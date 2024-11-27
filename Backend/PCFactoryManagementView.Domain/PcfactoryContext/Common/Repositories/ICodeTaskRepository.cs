using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface ICodeTaskRepository
    {
        List<CodeTaskQueryResult> GetAllCodeTask();
        List<CodeTaskQueryResult> GetPageCodeTask(int pPage, int pSize);
        List<CodeTaskQueryResult> GetCodeTaskByCode(string code);

    }
}
