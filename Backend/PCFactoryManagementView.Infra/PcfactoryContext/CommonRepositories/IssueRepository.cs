using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
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

        public string GetGreaterNoDetectionCause()
        {
            var qry = @$"
SELECT 
    TND.Code AS NoDetectionCode,
    COUNT(TBNC.idNoDetectionCause) AS OccurrenceCount
FROM 
    TblNoDetectionCause TND
LEFT JOIN 
    TblBugNoDetectionCause TBNC ON TND.idNoDetectionCause = TBNC.idNoDetectionCause
GROUP BY 
    TND.Code
ORDER BY 
    OccurrenceCount DESC
LIMIT 1;
";
            return _context.Connection.Query<string>(qry).FirstOrDefault();
        }

        public object GetNoDetectionByDate()
        {
            var qry = @$"
SELECT 
    Date,
    COUNT(*) AS NoDetectionCount
FROM 
    TblNoDetectionCause
GROUP BY 
    Date
ORDER BY 
    Date ASC;
";

            return _context.Connection.Query<object>(qry).FirstOrDefault();
        }

        public object GetNoDetectionCausePareto()
        {
            var qry = @$"
SELECT 
    TND.Code AS CauseCode,
    TND.Name AS CauseName,
    COUNT(TBNC.idNoDetectionCause) AS OccurrenceCount
FROM 
    TblNoDetectionCause TND
LEFT JOIN 
    TblBugNoDetectionCause TBNC ON TND.idNoDetectionCause = TBNC.idNoDetectionCause
GROUP BY 
    TND.Code, TND.Name
ORDER BY 
    OccurrenceCount DESC;
";
            return _context.Connection.Query<object>(qry).FirstOrDefault();
        }

 
    }
}
