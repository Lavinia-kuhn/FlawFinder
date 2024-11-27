using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IMovUnHandler
    {
        List<MovUnQueryResult> GetAllMovUn();
        List<MovUnQueryResult> GetMovUnByCode(string code);
        List<MovUnQueryResult> GetPageMovUn(int pPage, int pSize);
    }

    public class MovUnHandler : IMovUnHandler
    {

        private ILoggerManager _log;
        private readonly IMovUnRepository _MovUnRepository;

        public MovUnHandler(IMovUnRepository MovUnRepository,
            ILoggerManager log)
        {
            _MovUnRepository = MovUnRepository;
            _log = log;
        }

        public List<MovUnQueryResult> GetAllMovUn()
        {
            _log.LogInformation("MovUnHandler: GetAllMovUn");
            return _MovUnRepository.GetAllMovUn();
        }

        public List<MovUnQueryResult> GetMovUnByCode(string code)
        {
            _log.LogInformation("MovUnHandler: GetMovUnByCode");
            return _MovUnRepository.GetMovUnByCode(code);
        }

        public List<MovUnQueryResult> GetPageMovUn(int pPage, int pSize)
        {
            _log.LogInformation("MovUnHandler: GetPageMovUn");
            return _MovUnRepository.GetPageMovUn(pPage,pSize);
        }
    }
}
