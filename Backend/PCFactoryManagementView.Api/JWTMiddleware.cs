using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.Filters;
using Microsoft.AspNetCore.Mvc;
using Microsoft.IdentityModel.Tokens;
using PCFactoryManagementView.Shared;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.Extensions.Configuration;

namespace PCFactoryManagementView.Api
{
    public class JwtMiddleware
    {
        private readonly RequestDelegate _next;

        public JwtMiddleware(RequestDelegate next)
        {
            _next = next;
        }

        public async Task Invoke(HttpContext context)
        {
            var token = context.Request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();
            string apiKey = context.Request.Headers["X-Api-Key"];


            if ((token != null || apiKey != null) && context.Request.Path.Value != "/user/v1/login")
                attachUserToContext(token, apiKey);

            await _next(context);
        }

        private string attachUserToContext(string token, string apiKey)
        {
            try
            {
                if (apiKey == null)
                {
                    var tokenHandler = new JwtSecurityTokenHandler();
                    var key = Encoding.ASCII.GetBytes(Settings.Secret);
                    tokenHandler.ValidateToken(token, new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(key),
                        ValidateIssuer = false,
                        ValidateAudience = false,

                    }, out SecurityToken validatedToken);

                    var jwt = (JwtSecurityToken)validatedToken;
                    var expectedAlg = SecurityAlgorithms.HmacSha256;
                    if (jwt.Header?.Alg == null || jwt.Header?.Alg != expectedAlg)
                    {
                        throw new SecurityTokenValidationException("The alg is different from the expected alg");
                    }
                    else
                    {
                        return token;
                    }
                }
                else
                {
                    return apiKey;
                }
            }
            catch (System.Exception e)
            {
                throw e;
            }
        }
    }


    public class CustomAuthorizationFilter : IAuthorizationFilter
    {
        private readonly IConfiguration _configuration;
        private readonly string _apiKeyHeaderName = "X-Api-Key";


        public void OnAuthorization(AuthorizationFilterContext context)
        {
            var request = context.HttpContext.Request;
            var apiKey = request.Headers[_apiKeyHeaderName].FirstOrDefault();
            var token = request.Headers["Authorization"].FirstOrDefault()?.Split(" ").Last();

            if (!string.IsNullOrEmpty(apiKey))
            {
                var configuredApiKey = Settings.ApiKey;
                if (configuredApiKey != apiKey)
                {
                    context.Result = new UnauthorizedResult();
                    return;
                }
            }
            else if (!string.IsNullOrEmpty(token))
            {
                try
                {
                    var tokenHandler = new JwtSecurityTokenHandler();
                    var key = Encoding.ASCII.GetBytes(Settings.Secret);
                    tokenHandler.ValidateToken(token, new TokenValidationParameters
                    {
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(key),
                        ValidateIssuer = false,
                        ValidateAudience = false,
                    }, out SecurityToken validatedToken);
                }
                catch
                {
                    context.Result = new UnauthorizedResult();
                    return;
                }
            }
            else
            {
                context.Result = new UnauthorizedResult();
            }
        }
    }
}
