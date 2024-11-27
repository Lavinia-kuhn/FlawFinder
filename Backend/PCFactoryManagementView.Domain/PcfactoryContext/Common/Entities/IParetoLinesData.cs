using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class IParetoLinesData
    {
        public IParetoLinesData()
        {
            column = new List<IParetoLinesColumnData>();
            line = new List<IParetoLinesLineData>();
            select = new List<IChartSelect>();

        }

        public List<IParetoLinesColumnData> column { get; set; }
        public List<IParetoLinesLineData> line { get; set; }
        public string drilldownUrl { get; set; }
        public string drilldownType { get; set; }
        public List<IChartSelect> select { get; set; }
        public int idResource { get; set; }
    }

    public class IParetoLinesColumnData
    {
        public string time { get; set; }
        public decimal? OEE { get; set; }
        public string name { get; set; }
        public EValueType valueType { get; set; }

    }

    public class IParetoLinesLineData
    {
        public string time { get; set; }
        
        //public double porcentagem { get; set; }
        [ValueFormatterProp(EValueFormatterName.DEC2)]
        public decimal? count { get; set; }
        public string name { get; set; }
        
    }

}



