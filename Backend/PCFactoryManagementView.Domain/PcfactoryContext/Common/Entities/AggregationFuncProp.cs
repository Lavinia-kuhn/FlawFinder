using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]  // Multiuse attribute.  
    public class AggregationFuncProp : Attribute
    {
        public string _aggFunc { get; private set; }
        public AggregationFuncProp(string aggFunc)
        {
            _aggFunc = aggFunc;
        }
    }
}
