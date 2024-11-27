using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class RemoveColumnProp: Attribute
    {
        public bool _removeColumnFromColumnDefs { get; private set; }
        public RemoveColumnProp(bool removeColumnFromColumnDefs)
        {
            _removeColumnFromColumnDefs = removeColumnFromColumnDefs;
        }
    }

    
}
