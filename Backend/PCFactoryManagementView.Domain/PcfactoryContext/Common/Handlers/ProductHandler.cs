using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IProductHandler
    {
        List<ProductQueryResult> GetAllProducts();
        List<ProductQueryResult> GetProductByCode(string code);
        List<ProductQueryResult> GetProductbyIdProductFamily(List<int> productFIds);
        ProductCompleteQueryResult GetProductById(int idProduct);
        List<ProductQueryResult> GetPageProducts(int pPage, int pSize);
        List<ProductQueryResult> GetIntegrationPageProducts(int pPage, int pSize);

        List<ProductQueryResult> GetProductsByFamilyeType(List<int> productFIds, List<int> productTIds);
        ProductQueryResult GetProductByID(int idProduct);
    }
    public class ProductHandler : IProductHandler
    {

        private ILoggerManager _log;
        private readonly IProductRepository _productRepository;

        public ProductHandler(IProductRepository productRepository,
            ILoggerManager log)
        {
            _productRepository = productRepository;
            _log = log;
        }

        public List<ProductQueryResult> GetAllProducts()
        {
            _log.LogInformation("ProductHandler: GetAllProducts");
            return _productRepository.getAllProducts();
        }

        public List<ProductQueryResult> GetProductByCode(string code)
        {
            _log.LogInformation("ProductHandler: GetProductByCode");
            return _productRepository.getProductByCode(code);
        }

        public List<ProductQueryResult> GetProductbyIdProductFamily(List<int> productFIds)
        {
            _log.LogInformation("ProductHandler: GetProductbyIdProductFamily");
            return _productRepository.getProductByIdProductFamily(productFIds);
        }

        public ProductCompleteQueryResult GetProductById(int idProduct)
        {
            _log.LogInformation("ProductHandler: GetProductById");
            return _productRepository.GetProductById(idProduct);
        }

        public ProductQueryResult GetProductByID(int idProduct)
        {
            _log.LogInformation("ProductHandler: GetProductById");
            return _productRepository.GetProductByID(idProduct);
        }

        public List<ProductQueryResult> GetPageProducts(int pPage, int pSize)
        {
            _log.LogInformation("ProductHandler: getPageProducts");
            return _productRepository.getPageProducts(pPage, pSize);
        }

        public List<ProductQueryResult> GetProductsByFamilyeType(List<int> productFIds, List<int> productTIds)
        {
            _log.LogInformation("ProductHandler: getProductsByFamilyeType");
            return _productRepository.getProductsByFamilyeType(productFIds, productTIds);
        }

        public List<ProductQueryResult> GetIntegrationPageProducts(int pPage, int pSize)
        {
            _log.LogInformation("ProductHandler: getPageProducts");
            return _productRepository.getIntegrationPageProducts(pPage, pSize);
        }
    }
}
