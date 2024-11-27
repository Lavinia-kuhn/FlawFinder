using System.Text.Json.Serialization;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class DrillDownKey
    {
        public string Field { get; set; }
        public string Value { get; set; }
        public bool PreviousItem { get; set; } = false;
    }
}
