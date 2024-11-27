using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands
{
    public class GridsterPreferenceCommand
    {
        public string CardName { get; set; }
        public GridsterConfig Configuration { get; set; }
        public List<FilterRow> filter { get; set; }
        public bool isPrefCard { get; set; }
        public int IdUser { get; set; }
        public PrefsGrid? PrefsGrid { get; set; }
        public bool CopyCard { get; set; }
        public bool ForAll { get; set; }
        public int idPrefOrigin { get; set; }
    }
}
