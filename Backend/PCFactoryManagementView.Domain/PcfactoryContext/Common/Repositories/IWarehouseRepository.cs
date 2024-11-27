using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IWarehouseRepository
    {
        List<WarehouseQueryResult> GetAllWarehouses();
        List<WarehouseQueryResult> GetPageWarehouses(int pPage, int pSize);
        List<WarehouseQueryResult> GetWarehouseByCode(string code);
    }
}
