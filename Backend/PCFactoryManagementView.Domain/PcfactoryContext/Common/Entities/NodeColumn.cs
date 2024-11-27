using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class NodeColumnProp: Attribute
    {
        public bool _nodeColumn { get; private set; }
        public NodeColumnProp(bool nodeColumn)
        {
            _nodeColumn = nodeColumn;
        }
    }
}
