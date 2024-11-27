using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]  // Multiuse attribute.  
    public class IndicatorsColumn : Attribute
    {
        public bool _indicators { get; private set; }
        public IndicatorsColumn(bool indicators)
        {
            _indicators = indicators;
        }
    }
}
