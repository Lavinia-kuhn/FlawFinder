using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IMenuRepository
    {
        List<GetMenuQueryResult> GetMenusByIdUser(int idUser);
        List<MenuSearchControl> GetMenusSearchControl(string lang, int idUser);
    }
}
