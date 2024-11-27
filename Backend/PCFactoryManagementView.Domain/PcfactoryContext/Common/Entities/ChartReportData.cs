using PCFactoryManagementView.Domain.PcfactoryContext.Enums;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class ChartReportData : BaseReportData
    {
        public string Type { get; set; }
        public double? Value { get; set; }
        public string Percent { get; set; }
        public EValueType ValueType { get; set; } = EValueType.Decimal;
        public string GroupBy { get; set; }
        public string Color { get; set; }
    }
}