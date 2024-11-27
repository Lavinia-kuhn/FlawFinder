using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class AddressGroupQueryResult
    {
        public int AddressGroupId { get; set; }
        public string AddressGroupCode { get; set; }
        public string AddressGroupName { get; set; }
        public DateTime LastUpdate { get; set; }
        public decimal Balance { get; set; }
        public string WarehouseCode { get; set; }
    }
}
