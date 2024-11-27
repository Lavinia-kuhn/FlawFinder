using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class ResourceRepository : IResourceRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public ResourceRepository(
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<ResourceQueryResult> GetAll()
        {
            _log.LogInformation("ResourceRepository: GetAll");
            var qry = $@"
                SELECT
                A.IDResource,
                A.CODE + '-' + A.NAME AS 'Code'
                FROM TBLResource A
                ORDER BY A.Code ";

            return _context.Connection.Query<ResourceQueryResult>(qry).ToList();
        }

        public List<ResourceQueryResult> GetPage(int pPage, int pSize)
        {
            _log.LogInformation("ResourceRepository: GetPage");
            var qry = $@"
                SELECT
                A.IDResource,
                A.CODE + '-' + A.NAME AS 'Code'
                FROM TBLResource A
                ORDER BY A.Code ";

            return _context.Connection.Query<ResourceQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }

        public List<ResourceQueryResult> GetByCode(string code)
        {
            _log.LogInformation("ResourceRepository: GetAll");
            var qry = $@"
                SELECT
                A.IDResource,
                A.CODE + '-' + A.NAME AS 'Code'
                FROM TBLResource A
                WHERE A.CODE + '-' + A.NAME LIKE '{code}%'
                ORDER BY A.Code ";

            return _context.Connection.Query<ResourceQueryResult>(qry).ToList();
        }


        public ResourceCompleteQueryResult GetByIdResource(int idResource)
        {
            _log.LogInformation("ResourceRepository: GetByIdResource");
            var qry = $@"
SELECT
    A.IDResource,
    A.Code, 
    A.StdCycleTime, 
    A.StdCycleTimeFormat,
    A.FlgAdvTooling,
    A.IDShift,
    A.IDHolidayHD
FROM TBLResource A
WHERE A.IDRESOURCE = {idResource}
ORDER BY A.Code ";

            return _context.Connection.Query<ResourceCompleteQueryResult>(qry).FirstOrDefault();
        }

        public List<ResourceQueryResult> getByIdManagerGrp(int idManagerGrp)
        {
            _log.LogInformation("ResourceRepository: GetByIdResource");
            var qry = $@"
                SELECT
                A.IDResource,
                A.IDResource as id,
                A.Code,
				A.Name,
				A.Nickname,
                A.IdManagerGrp
                FROM TBLResource A
                WHERE A.IDMANAGERGRP = {idManagerGrp}
				AND FlgEnable = 1
                ORDER BY A.Code ";

            return _context.Connection.Query<ResourceQueryResult>(qry).ToList();
        }
    }
}
