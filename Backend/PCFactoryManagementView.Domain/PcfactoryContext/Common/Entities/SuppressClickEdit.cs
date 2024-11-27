using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class SuppressClickEdit : Attribute
    {
        public bool _clickable { get; private set; }
        public SuppressClickEdit(bool clickable)
        {
            _clickable = clickable;
        }
    }
}
