using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IProductTypeRepository
    {
        List<ProductTypeQueryResult> getAllProductTypes();
        List<ProductTypeQueryResult> getPageProductTypes(int pPage, int pSize);
        List<ProductTypeQueryResult> getProductTypeByCode(string code);
        List<ProductTypeQueryResult> getProductTypeByIdProductFamily(List<int> productFIds);
    }
}
