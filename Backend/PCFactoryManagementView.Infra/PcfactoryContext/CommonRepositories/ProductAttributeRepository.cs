using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class ProductAttributeRepository : IProductAttributeRepository
    {
        private ILoggerManager _log;
        private readonly PCFactoryManagementViewDataContext _context;

        public ProductAttributeRepository(ILoggerManager log, PCFactoryManagementViewDataContext context)
        {
            _log = log;
            _context = context;
        }

        public List<ProductAttributeQueryResult> GetAllProductAttributes()
        {
            _log.LogInformation("ProductAttributeRepository: GetAllProductAttributes");

            var qry =
                @"SELECT 
                    CAST(PROD.IDProduct as varchar) + '.' + CAST(PRODATT.IDAttribute AS Varchar) as id,
                    PRODATT.Code AS CODE, 
                    PROD.CODE AS PRODCODE, 
                    ATT.CODE AS ATTRCODE
                FROM TBLProductAttribute PRODATT
                INNER JOIN TBLAttribute ATT
                    ON PRODATT.IDAttribute = ATT.IDAttribute
                INNER JOIN TBLProduct PROD 
                    ON PRODATT.IDProducT = PROD.IDProduct
                ORDER BY PRODATT.Code";

            return _context.Connection.Query<ProductAttributeQueryResult>(qry).ToList();
        }
        public List<ProductAttributeQueryResult> getPageProductAttribute(int pPage, int pSize)
        {
            _log.LogInformation("ProductAttributeRepository: getPageProductAttribute");
            var qry =
                @"SELECT 
                    CAST(PROD.IDProduct as varchar) + '.' + CAST(PRODATT.IDAttribute AS Varchar) as id,
                    PRODATT.Code AS CODE, 
                    PROD.CODE AS PRODCODE, 
                    ATT.CODE AS ATTRCODE
                FROM TBLProductAttribute PRODATT
                INNER JOIN TBLAttribute ATT
                    ON PRODATT.IDAttribute = ATT.IDAttribute
                INNER JOIN TBLProduct PROD 
                    ON PRODATT.IDProducT = PROD.IDProduct
                ORDER BY PRODATT.Code";
            return _context.Connection.Query<ProductAttributeQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }
        public List<ProductAttributeQueryResult> getProductAttributeByCode(string code)
        {
            _log.LogInformation("ProductAttributeRepository: getProductAttributeByCode");
            var qry =
                    $@"SELECT  
                    CAST(PROD.IDProduct as varchar) + '.' + CAST(PRODATT.IDAttribute AS Varchar) as id,
                    PRODATT.Code AS CODE, 
                    PROD.CODE AS PRODCODE, 
                    ATT.CODE AS ATTRCODE
                FROM TBLProductAttribute PRODATT
                INNER JOIN TBLAttribute ATT
                    ON PRODATT.IDAttribute = ATT.IDAttribute
                INNER JOIN TBLProduct PROD 
                    ON PRODATT.IDProducT = PROD.IDProduct
                WHERE CODE '{code}%";

            return _context.Connection.Query<ProductAttributeQueryResult>(qry).ToList();
        }
        public List<ProductAttributeQueryResult> GetProductAttributeById(string id)
        {
            _log.LogInformation("CharacteristicDomainRepository: GetProductAttributeById");
            var qry =
                $@"select 
                *
                FROM TBLProductAttribute 
                WHERE IDAttribute = {id}";
            return _context.Connection.Query<ProductAttributeQueryResult>(qry, new { }).ToList();
        }


    }
}
