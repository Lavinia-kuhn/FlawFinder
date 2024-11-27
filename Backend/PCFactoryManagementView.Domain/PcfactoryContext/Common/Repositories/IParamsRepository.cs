using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IParamsRepository
    {
        List<ParamsQueryResult> GetDefaultUsersParams();
        ParamsQueryResult GetParamByParamName(string paramName);
    }
}
