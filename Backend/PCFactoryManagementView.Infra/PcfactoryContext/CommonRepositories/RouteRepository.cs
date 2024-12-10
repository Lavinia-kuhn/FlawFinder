using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class RouteRepository : IRouteRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public RouteRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<RouteQueryResult> GetAllRoute()
        {
            _log.LogInformation("RouteRepository: GetAllRoute");
            var qry = $@"
				SELECT 
                A.IDTransportRouteHD 'RouteId', 
                A.Code AS 'RouteCode', 
                A.Name AS 'RouteName'
                from TBLTransportRouteHD A
                ORDER BY A.Code ";

            return _context.Connection.Query<RouteQueryResult>(qry).ToList();
        }

        public List<RouteQueryResult> GetPageRoute(int pPage, int pSize)
        {
            _log.LogInformation("RouteRepository: GetAllRoute");
            var qry = $@"
				SELECT 
                A.IDTransportRouteHD 'RouteId', 
                A.Code AS 'RouteCode', 
                A.Name AS 'RouteName'
                from TBLTransportRouteHD A
                ORDER BY A.Code";

            return _context.Connection.Query<RouteQueryResult>(qry).Skip(pPage*pSize).Take(pSize).ToList();
        }

        public List<RouteQueryResult> GetRouteByCode(string code)
        {
            _log.LogInformation("RouteRepository: GetRouteByCode");
            var count = "100";
            var qry = $@"
                SELECT 
                A.IDTransportRouteHD 'RouteId', 
                A.Code AS 'RouteCode', 
                A.Name AS 'RouteName'
                from TBLTransportRouteHD A
                WHERE A.CODE LIKE '{code}%'
                ORDER BY A.Code
                ";

            return _context.Connection.Query<RouteQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}
