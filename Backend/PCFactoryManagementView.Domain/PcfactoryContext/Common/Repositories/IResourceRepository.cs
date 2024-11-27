using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IResourceRepository
    {
        List<ResourceQueryResult> GetAll();
        List<ResourceQueryResult> GetPage(int pPage, int pSize);
        List<ResourceQueryResult> GetByCode(string code);
        ResourceCompleteQueryResult GetByIdResource(int idResource);
        List<ResourceQueryResult> getByIdManagerGrp(int idManagerGrp);

    }
}
