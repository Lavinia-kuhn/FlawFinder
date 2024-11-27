using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Text;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ITranslationChartHandler
    {
        string GetChartTranslation(TranslationChartQueryResult translationKey);
    }
    class TranslationChartHandler: ITranslationChartHandler
    {
        private ILoggerManager _log;
        private readonly ITranslationChartRepository _translationChartRepository;

        public TranslationChartHandler(ITranslationChartRepository translationChartRepository,
            ILoggerManager log)
        {
            _translationChartRepository = translationChartRepository;
            _log = log;
        }

        public string GetChartTranslation(TranslationChartQueryResult translationKey)
        {
            _log.LogInformation("TranslationChartHandler: GetChartTranslation");
            
            return _translationChartRepository.GetByTranslationKey(translationKey);
        }
    }
}
