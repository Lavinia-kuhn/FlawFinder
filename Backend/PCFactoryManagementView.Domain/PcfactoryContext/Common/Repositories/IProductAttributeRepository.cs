using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IProductAttributeRepository
    {
        List<ProductAttributeQueryResult> GetAllProductAttributes();
        List<ProductAttributeQueryResult> getPageProductAttribute(int pPage, int pSize);
        List<ProductAttributeQueryResult> getProductAttributeByCode(string code);
        List<ProductAttributeQueryResult> GetProductAttributeById(string id);
    }
}
