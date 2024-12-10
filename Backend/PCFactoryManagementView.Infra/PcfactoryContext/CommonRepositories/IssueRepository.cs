using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Threading.Tasks;
using System;
using System.Transactions;
using System.Data.Common;

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
	N.Name AS grouper
	,COUNT(*) count
FROM TblBugNoDetectionCause BN
INNER JOIN TblNoDetectionCause N ON N.idNoDetectionCause = BN.idNoDetectionCause
GROUP BY N.Name
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
	 N.Name AS type
	,COUNT(*) value
FROM TblBugNoDetectionCause BN
INNER JOIN TblNoDetectionCause N ON N.idNoDetectionCause = BN.idNoDetectionCause
GROUP BY N.Name
ORDER BY value Desc
";
            return _context.Connection.Query<Pie>(qry).ToList();
        }

        public int GetBugCount()
        {
            var qry = $@"
SELECT 
	COUNT(*) value
FROM TBLBug
";
            return _context.Connection.Query<int>(qry).FirstOrDefault();
        }


        public async Task InsertIssueCodes(List<Issue> issues)
        {
            foreach (var issue in issues)
            {
                if (issue != null)
                {
                    string checkQuery = "SELECT COUNT(1) FROM TBLBug WHERE JiraCode = @_issue";
                    int count = _context.Connection.Query<int>(checkQuery, new { _issue = issue.key }).FirstOrDefault();
                    if (count == 0)
                    {
                        try
                        {
                            string insertQuery = "INSERT INTO TBLBug (JiraCode, Date) VALUES (@_issue, @_date)";
                            _context.Connection.Execute(insertQuery, new { _issue = issue.key, _date = issue.date });
                        }
                        catch (Exception ex)
                        {

                            throw;
                        }

                    }
                }

            }
        }

        public async Task InsertNoDetectionCause(List<ApiResponse> nodetections)
        {
            foreach (var nodetection in nodetections)
            {
                if (nodetection != null)
                {
                    string checkQuery = "SELECT COUNT(1) FROM TBlNoDetectionCause WHERE name = @_noDetection";
                    int count = _context.Connection.Query<int>(checkQuery, new { _noDetection = nodetection.Motivo_Nao_Deteccao }).FirstOrDefault();
                    if (count == 0)
                    {
                        try
                        {
                            string insertQuery = "INSERT INTO TBlNoDetectionCause (name, Date) VALUES (@_noDetection, @_date)";
                            _context.Connection.Execute(insertQuery, new { _noDetection = nodetection.Motivo_Nao_Deteccao, _date = DateTime.Now });
                        }
                        catch (Exception ex)
                        {

                            throw;
                        }

                    }

                    string checkQueryNoDetection = @$"
SELECT * FROM TblBugNoDetectionCause WHERE idBug = (SELECT idbug FROM TblBug WHERE JiraCode = @_bugCode) AND idNoDetectionCause = (SELECT idNoDetectionCause FROM TblNoDetectionCause WHERE Name = @_noDetection)";
                    int count1 = _context.Connection.Query<int>(checkQueryNoDetection, new { _noDetection = nodetection.Motivo_Nao_Deteccao, _bugCode = nodetection.Issue_key}).FirstOrDefault();

                    if (count1 == 0)
                    {
                        try
                        {
                            var idBug = _context.Connection.Query<int>("SELECT idBug from TblBug Where JiraCode = @_bugCode", new {  _bugCode = nodetection.Issue_key }).FirstOrDefault();
                            if(idBug != 0)
                            {
                                string insertQuery = $@"
INSERT INTO TblBugNoDetectionCause (idBug, idNoDetectionCause, Date) VALUES ((SELECT idbug FROM TblBug WHERE JiraCode = @_bugCode), (SELECT idNoDetectionCause FROM TblNoDetectionCause WHERE Name = @_noDetection), GETDATE())";
                                _context.Connection.Execute(insertQuery, new { _bugCode = nodetection.Issue_key, _noDetection = nodetection.Motivo_Nao_Deteccao, _date = DateTime.Now });
                            }
                          
                        }
                        catch (Exception ex)
                        {

                            throw;
                        }
                    }
                }



            }
        }

    }
}