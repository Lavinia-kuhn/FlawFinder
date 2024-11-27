using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IWoDetHandler
    {
        WoDetQueryResult GetWodetByIdWodet(int idWodet);
    }

    public class WoDetHandler: IWoDetHandler
    {
        private readonly IWoDetRepository _woDetRepository;
        private ILoggerManager _log;

        public WoDetHandler(IWoDetRepository woDetRepository,
            ILoggerManager log)
        {
            _woDetRepository = woDetRepository;
            _log = log;
        }

        public WoDetQueryResult GetWodetByIdWodet(int idWodet)
        {
            return _woDetRepository.GetWodetByIdWodet(idWodet);
        }
    }
}
