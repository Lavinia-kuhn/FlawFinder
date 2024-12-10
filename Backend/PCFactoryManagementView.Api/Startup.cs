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

            //Compress�o de Respostas HTTP do tipo JSON (Podemos adicionar mais formatos futuramente)
            services.AddResponseCompression(options =>
            {
                options.Providers.Add<GzipCompressionProvider>();
                options.MimeTypes = ResponseCompressionDefaults.MimeTypes.Concat(new[] { "application/json" });
            });

            //Adi��o do controllers B�sicos
            services.AddControllers(e =>
            {
                e.Filters.Add<MVExceptionFilter>();
            }).AddNewtonsoftJson(options =>
            {
                options.SerializerSettings.ReferenceLoopHandling = ReferenceLoopHandling.Ignore;
            });

            var key = Encoding.ASCII.GetBytes(Settings.Secret);

            /*
             * INJE��O DE DEPEND�NCIA
             * ANOTA��ES DEVEM SER COLOCADAS NAS CLASSES 
             * SCOPED � A MESMA INST�NCIA PARA O ESCOPO (EX.: TRANSA��O COM BD)
             * TRANSIENT � UMA INST�NCIA PARA CADA NEW() NO OBJETO (EX.: CLASSES DE REPOSIT�RIO)
             * SINGLETON � UMA INST�NCIA PARA A APLICA��O (EX.: MECANISMO DE LOG)
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
                //Adi��o do Swagger/OpenAPi para documenta��o das APIs 
                services.AddSwaggerGen(c =>
                {
                    c.SwaggerDoc("v1", new OpenApiInfo
                    {
                        Title = "PCF4 - Gest�o",
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
            // Adi��o do mecanismo de autentica��o
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

            // Adiciona o filtro de autoriza��o personalizado
            services.AddSingleton<CustomAuthorizationFilter>();

            //Repasso a ConnectionString do appsettings.json para a Aplica��o
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
                    c.SwaggerEndpoint("/swagger/v1/swagger.json", "PCF4 - Gest�o API V1");
                });
            }
            //CORS para chamadas de aplica��es Localhost
            app.UseCors(x => x
                .AllowAnyOrigin()
                .AllowAnyMethod()
                .AllowAnyHeader());

            //Habilito sistema de Autentica��o
            app.UseAuthentication();
            //Habilito sistema de Autoriza��o
            app.UseAuthorization();

            app.UseMiddleware<JwtMiddleware>();

            //Aqui habilito o controle de nomea��o simplificado dos endpoints com base em rotas definidas nos controllers.
            app.UseEndpoints(endpoints => {
                endpoints.MapControllers();
            });
        }
    }
}
