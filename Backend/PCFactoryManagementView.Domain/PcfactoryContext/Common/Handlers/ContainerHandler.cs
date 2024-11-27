using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IContainerHandler
    {
        List<ContainerQueryResult> GetAllContainer();
        List<ContainerQueryResult> GetContainerByCode(string code);
        List<ContainerQueryResult> GetPageContainer(int pPage, int pSize);
    }

    public class ContainerHandler : IContainerHandler
    {
        private ILoggerManager _log;
        private readonly IContainerRepository _ContainerRepository;

        public ContainerHandler(IContainerRepository ContainerRepository,
            ILoggerManager log)
        {
            _ContainerRepository = ContainerRepository;
            _log = log;
        }

        public List<ContainerQueryResult> GetAllContainer()
        {
            _log.LogInformation("ContainerHandler: GetAllContainer");
            return _ContainerRepository.GetAllContainer();
        }

        public List<ContainerQueryResult> GetContainerByCode(string code)
        {
            _log.LogInformation("ContainerHandler: GetContainerByCode");
            return _ContainerRepository.GetContainerByCode(code);
        }

        public List<ContainerQueryResult> GetPageContainer(int pPage, int pSize)
        {
            _log.LogInformation("ContainerHandler: GetAllContainer");
            return _ContainerRepository.GetPageContainer(pPage, pSize);
        }
    }
}
