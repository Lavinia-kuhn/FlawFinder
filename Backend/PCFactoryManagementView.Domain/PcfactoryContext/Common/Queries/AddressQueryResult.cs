using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class AddressQueryResult
    {
        public int AddressId { get; set; }
        public string AddressCode { get; set; }
        public string AddressName { get; set; }
        public DateTime LastUpdate { get; set; }
        public decimal Balance { get; set; }
        public string WarehouseCode { get; set; }
    }
}
