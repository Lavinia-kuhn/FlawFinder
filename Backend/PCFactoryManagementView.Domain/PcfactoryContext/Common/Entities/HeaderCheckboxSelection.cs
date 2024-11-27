using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class HeaderCheckboxSelection : Attribute
    {
        public bool _hideCheckBoxColumn { get; private set; }
        public HeaderCheckboxSelection(bool checkable)
        {
            _hideCheckBoxColumn = checkable;
        }
    }
}
