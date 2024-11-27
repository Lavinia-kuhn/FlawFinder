using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IRouteHandler
    {
        List<RouteQueryResult> GetAllRoute(); 
        List<RouteQueryResult> GetPageRoute(int pPage, int pSize);
        List<RouteQueryResult> GetRouteByCode(string code);
    }

    public class RouteHandler : IRouteHandler
    {

        private ILoggerManager _log;
        private readonly IRouteRepository _RouteRepository;

        public RouteHandler(IRouteRepository RouteRepository,
            ILoggerManager log)
        {
            _RouteRepository = RouteRepository;
            _log = log;
        }

        public List<RouteQueryResult> GetAllRoute()
        {
            _log.LogInformation("RouteHandler: GetAllRoute");
            return _RouteRepository.GetAllRoute();
        }

        public List<RouteQueryResult> GetRouteByCode(string code)
        {
            _log.LogInformation("RouteHandler: GetRouteByCode");
            return _RouteRepository.GetRouteByCode(code);
        }

        public List<RouteQueryResult> GetPageRoute(int pPage, int pSize)
        {
            _log.LogInformation("RouteHandler: GetPageRoute");
            return _RouteRepository.GetPageRoute(pPage,pSize);
        }
    }
}

