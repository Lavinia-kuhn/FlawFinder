using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ICodeOperationHandler
    {
        List<CodeOperationQueryResult> GetAllCodeOperation();
        List<CodeOperationQueryResult> GetPageCodeOperation(int pPage, int pSize);
        List<CodeOperationQueryResult> GetCodeOperationByCode(string code);
    }

    public class CodeOperationHandler : ICodeOperationHandler
    {

        private ILoggerManager _log;
        private readonly ICodeOperationRepository _codeOperationRepository;

        public CodeOperationHandler(ICodeOperationRepository codeOperationRepository,
            ILoggerManager log)
        {
            _codeOperationRepository = codeOperationRepository;
            _log = log;
        }

        public List<CodeOperationQueryResult> GetAllCodeOperation()
        {
            _log.LogInformation("CodeOperationHandler: GetAllCodeOperation");
            return _codeOperationRepository.GetAllCodeOperations();
        }

        public List<CodeOperationQueryResult> GetCodeOperationByCode(string code)
        {
            _log.LogInformation("CodeOperationHandler: GetCodeOperationByCode");
            return _codeOperationRepository.GetCodeOperationByCode(code);
        }

        public List<CodeOperationQueryResult> GetPageCodeOperation(int pPage, int pSize)
        {
            _log.LogInformation("CodeOperationHandler: GetPageCodeOperation");
            return _codeOperationRepository.GetPageCodeOperations(pPage, pSize);
        }
    }
}
