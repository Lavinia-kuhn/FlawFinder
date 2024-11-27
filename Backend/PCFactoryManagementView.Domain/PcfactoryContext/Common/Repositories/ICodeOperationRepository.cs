using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface ICodeOperationRepository
    {
        List<CodeOperationQueryResult> GetAllCodeOperations();
        List<CodeOperationQueryResult> GetPageCodeOperations(int pPage, int pSize);
        List<CodeOperationQueryResult> GetCodeOperationByCode(string code);
    }
}
