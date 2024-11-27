using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class ColumnLinesData
    {
        public ColumnLinesData()
        {
            columns = new List<IColumnLinesColumnData>();
            lines = new List<IColumnLinesLineData>();
            select = new List<IChartSelect>();
            colorLines = new List<string>();
            colorColumns = new List<string>();
            sameYaxys = true;
            
        }

        public List<IColumnLinesColumnData> columns { get; set; }
        public List<IColumnLinesLineData> lines { get; set; }
        public List<string> colorLines { get; set; }
        public List<string> colorColumns { get; set; }
        public string drilldownUrl { get; set; }
        public string drilldownType { get; set; }
        public List<IChartSelect> select { get; set; }
        public int idResource { get; set; }
        public EValueType valueType { get; set; }
        public bool sameYaxys { get; set; }
    }

    public class IColumnLinesColumnData
    {
        public IColumnLinesColumnData()
        {
            Tooltips = new List<ITooltipValues>();
        }

        public string Type { get; set; } 
        public decimal? Value { get; set; } 
        public string Name { get; set; }    
        public string Color { get; set; }
        public List<ITooltipValues> Tooltips { get; set; }
        public string Group { get; set; }
    }

    public class IColumnLinesLineData
    {
        public string Type { get; set; }
        [ValueFormatterProp(EValueFormatterName.DEC2)]
        public decimal? Count { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }
    }

    public class ITooltipValues
    {
        public string Title { get; set; }
        public string Value { get; set; }
        public string Color { get; set; }
    }

}
