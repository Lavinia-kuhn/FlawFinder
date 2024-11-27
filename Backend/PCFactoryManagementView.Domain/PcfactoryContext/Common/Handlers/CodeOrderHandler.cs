using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ICodeOrderHandler
    {
        List<CodeOrderQueryResult> GetAllCodeOrder();
        List<CodeOrderQueryResult> GetPageCodeOrder(int pPage, int pSize);
        List<CodeOrderQueryResult> GetIntegrationPageCodeOrder(int pPage, int pSize);
        List<CodeOrderQueryResult> GetCodeOrderByCode(string code);
    }

    public class CodeOrderHandler : ICodeOrderHandler
    {

        private ILoggerManager _log;
        private readonly ICodeOrderRepository _codeOrderRepository;

        public CodeOrderHandler(ICodeOrderRepository codeOrderRepository,
            ILoggerManager log)
        {
            _codeOrderRepository = codeOrderRepository;
            _log = log;
        }

        public List<CodeOrderQueryResult> GetAllCodeOrder()
        {
            _log.LogInformation("CodeOrderHandler: GetAllCodeOrder");
            return _codeOrderRepository.GetAllCodeOrders();
        }

        public List<CodeOrderQueryResult> GetCodeOrderByCode(string code)
        {
            _log.LogInformation("CodeOrderHandler: GetCodeOrderByCode");
            return _codeOrderRepository.GetCodeOrderByCode(code);
        }

        public List<CodeOrderQueryResult> GetPageCodeOrder(int pPage, int pSize)
        {
            _log.LogInformation("CodeOrderHandler: GetPageCodeOrder");
            return _codeOrderRepository.GetPageCodeOrders(pPage, pSize);
        }

        public List<CodeOrderQueryResult> GetIntegrationPageCodeOrder(int pPage, int pSize)
        {
            _log.LogInformation("CodeOrderHandler: GetPageCodeOrder");
            return _codeOrderRepository.GetIntegrationPageCodeOrders(pPage, pSize);
        }
    }
}
