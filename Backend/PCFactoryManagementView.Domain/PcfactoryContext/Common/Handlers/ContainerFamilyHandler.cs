using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IContainerFamilyHandler
    {
        List<ContainerFamilyQueryResult> GetAllContainerFamily();
        List<ContainerFamilyQueryResult> GetContainerFamilyByCode(string code);
        List<ContainerFamilyQueryResult> GetPageContainerFamily(int pPage, int pSize);
    }
    public class ContainerFamilyHandler : IContainerFamilyHandler
    {
        private ILoggerManager _log;
        private readonly IContainerFamilyRepository _ContainerFamilyRepository;

        public ContainerFamilyHandler(IContainerFamilyRepository ContainerFamilyRepository,
            ILoggerManager log)
        {
            _ContainerFamilyRepository = ContainerFamilyRepository;
            _log = log;
        }
        public List<ContainerFamilyQueryResult> GetAllContainerFamily()
        {
            _log.LogInformation("ContainerFamilyHandler: GetAllContainerFamily");
            return _ContainerFamilyRepository.GetAllContainerFamily();
        }

        public List<ContainerFamilyQueryResult> GetContainerFamilyByCode(string code)
        {
            _log.LogInformation("ContainerFamilyHandler: GetContainerFamilyByCode");
            return _ContainerFamilyRepository.GetContainerFamilyByCode(code);
        }

        public List<ContainerFamilyQueryResult> GetPageContainerFamily(int pPage, int pSize)
        {
            _log.LogInformation("ContainerFamilyHandler: GetAllContainerFamily");
            return _ContainerFamilyRepository.GetPageContainerFamily(pPage, pSize);
        }
    }
}
