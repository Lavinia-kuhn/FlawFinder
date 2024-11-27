using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class CodeOperationRepository : ICodeOperationRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public CodeOperationRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<CodeOperationQueryResult> GetAllCodeOperations()
        {
            _log.LogInformation("CodeOperationRepository: GetAllCodeOperation");
            var qry = $@"
                SELECT DISTINCT
                WODet.Code AS WODetCode
                FROM TBLWODet WODet
                ORDER BY WODet.Code";
            return _context.Connection.Query<CodeOperationQueryResult>(qry).ToList();
        }

        public List<CodeOperationQueryResult> GetPageCodeOperations(int pPage, int pSize)
        {
            _log.LogInformation("CodeOperationRepository: GetAllCodeOperation");
            var qry = $@"
                SELECT DISTINCT
                WODet.Code AS WODetCode
                FROM TBLWODet WODet
                ORDER BY WODet.Code";
            return _context.Connection.Query<CodeOperationQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }

        public List<CodeOperationQueryResult> GetCodeOperationByCode(string code)
        {
            _log.LogInformation("CodeOperationRepository: GetCodeOperationByCode");
            var count = "100";
            var qry = $@"SELECT DISTINCT
                WODet.Code AS WODetCode
                FROM TBLWODet WODet
				WHERE WODET.Code LIKE '{code}%'
                ORDER BY WODet.Code";

            return _context.Connection.Query<CodeOperationQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}
