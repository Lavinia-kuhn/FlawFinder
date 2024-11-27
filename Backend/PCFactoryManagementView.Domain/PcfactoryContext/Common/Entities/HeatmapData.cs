using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class HeatmapData
    {
        public string xGroup { get; set; }
        public string yGroup { get; set; }
        public decimal value { get; set; }
        public List<ITooltipValues> tooltips { get; set; }
    }

}
