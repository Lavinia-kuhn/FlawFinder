using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class GridsterConfig
    {
        //public GridsterConfig()
        //{
            //Parameters = new List<GridsterParams>();
            //Height = ECardHeight.DEFAULT;
        //}

        public bool Visible { get; set; }
        public int Cols { get; set; }
        public int Rows { get; set; }
        public int IdCard { get; set; }
        public string Widget { get; set; }
        public double Height { get; set; }
        public double Width { get; set; }
        public string ChartUrl { get; set; }
        public int X { get; set; }
        public int Y { get; set; }
        public int idLastEditUser { get; set; }
        public int idPref { get; set; }
        public int idPrefOrigin { get; set; }
        public bool isPrefCard { get; set; }
        public string pillar { get; set; }
        public string fieldType { get; set; }
    }
    public class PrefsGrid
    {
        public string Label { get; set; }
        public string Preferences { get; set; }
        public string ChartPreferences { get; set; }
        public bool SavedPivotMode { get; set; }
        public string FiltersPref { get; set; }
        public int idPrefOrigin { get; set; }
        public List<string> subtitles { get; set; }
    }

    public class CardPreference
    {
        public GridsterConfig GridsterConfig { get; set; }
        public List<FilterRow> filter { get; set; }
        public PrefsGrid? PrefsGrid { get; set; }
    }
}
