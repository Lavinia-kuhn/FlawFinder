using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class GoalColumnLineData
    {
        public GoalColumnLineData()
        {
            columns = new List<IGoalColumnData>();
            lines = new List<IGoalLineLineData>();
        }

        public List<IGoalColumnData> columns { get; set; }
        public List<IGoalLineLineData> lines { get; set; }
        public string drilldownUrl { get; set; }
        public string drilldownType { get; set; }
        public int idResource { get; set; }
        public EValueType valueType { get; set; }
    }

    public class IGoalColumnData
    {
        public string Time { get; set; } 
        public decimal? Value { get; set; } 
        public string Name { get; set; }    
        public string Color { get; set; }
    }

    public class IGoalLineLineData
    {
        public string Time { get; set; }
        public decimal? Count { get; set; }
        public string Name { get; set; }
        public string Color { get; set; }
    }

}
