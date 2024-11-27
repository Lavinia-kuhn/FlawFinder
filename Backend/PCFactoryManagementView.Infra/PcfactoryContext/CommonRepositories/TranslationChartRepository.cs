using Dapper;
using Microsoft.Extensions.Caching.Memory;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Commands;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using PCFactoryManagementView.Shared;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class TranslationChartRepository : ITranslationChartRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;
        private readonly IMemoryCache _memoryCache;
        private const string tKey = "mv_translate";


        public TranslationChartRepository(PCFactoryManagementViewDataContext context,
            ILoggerManager log, IMemoryCache memoryCache)
        {
            _memoryCache = memoryCache;
            _log = log;
            _context = context;
        }
        public string GetByTranslationKey(TranslationChartQueryResult translationKey)
        {
            _log.LogInformation("TranslationRepository: GetByLang");

            if (translationKey.translationKey == "" || translationKey.translationKey == null)
                return "";

            if (translationKey.indicatorLabel != "" && translationKey.indicator == true)
            {
                translationKey.translationKey = translationKey.indicatorLabel + translationKey.translationKey;
                
            }

            if (_memoryCache.TryGetValue(tKey, out List<TranslationChartQueryResult> result))
            {
                var translate = result.Find(item => item.translationKey.Contains(translationKey.translationKey) && item.screenCode.Contains(translationKey.screenCode) && item.lang.Contains(translationKey.lang));

                if(translate == null)
                {
                    return SetTranslationInCache(translationKey, result);
                }
                return translate.translation;
            }

            var newListOfTranslations = new List<TranslationChartQueryResult>();

            return SetTranslationInCache(translationKey, newListOfTranslations);
        }

        public string SetTranslationInCache(TranslationChartQueryResult translationKey, List<TranslationChartQueryResult> result)
        {

            var screen = $@" and idScreen = (Select IDScreen from TBLScreen where code = '{translationKey.screenCode}')";


            if (translationKey.screenCode == "" || translationKey.screenCode == "GLOBAL" || (translationKey.indicatorLabel != "" && translationKey.indicator == true))
                screen = $@"and idScreen = -1";

            var qry = $@"
                        SELECT 
                            {translationKey.lang}Local as Translation
                        FROM 
                        TBLLocalizations A
                        where TranslationKey = '{translationKey.translationKey}' 
                                and (IDApplication =(Select IDApplication from TBLAplication where code = 'PCF4View') OR IDApplication IS NULL)
                        {screen}";

            translationKey.translation = _context
            .Connection
            .Query<string>(qry).FirstOrDefault();

            result.Add(translationKey);
            _memoryCache.Set(tKey, result);

            return translationKey.translation;
        }
    }
}
