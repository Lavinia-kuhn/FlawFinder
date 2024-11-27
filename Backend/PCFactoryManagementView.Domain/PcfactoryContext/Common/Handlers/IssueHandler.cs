using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IIssueHandler
    {
        List<DualAxes> GetNoDetectionCausePareto();
        List<Line> GetNoDetectionIncrease();
        List<Pie> GetAllNoDetection();

    }
    public class IssueHandler : IIssueHandler
    {

        private ILoggerManager _log;
        private IIssueRepository _issueRepository;

        public IssueHandler(
            ILoggerManager log,
            IIssueRepository issueRepository
            )
        {
            _log = log;
            _issueRepository = issueRepository;
        }

        public List<DualAxes> GetNoDetectionCausePareto()
        {

            var pareto = _issueRepository.GetNoDetectionCausePareto();
            var total = pareto.Sum(x => x.count);
            var countLine = 0.0;
            foreach ( var p in pareto ) {

                countLine += p.count;
                p.value = Math.Round((countLine / total) * 100, 2);
            }

            return pareto;
        }

        public List<Line> GetNoDetectionIncrease()
        {
            return _issueRepository.GetNoDetectionIncrease();
        }

        public List<Pie> GetAllNoDetection()
        {
            return _issueRepository.GetAllNoDetection();
        }
    }

}
