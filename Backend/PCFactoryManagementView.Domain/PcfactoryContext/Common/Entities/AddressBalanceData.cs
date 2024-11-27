using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class AddressBalanceData
    {
        public string Address { get; set; }
        public string Color { get; set; }
        public DateTime LastUpdate { get; set; }
        public ColumnAreaReportData BulletChart { get; set; }
        public List<ProductQueryResult> Itens { get; set; }
    }
}
