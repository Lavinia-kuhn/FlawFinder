namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class ParamsQueryResult
    {
        public int IdParam { get; set; }
        public string ParamName { get; set; }
        public string ParamOwner { get; set; }
        public string ParamValue { get; set; }
        public string ParamType { get; set; }
        public string ParamTypeConfig { get; set; }
        public string DefaultValue { get; set; }
        public string EnumCode { get; set; }
        public string Range { get; set; }
        public int FlgProduct { get; set; }
        public int FlgV4 { get; set; }
        public int WhereValue { get; set; }
        public int Consumer { get; set; }
    }
}
