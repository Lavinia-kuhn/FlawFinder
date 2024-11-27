using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class WarehouseRepository : IWarehouseRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public WarehouseRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<WarehouseQueryResult> GetAllWarehouses()
        {
            _log.LogInformation("WarehouseRepository: GetAllWarehouses");
            var qry = $@"
                SELECT
                A.IDWAREHOUSE AS 'WarehouseId',
                A.CODE AS 'WarehouseCode',
                A.NAME AS 'WarehouseName'
                FROM TBLWarehouse A
                ORDER BY A.Code";
            return _context.Connection.Query<WarehouseQueryResult>(qry).ToList();
        }

        public List<WarehouseQueryResult> GetPageWarehouses(int pPage, int pSize)
        {
            _log.LogInformation("WarehouseRepository: GetAllWarehouses");
            var qry = $@"
                SELECT
                A.IDWAREHOUSE AS 'WarehouseId',
                A.CODE AS 'WarehouseCode',
                A.NAME AS 'WarehouseName'
                FROM TBLWarehouse A
                ORDER BY A.Code";
            return _context.Connection.Query<WarehouseQueryResult>(qry).Skip(pPage*pSize).Take(pSize).ToList();
        }

        public List<WarehouseQueryResult> GetWarehouseByCode(string code)
        {
            _log.LogInformation("WarehouseRepository: GetWarehouseByCode");
            var count = "100";
            var qry = $@"Select
                A.IDWAREHOUSE AS 'WarehouseId',
                A.CODE AS 'WarehouseCode',
                A.NAME AS 'WarehouseName'

                FROM TBLWarehouse A
                WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<WarehouseQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}
