using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IInspPlanHandler
    {
        List<InspPlanQueryResult> GetByType(int idInspectionPlanType);
        List<InsPlanTypeQueryResult> GetAllType();
    }

    public class InspPlanHandler : IInspPlanHandler
    {
        private readonly IInspPlanRepository _inspPlanRepository;
        private ILoggerManager _log;

        public InspPlanHandler(IInspPlanRepository inspPlanRepository,
            ILoggerManager log)
        {
            _inspPlanRepository = inspPlanRepository;
            _log = log;
        }

        public List<InspPlanQueryResult> GetByType(int idInspectionPlanType)
        {
            _log.LogInformation("WorkOrderHandler: GetAll");
            return _inspPlanRepository.GetByType(idInspectionPlanType);
        }

        public List<InsPlanTypeQueryResult> GetAllType()
        {
            _log.LogInformation("WorkOrderHandler: GetAll");
            return _inspPlanRepository.GetAllType();
        }

    }
}
