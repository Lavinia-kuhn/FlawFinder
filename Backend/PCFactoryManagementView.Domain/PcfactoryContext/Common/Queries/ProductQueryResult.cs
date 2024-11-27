using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class ProductQueryResult
    {
        public int ProductId { get; set; }
        public String ProductCode { get; set; }
        public String ProductName { get; set; }
        public String ProductFamilyCode { get; set; }
        public String LotCode { get; set; }
        public decimal Balance { get; set; }
        public String Unit1 { get; set; }
        public decimal QtyGreen { get; set; }
        public decimal QtyYellow { get; set; }
        public decimal QtyRed { get; set; }
    }

    public class ProductCompleteQueryResult
    {
        public int IdProduct { get; set; }
        public string Code { get; set; }
        public string Name { get; set; }
        public int? IdProductFamily { get; set; }
    }
}
