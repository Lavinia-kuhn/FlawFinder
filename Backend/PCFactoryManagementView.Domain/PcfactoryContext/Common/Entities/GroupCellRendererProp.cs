using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class GroupCellRendererProp: Attribute
    {
        public bool _groupCellColumnDefs { get; private set; }
        public GroupCellRendererProp(bool groupCellColumnDefs)
        {
            _groupCellColumnDefs = groupCellColumnDefs;
        }
    }
}
