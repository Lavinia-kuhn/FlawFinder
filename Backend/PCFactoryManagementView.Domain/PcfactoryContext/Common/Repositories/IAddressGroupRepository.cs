using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IAddressGroupRepository
    {
        List<AddressGroupQueryResult> GetAllAddressGroup();
        List<AddressGroupQueryResult> GetPageAddressGroup(int pPage, int pSize);
        List<AddressGroupQueryResult> GetAddressGroupByCode(string code);

    }
}
