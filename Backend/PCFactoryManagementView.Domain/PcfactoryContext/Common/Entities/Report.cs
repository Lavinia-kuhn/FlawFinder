using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class Report
    {
        public string id { get; set; }
        public string name { get; set; }
        public Report submenu { get; set; }
        public bool advancedFilter { get; set; }
        public string reportMenuSlug { get; set; }
        public string reportMenuLabel { get; set; }
        public ReportFilters filters { get; set; }
        public List<ReportTab> tabs { get; set; }
    }

    public class ReportPreferences
    {
        public string pillar { get; set; }
        public string apiUrl { get; set; }
        public string preferences { get; set; }
        public string detFilterPreferences { get; set; }
        public string chartPreference { get; set; }
        public string reportCode { get; set; }
        public int idUser { get; set; }
        public string name { get; set; }
        public int? idPreferences { get; set; }
        public int? idDefaultAdm { get; set; }
        public bool flgExist { get; set; }
        public string Widget { get; set; }
        public List<int> userGroups { get; set; }
        public List<string> subtitles { get; set; }
        public string filtersPref { get; set; }
    }

    public class ReportDelete
    {
        public int idPref { get; set; }
        public int idUser { get; set; }
        public int? idDefaultAdm { get; set; }

    }

    public class PrefsCard
    {
        public string preferences { get; set; }
        public string detPreference { get; set; }
        public string preferencePivot { get; set; }
        public string filterPreferences { get; set; }
        public string chartPreference { get; set; }
        public List<string> subtitles { get; set; }

    }

    public class ReportCheck 
    {
        public string name { get; set; }
        public string reportCode { get; set; }
        public int idUser { get; set; }
    }


    public class SelectItem
    {
        public string label { get; set; }
        public string value { get; set; }
    }
}
