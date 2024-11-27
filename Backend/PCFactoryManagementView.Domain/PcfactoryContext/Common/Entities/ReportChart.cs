using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class ReportChart
    {
        public string type { get; set; }
        public string chartUrl { get; set; }
        public string customChartProperties { get; set; }
        public List<object> ganttData { get; set; }
        public List<object> paretoData { get; set; }
        public List<object> columnsData { get; set; }
        public List<object> chartData { get; set; }
        public List<ReportChartSelect> select { get; set; }
    }
}
