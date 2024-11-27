using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class MovUnRepository : IMovUnRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public MovUnRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<MovUnQueryResult> GetAllMovUn()
        {
            _log.LogInformation("MovUnRepository: GetAllMovUn");
            var qry = $@"
                Select
                A.IDMovUn AS 'MovUnId',
                A.CODE AS 'MovUnCode'
                FROM TBLMovUn A";

            return _context.Connection.Query<MovUnQueryResult>(qry, new { }).Take(int.Parse("500")).ToList();
        }

        public List<MovUnQueryResult> GetPageMovUn(int pPage, int pSize)
        {
            _log.LogInformation("MovUnRepository: GetPageMovUn");
            var qry = $@"
                Select
                A.IDMovUn AS 'MovUnId',
                A.CODE AS 'MovUnCode'
                FROM TBLMovUn A";

            return _context.Connection.Query<MovUnQueryResult>(qry, new { }).Skip(pPage * pSize).Take(pSize).ToList();
        }


        public List<MovUnQueryResult> GetMovUnByCode(string code)
        {
            _log.LogInformation("MovUnRepository: GetAllMovUn");
            var count = "500";
            var qry = $@"Select
                A.IDMovUn AS 'MovUnId',
                A.CODE AS 'MovUnCode',
                A.Code1 AS 'MovUnCode1'

                FROM TBLMovUn A
                WHERE A.CODE LIKE '{code}%'";

            return _context.Connection.Query<MovUnQueryResult>(qry, new { }).Take(int.Parse(count)).ToList();
        }
    }
}
