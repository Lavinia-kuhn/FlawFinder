using Dapper;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class InspPlanRepository : IInspPlanRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public InspPlanRepository(PCFactoryManagementViewDataContext context,
            ILoggerManager log)
        {
            _context = context;
            _log = log;
        }

        public List<InsPlanTypeQueryResult> GetAllType()
        {
            var qry = $@"select 
	inspType.IDInspectionPlanType AS idInspectionPlanType,
	inspType.Code AS InspPlanTypeCode,
	inspType.Name AS InspPlanTypeName
from TBLInspectionPlanType inspType";

            return _context.Connection.Query<InsPlanTypeQueryResult>(qry).ToList();
        }

        public List<InspPlanQueryResult> GetByType(int idInspectionPlanType)
        {
            _log.LogInformation("WorkOrderRepository: GetAll");

            var filter = "where IDInspectionPlanType =";

            if(idInspectionPlanType == 0 || idInspectionPlanType == -1)
            {
                filter = " ";
            }
            else
            {
                filter += $" {idInspectionPlanType}";
            }

            var qry = $@"select 
	inspPlanHd.IDInspectionPlanHD	AS idInspPlan,
	inspPlanHd.Code					AS InspPlanCode,
	inspPlanHd.Name					AS InspPlanName
from TBLInspectionPlanHD inspPlanHd {filter}";

            return _context.Connection.Query<InspPlanQueryResult>(qry).ToList();
        }

      
    }
}
