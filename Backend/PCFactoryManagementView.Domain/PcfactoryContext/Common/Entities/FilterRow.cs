using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class FilterRow
    {
        public string label { get; set; }
        public string type { get; set; }
        public int hidden { get; set; }
        public string filterId { get; set; }
        public List<FilterOption> options { get; set; }
    }
}
