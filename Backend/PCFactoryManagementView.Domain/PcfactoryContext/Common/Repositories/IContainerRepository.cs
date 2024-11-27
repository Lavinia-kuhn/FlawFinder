using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IContainerRepository
    {

        List<ContainerQueryResult> GetAllContainer();
        List<ContainerQueryResult> GetPageContainer(int pPage, int pSize);
        List<ContainerQueryResult> GetContainerByCode(string code);

    }
}
