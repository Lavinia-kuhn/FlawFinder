using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface ILotRepository
    {

        List<LotQueryResult> GetAllLot();
        List<LotQueryResult> GetPageLot(int pPage, int pSize);
        List<LotQueryResult> GetLotByCode(string code);

    }
}
