using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IUserRepository
    {
        GetUserQueryResult GetByCode(string code);
        List<int> GetIdsUsrGrp(int idUser);
        bool isAdLogin();
        string AdLoginType();

        List<UserQueryResult> GetAllCodeUser();
        List<UserQueryResult> GetPageCodeUser(int pPage, int pSize);
        List<UserQueryResult> GetCodeUserByCode(string code);
    }
}
