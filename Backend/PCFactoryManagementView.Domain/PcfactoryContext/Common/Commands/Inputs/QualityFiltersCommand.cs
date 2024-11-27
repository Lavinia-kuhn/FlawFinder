using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using System;
using System.Collections.Generic;
using System.Text;
    
namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands
{
    public class QualityFiltersCommand
    {
         List<FilterOption> _filterPresets;
         public string startDate { get; set; }
        public string endDate { get; set; }
        public string lang { get; set; }
        public string indicators { get; set; }
        public List<int>? product { get; set; }
        public List<int>? familyProduct { get; set; }
        public List<int>? typeProduct { get; set; }
        public List<int>? lot { get; set; }
        public List<int>? movUn { get; set; }
        public List<int>? charDomain { get; set; }
        public int? resource { get; set; }
        public int? wohd { get; set; }
        public string wodet { get; set; }
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
        public List<DrillDownKey>? DrillDownKeys { get; set; }

        public void setFilterPresets()
        {
            _filterPresets = new List<FilterOption>();
            foreach (var row in filterRows)
            {
                foreach (var option in row.options)
                {
                    _filterPresets.Add(option);
                }
            }
        }
    }
}

