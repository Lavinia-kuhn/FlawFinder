using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface IReportHandler
    {
        List<ReportQueryResult> GetReport();
    }

    public class ReportHandler : IReportHandler
    {
        private ILoggerManager _log;
        private IReportRepository _repository;

        public ReportHandler(
            ILoggerManager log,
            IReportRepository repository
            )
        {
            _log = log;
            _repository = repository;
        }
        public List<ReportQueryResult> GetReport()
        {
            _log.LogInformation("RouteHandler: GetAllRoute");
            try
            {
                return _repository.GetReport();
            }
            catch (System.Exception ex)
            {

                throw;
            }
            
        }

      
    }
}

