using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class XbarRbarReportData
    {
        public XbarRbarReportData()
        {
            XLines = new List<LineReportData>();
            XColumns = new List<ChartReportData>();
            AmpLines = new List<LineReportData>();
            AmpColumns = new List<ChartReportData>();
        }

        public List<LineReportData> XLines { get; set; }
        public decimal? XLinesMin { get; set; }
        public decimal? XLinesMax { get; set; }
        public List<ChartReportData> XColumns { get; set; }

        public List<LineReportData> AmpLines { get; set; }
        public decimal? AmpLinesMin { get; set; }
        public decimal? AmpLinesMax { get; set; }
        public List<ChartReportData> AmpColumns { get; set; }

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
