using System.Collections.Generic;
using System;
using Newtonsoft.Json;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands
{
    public class LoginCommand
    {
        public string User { get; set; }
        public string Password { get; set; }
        public string pcfToken { get; set; } = "";
    }

    public class PCFLoginCommand
    {
        public string Username { get; set; }
        public string Password { get; set; }
        public string pcfServer { get; set; }
    }

    public class PCFUserInformation
    {
        public string UserName { get; set; }
        public string UserCode { get; set; }
        public int IdUser { get; set; }
        public int IdLanguage { get; set; }
        public int OpenKeyBoard { get; set; }
        public string CompanyName { get; set; }

        public Uri Callback { get; set; }
        public string RefreshToken { get; set; }
        public string AccessToken { get; set; }
        public DateTime? AccessTokenIssueDateUtc { get; set; }
        public DateTime? AccessTokenExpirationUtc { get; set; }
        public HashSet<string> Scope { get; set; }
        public bool IsAdAuthentication { get; set; }
        public int ExpirationPwdDays { get; set; }
        public List<int> IdAlarmList { get; set; }
    }

    public class PCFAccessTokenResponse
    {
        public string AccessToken { get; set; }
    }
}
