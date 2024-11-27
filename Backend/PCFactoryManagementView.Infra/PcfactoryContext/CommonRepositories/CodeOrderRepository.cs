using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class CodeOrderRepository : ICodeOrderRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private readonly PCFactoryManagementViewDataContextInteg _contextInteg;
        private ILoggerManager _log;

        public CodeOrderRepository(PCFactoryManagementViewDataContext Context,
            PCFactoryManagementViewDataContextInteg ContextInteg,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
            _contextInteg = ContextInteg;
        }

        public List<CodeOrderQueryResult> GetAllCodeOrders()
        {
            _log.LogInformation("CodeOrderRepository: GetAllCodeOrder");
            var qry = $@"
                SELECT DISTINCT
                WOHD.Code AS WohdCode,
                WOHD.Code1 AS WohdName,
                Wohd.IDWOHD as WohdId
                FROM TBLProductionEv ev
                LEFT JOIN TBLWOHD WOHD WITH(NOLOCK) ON EV.IDWOHD = WOHD.IDWOHD
                WHERE WOHD.Code IS NOT NULL
                ORDER BY WOHD.Code";
            return _context.Connection.Query<CodeOrderQueryResult>(qry).ToList();
        }

        public List<CodeOrderQueryResult> GetPageCodeOrders(int pPage, int pSize)
        {
            _log.LogInformation("CodeOrderRepository: GetAllCodeOrder");
            var qry = $@"
                SELECT DISTINCT
                WOHD.Code AS WohdCode,
                WOHD.Code1 AS WohdName,
                Wohd.IDWOHD as WohdId
                FROM TBLProductionEv ev
                LEFT JOIN TBLWOHD WOHD WITH(NOLOCK) ON EV.IDWOHD = WOHD.IDWOHD
                WHERE WOHD.Code IS NOT NULL
                ORDER BY WOHD.Code";
            return _context.Connection.Query<CodeOrderQueryResult>(qry).Skip(pPage*pSize).Take(pSize).ToList();
        }

        public List<CodeOrderQueryResult> GetCodeOrderByCode(string code)
        {
            _log.LogInformation("CodeOrderRepository: GetCodeOrderByCode");
            var count = "100";
            var qry = $@"SELECT DISTINCT
                        WOHD.Code AS WohdCode,
                        WOHD.Code1 AS WohdName,
                        Wohd.IDWOHD as WohdId
                        FROM TBLProductionEv ev
                        LEFT JOIN TBLWOHD WOHD WITH(NOLOCK) ON EV.IDWOHD = WOHD.IDWOHD
                        WHERE WOHD.Code LIKE '{code}%'";

            return _context.Connection.Query<CodeOrderQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }

        public List<CodeOrderQueryResult> GetIntegrationPageCodeOrders(int pPage, int pSize)
        {
            _log.LogInformation("CodeOrderRepository: GetIntegrationCodeOrderByCode");
            var qry = $@"
                SELECT 
                    IDInWOHD    AS WOHDID,
                    Code        AS WOHDCODE 
                FROM TBLInWOHD 
                WHERE IDInWOHD IN (
	                SELECT
		                TBLInWOHD_Passado.IDInWOHD 
	                FROM TBLInWOHD AS TBLInWOHD_Passado 
	                INNER JOIN (
		                SELECT 
			                COUNT(*) AS Qty, 
			                MAX(IDInWOHD) AS IDInWOHD_Ultimo, 
			                Code 
		                FROM TBLInWOHD AS TBLInWOHD_Passado
		                GROUP BY Code 
		                HAVING COUNT(*) >= 1 
	                ) TBLInWOHD_Ultimo ON TBLInWOHD_Passado.Code = TBLInWOHD_Ultimo.Code 
	                AND TBLInWOHD_Ultimo.IDInWOHD_Ultimo = TBLInWOHD_Passado.IDInWOHD 
                );";

            return _contextInteg.ConnectionWithPCF4Integ.Query<CodeOrderQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }
    }
}
