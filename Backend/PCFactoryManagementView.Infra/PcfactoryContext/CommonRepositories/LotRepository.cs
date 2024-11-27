using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class LotRepository : ILotRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public LotRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<LotQueryResult> GetAllLot()
        {
            _log.LogInformation("LotRepository: GetAllLot");
            var qry = $@"
                Select
                A.IDLot AS 'LotId',
                A.CODE AS 'LotCode',
                B.Code AS ProductCode
                FROM TBLLot A 
                INNER JOIN TBLProduct B
                ON A.IDProduct = B.IDProduct
                ORDER BY A.Code";

            return _context.Connection.Query<LotQueryResult>(qry).ToList();
        }

        public List<LotQueryResult> GetLotByCode(string code)
        {
            _log.LogInformation("LotRepository: GetLotByCode");
            var count = "500";
            var qry = $@"Select
                A.IDLot AS 'LotId',
                A.CODE AS 'LotCode',
                B.Code AS ProductCode
                FROM TBLLot A
                INNER JOIN TBLProduct B
                ON A.IDProduct = B.IDProduct
                WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<LotQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }

        public List<LotQueryResult> GetPageLot(int pPage, int pSize)
        {
            _log.LogInformation("LotRepository: GetPageLot");
            
            var qry = $@"
                Select
                A.IDLot AS 'LotId',
                A.CODE AS 'LotCode',
                B.Code AS ProductCode
                FROM TBLLot A 
                INNER JOIN TBLProduct B
                ON A.IDProduct = B.IDProduct
                ORDER BY A.Code";

            return _context.Connection.Query<LotQueryResult>(qry).Skip(pPage*pSize).Take(pSize).ToList();
        }
    }
}
