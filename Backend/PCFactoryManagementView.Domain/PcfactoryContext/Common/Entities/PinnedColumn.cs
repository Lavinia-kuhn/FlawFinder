using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]  // Multiuse attribute.  
    public class PinnedColumn : Attribute
    {
        public string _pinned { get; private set; }
        public PinnedColumn(string pinned)
        {
            _pinned = pinned;
        }
    }
}
