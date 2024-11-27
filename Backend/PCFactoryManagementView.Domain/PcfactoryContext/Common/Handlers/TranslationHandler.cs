using AspNetCore.ServiceRegistration.Dynamic;
using PCFactoryManagementView.Shared;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Domain.PcfactoryContext.Common.Handlers
{
    [TransientService]
    public interface ITranslationHandler
    {
        Dictionary<string, object> GetReportTranslationByLanguage(string lang);
    }
    public class TranslationHandler : ITranslationHandler
    {
        private ILoggerManager _log;
        private readonly ITranslationRepository _translationRepository;
        public TranslationHandler(ITranslationRepository translationRepository,
            ILoggerManager log)
        {
            _log = log;
            _translationRepository = translationRepository;
        }

        public Dictionary<string, object> GetReportTranslationByLanguage(string lang)
        {
            _log.LogInformation("TranslationHandler: GetReportTranslationByLanguage");
            var result = new Dictionary<string, object>();
            var translations = _translationRepository.GetByLang(lang);
            foreach (var translation in translations)
            {
                var screen = result.Where(x => x.Key == translation.ScreenCode).Any();
                if (!screen)
                {
                    var newScreen = new Dictionary<string, object>();
                    result.Add(translation.ScreenCode, new Dictionary<string, string>());
                }

                var valuesFound = ((Dictionary<string, string>)result[translation.ScreenCode]).Where(x => x.Key == translation.Key).Any();
                if (!valuesFound)
                    ((Dictionary<string, string>)result[translation.ScreenCode]).Add(translation.Key, translation.Value);

            }
            return result;
        }
    }
}
