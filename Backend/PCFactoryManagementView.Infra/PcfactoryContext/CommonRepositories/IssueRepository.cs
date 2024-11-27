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
    public class IssueRepository : IIssueRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public IssueRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }


        public List<DualAxes> GetNoDetectionCausePareto()
        {
            var qry = @$"

SELECT 
	N.Code + '-' + N.Name AS grouper
	,COUNT(*) count
FROM TblBugNoDetectionCause BN
INNER JOIN TblNoDetectionCause N ON N.idNoDetectionCause = BN.idNoDetectionCause
GROUP BY N.Code, N.Name
ORDER BY count Desc
";
            return _context.Connection.Query<DualAxes>(qry).ToList();
        }

        public List<Line> GetNoDetectionIncrease()
        {
            var qry = @$"
SELECT 
	BN.Date as grouper
	,COUNT(*) value
FROM TblBugNoDetectionCause BN
INNER JOIN TblNoDetectionCause N ON N.idNoDetectionCause = BN.idNoDetectionCause
GROUP BY BN.Date
ORDER BY BN.Date ASC
";
            return _context.Connection.Query<Line>(qry).ToList();
        }


        public List<Pie> GetAllNoDetection()
        {
            var qry = $@"
SELECT 
	N.Code + '-' + N.Name AS type
	,COUNT(*) value
FROM TblBugNoDetectionCause BN
INNER JOIN TblNoDetectionCause N ON N.idNoDetectionCause = BN.idNoDetectionCause
GROUP BY N.Code, N.Name
ORDER BY value Desc
";
            return _context.Connection.Query<Pie>(qry).ToList();
        }
    }
}
