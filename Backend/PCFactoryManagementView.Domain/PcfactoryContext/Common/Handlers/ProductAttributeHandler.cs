using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IProductAttributeHandler
    {
        List<ProductAttributeQueryResult> GetAllProductAttributes();
        List<ProductAttributeQueryResult> getPageProductAttribute(int pPage, int pSize);
        List<ProductAttributeQueryResult> getProductAttributeByCode(string code);
        List<ProductAttributeQueryResult> GetProductAttributeById(string id);
    }
    public class ProductAttributeHandler : IProductAttributeHandler
    {
        private ILoggerManager _log;
        private readonly IProductAttributeRepository _repository;

        public ProductAttributeHandler(ILoggerManager log, IProductAttributeRepository repository)
        {
            _log = log;
            _repository = repository;

        }
        public List<ProductAttributeQueryResult> GetAllProductAttributes()
        {
            _log.LogInformation("ProductAttributeHandler: GetAllProductAttributes");
            return _repository.GetAllProductAttributes();
        }
        public List<ProductAttributeQueryResult> getProductAttributeByCode(string code)
        {
            _log.LogInformation("ProductAttributeHandler: getProductAttributeByCode");
            return _repository.getProductAttributeByCode(code);
        }
        public List<ProductAttributeQueryResult> getPageProductAttribute(int pPage, int pSize)
        {
            _log.LogInformation("ProductAttributeHandler: getPageProductAttribute");
            return _repository.getPageProductAttribute(pPage, pSize);
        }
        public List<ProductAttributeQueryResult> GetProductAttributeById(string id)
        {
            _log.LogInformation("ProductAttributeHandler: GetProductAttributeById");
            return _repository.GetProductAttributeById(id);
        }
    }
}
