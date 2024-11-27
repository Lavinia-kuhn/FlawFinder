using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class BasicCardReportData
    {
        public BasicCardReportData()
        {
            Cards = new List<BasicCard>();
        }

        public List<BasicCard> Cards { get; set; }
    }

    public class BasicCard
    {
        public string Title { get; set; }
        public string Value { get; set; }
        public string Color { get; set; }
    }
}
