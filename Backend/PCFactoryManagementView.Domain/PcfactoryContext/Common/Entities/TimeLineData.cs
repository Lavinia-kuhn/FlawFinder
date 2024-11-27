using System;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class TimeLineData
    {

        public string DrillDownUrl { get; set; }
        public string DrillDownType { get; set; }
        public string DrillDownTitle { get; set; }
        public List<DrillDownKey> DrillDownKeys { get; set; }
        public string Color { get; set; }
        public string Icon { get; set; }
        public DateTime Date { get; set; }
        public string Status { get; set; }
        public string Title { get; set; }
        public string Contents { get; set; }
    }
}
