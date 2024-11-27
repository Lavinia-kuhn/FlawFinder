using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ICodeTaskHandler
    {
        List<CodeTaskQueryResult> GetAllCodeTask(); 
        List<CodeTaskQueryResult> GetPageCodeTask(int pPage, int pSize);
        List<CodeTaskQueryResult> GetCodeTaskByCode(string code);
    }

    public class CodeTaskHandler : ICodeTaskHandler
    {

        private ILoggerManager _log;
        private readonly ICodeTaskRepository _CodeTaskRepository;

        public CodeTaskHandler(ICodeTaskRepository CodeTaskRepository,
            ILoggerManager log)
        {
            _CodeTaskRepository = CodeTaskRepository;
            _log = log;
        }

        public List<CodeTaskQueryResult> GetAllCodeTask()
        {
            _log.LogInformation("CodeTaskHandler: GetAllCodeTask");
            return _CodeTaskRepository.GetAllCodeTask();
        }

        public List<CodeTaskQueryResult> GetCodeTaskByCode(string code)
        {
            _log.LogInformation("CodeTaskHandler: GetCodeTaskByCode");
            return _CodeTaskRepository.GetCodeTaskByCode(code);
        }

        public List<CodeTaskQueryResult> GetPageCodeTask(int pPage, int pSize)
        {
            _log.LogInformation("CodeTaskHandler: GetPageCodeTask");
            return _CodeTaskRepository.GetPageCodeTask(pPage,pSize);
        }
    }
}

