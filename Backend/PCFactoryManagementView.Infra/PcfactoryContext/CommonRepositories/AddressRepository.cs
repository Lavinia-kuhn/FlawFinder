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
    public class AddressRepository : IAddressRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public AddressRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<AddressQueryResult> GetAllAddress()
        {
            _log.LogInformation("AddressRepository: GetAllAddress");
            var qry = $@"
                SELECT
                A.IDAddress AS 'AddressId',
                A.CODE AS 'AddressCode',
                A.NAME AS 'AddressName',
                B.code AS 'WarehouseCode' 
                FROM TBLAddress A
                INNER JOIN TBLWarehouse B
                ON A.IDWarehouse = B.IDWarehouse
                ORDER BY A.Code ";

            return _context.Connection.Query<AddressQueryResult>(qry).ToList();
        }

        public List<AddressQueryResult> GetPageAddress(int pPage, int pSize)
        {
            _log.LogInformation("AddressRepository: GetAllAddress");
            var qry = $@"
                SELECT
                A.IDAddress AS 'AddressId',
                A.CODE AS 'AddressCode',
                A.NAME AS 'AddressName',
                B.code AS 'WarehouseCode' 
                FROM TBLAddress A
                INNER JOIN TBLWarehouse B
                ON A.IDWarehouse = B.IDWarehouse
                ORDER BY A.Code ";

            return _context.Connection.Query<AddressQueryResult>(qry).Skip(pPage*pSize).Take(pSize).ToList();
        }

        public List<AddressQueryResult> GetAddressByCode(string code)
        {
            _log.LogInformation("AddressRepository: GetAddressByCode");
            var count = "100";
            var qry = $@"Select
                A.IDAddress AS 'AddressId',
                A.CODE AS 'AddressCode',
                A.NAME AS 'AddressName',
                B.code AS 'WarehouseCode' 

                from TBLAddress A

                inner join TBLWarehouse B
                on A.IDWarehouse = B.IDWarehouse
                WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<AddressQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }

        List<AddressQueryResult> IAddressRepository.GetAddressByIdWarehouses(List<int> warehouseIds)
        {
            _log.LogInformation("AddressRepository: GetAddressByIdWarehouses");

            var count = "100";
            string idWarehouse = "";

            foreach(var id in warehouseIds)
            {
                idWarehouse += id + ",";
            }
            string formatedId = idWarehouse.Remove(idWarehouse.Length -1);

            var qry = $@"select 
                A.IDAddress 'AddressId', 
                A.code AS 'AddressCode', 
                A.name AS 'AddressName',
                B.code AS 'WarehouseCode'

                from TBLAddress A

                inner join TBLWarehouse B
                on A.IDWarehouse = B.IDWarehouse
                where b.IDWarehouse in ({formatedId})";

            return _context.Connection.Query<AddressQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }

        public List<SelectData> GetAllAddressToSelect()
        {
            _log.LogInformation("AddressRepository: GetAllAddress");
            var qry = $@"
                SELECT
                A.IDAddress AS value,
				A.Code + '-' + A.Name AS label,
                B.code AS groupLabel 
                FROM TBLAddress A
                INNER JOIN TBLWarehouse B
                ON A.IDWarehouse = B.IDWarehouse
                ORDER BY A.Code ";

            return _context.Connection.Query<SelectData>(qry).ToList();
        }

        public List<AddressQueryResult> GetAddressByIdMap(int? idMap)
        {
            _log.LogInformation("AddressRepository: GetAddressByIdMap");
            _log.LogInformation("GetAddressByIdMap: IdMap - " + idMap);

            var qry = $@"
                Select 
	                AD.Code										AS AddressCode,
	                AD.IDAddress								AS AddressId,
	                MAX(MEV.DtTimeStamp)						AS LastUpdate,
	                SUM(FB.InitBalance + FB.InQty - FB.OutQty)	AS Balance
                FROM TBLAddressMapDet ADMAP(NOLOCK)
	                INNER JOIN TBLAddress AD(NOLOCK)		ON AD.IDAddress = ADMAP.IDAddress
	                LEFT JOIN (SELECT MAX(DtTimeStamp) DtTimeStamp,IDAddress FROM TBLMovEv MEV GROUP BY IDAddress ) MEV ON ADMAP.IDAddress = MEV.IDAddress
	                LEFT JOIN TBLFinalBalance FB(NOLOCK)	ON FB.IDAddress = AD.IDAddress
                WHERE 
	                IDAddressMapHD = @IdMap 
	                AND AD.FlgEnable = 1
                GROUP BY 
	                AD.Code, 
	                AD.IDAddress";

            _log.LogInformation("GetAddressByIdMap: Query - " + qry);

            return _context.Connection.Query<AddressQueryResult>(qry, new { IdMap = idMap}).ToList();
        }

        public AddressQueryResult GetAddressById(int? idMap, int addressId)
        {
            _log.LogInformation("AddressRepository: GetAddressByIdMap");
            _log.LogInformation("GetAddressByIdMap: IdMap - " + idMap);

            var qry = $@"
                Select 
	                AD.Code										AS AddressCode,
	                AD.IDAddress								AS AddressId,
	                MAX(MEV.DtTimeStamp)						AS LastUpdate,
	                SUM(FB.InitBalance + FB.InQty - FB.OutQty)	AS Balance
                FROM TBLAddressMapDet ADMAP(NOLOCK)
	                INNER JOIN TBLAddress AD(NOLOCK)		ON AD.IDAddress = ADMAP.IDAddress
	                LEFT JOIN (SELECT MAX(DtTimeStamp) DtTimeStamp,IDAddress FROM TBLMovEv MEV GROUP BY IDAddress ) MEV ON ADMAP.IDAddress = MEV.IDAddress
	                LEFT JOIN TBLFinalBalance FB(NOLOCK)	ON FB.IDAddress = AD.IDAddress
                WHERE 
	                IDAddressMapHD = @IdMap 
	                AND AD.FlgEnable = 1
                    AND AD.IDAddress = {addressId}
                GROUP BY 
	                AD.Code, 
	                AD.IDAddress";

            _log.LogInformation("GetAddressByIdMap: Query - " + qry);

            return _context.Connection.Query<AddressQueryResult>(qry, new { IdMap = idMap}).First();
        }
    }
}
