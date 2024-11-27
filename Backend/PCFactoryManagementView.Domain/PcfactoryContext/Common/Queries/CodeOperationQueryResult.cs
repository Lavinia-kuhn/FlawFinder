using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class CodeOperationQueryResult
    {

        public int WodetId { get; set; }
        public String WodetCode { get; set; }
        public String WodetName { get; set; }

    }
    public class DivOperation
    {
        public List<String> WodetCodes { get; set; }
        public List<String> WodetNames { get; set; }
    }
}
