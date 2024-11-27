using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class MenusResult
    {
        public string id { get; set; }
        public string name { get; set; }
        public string reportMenuSlug { get; set; }
        public string reportMenuLabel { get; set; }
        public List<object> subMenu { get; set; }
        public object filters { get; set; }
        public bool product { get; set; }
        public string link { get; set; }
    }

    public class MenuSearchControl
    {
        public string Path { get; set; }
        public string Code { get; set; }
    }
}
