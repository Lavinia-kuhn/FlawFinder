using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ICodeInventoryHandler
    {
        List<CodeInventoryQueryResult> GetAllCodeInventory(); 
        List<CodeInventoryQueryResult> GetPageCodeInventory(int pPage, int pSize);
        List<CodeInventoryQueryResult> GetCodeInventoryByCode(string code);
    }

    public class CodeInventoryHandler : ICodeInventoryHandler
    {

        private ILoggerManager _log;
        private readonly ICodeInventoryRepository _CodeInventoryRepository;

        public CodeInventoryHandler(ICodeInventoryRepository CodeInventoryRepository,
            ILoggerManager log)
        {
            _CodeInventoryRepository = CodeInventoryRepository;
            _log = log;
        }

        public List<CodeInventoryQueryResult> GetAllCodeInventory()
        {
            _log.LogInformation("CodeInventoryHandler: GetAllCodeInventory");
            return _CodeInventoryRepository.GetAllCodeInventory();
        }

        public List<CodeInventoryQueryResult> GetCodeInventoryByCode(string code)
        {
            _log.LogInformation("CodeInventoryHandler: GetCodeInventoryByCode");
            return _CodeInventoryRepository.GetCodeInventoryByCode(code);
        }

        public List<CodeInventoryQueryResult> GetPageCodeInventory(int pPage, int pSize)
        {
            _log.LogInformation("CodeInventoryHandler: GetPageCodeInventory");
            return _CodeInventoryRepository.GetPageCodeInventory(pPage,pSize);
        }
    }
}

