using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IRouteRepository
    {
        List<RouteQueryResult> GetAllRoute();
        List<RouteQueryResult> GetPageRoute(int pPage, int pSize);
        List<RouteQueryResult> GetRouteByCode(string code);

    }
}
