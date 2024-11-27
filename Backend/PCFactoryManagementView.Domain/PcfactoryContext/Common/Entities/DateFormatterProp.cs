using System;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    [AttributeUsage(AttributeTargets.Property)]  // Multiuse attribute.  
    public class DateFormatterProp : Attribute
    {
        public string _cellClass { get; private set; }
        public DateFormatterProp(string cellClass)
        {
            _cellClass = cellClass;
        }
        public DateFormatterProp(string cellClass, string? fieldTable)
        {
            _cellClass = cellClass;
        }
    }

    public class DateStartEnd
    {
        public string depict { get; set; }
        public string startDate { get; set; }
        public string endDate { get; set; }

    }
}
