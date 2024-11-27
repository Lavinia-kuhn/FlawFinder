using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class XbarReportData
    {

        public XbarReportData()
        {
            Lines = new List<LineReportData>();
            Bars = new List<ChartReportData>();
        }

        public List<LineReportData> Lines { get; set; }
        public List<ChartReportData> Bars { get; set; }
        public decimal? XLinesMin { get; set; }
        public decimal? XLinesMax { get; set; }
        public double? XBar { get; set; }
        public double? RBar { get; set; }
        public double? Sum { get; set; }
        public double? StdDeviation { get; set; }
        public double? Cpu { get; set; }
        public double? Cpl { get; set; }
        public double? Cpk { get; set; }
        public double? Cp { get; set; }
    }
}
