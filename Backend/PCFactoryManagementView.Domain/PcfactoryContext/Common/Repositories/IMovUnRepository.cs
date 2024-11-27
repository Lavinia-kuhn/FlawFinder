using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IMovUnRepository
    {
        List<MovUnQueryResult> GetAllMovUn();
        List<MovUnQueryResult> GetPageMovUn(int pPage, int pSize);
        List<MovUnQueryResult> GetMovUnByCode(string code);
    }
}
