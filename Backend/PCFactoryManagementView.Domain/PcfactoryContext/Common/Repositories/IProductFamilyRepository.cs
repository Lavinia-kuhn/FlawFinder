using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IProductFamilyRepository
    {
        List<ProductFamilyQueryResult> GetAllProductFamily();
        List<ProductFamilyQueryResult> GetPageProductFamily(int pPage, int pSize);
        List<ProductFamilyQueryResult> GetProductFamilyByCode(string code);
    }
}
