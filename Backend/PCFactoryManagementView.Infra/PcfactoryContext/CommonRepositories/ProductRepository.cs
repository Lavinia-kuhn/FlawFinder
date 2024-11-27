using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class ProductRepository : IProductRepository
    {

        private readonly PCFactoryManagementViewDataContext _context;
        private readonly PCFactoryManagementViewDataContextInteg _contextInteg;
        private ILoggerManager _log;

        public ProductRepository
        (
           PCFactoryManagementViewDataContext Context,
           PCFactoryManagementViewDataContextInteg ContextInteg,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
            _contextInteg = ContextInteg;
        }

        public List<ProductQueryResult> getAllProducts()
        {
            _log.LogInformation("ProductRepository: getAllProducts");
            var qry = $@"
                SELECT 
                A.IDProduct 'productId', 
                A.Code AS 'productCode', 
                A.Name AS 'productName',
                B.Code AS 'productFamilyCode'
                from TBLProduct A
                LEFT JOIN TBLProductFamily B
	            ON A.IDProductFamily = B.IDProductFamily
                ORDER BY A.Code";
            return _context.Connection.Query<ProductQueryResult>(qry).ToList();
        }

        public List<ProductQueryResult> getPageProducts(int pPage, int pSize)
        {
            _log.LogInformation("ProductRepository: getAllProducts");
            var qry = $@"
                SELECT 
                A.IDProduct 'productId', 
                A.Code AS 'productCode', 
                A.Name AS 'productName',
                B.Code AS 'productFamilyCode'
                from TBLProduct A
                LEFT JOIN TBLProductFamily B
	            ON A.IDProductFamily = B.IDProductFamily
                ORDER BY A.Code";
            return _context.Connection.Query<ProductQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }


        public List<ProductQueryResult> getProductByCode(string code)
        {
            _log.LogInformation("ProductRepository: getProductByCode");
            var qry = $@"select 
                A.IDProduct 'productId', 
                A.code AS 'productCode', 
                A.name AS 'productName',
                B.code AS 'productFamilyCode'
                from TBLProduct A
                LEFT join TBLProductFamily B
	                on A.IDProductFamily = B.IDProductFamily
                WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<ProductQueryResult>(qry).ToList();
        }

        public ProductCompleteQueryResult GetProductById(int idProduct)
        {
            _log.LogInformation("ProductRepository: GetProductById");
            var qry =
                $@"select 
                *
                FROM TBLProduct 
                WHERE IdProduct= {idProduct}";

            return _context.Connection.Query<ProductCompleteQueryResult>(qry).FirstOrDefault();
        }

        public ProductQueryResult GetProductByID(int idProduct)
        {
            _log.LogInformation("ProductRepository: GetProductById");

            var qry = $@"select 
                A.IDProduct 'productId', 
                A.code AS 'productCode', 
                A.name AS 'productName',
                B.code AS 'productFamilyCode'
                from TBLProduct A
                LEFT join TBLProductFamily B
	                on A.IDProductFamily = B.IDProductFamily
                WHERE IdProduct= {idProduct}";

            return _context.Connection.Query<ProductQueryResult>(qry).FirstOrDefault();
        }

        public List<ProductQueryResult> getProductByIdProductFamily(List<int> productFIds)
        {
            _log.LogInformation("ProductRepository: getProductByIdProductFamily");
            string idProductF = "";
            foreach (var id in productFIds)
            {
                idProductF += id + ",";
            }
            string formatedId = idProductF.Remove(idProductF.Length - 1);

            var qry = $@"select 
                A.IDProduct 'productId', 
                A.code AS 'productCode', 
                A.name AS 'productName',
                B.code AS 'productFamilyCode'
                from TBLProduct A
                Inner join TBLProductFamily B
	                on A.IDProductFamily = B.IDProductFamily
                where b.IDProductFamily in ({formatedId})";

            return _context.Connection.Query<ProductQueryResult>(qry).ToList();
        }

        public List<ProductQueryResult> getProductsByFamilyeType(List<int> productFIds, List<int> productTIds)
        {
            string conditional = "and";
            if (productFIds == null || productFIds.Count == 0)
            {
                conditional = "or";
                List<ProductFamilyQueryResult> prodFamily = _context.Connection.Query<ProductFamilyQueryResult>
                    ($@" SELECT A.IDProductFamily 'productFamilyId' FROM TBLProductFamily A").ToList();
                foreach(var family in prodFamily)
                {
                    productFIds.Add(family.ProductFamilyId);
                }
            }

            if (productTIds == null || productTIds.Count == 0)
            {
                List<ProductTypeQueryResult> prodType = _context.Connection.Query<ProductTypeQueryResult>
                    ($@" SELECT A.IDProductType 'productTypeId' FROM TBLProductType A").ToList();
                foreach (var type in prodType)
                {
                    productTIds.Add(type.ProductTypeId);
                }
            }

            string idProductF = "";
            foreach (var id in productFIds)
            {
                idProductF += id + ",";
            }
            string formatedId = idProductF.Remove(idProductF.Length - 1);

            string idProductT = "";
            foreach (var id in productTIds)
            {
                idProductT += id + ",";
            }
            string formatedTId = idProductT.Remove(idProductT.Length - 1);

            _log.LogInformation("ProductRepository: getProductsByFamilyeType");
            var qry = $@"
                select 
                A.IDProduct 'productId', 
                A.code AS 'productCode', 
                A.name AS 'productName',
                B.code AS 'productFamilyCode',
				C.code As 'productTypeCode'
                from TBLProduct A
                Left join TBLProductFamily B
	                on A.IDProductFamily = B.IDProductFamily
				Inner join TBLProductType C
					on A.IDProductType = C.IDProductType
                where b.IDProductFamily in ({formatedId}) {conditional} c.IDProductType in ({formatedTId})
                ORDER BY A.Code";
            return _context.Connection.Query<ProductQueryResult>(qry).ToList();
        }

        public List<ProductQueryResult> getProductsByAddress(int addressId)
        {
            _log.LogInformation("ProductRepository: getProductByIdProductFamily");

            var qry = $@"
SELECT 
	PROD.Code									AS ProductCode,
	PROD.Name									AS ProductName,
	PROD.IDProduct								AS ProductId,
	LOT.Code									AS LotCode,
	SUM(FB.InitBalance + FB.InQty - FB.OutQty)	AS Balance,
	UN1.Code									AS Unit1,
	PRDAD.QtyGreen,
	PRDAD.QtyYellow,
	PRDAD.QtyRed
FROM TBLFinalBalance FB(NOLOCK)  
	INNER JOIN TBLProduct PROD(NOLOCK)	ON PROD.IDProduct = FB.IDProduct
	INNER JOIN TBLUnits UN1(NOLOCK)		ON UN1.IDUnits = PROD.IDUnit1
	LEFT JOIN TBLProductAddress PRDAD(NOLOCK)	ON PRDAD.IDProduct = FB.IDProduct AND PRDAD.IDAddress = FB.IDAddress
	LEFT JOIN TBLLot LOT(NOLOCK)		ON LOT.IDLot = FB.IDLot
	LEFT JOIN TBLProductType PRODTYPE (NOLOCK)	ON PRODTYPE.IDProductType = PROD.IDProductType
	LEFT JOIN TBLProductFamily PRODFAMILY (NOLOCK)	ON PRODFAMILY.IDProductFamily = PROD.IDProductFamily
	WHERE 
	FB.IDAddress = @IdAddress
GROUP BY
	PROD.Code,
	PROD.Name,
	PROD.IDProduct,
	LOT.Code,
	UN1.Code,
	PRDAD.QtyGreen,
	PRDAD.QtyYellow,
	PRDAD.QtyRed
ORDER BY Balance asc
";

            return _context.Connection.Query<ProductQueryResult>(qry, new { IdAddress = addressId }).ToList();
        }

        public List<ProductQueryResult> getIntegrationPageProducts(int pPage, int pSize)
        {
            _log.LogInformation("ProductRepository: getAllProducts");
            var qry = $@"
                SELECT 
                    A.IDInProduct 'productId', 
                    A.Code AS 'productCode', 
                    A.Name AS 'productName'
                FROM TBLInProduct A
                ORDER BY A.Code";
            return _contextInteg.ConnectionWithPCF4Integ.Query<ProductQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }
    }
}
