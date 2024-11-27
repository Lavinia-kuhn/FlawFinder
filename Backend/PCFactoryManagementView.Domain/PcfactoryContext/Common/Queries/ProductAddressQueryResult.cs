using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class ProductAddressQueryResult
    {
        public int ProductId { get; set; }
        public int AddressId { get; set; }
        public decimal QtyGreen { get; set; }
        public decimal QtyYellow { get; set; }
        public decimal QtyRed { get; set; }
    }
}
