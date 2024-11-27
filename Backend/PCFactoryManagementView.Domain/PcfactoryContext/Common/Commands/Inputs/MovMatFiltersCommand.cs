using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands
{
    public class MovMatFiltersCommand
    {
        List<FilterOption> _filterPresets;
        public int? map { get; set; }
        public int? mapMov { get; set; }
        public string? tabTitle { get; set; }
        public string startDate { get; set; }
        public string endDate { get; set; }
        public List<FilterRow> filterRows { get; set; }
        public List<FilterOption> filterPresets
        {
            get
            {
                if (filterRows != null && filterRows.Count > 0)
                    setFilterPresets();

                return _filterPresets;
            }
            set
            {
                _filterPresets = value;
            }
        }
        public List<int>? warehouse { get; set; }
        public List<int>? container { get; set; }
        public List<int>? containerFamily { get; set; }
        public List<int>? containerType { get; set; }
        public List<int>? address { get; set; }
        public List<int>? productType { get; set; }
        public List<int>? productFamily { get; set; }
        public List<int>? product { get; set; }
        public List<int> lot { get; set; }
        public List<int>? movUn { get; set; }
        public List<int>? movType { get; set; }
        public List<DrillDownKey>? DrillDownKeys { get; set; }
        public string lang { get; set; }
        public string indicators { get; set; }

        public void setFilterPresets()
        {
            _filterPresets = new List<FilterOption>();
            foreach (var row in filterRows)
            {
                if (row.filterId.Equals(tabTitle))
                {
                    foreach (var option in row.options)
                    {
                        _filterPresets.Add(option);
                    }
                }
            }
        }
    }
}