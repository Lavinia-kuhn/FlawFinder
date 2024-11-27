using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class GanttReportDatas
    {
        public GanttReportDatas()
        {
            Data = new List<GanttData>();
            Groups = new List<GanttGroup>();
        }

        public List<GanttData> Data { get; set; }
        public List<GanttGroup> Groups { get; set; }

    }

    public class GanttData: BaseReportData
    {
        public string Content { get; set; }
        public string Start { get; set; }
        public bool isFirst { get; set; }
        public string PlanStart { get; set; }
        public string PlanEnd { get; set; }
        public string End { get; set; }
        public decimal Prod { get; set; }
        public decimal Prev { get; set; }
        public int Group { get; set; }
        public string Style { get; set; }
        public List<string> Orders { get; set; }
    }

    public class GanttGroup
    {
        public string Content { get; set; }
        public int Id { get; set; }
    }
}
