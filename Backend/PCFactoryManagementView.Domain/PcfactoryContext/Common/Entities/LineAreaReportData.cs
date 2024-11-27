using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class LineAreaReportData
    {
        public LineAreaReportData()
        {
            Area = new List<AreaReportData>();
            Line = new List<LineReportData>();
        }

        public List<AreaReportData> Area { get; set; }
        public List<LineReportData> Line { get; set; }
    }

    public class AreaReportData
    {
        public string Type { get; set; }
        public double Value{ get; set; }
        public int? Time { get; set; }
    }


    public class Page
    {
        public string Title { get; set; }
        public List<Chart> Charts { get; set; }
    }

    public class Chart
    {
        public string Title { get; set; }
        public string TitleChart { get; set; }
        public List<LineReportData> Data { get; set; }
    }

    public class LineReportData
    {
        public string Time { get; set; }
        public decimal Value { get; set; }
        public string Type { get; set; }
        public string User { get; set; }
        public string Color { get; set; }
        public string GroupBy { get; set; }
        public List<ILineData> Tooltips { get; set; }
    }


    public class TemporalLineData
    {
        public List<LineReportData> lines { get; set; }
        public List<GaugeData> gauges { get; set; }
    }

    public class ILineData
    {
        public ILineData()
        {
            Line = new List<LineReportData>();
            Tooltips = new ITooltipValues();
        }
        public List<LineReportData> Line { get; set; }
        public ITooltipValues Tooltips { get; set; }
    }
}
