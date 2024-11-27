using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IContainerTypeRepository
    {
        List<ContainerTypeQueryResult> GetAllContainerType();
        List<ContainerTypeQueryResult> GetPageContainerType(int pPage, int pSize);
        List<ContainerTypeQueryResult> GetContainerTypeByCode(string code);
    }
}
