using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]
    public class DrillDownUrlColumnProp: Attribute
    {
        public bool _drillDownUrl { get; private set; }
        public DrillDownUrlColumnProp(bool drillDownUrl)
        {
            _drillDownUrl = drillDownUrl;
        }
    }
}
