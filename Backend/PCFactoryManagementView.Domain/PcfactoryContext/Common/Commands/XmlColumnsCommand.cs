using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands
{
    public class XmlColumnsCommand
    {
        public string TableName { get; set; }
        public string Name { get; set; }
        public string Code { get; set; }
        public string Label { get; set; }
        public int Hidden { get; set; }
        public int Type { get; set; }
        public string value { get; set; }

    }
}
