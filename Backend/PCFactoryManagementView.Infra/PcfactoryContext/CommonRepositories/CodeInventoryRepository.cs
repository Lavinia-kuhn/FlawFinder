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
    public class CodeInventoryRepository : ICodeInventoryRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public CodeInventoryRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<CodeInventoryQueryResult> GetAllCodeInventory()
        {
            _log.LogInformation("CodeInventoryRepository: GetAllCodeInventory");
            var qry = $@"
				SELECT 
                A.IDInventory 'InventoryId', 
                A.Code AS 'InventoryCode'
                from TBLInventory A
                ORDER BY A.Code";

            return _context.Connection.Query<CodeInventoryQueryResult>(qry).ToList();
        }

        public List<CodeInventoryQueryResult> GetPageCodeInventory(int pPage, int pSize)
        {
            _log.LogInformation("CodeInventoryRepository: GetAllCodeInventory");
            var qry = $@"
				SELECT 
                A.IDInventory 'InventoryId', 
                A.Code AS 'InventoryCode'
                from TBLInventory A
                ORDER BY A.Code";

            return _context.Connection.Query<CodeInventoryQueryResult>(qry).Skip(pPage*pSize).Take(pSize).ToList();
        }

        public List<CodeInventoryQueryResult> GetCodeInventoryByCode(string code)
        {
            _log.LogInformation("CodeInventoryRepository: GetCodeInventoryByCode");
            var count = "100";
            var qry = $@"
				SELECT 
                A.IDInventory 'InventoryId', 
                A.Code AS 'InventoryCode'
                from TBLInventory A
                ORDER BY A.Code
                ";

            return _context.Connection.Query<CodeInventoryQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}
