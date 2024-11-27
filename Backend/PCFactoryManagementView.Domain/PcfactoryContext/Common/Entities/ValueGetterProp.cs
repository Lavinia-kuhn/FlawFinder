using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]  // Multiuse attribute.  
    public class ValueGetterProp : Attribute
    {
        public string _valueGetter { get; private set; }
        public ValueGetterProp(string valueGetter)
        {
            _valueGetter = valueGetter;
        }
    }
}

