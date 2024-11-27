namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class WoDetQueryResult
    {
        public int IdWoDet { get; set; }
        public int IdWoHd { get; set; }
        public int SeqWoDet { get; set; }
        public string Code { get; set; }
        public string Name{ get; set; }
        public decimal? StdCycleTime { get; set; }
        public int? StdCycleTimeFormat { get; set; }
        public int? DefaultCycleTimeOrigin { get; set; }
    }
}
