using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class GaugeData
    {
        public string title { get; set; }
        public decimal value { get; set; }
        public string color { get; set; }
    }

    public class VariousGaugeData
    {
        public string Title { get; set; }
        public string Subtitle { get; set; }
        public List<GaugeData> Gauges { get; set; }
    }
}
