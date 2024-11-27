using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]  // Multiuse attribute.
    class IndicatorsColValues: Attribute
    {
        public string _indicatorsValue { get; private set; }
        public IndicatorsColValues(string indicatorsValue)
        {
            _indicatorsValue = indicatorsValue;
        }
    }
}
