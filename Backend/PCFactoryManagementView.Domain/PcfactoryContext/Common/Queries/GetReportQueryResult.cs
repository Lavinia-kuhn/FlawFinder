namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class GetReportQueryResult
    {
        public int IdScreen { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public bool FlgProduct { get; set; }

    }

    public class GetStatusQtyQueryResult
    {
        public int Quantidade { get; set; }
        public string Status { get; set; }
    }
}
