using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IContainerTypeHandler
    {
        List<ContainerTypeQueryResult> GetAllContainerType();
        List<ContainerTypeQueryResult> GetContainerTypeByCode(string code);
        List<ContainerTypeQueryResult> GetPageContainerType(int pPage, int pSize);
    }
    public class ContainerTypeHandler : IContainerTypeHandler
    {
        private ILoggerManager _log;
        private readonly IContainerTypeRepository _ContainerTypeRepository;

        public ContainerTypeHandler(IContainerTypeRepository ContainerTypeRepository,
            ILoggerManager log)
        {
            _ContainerTypeRepository = ContainerTypeRepository;
            _log = log;
        }

        public List<ContainerTypeQueryResult> GetAllContainerType()
        {
            _log.LogInformation("ContainerTypeHandler: GetAllContainerType");
            return _ContainerTypeRepository.GetAllContainerType();
        }

        public List<ContainerTypeQueryResult> GetContainerTypeByCode(string code)
        {
            _log.LogInformation("ContainerTypeHandler: GetContainerTypeByCode");
            return _ContainerTypeRepository.GetContainerTypeByCode(code);
        }

        public List<ContainerTypeQueryResult> GetPageContainerType(int pPage, int pSize)
        {
            _log.LogInformation("ContainerTypeHandler: GetAllContainerType");
            return _ContainerTypeRepository.GetPageContainerType(pPage, pSize);
        }
    }
}
