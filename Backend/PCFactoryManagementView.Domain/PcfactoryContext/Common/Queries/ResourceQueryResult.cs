using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class ResourceQueryResult
    {
        public int IdResource { get; set; }
        public int id { get; set; }
        public int IdManagerGrp { get; set; }
        public string Code { get; set; }
    }

    public class ResourceCompleteQueryResult
    {
        public int IdResource { get; set; }
        public string Code { get; set; }
        public int NoSchTime { get; set; }
        public int NPlanTime { get; set; }
        public int PlanTime { get; set; }
        public int RunningTime { get; set; }
        public decimal? StdCycleTime { get; set; }
        public int? StdCycleTimeFormat { get; set; }
        public int? FlgAdvTooling { get; set; }
        public int IDShift { get; set; }
        public int IDHolidayHD { get; set; }
        public string DrillDownUrl { get; set; }
        public string DrillDownType { get; set; }
        public string DrillDownTitle { get; set; }
        public List<DrillDownKey> DrillDownKeys { get; set; }
    }
}
