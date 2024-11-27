using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]  // Multiuse attribute.  
    public class ValueFormatterProp : Attribute
    {
        public string _valueFormatter { get; private set; }
        public ValueFormatterProp(string valueFormatter)
        {
            _valueFormatter = valueFormatter;
        }
        public ValueFormatterProp(string valueFormatter, string? fieldTable)
        {
            _valueFormatter = valueFormatter;
        }
    }
}
