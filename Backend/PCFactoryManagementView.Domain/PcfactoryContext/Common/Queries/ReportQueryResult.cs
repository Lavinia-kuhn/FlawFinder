using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class ReportQueryResult
    {
        public int idNoDetectionCause { get; set; }
        public string bugCode { get; set; }
        public string code { get; set; }
        public string name { get; set; }
        public string description { get; set; }
        public DateTime date { get; set; }
    }
}
