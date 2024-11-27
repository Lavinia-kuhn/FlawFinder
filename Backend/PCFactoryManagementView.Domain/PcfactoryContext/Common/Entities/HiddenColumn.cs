using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]  // Multiuse attribute.  
    public class HiddenColumn: Attribute
    {
        public bool _hidden { get; private set; }
        public HiddenColumn(bool hidden)
        {
            _hidden = hidden;
        }
    }
}
