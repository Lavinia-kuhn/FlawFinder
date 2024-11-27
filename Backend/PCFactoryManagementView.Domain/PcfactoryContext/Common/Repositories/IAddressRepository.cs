using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IAddressRepository
    {
        List<AddressQueryResult> GetAllAddress();
        List<AddressQueryResult> GetAddressByIdMap(int? idMap);
        AddressQueryResult GetAddressById(int? idMap, int addressId);
        List<AddressQueryResult> GetPageAddress(int pPage, int pSize);
        List<AddressQueryResult> GetAddressByCode(string code);
        List<AddressQueryResult> GetAddressByIdWarehouses(List<int> warehouseIds);
        List<SelectData> GetAllAddressToSelect();
    }
}
