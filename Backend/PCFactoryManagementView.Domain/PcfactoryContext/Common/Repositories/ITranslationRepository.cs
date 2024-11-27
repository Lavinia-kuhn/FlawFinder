using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;
using System.Threading.Tasks;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface ITranslationRepository
    {
        List<GetTranslationQueryResult> GetByLang(string lang); 
    }
}
