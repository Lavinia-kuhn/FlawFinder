using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]  // Multiuse attribute.  
    public class GoalColumn : Attribute
    {
        public bool _goal { get; private set; }
        public GoalColumn(bool goal)
        {
            _goal = goal;
        }
    }
}
