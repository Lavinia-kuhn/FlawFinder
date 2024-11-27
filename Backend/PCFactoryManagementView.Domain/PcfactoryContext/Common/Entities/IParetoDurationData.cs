using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class IParetoDurationData
    {
        public List<IParetoColumnDurationData> columnDuration { get; set; }
        public List<IParetoLinePercentData> linePercent { get; set; }
        public List<IParetoAnaliticData> percentAnalitic { get; set; }
        public List<IChartSelect> select { get; set; }
        public EValueType valueType { get; set; } = EValueType.Decimal;
        public string label { get; set; }
        public bool isPercentAnalitic { get; set; } = false;
        //public bool isQty { get; set; } = true;

    }

    public class IParetoColumnDurationData
    {
        public string time { get; set; }
        public long quantidade { get; set; }
        public string drillDownUrl { get; set; }
        public string drillDownType { get; set; }
        public string drillDownTitle { get; set; }
        public List<DrillDownKey> DrillDownKeys { get; set; }
        public string color { get; set; }
    }

    public class IParetoAnaliticData
    {
        public string time { get; set; }
        public double percentual { get; set; }
        public string color { get; set; }
    }

    public class IParetoLinePercentData
    {
        public string time { get; set; }
        [ValueFormatterProp(EValueFormatterName.DEC2)]
        public double porcentagem { get; set; }
        public EValueType valueType { get; set; }
        public string drillDownUrl { get; set; }
        public string drillDownType { get; set; }
        public string drillDownTitle { get; set; }
        public List<DrillDownKey> DrillDownKeys { get; set; }
    }

}


