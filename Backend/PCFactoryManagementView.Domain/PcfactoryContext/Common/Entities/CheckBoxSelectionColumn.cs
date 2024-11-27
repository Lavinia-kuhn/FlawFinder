using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class CheckBoxSelectionColumn: Attribute
    {
        public bool _checkable { get; private set; }
        public CheckBoxSelectionColumn(bool checkable)
        {
            _checkable = checkable;
        }
    }
}
