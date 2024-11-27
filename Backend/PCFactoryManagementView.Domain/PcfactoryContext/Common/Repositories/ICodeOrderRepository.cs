using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface ICodeOrderRepository
    {
        List<CodeOrderQueryResult> GetAllCodeOrders();
        List<CodeOrderQueryResult> GetPageCodeOrders(int pPage, int pSize);
        List<CodeOrderQueryResult> GetIntegrationPageCodeOrders(int pPage, int pSize);
        List<CodeOrderQueryResult> GetCodeOrderByCode(string code);
    }
}
