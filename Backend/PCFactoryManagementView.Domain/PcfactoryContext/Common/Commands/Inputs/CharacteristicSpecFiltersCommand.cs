using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands.Inputs
{
    public class CharacteristicSpecFiltersCommand
    {
        List<FilterOption> _filterPresets;
        public string StartDate { get; set; }
        public string EndDate { get; set; }
        public int? Product { get; set; }
        public int? ProductRaw { get; set; }
        public int? ProductFamily { get; set; }
        public int? Resource { get; set; }
        public int? CharacteristicDomain { get; set; }
        public string? ProductAttribute { get; set; }
        public int? Wohd { get; set; }
        public string Wodet { get; set; }
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
        public List<DrillDownKey> DrillDownKeys { get; set; }
        public string lang { get; set; }
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

    public class CEPContextDTO
    {
        public int? IDProduct { get; set; }
        public int? CepKeyIDProduct { get; set; }
        public int? IDProductRaw { get; set; }
        public int? CepKeyIDProductRaw { get; set; }
        public int? IDProductFamily { get; set; }
        public int? CepKeyIDProductFamily { get; set; }
        public int? IDProductAttribute { get; set; }
        public int? CepKeyIDProductAttribute { get; set; }
        public int? IDResource { get; set; }
        public int? CepKeyIDResource { get; set; }
        public int? IDWOHD { get; set; }
        public int? CepKeyIDWOHD { get; set; }
        public int? IDWODet { get; set; }
        public int? CepKeyIDWODet { get; set; }
        public int? IDCharacteristicDomain { get; set; }
        public int? CepKeyIDCharacteristicDomain { get; set; }
    }
}
