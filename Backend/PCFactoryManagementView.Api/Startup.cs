using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.ResponseCompression;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using PCFactoryManagementView.Shared;
using System.Linq;
using System.Text;
using AspNetCore.ServiceRegistration.Dynamic;
using System.Reflection;
using System.IO;
using System;
using PCFactoryManagementView.Filters;
using Elastic.Apm.NetCoreAll;
using System.Collections.Generic;
using Newtonsoft.Json;
using PCFactoryManagementView.Api.Filters;

namespace PCFactoryManagementView.Api
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        public void ConfigureServices(IServiceCollection services)
        {
            //Habilito CORS para chamadas localhost 
            services.AddCors();

            //Compressão de Respostas HTTP do tipo JSON (Podemos adicionar mais formatos futuramente)
            services.AddResponseCompression(options =>
            {
                options.Providers.Add<GzipCompressionProvider>();
                options.MimeTypes = ResponseCompressionDefaults.MimeTypes.Concat(new[] { "application/json" });
            });

            //Adição do controllers Básicos
            services.AddControllers(e =>
            {
                e.Filters.Add<MVExceptionFilter>();
            }).AddNewtonsoftJson(options =>
            {
                options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
            });

            var key = Encoding.ASCII.GetBytes(Settings.Secret);

            /*
             * INJEÇÃO DE DEPENDÊNCIA
             * ANOTAÇÕES DEVEM SER COLOCADAS NAS CLASSES 
             * SCOPED É A MESMA INSTÂNCIA PARA O ESCOPO (EX.: TRANSAÇÃO COM BD)
             * TRANSIENT É UMA INSTÂNCIA PARA CADA NEW() NO OBJETO (EX.: CLASSES DE REPOSITÓRIO)
             * SINGLETON É UMA INSTÃNCIA PARA A APLICAÇÃO (EX.: MECANISMO DE LOG)
             */
            services.AddServicesOfType<IScopedService>();
            services.AddServicesOfType<ITransientService>();
            services.AddServicesOfType<ISingletonService>();
            services.AddServicesWithAttributeOfType<ScopedServiceAttribute>();
            services.AddServicesWithAttributeOfType<TransientServiceAttribute>();
            services.AddServicesWithAttributeOfType<SingletonServiceAttribute>();

            //EXECUTO OS "MIGRATIONS"
            services.AddTransient<IStartupFilter, DatabaseInitFilter>();

            services.AddMemoryCache();

            var enableSwagger = Configuration.GetValue<bool>("EnableSwagger");

            if (enableSwagger)
            {
                //Adição do Swagger/OpenAPi para documentação das APIs 
                services.AddSwaggerGen(c =>
                {
                    c.SwaggerDoc("v1", new OpenApiInfo
                    {
                        Title = "PCF4 - Gestão",
                        Version = "v1"
                    });

                    var xmlFile = $"{Assembly.GetExecutingAssembly().GetName().Name}.xml";
                    var xmlPath = Path.Combine(AppContext.BaseDirectory, xmlFile);

                    c.IncludeXmlComments(xmlPath, includeControllerXmlComments: true);

                    c.AddSecurityDefinition("Bearer", new OpenApiSecurityScheme
                    {
                        Name = "Authorization",
                        Description = @"JWT Authorization header using the Bearer scheme. \r\n\r\n 
                      Enter 'Bearer' [space] and then your token in the text input below.
                      \r\n\r\nExample: 'Bearer 12345abcdef'",
                        Type = SecuritySchemeType.ApiKey,
                        Scheme = "Bearer",
                        In = ParameterLocation.Header,

                    });

                    c.AddSecurityRequirement(new OpenApiSecurityRequirement(){{
                         new OpenApiSecurityScheme{
                            Reference = new OpenApiReference{
                                Type = ReferenceType.SecurityScheme,
                                Id = "Bearer"
                            },
                            Scheme = "oauth2",
                            Name = "Bearer",
                            In = ParameterLocation.Header
                        }, new List<string>()
                    }
                    });
                });
            }
            // Adição do mecanismo de autenticação
            services.AddAuthentication(x =>
            {
                x.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
                x.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(x =>
            {
                x.RequireHttpsMetadata = false;
                x.SaveToken = true;
                x.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuerSigningKey = true,
                    IssuerSigningKey = new SymmetricSecurityKey(key),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                };
            });

            // Adiciona o filtro de autorização personalizado
            services.AddSingleton<CustomAuthorizationFilter>();

            //Repasso a ConnectionString do appsettings.json para a Aplicação
            Settings.ConnectionString = Configuration.GetConnectionString("connectionString");
            Settings.ConnectionStringInteg = Configuration.GetConnectionString("connectionStringInteg");
        }

        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            app.UseAllElasticApm(Configuration);

            if (env.IsDevelopment())
                app.UseDeveloperExceptionPage();


            //Habilito sistema de Rotas 
            app.UseRouting();


            var enableSwagger = Configuration.GetValue<bool>("EnableSwagger");
            if (enableSwagger)
            {
                //Swagger JSON
                app.UseSwagger();

                //Configuracao do Swagger UI
                app.UseSwaggerUI(c =>
                {
                    c.RoutePrefix = "swagger";
                    c.SwaggerEndpoint("/swagger/v1/swagger.json", "PCF4 - Gestão API V1");
                });
            }
            //CORS para chamadas de aplicações Localhost
            app.UseCors(x => x
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());

            //Habilito sistema de Autenticação
            app.UseAuthentication();
            //Habilito sistema de Autorização
            app.UseAuthorization();

            app.UseMiddleware<JwtMiddleware>();

            //Aqui habilito o controle de nomeação simplificado dos endpoints com base em rotas definidas nos controllers.
            app.UseEndpoints(endpoints => {
                endpoints.MapControllers();
            });
        }
    }
}
