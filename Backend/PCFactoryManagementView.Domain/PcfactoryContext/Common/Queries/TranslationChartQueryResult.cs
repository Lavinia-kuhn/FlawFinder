using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands
{
    public class TranslationChartQueryResult
    {
        public string lang { get; set; }
        public bool indicator { get; set; } = false;
        public string indicatorLabel { get; set; }
        public string translationKey { get; set; }
        public string translation { get; set; }
        public string screenCode { get; set; }
    }
}
