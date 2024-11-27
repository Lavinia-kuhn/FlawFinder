using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class ProductFamilyRepository : IProductFamilyRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public ProductFamilyRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<ProductFamilyQueryResult> GetAllProductFamily()
        {
            _log.LogInformation("ProductFamilyRepository: GetAllProductFamily");
            var qry = $@"
                SELECT 
                A.IDProductFamily 'productFamilyId', 
                A.Code AS 'productFamilyCode', 
                A.Name AS 'ProductFamilyName'
                FROM TBLProductFamily A
                ORDER BY A.Code";

            return _context.Connection.Query<ProductFamilyQueryResult>(qry).ToList();
        }

        public List<ProductFamilyQueryResult> GetPageProductFamily(int pPage, int pSize)
        {
            _log.LogInformation("ProductFamilyRepository: GetPageProductFamily");
            var qry = $@"
                SELECT 
                A.IDProductFamily 'productFamilyId', 
                A.Code AS 'productFamilyCode', 
                A.Name AS 'ProductFamilyName'
                FROM TBLProductFamily A
                ORDER BY A.Code";

            return _context.Connection.Query<ProductFamilyQueryResult>(qry).Skip(pSize * pPage).Take(pSize).ToList();
        }

        public List<ProductFamilyQueryResult> GetProductFamilyByCode(string code)
        {
            _log.LogInformation("ProductFamilyRepository: GetProductFamilyByCode");
            var count = "100";
            var qry = $@"select 
                A.IDProductFamily 'productFamilyId', 
                A.code AS 'productFamilyCode', 
                A.name AS 'ProductFamilyName'

                from TBLProductFamily A
                WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<ProductFamilyQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}

