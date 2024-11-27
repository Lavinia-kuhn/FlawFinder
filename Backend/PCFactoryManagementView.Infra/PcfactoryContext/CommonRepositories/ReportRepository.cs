using Dapper;
using PCFactoryManagementView.Shared;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using System.Collections.Generic;
using System.Linq;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class ReportRepository : IReportRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;
        public ReportRepository(PCFactoryManagementViewDataContext context,
            ILoggerManager log)
        {
            _log = log;
            _context = context;
        }

       

        public List<ReportQueryResult> GetReport()
        {
            _log.LogInformation("ReportRepository: GetUserGroupsByPref");
            var qry =
             $@"
	            SELECT * FROM TblNoDetectionCause
                ";

            return _context.Connection.Query<ReportQueryResult>(qry).ToList();
        }
    }
}