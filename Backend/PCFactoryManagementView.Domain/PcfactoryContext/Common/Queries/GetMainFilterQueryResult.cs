namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class GetMainFilterQueryResult
    {
        public int IdScreenFields { get; set; }
        public string DefaultValue { get; set; }
        public string ComponentType { get; set; }
        public int Hidden { get; set; }
        public int Enabled { get; set; }
    }
}
