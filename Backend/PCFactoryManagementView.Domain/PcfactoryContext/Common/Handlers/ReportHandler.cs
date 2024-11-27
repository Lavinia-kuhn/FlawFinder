using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Shared;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Entities;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Domain.PcfactoryContext.Enums;
using System.Collections.Generic;
using Newtonsoft.Json;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System;
using Microsoft.Extensions.Options;

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
        private readonly IReportRepository _repository;

        public ReportHandler(IReportRepository repository,
            ILoggerManager log)
        {
            _log = log;
            _repository = repository;
        }


        public List<ReportQueryResult> GetReport()

        {
            return _repository.GetReport();
        }

    }
}
