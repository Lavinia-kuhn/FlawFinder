namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class GetMenuQueryResult
    {
        public int IDSuperiorScreenMenu { get; set; }
        public int IDScreen { get; set; }
        public int MenuOrder { get; set; }
        public int ScreenOrder { get; set; }
        public string ShortCut { get; set; }
        public string Link { get; set; }
        public string Menu { get; set; }
        public string Screen { get; set; }
        public string ScreenName { get; set; }
        public string Operation { get; set; }
        public int Product { get; set; }
    }
}
