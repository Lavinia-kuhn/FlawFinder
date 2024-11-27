namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class GetReportFilterQueryResult
    {
        public int IdScreenFields { get; set; }
        public string FieldType { get; set; }
        public string FieldName { get; set; }
        public string TableName { get; set; }
        public string DefaultValue { get; set; }
        public string GroupName { get; set; }
        public int Hidden { get; set; }
    }
}
