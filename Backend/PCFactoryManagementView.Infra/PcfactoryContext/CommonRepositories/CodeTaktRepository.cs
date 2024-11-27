using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class CodeTaktRepository : ICodeTaktRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public CodeTaktRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<CodeTaktQueryResult> GetAllCodeTakt()
        {
            _log.LogInformation("CodeInventoryRepository: GetAllCodeInventory");
            var qry = $@"
SELECT
	 A.IDTAKTHD 'TaktId'
	,A.Code 'TaktCode'
FROM TBLTAKTHD A
ORDER BY
	A.Code";

            return _context.Connection.Query<CodeTaktQueryResult>(qry).ToList();
        }

        public List<CodeTaktQueryResult> GetPageCodeTakt(int pPage, int pSize)
        {
            _log.LogInformation("CodeInventoryRepository: GetAllCodeInventory");
            var qry = $@"
SELECT
	 A.IDTAKTHD 'TaktId'
	,A.Code 'TaktCode'
FROM TBLTAKTHD A
ORDER BY
	A.Code";

            return _context.Connection.Query<CodeTaktQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }

        public List<CodeTaktQueryResult> GetCodeTaktByCode(string code)
        {
            _log.LogInformation("CodeInventoryRepository: GetCodeInventoryByCode");
            var count = "100";
            var qry = $@"
SELECT
	 A.IDTAKTHD 'TaktId'
	,A.Code 'TaktCode'
FROM TBLTAKTHD A
ORDER BY
	A.Code
                ";

            return _context.Connection.Query<CodeTaktQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }

    }
}
