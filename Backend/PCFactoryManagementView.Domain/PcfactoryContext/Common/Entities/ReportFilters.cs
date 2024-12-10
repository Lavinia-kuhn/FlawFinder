using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class ReportFilters
    {
         public List<ReportFilterItem> mainFilter { get; set; }
        public bool timeElapsedFilter { get; set; }
        public List<ReportFilterItem> typeFilter { get; set; }
        public List<ReportFilterItem> periodFilter { get; set; }
    }
}
