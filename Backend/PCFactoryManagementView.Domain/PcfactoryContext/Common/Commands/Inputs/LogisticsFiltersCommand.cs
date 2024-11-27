using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands
{
    public class LogisticsFiltersCommand
    {
        List<FilterOption> _filterPresets;
        public int? map { get; set; }
        public string tabTitle { get; set; }
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
        public string lang { get; set; }
        public string indicators { get; set; }
        public int clearCacheData { get; set; }
        public List<DrillDownKey> DrillDownKeys { get; set; }
        public int cleanCacheTime { get; set; }
        public List<int> originWarehouses { get; set; }
        public List<int> endWarehouses { get; set; }
        public List<int> originAddressGroup { get; set; }
        public List<int> endAddressGroup { get; set; }
        public List<int> endAddresses { get; set; }
        public List<int> routes { get; set; }

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

