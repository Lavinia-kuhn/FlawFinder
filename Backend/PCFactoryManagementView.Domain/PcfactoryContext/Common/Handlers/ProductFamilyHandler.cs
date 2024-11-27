using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IProductFamilyHandler
    {
        List<ProductFamilyQueryResult> GetAllProductFamilies();
        List<ProductFamilyQueryResult> GetPageProductFamilies(int pPage, int pSize);
        List<ProductFamilyQueryResult> GetProductFamilyByCode(string code);
    }
    public class ProductFamilyHandler : IProductFamilyHandler
    {

        private ILoggerManager _log;
        private readonly IProductFamilyRepository _productFamilyRepository;

        public ProductFamilyHandler(IProductFamilyRepository productFamilyRepository,
            ILoggerManager log)
        {
            _productFamilyRepository = productFamilyRepository;
            _log = log;
        }

        public List<ProductFamilyQueryResult> GetAllProductFamilies()
        {
            _log.LogInformation("ProductFamilyHandler: GetAllProductFamilies");
            return _productFamilyRepository.GetAllProductFamily();
        }

        public List<ProductFamilyQueryResult> GetProductFamilyByCode(string code)
        {
            _log.LogInformation("ProductFamilyHandler: GetProductFamilyByCode");
            return _productFamilyRepository.GetProductFamilyByCode(code);
        }

        public List<ProductFamilyQueryResult> GetPageProductFamilies(int pPage, int pSize)
        {
            _log.LogInformation("ProductFamilyHandler: GetPageProductFamilies");
            return _productFamilyRepository.GetPageProductFamily(pPage, pSize);
        }
    }
}
