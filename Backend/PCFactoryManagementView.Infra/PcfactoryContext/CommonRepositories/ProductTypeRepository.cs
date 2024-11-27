using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class ProductTypeRepository : IProductTypeRepository
    {

        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public ProductTypeRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<ProductTypeQueryResult> getAllProductTypes()
        {
            _log.LogInformation("ProductTypeRepository: getAllProductTypes");
            var qry = $@"
                SELECT 
                A.IDProductType 'productTypeId', 
                A.Code AS 'productTypeCode', 
                A.Name AS 'productTypeName'
                from TBLProductType A
                ORDER BY A.Code";
            return _context.Connection.Query<ProductTypeQueryResult>(qry).ToList();
        }

        public List<ProductTypeQueryResult> getPageProductTypes(int pPage, int pSize)
        {
            _log.LogInformation("ProductTypeRepository: getPageProductTypes");
            var qry = $@"
                SELECT 
                A.IDProductType 'productTypeId', 
                A.Code AS 'productTypeCode', 
                A.Name AS 'productTypeName'
                from TBLProductType A
                ORDER BY A.Code";
            return _context.Connection.Query<ProductTypeQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }

        public List<ProductTypeQueryResult> getProductTypeByCode(string code)
        {
            _log.LogInformation("ProductTypeRepository: getProductTypeByCode");
            var qry = $@"
                SELECT 
                A.IDProductType 'productTypeId', 
                A.Code AS 'productTypeCode', 
                A.Name AS 'productTypeName'
                from TBLProductType A
                WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<ProductTypeQueryResult>(qry).ToList();
        }

        public List<ProductTypeQueryResult> getProductTypeByIdProductFamily(List<int> productFIds)
        {
            _log.LogInformation("ProductRepository: getProductTypeByIdProductFamily");
            string formatedId = "";
            if (productFIds.Count() != 0)
            {
                string idProductF = "";
                foreach (var id in productFIds)
                {
                    idProductF += id + ",";
                }
                formatedId = "C.IDProductFamily in (" + idProductF.Remove(idProductF.Length - 1) + ")";
            } else
            {
                formatedId = "1 = 1";
            }


            var qry = $@"				
                SELECT distinct
                A.IDProductType 'productTypeId', 
                A.Code AS 'productTypeCode', 
                A.Name AS 'productTypeName',
				C.code AS 'productFamilyCode'
                from TBLProductType A
				Inner join TBlProduct B
					on A.IDProductType = B.IDProductType
				Inner join TBLProductFamily C
	                on B.IDProductFamily = C.IDProductFamily
				where {formatedId}
                ORDER BY A.Code";

            return _context.Connection.Query<ProductTypeQueryResult>(qry).ToList();
        }
    }
}
