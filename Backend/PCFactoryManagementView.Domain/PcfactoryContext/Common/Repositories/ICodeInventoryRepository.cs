using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface ICodeInventoryRepository
    {
        List<CodeInventoryQueryResult> GetAllCodeInventory();
        List<CodeInventoryQueryResult> GetPageCodeInventory(int pPage, int pSize);
        List<CodeInventoryQueryResult> GetCodeInventoryByCode(string code);

    }
}
