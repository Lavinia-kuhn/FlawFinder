using AspNetCore.ServiceRegistration.Dynamic;
using Microsoft.Extensions.Caching.Memory;
using Newtonsoft.Json.Linq;
using Newtonsoft.Json;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Net.Http;
using System.Net;
using System.Threading.Tasks;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IUserHandler
    {
        GetUserTokenPrefs GetLogin(LoginCommand login);
        GetUserTokenPrefs GetAdLogin(LoginCommand login);
        Task<string> GetPCFToken(PCFLoginCommand login);
        bool IsAdLogin();
        List<UserQueryResult> GetAllCodeUser();
        List<UserQueryResult> GetPageCodeUser(int pPage, int pSize);
        List<UserQueryResult> GetCodeUserByCode(string code);
    }

    public class UserHandler : IUserHandler
    {
        private readonly IUserRepository _userRepository;
        private readonly IMemoryCache _memoryCache;
        private const string tKey = "mv_users";
        private ILoggerManager _log;

        public UserHandler(IUserRepository userRepository, 
            ILoggerManager log,
            IMemoryCache memoryCache)
        {
            _memoryCache = memoryCache;
            _userRepository = userRepository;
            _log = log;
        }

        public GetUserTokenPrefs GetLogin(LoginCommand login)
        {
            _log.LogInformation("UserHandler: GetUserTokenPrefs");
            var user = _userRepository.GetByCode(login.User);
            string token = "";
            var prefs = new List<UserPreferences>();
            var result = new GetUserTokenPrefs();
            var idUser = 0;

            if (_memoryCache.TryGetValue(tKey, out List<int> resultList))
            {
                idUser = resultList.Find(item => item == user.IdUser);

                if (idUser == 0)
                {
                    resultList.Add(user.IdUser);
                    _memoryCache.Set(tKey, resultList);
                }
            } else
            {
                var newListOfUsers = new List<int>();
                newListOfUsers.Add(user.IdUser);
                _memoryCache.Set(tKey, newListOfUsers);
            }

            if (user != null)
            {
                var password = Settings.Decrypt(user.Password);
                if (login.Password.ToLower() == password.ToLower())
                {
                    token = TokenService.TokenService.GenerateToken(user);
                }


                result.IdUser = user.IdUser;
                result.Code = user.Code;
                result.Name = user.Name;
                result.token = token;
                result.Prefs = prefs;
                result.userRoles = user.Roles;
                result.userGroups = user.GroupId;
                result.idDefaultAdmin = user.idDefaultAdmin;
                result.news = idUser == 0;
                result.email = user.Email;
                
            }

            return result;
        }

        public GetUserTokenPrefs GetAdLogin(LoginCommand login)
        {
            _log.LogInformation("UserHandler: GetAdLogin");
            var user = _userRepository.GetByCode(login.User);
            string token = "";

            var result = new GetUserTokenPrefs();
            if (user != null)
            {
                var prefs = new List<UserPreferences>();
                var adLoginType = _userRepository.AdLoginType();

                if (adLoginType == "1")
                {
                    //SE FOR USUÁRIO PADRÃO DO SISTEMA LOGA COM USUÁRIO E SENHA FORA DO AD
                    var password = Settings.Decrypt(user.Password);
                    if (login.Password.ToLower() == password.ToLower() || login.pcfToken != "")
                    {
                        token = TokenService.TokenService.GenerateToken(user);
                    }
                }
                else
                {
                    //JÁ VALIDOU USUÁRIO E SENHA NO AD ATRAVÉS DO PCF4
                    token = TokenService.TokenService.GenerateToken(user);
                }


                result.IdUser = user.IdUser;
                result.Code = user.Code;
                result.Name = user.Name;
                result.token = token;
                result.Prefs = prefs;
                result.userRoles = user.Roles;
                result.userGroups = user.GroupId;
                result.idDefaultAdmin = user.idDefaultAdmin;
                
            }

            return result;
        }

        public async Task<string> GetPCFToken(PCFLoginCommand login)
        {
            string url;
            string responseBody;
            string tokenResponse = String.Empty;

            try
            {
                url = login.pcfServer + "api/Login/Login?user=" + login.Username + "&password=" + login.Password;

                using (HttpClient client = new HttpClient())
                {
                    HttpRequestMessage request = new HttpRequestMessage(HttpMethod.Get, url);
                    request.Headers.Add("Accept", "application/json");

                    HttpResponseMessage response = await client.SendAsync(request);

                    if (response.StatusCode >= HttpStatusCode.InternalServerError)
                        return JsonConvert.SerializeObject(tokenResponse);

                    response.EnsureSuccessStatusCode();

                    responseBody = await response.Content.ReadAsStringAsync();
                    var result = JsonConvert.DeserializeObject<PCFUserInformation>(responseBody);

                    if (result != null)
                        tokenResponse = result.AccessToken;
                }
            }
            catch (Exception ex)
            {
                _log.LogInformation("UserHandler: GetPCFToken: " + ex.Message);
            }

            return tokenResponse;
        }

        public bool IsAdLogin()
        {
            return _userRepository.isAdLogin();
        }

 
        public List<UserQueryResult> GetAllCodeUser()
        {
            _log.LogInformation("UserHandler: GetAllCodeUser");
            return _userRepository.GetAllCodeUser();
        }

        public List<UserQueryResult> GetCodeUserByCode(string code)
        {
            _log.LogInformation("UserHandler: GetCodeUserByCode");
            return _userRepository.GetCodeUserByCode(code);
        }

        public List<UserQueryResult> GetPageCodeUser(int pPage, int pSize)
        {
            _log.LogInformation("UserHandler: GetPageCodeUser");
            return _userRepository.GetPageCodeUser(pPage, pSize);
        }

    }
}
