using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public abstract class BaseReportData
    {
        public BaseReportData()
        {
            DrillDownKeys = new List<DrillDownKey>();
        }

        public string DrillDownUrl { get; set; }
        public string DrillDownType { get; set; }
        public string DrillDownTitle { get; set; }
        public List<DrillDownKey> DrillDownKeys { get; set; }
        public string Color { get; set; }
        public ReportChartSelect Select { get; set; }
    }
}
