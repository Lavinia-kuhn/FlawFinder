using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IInspPlanRepository
    {
        List<InspPlanQueryResult> GetByType(int idInspectionPlanType);
        List<InsPlanTypeQueryResult> GetAllType();
    }
}
