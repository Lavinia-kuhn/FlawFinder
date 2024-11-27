using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class HeaderCheckboxSelectionFilteredOnly : Attribute
    {
        public bool _headerCheckboxSelectionFilteredOnly { get; private set; }
        public HeaderCheckboxSelectionFilteredOnly(bool checkable)
        {
            _headerCheckboxSelectionFilteredOnly = checkable;
        }
    }
}
