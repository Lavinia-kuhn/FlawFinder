using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IMovTypeRepository
    {
        List<MovTypeQueryResult> GetAllMovType();
        List<MovTypeQueryResult> GetPageMovType(int pPage, int pSize);
        List<MovTypeQueryResult> GetMovTypeByCode(string code);
    }
}
