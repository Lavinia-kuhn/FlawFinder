using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class ReportTab : System.ICloneable
    {
        public ReportTab()
        {
            breadcrumb = new List<string>();
            DisableQuickFilterDate = false;
            DisableFilterDates = false;
            DisableFilterShift = false;
            DisableFilterShiftTeam = false;
            DisableTreeView = false;
            CloseTreeView = false;
            DisableAddress = false;
            DisableProduct = false;
            DisableProductFamily = false;
            DisableProductType = false;
            DisableUnMov = false;
            DisableLot = false;
            DisableWarehouse = false;
            DisableMovType = false;
            SystemTab = false;
            DisableTempFilter = false;
            DisableFilterTreeViewOM = false;
            disableWodet = false;
            disableWohd = false;
            disableResource = false;
            disableOriginWarehouse = false;
            disableEndWarehouse = false;
            disableOriginAddressGroup = false;
            disableEndAddressGroup = false;
            disableEndAddress = false;
            disableRoute = false;
        }

        public object Clone()
        {
            return this.MemberwiseClone();
        }

        public string id { get; set; }
        public string title { get; set; }
        public List<string> breadcrumb { get; set; }
        public bool showBreadcrumb { get; set; }
        public ReportChart mainChart { get; set; }
        public string FilterRow { get; set; }
        public string preference { get; set; }
        public string detPreference { get; set; }
        public string filterPreferences { get; set; }
        public string detFilterPreference { get; set; }
        public string chartPreference { get; set; }
        public bool preferencePivot { get; set; }
        public int idPreferences { get; set; }
        public int idUserPreferences { get; set; }
        public string UserCreation { get; set; }
        public bool DisableQuickFilterDate { get; set; }
        public bool DisableFilterDates { get; set; }
        public bool DisableFilterShift { get; set; }
        public bool DisableFilterShiftTeam { get; set; }
        public bool DisableTreeView { get; set; }
        public bool CloseTreeView { get; set; }
        public bool DisableProduct { get; set; }
        public bool DisableProductFamily { get; set; }
        public bool DisableProductType { get; set; }
        public bool DisableAddress { get; set; }
        public bool DisableWarehouse { get; set; }
        public bool DisableUnMov { get; set; }
        public bool DisableMovType { get; set; }
        public bool DisableLot { get; set; }
        public bool SystemTab { get; set; }
        public bool DisableTempFilter { get; set; }
        public bool DisableFilterTreeViewOM { get; set; }
        public bool disableWohd { get; set; }
        public bool disableWodet { get; set; }
        public bool disableResource { get ; set; }
        public bool disableOriginWarehouse { get; set; }
        public bool disableEndWarehouse { get; set; }
        public bool disableOriginAddressGroup { get; set; }
        public bool disableEndAddressGroup { get; set; }
        public bool disableEndAddress { get; set; }
        public bool disableRoute { get; set; }
        public List<int> UserGroups { get ; set; }
        public string Subtitles { get; set; }
    }

    public class Preferences
    {
        public int IDUser { get; set; }
        public int IDScreen { get; set; }
        public string Preference { get; set; }
        public int IDPref { get; set; }
        public string UsrCreation { get; set; }
    }

    public class PreferencesCard
    {
   
        public string PreferencePivot { get; set; }
        public string Preferences { get; set; }
    
    }
}
