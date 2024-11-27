using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class WoDetRepository: IWoDetRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public WoDetRepository(PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public WoDetQueryResult GetWodetByIdWodet(int idWodet)
        {
            var qry = $@" SELECT * FROM TBLWODet WHERE IDWodet = {idWodet} ";

            return _context.Connection.Query<WoDetQueryResult>(qry).FirstOrDefault();
        }


        public List<WoDetQueryResult> GetWodetByIdWohd(int idWohd)
        {
            var qry = $@" SELECT * FROM TBLWODet WHERE IDWOHD = {idWohd} ORDER BY SeqWoDet ";

            return _context.Connection.Query<WoDetQueryResult>(qry).ToList();
        }
    }
}
