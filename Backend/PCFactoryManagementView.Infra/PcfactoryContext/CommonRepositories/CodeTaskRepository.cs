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
    public class CodeTaskRepository : ICodeTaskRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public CodeTaskRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<CodeTaskQueryResult> GetAllCodeTask()
        {
            _log.LogInformation("CodeTaskRepository: GetAllCodeTask");
            var qry = $@"
				SELECT 
                A.IDPickingTaskHD 'TaskId', 
                A.Code AS 'TaskCode'
                from TBLPickingTaskHD A
                ORDER BY A.Code ";

            return _context.Connection.Query<CodeTaskQueryResult>(qry).ToList();
        }

        public List<CodeTaskQueryResult> GetPageCodeTask(int pPage, int pSize)
        {
            _log.LogInformation("CodeTaskRepository: GetAllCodeTask");
            var qry = $@"
				SELECT 
                A.IDPickingTaskHD 'TaskId', 
                A.Code AS 'TaskCode'
                from TBLPickingTaskHD A
                ORDER BY A.Code ";

            return _context.Connection.Query<CodeTaskQueryResult>(qry).Skip(pPage*pSize).Take(pSize).ToList();
        }

        public List<CodeTaskQueryResult> GetCodeTaskByCode(string code)
        {
            _log.LogInformation("CodeTaskRepository: GetCodeTaskByCode");
            var count = "100";
            var qry = $@"
				SELECT 
                A.IDPickingTaskHD 'TaskId', 
                A.Code AS 'TaskCode'
                from TBLPickingTaskHD A
                WHERE A.CODE LIKE '{code}%'
                ORDER BY A.Code
                ";

            return _context.Connection.Query<CodeTaskQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}
