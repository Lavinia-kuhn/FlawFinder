namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class GetFilterValueQueryResult
    {
        public int IdScreenFields { get; set; }
        public string FieldName { get; set; }
        public string TableName { get; set; }
        public  string DefaultValue { get; set; }
    }
}
