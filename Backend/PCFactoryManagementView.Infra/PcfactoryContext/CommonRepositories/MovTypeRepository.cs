using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class MovTypeRepository : IMovTypeRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public MovTypeRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<MovTypeQueryResult> GetAllMovType()
        {
            _log.LogInformation("MovTypeRepository: GetAllMovType");
            var qry = $@"
                Select
                A.IDMovType AS 'MovTypeId',
                A.CODE AS 'MovTypeCode',
                A.NAME AS 'MovTypeName'
                FROM TBLMovType A
                ORDER BY A.Code";

            return _context.Connection.Query<MovTypeQueryResult>(qry).ToList();
        }

        public List<MovTypeQueryResult> GetPageMovType(int pPage, int pSize)
        {
            _log.LogInformation("MovTypeRepository: GetAllMovType");
            var qry = $@"
                Select
                A.IDMovType AS 'MovTypeId',
                A.CODE AS 'MovTypeCode',
                A.NAME AS 'MovTypeName'
                FROM TBLMovType A
                ORDER BY A.Code";

            return _context.Connection.Query<MovTypeQueryResult>(qry).Skip(pPage * pSize).Take(pSize).ToList();
        }


        public List<MovTypeQueryResult> GetMovTypeByCode(string code)
        {
            _log.LogInformation("MovTypeRepository: GetMovTypeByCode");
            var count = "100";
            var qry = $@"Select
A.IDMovType AS 'MovTypeId',
A.CODE AS 'MovTypeCode',
A.NAME AS 'MovTypeName'

FROM TBLMovType A
WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<MovTypeQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}
