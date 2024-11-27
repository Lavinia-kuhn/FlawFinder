using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class ColumnAreaReportData
    {
        public ColumnAreaReportData()
        {
            Columns = new List<ColumnReportData>();
            Areas = new List<AreaReportData>();
        }

        public List<ColumnReportData> Columns { get; set; }
        public List<AreaReportData> Areas { get; set; }
    }
}
