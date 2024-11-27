using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class HideCheckBoxColumnProp: Attribute
    {
        public bool _hideCheckBoxColumn { get; private set; }
        public HideCheckBoxColumnProp()
        {
            _hideCheckBoxColumn = true;
        }
    }
}
