using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IContainerFamilyRepository
    {
        List<ContainerFamilyQueryResult> GetAllContainerFamily();
        List<ContainerFamilyQueryResult> GetPageContainerFamily(int pPage, int pSize);
        List<ContainerFamilyQueryResult> GetContainerFamilyByCode(string code);
    }
}
