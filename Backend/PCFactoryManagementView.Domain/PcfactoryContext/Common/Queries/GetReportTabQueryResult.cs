namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class GetReportTabQueryResult
    {
        public int IdScreenFields { get; set; }
        public string DefaultValue { get; set; }
        public string TableName { get; set; }
        public string FieldName { get; set; }
        public int Nullable { get; set; }
    }
}
