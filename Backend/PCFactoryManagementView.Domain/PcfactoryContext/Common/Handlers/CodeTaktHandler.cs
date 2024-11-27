using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ICodeTaktHandler
    {
        List<CodeTaktQueryResult> GetAllCodeTakt(); 
        List<CodeTaktQueryResult> GetPageCodeTakt(int pPage, int pSize);
        List<CodeTaktQueryResult> GetCodeTaktByCode(string code);
    }

    public class CodeTaktHandler : ICodeTaktHandler
    {

        private ILoggerManager _log;
        private readonly ICodeTaktRepository _CodeTaktRepository;

        public CodeTaktHandler(ICodeTaktRepository CodeTaktRepository,
            ILoggerManager log)
        {
            _CodeTaktRepository = CodeTaktRepository;
            _log = log;
        }

        public List<CodeTaktQueryResult> GetAllCodeTakt()
        {
            _log.LogInformation("CodeTaktHandler: GetAllCodeTakt");
            return _CodeTaktRepository.GetAllCodeTakt();
        }

        public List<CodeTaktQueryResult> GetCodeTaktByCode(string code)
        {
            _log.LogInformation("CodeTaktHandler: GetCodeTaktByCode");
            return _CodeTaktRepository.GetCodeTaktByCode(code);
        }

        public List<CodeTaktQueryResult> GetPageCodeTakt(int pPage, int pSize)
        {
            _log.LogInformation("CodeTaktHandler: GetPageCodeTakt");
            return _CodeTaktRepository.GetPageCodeTakt(pPage,pSize);
        }
    }
}

