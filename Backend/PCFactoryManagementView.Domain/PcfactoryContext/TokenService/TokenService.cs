using Microsoft.IdentityModel.Tokens;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.TokenService
{
    public static class TokenService
    {
        public static string GenerateToken(GetUserQueryResult user)
        {
            var tokenHandler = new JwtSecurityTokenHandler();
            var key = Encoding.ASCII.GetBytes(Settings.Secret);

            ClaimsIdentity getClaimsIdentity()
            {
                return new ClaimsIdentity(
                    getClaims()
                );

                Claim[] getClaims()
                {
                    List<Claim> claims = new List<Claim>();
                    claims.Add(new Claim(ClaimTypes.Name, user.Code));
                    foreach (var item in user.Roles)
                    {
                        claims.Add(new Claim(ClaimTypes.Role, item));
                    }
                    return claims.ToArray();
                }

            }

            var tokenDescriptor = new SecurityTokenDescriptor
            {
                Subject = getClaimsIdentity(),
                Expires = DateTime.UtcNow.AddHours(4),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(key), SecurityAlgorithms.HmacSha256Signature)
            };
            var token = tokenHandler.CreateToken(tokenDescriptor);
            return tokenHandler.WriteToken(token);
        }
    }
}
