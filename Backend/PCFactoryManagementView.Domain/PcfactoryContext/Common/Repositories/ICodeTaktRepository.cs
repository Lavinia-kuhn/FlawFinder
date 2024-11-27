using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface ICodeTaktRepository
    {
        List<CodeTaktQueryResult> GetAllCodeTakt();
        List<CodeTaktQueryResult> GetPageCodeTakt(int pPage, int pSize);
        List<CodeTaktQueryResult> GetCodeTaktByCode(string code);

    }
}
