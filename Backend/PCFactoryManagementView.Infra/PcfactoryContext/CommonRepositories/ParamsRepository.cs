using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class ParamsRepository : IParamsRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public ParamsRepository
        (
           PCFactoryManagementViewDataContext Context,
           ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<ParamsQueryResult> GetDefaultUsersParams()
        {
            _log.LogInformation("ParamsRepository: GetDefaultUsersParams");
            var qry = $@"
                SELECT * 
                FROM TBLParams 
                WHERE
                    ParamName IN ('IDUserDefaultAdmin','IDUserDefaultDCM','IDUserDefaultMonitor') 
                AND FlgProduct = 1
                AND FlgV4 = 1";

            return _context.Connection.Query<ParamsQueryResult>(qry).ToList();
        }

        public ParamsQueryResult GetParamByParamName(string paramName)
        {
            _log.LogInformation("ParamsRepository: GetParamByCode");
            var qry = $@"
                SELECT * 
                FROM TBLParams 
                WHERE
                    ParamName = '{paramName}'
                AND FlgProduct = 1
                AND FlgV4 = 1";

            return _context.Connection.Query<ParamsQueryResult>(qry).FirstOrDefault();
        }
    }
}
