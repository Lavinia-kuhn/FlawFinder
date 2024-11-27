using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IMovTypeHandler
    {
        List<MovTypeQueryResult> GetAllMovType();
        List<MovTypeQueryResult> GetPageMovType(int pPage, int pSize);
        List<MovTypeQueryResult> GetMovTypeByCode(string code);
    }

    public class MovTypeHandler : IMovTypeHandler
    {

        private ILoggerManager _log;
        private readonly IMovTypeRepository _MovTypeRepository;

        public MovTypeHandler(IMovTypeRepository MovTypeRepository,
            ILoggerManager log)
        {
            _MovTypeRepository = MovTypeRepository;
            _log = log;
        }

        public List<MovTypeQueryResult> GetAllMovType()
        {
            _log.LogInformation("MovTypeHandler: GetAllMovType");
            return _MovTypeRepository.GetAllMovType();
        }

        public List<MovTypeQueryResult> GetMovTypeByCode(string code)
        {
            _log.LogInformation("MovTypeHandler: GetMovTypeByCode");
            return _MovTypeRepository.GetMovTypeByCode(code);
        }

        public List<MovTypeQueryResult> GetPageMovType(int pPage, int pSize)
        {
            _log.LogInformation("MovTypeHandler: GetAllMovType");
            return _MovTypeRepository.GetPageMovType(pPage, pSize);
        }
    }
}
