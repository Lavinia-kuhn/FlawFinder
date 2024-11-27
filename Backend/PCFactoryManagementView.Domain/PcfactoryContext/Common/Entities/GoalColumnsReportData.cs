using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class GoalColumnsReportData
    {
        public GoalColumnsReportData()
        {
            Columns = new List<ColumnReportData>();
            Goals = new List<ColumnReportData>();
            Tooltips = new List<IGoalColumnsReportData>();
            SameMaxXAxis = false;
        }

        public List<ColumnReportData> Columns { get; set; }
        public List<ColumnReportData> Goals { get; set; }
        public List<IGoalColumnsReportData> Tooltips { get; set; }
        public bool SameMaxXAxis { get; set; }
    }

    public class IGoalColumnsReportData
    {
        public IGoalColumnsReportData()
        {
            Tooltips = new List<ITooltipValues>();
        }
        public List<ITooltipValues> Tooltips { get; set; }
    }
}