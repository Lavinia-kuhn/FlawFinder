using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries
{
    public class InspPlanQueryResult
    {
        public int idInspPlan { get; set; }
        public string InspPlanCode { get; set; }
        public string InspPlanName { get; set; }
    }

    public class InsPlanTypeQueryResult
    {
        public int idInspectionPlanType { get; set; }
        public string InspPlanTypeCode { get; set; }
        public string InspPlanTypeName { get; set; }
    }
}
