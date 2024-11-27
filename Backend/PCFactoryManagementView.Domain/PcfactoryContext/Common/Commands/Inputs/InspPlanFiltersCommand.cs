using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands.Inputs
{
    public class InspPlanFiltersCommand
    {
        public int IdInspPlan { get; set; }
        public List<FilterOption> filterPresets { get; set; }
        public List<DrillDownKey> DrillDownKeys { get; set; }
    }
}
