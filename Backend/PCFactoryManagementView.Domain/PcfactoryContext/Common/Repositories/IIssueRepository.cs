using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface IIssueRepository
    {

        List<DualAxes> GetNoDetectionCausePareto();
        List<Line> GetNoDetectionIncrease();
        List<Pie> GetAllNoDetection();


    }
}