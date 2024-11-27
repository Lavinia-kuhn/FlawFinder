using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IProductTypeHandler
    {
        List<ProductTypeQueryResult> GetAllProductTypes();
        List<ProductTypeQueryResult> GetProductTypeByCode(string code);
        List<ProductTypeQueryResult> GetPageProductTypes(int pPage, int pSize);
        List<ProductTypeQueryResult> getProductTypeByIdProductFamily(List<int> productFIds);
    }
    public class ProductTypeHandler : IProductTypeHandler
    {
        private ILoggerManager _log;
        private readonly IProductTypeRepository _productTypeRepository;

        public ProductTypeHandler(IProductTypeRepository productTypeRepository,
            ILoggerManager log)
        {
            _productTypeRepository = productTypeRepository;
            _log = log;
        }

        public List<ProductTypeQueryResult> GetAllProductTypes()
        {
            _log.LogInformation("ProductHandler: GetAllProducts");
            return _productTypeRepository.getAllProductTypes();
        }

        public List<ProductTypeQueryResult> GetPageProductTypes(int pPage, int pSize)
        {
            _log.LogInformation("ProductHandler: GetAllProducts");
            return _productTypeRepository.getPageProductTypes(pPage, pSize);
        }

        public List<ProductTypeQueryResult> GetProductTypeByCode(string code)
        {
            _log.LogInformation("ProductHandler: GetAllProducts");
            return _productTypeRepository.getProductTypeByCode(code);
        }

        public List<ProductTypeQueryResult> getProductTypeByIdProductFamily(List<int> productFIds)
        {
            _log.LogInformation("ProductHandler: getProductTypeByIdProductFamily");
            return _productTypeRepository.getProductTypeByIdProductFamily(productFIds);
        }
    }
}
