using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class IParetoData
    {
        public List<IParetoColumnData> column { get; set; }
        public List<IParetoLineData> line { get; set; }
        public string drilldownUrl { get; set; }
        public string drilldownType { get; set; }
        public List<IChartSelect> select { get; set; }
        public EValueType valueType { get; set; } = EValueType.Decimal;
        public string label { get; set; }
        //public bool isQty { get; set; } = true;

    }

    public class IParetoColumnData
    {
        public string time { get; set; }
        public int quantidade { get; set; }
        [ValueFormatterProp(EValueFormatterPref.DECUNIT)]
        public double? Ppm { get; set; }
        public string drillDownUrl { get; set; }
        public string drillDownType { get; set; }
        public string drillDownTitle { get; set; }
        public List<DrillDownKey> DrillDownKeys { get; set; }
    }

    public class IParetoLineData
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


