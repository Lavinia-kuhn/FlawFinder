using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using System.Collections.Generic;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories
{
    [TransientService]
    public interface ITranslationChartRepository
    {
        public string GetByTranslationKey(TranslationChartQueryResult indicators);
        public string SetTranslationInCache(TranslationChartQueryResult translationKey, List<TranslationChartQueryResult> result);

    }
}
