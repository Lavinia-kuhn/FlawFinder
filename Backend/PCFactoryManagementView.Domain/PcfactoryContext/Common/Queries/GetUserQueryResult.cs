using System.Collections.Generic;
using System.Security.Claims;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class UserPreferences
    {
        public int idPref { get; set; }
        public int IdUser { get; set; }
        public string Code { get; set; }
        public string Value { get; set; }
        public int Shared { get; set; }
        public bool adminPrefs { get; set; } = false;
        public bool flgExist { get; set; } = false;
    }

    public class UserGroup
    {
        public int IdUsrGroup { get; set; }
        public int IdUser { get; set; }

    }

    public class GetUserQueryResult
    {
        public GetUserQueryResult()
        {
            Roles = new List<string>();
            GroupId = new List<string>();
        }
        public int IdUser { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Nickname { get; set; }
        public string  Password { get; set; }
        public List<string> GroupId { get; set; }
        public List<string> Roles { get; set; }
        public int idDefaultAdmin { get; set; }
        public int language { get; set; }
        public string Email { get; set; }
    }

    public class GetUserTokenPrefs
    {
        public int IdUser { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string token { get; set; }
        public List<UserPreferences> Prefs { get; set; }
        public List<string> userGroups { get; set; }
        public List<string> userRoles { get; set; }
        public int idDefaultAdmin { get; set; }
        public bool news { get; set; }
        public string email { get; set; }

    }
}
