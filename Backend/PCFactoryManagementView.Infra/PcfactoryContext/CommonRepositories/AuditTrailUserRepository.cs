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
    public class AuditTrailTableRepository : IAuditTrailTableRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public AuditTrailTableRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<AuditTrailTableQueryResult> GetAllCodeTable()
        {
            _log.LogInformation("AuditTrailTableRepository: GetAllCodeTable");
            var qry = $@"
				SELECT 
                A.IDAuditTrail 'IDAuditTrail', 
                A.Code AS 'TableCode'
                from TBLAuditTrail A
                ORDER BY A.Code";

            return _context.Connection.Query<AuditTrailTableQueryResult>(qry).ToList();
        }

        public List<AuditTrailTableQueryResult> GetPageCodeTable(int pPage, int pSize)
        {
            _log.LogInformation("AuditTrailTableRepository: GetPageCodeTable");
            var qry = $@"
				SELECT 
                A.IDAuditTrail 'IDAuditTrail', 
                A.Code AS 'TableCode'
                from TBLAuditTrail A
                ORDER BY A.Code";

            return _context.Connection.Query<AuditTrailTableQueryResult>(qry).Skip(pPage*pSize).Take(pSize).ToList();
        }

        public List<AuditTrailTableQueryResult> GetCodeTableByCode(string code)
        {
            _log.LogInformation("AuditTrailTableRepository: GetCodeTableByCode");
            var count = "100";
            var qry = $@"
				SELECT 
                A.IDAuditTrail 'IDAuditTrail', 
                A.Code AS 'TableCode'
                from TBLAuditTrail A
                WHERE A.CODE LIKE '{code}%'
                ORDER BY A.Code
                ";

            return _context.Connection.Query<AuditTrailTableQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}
