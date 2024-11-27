using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities
{
    public class TaktHd
    {
        public int idTaktHd { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public string Description { get; set; }
        public string NickName { get; set; }
        public DateTime DtCreation { get; set; }
    }
}
