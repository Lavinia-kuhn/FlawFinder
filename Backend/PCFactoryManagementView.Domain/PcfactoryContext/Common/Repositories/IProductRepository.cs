using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IProductRepository
    {

        List<ProductQueryResult> getAllProducts();
        List<ProductQueryResult> getPageProducts(int pPage, int pSize);
        List<ProductQueryResult> getIntegrationPageProducts(int pPage, int pSize);
        List<ProductQueryResult> getProductByCode(string code);
        List<ProductQueryResult> getProductsByAddress(int addressId);
        List<ProductQueryResult> getProductByIdProductFamily(List<int> productFIds);
        List<ProductQueryResult> getProductsByFamilyeType(List<int> productFIds, List<int> productTIds);
        ProductCompleteQueryResult GetProductById(int idProduct);
        ProductQueryResult GetProductByID(int idProduct);
    }
}
