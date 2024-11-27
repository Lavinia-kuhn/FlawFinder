using PCFactoryManagementView.Domain.PcfactoryContext.Enums;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class ValueInfoCellRenderer
    {
        // Title of tooltip
        public string Title { get; set; }

        // Message of tooltip
        public string Message { get; set; }

        // Icon of tooltip
        public string Icon { get; set; }

        // Value formatter for the value outside of the tooltip and inside the tooltip.
        public string CellRendererValueFormatter { get; set; }

        // Values of tooltip.
        // It can be a list of key-value pairs.
        // E.g. what appears in frontend: "Key: Value"
        public Values[] Values { get; set; }

        public ValueInfoCellRenderer(string title = "", string message = "", string icon = "", string cellRendererValueFormatter = "", Values[] values = null)
        {
            Title = title;
            Message = message;
            Icon = icon;
            CellRendererValueFormatter = cellRendererValueFormatter;
            Values = values ?? new Values[0];
        }
    }

    public class Values
    {
        public string Key { get; set; }
        public string Value { get; set; }
    }
}