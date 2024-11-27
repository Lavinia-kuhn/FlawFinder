using Dapper;
using PCFactoryManagementView.Shared;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class TranslationRepository : ITranslationRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public TranslationRepository(PCFactoryManagementViewDataContext context,
            ILoggerManager log)
        {
            _log = log;
            _context = context;
        }

        public List<GetTranslationQueryResult> GetByLang(string lang)
        {
            _log.LogInformation("TranslationRepository: GetByLang");
            var result = 
                _context
                .Connection
                .Query<GetTranslationQueryResult>(@"
                    SELECT LOCALIZATION.[Key] as 'Key', ISNUll(LOCALIZATION.[Value], '') as 'Value', LOCALIZATION.ScreenCode
                    FROM(
                        SELECT SCREEN.ShortCut AS ScreenCode, LOC.Translationkey as 'Key', ISNUll(LOC." + lang + @", '') as 'Value'
                        FROM TBLScreenMenus Coleta
                        INNER JOIN TBLScreenMenus PCF
                            ON Coleta.IDSuperiorScreenMenu = PCF.IDScreenMenu
                        INNER JOIN TBLScreenMenus SCREEN
                            ON Coleta.IDScreenMenu = SCREEN.IDSuperiorScreenMenu
                        INNER JOIN TBLLocalizations LOC
                            ON SCREEN.IDScreen = LOC.IDScreen
                        WHERE
                            PCF.Code = 'PCF4View'
                            AND PCF.FlgEnable = 1
                            AND Coleta.FlgEnable = 1
                            AND SCREEN.FlgEnable = 1
                            AND SCREEN.ShortCut IS NOT NULL
                            AND LOC.FlgEnable = 1
                            AND LOC.TranslationKey IS NOT NULL
                    UNION
                        SELECT 'MENU' AS ScreenCode, LOC.Translationkey as 'Key', ISNUll(LOC." + lang + @", '') as 'Value'
                        FROM TBLLocalizations LOC
                        INNER JOIN TBLAplication APP
                            ON LOC.IDApplication = APP.IDAplication
                        WHERE
                            LOC.FlgEnable = 1
                            AND LOC.FlgProduct = 1
                            AND LOC.TranslationKey IS NOT NULL
                            AND LOC.IDScreen IS NULL
						    AND APP.Code = 'PCF4View'
                    UNION
                        SELECT 'GLOBAL' AS ScreenCode, LOC.Translationkey as 'Key', ISNUll(LOC." + lang + @", '') as 'Value'
                        FROM TBLLocalizations LOC
                        INNER JOIN TBLAplication APP
                            ON LOC.IDApplication = APP.IDAplication
                        WHERE
                            LOC.FlgEnable = 1
                            AND LOC.FlgProduct = 1
                            AND LOC.TranslationKey IS NOT NULL
                            AND LOC.IDScreen = -1
						    AND APP.Code = 'PCF4View'
                    UNION 
						SELECT 'VIEWDASHBOARD' AS ScreenCode, LOC.Translationkey as 'Key', ISNUll(LOC." + lang + @", '') as 'Value'
                        FROM TBLScreen SCREEN
                        INNER JOIN TBLAplication APP
							ON SCREEN.IDAplication = APP.IDAplication
                        INNER JOIN TBLLocalizations LOC
							ON SCREEN.IDScreen = LOC.IDScreen
                        WHERE
							APP.Code = 'PCF4View'
							AND SCREEN.Code = 'VIEWDASHBOARD'
							AND LOC.FlgEnable = 1
							AND LOC.TranslationKey IS NOT NULL
                    UNION 
						SELECT 'OEEMAP' AS ScreenCode, LOC.Translationkey as 'Key', ISNUll(LOC." + lang + @", '') as 'Value'
                        FROM TBLScreen SCREEN
                        INNER JOIN TBLAplication APP
							ON SCREEN.IDAplication = APP.IDAplication
                        INNER JOIN TBLLocalizations LOC
							ON SCREEN.IDScreen = LOC.IDScreen
                        WHERE
							APP.Code = 'PCF4View'
							AND SCREEN.Code = 'OEEMAP'
							AND LOC.FlgEnable = 1
							AND LOC.TranslationKey IS NOT NULL

                    ) LOCALIZATION
                    ORDER BY LOCALIZATION.ScreenCode").ToList();

            return result;
        }
    }
}
