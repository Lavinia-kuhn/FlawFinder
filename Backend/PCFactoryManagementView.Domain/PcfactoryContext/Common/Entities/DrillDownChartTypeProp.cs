using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class DrillDownChartTypeProp: Attribute
    {
        public bool _chartType { get; private set; }
        public DrillDownChartTypeProp(bool chartType)
        {
            _chartType = chartType;
        }
    }
}
