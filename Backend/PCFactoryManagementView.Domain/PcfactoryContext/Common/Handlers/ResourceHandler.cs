using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{

    [TransientService]
    public interface IResourceHandler
    {
        List<ResourceQueryResult> GetAll();
        List<ResourceQueryResult> GetPage(int pPage, int pSize);
        List<ResourceQueryResult> GetByCode(string code);
        ResourceCompleteQueryResult GetByIdResource(int idResource);
        List<ResourceQueryResult> GetByIdManagerGrp(int idManagerGrp);
    }

    public class ResourceHandler : IResourceHandler
    {
        private ILoggerManager _log;
        private readonly IResourceRepository _resourceRepository;

        public ResourceHandler(IResourceRepository resourceRepository, 
            ILoggerManager log)
        {
            _log = log;
            _resourceRepository = resourceRepository;
        }
        
        public List<ResourceQueryResult> GetAll()
        {
            _log.LogInformation("ResourceHandler: GetAll");
            return _resourceRepository.GetAll();
        }

        public List<ResourceQueryResult> GetByCode(string code)
        {
            _log.LogInformation("ResourceHandler: GetByCode");
            return _resourceRepository.GetByCode(code);
        }

        public ResourceCompleteQueryResult GetByIdResource(int idResource)
        {
            _log.LogInformation("ResourceHandler: GetByIdResource");
            return _resourceRepository.GetByIdResource(idResource);
        }

        public List<ResourceQueryResult> GetByIdManagerGrp(int idManagerGrp)
        {
            _log.LogInformation("ResourceHandler: GetByIdManagerGrp");
            return _resourceRepository.getByIdManagerGrp(idManagerGrp);
        }

        public List<ResourceQueryResult> GetPage(int pPage, int pSize)
        {
            _log.LogInformation("ResourceHandler: GetPage");
            return _resourceRepository.GetPage(pPage, pSize);
        }
    }
}
