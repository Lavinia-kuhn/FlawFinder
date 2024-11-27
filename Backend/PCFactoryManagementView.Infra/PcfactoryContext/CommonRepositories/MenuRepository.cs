using Dapper;
using PCFactoryManagementView.Shared;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Queries;
using PCFactoryManagementView.Domain.PcfactoryContext.Common.Repositories;
using PCFactoryManagementView.Infra.PcfactoryContext.DataContext;
using System.Collections.Generic;
using System.Linq;

namespace PCFactoryManagementView.Infra.PcfactoryContext.CommonRepositories
{
    public class MenuRepository: IMenuRepository
    {
        private readonly PCFactoryManagementViewDataContext _context;
        private ILoggerManager _log;

        public MenuRepository(PCFactoryManagementViewDataContext Context,
            ILoggerManager log)
        {
            _log = log;
            _context = Context;
        }

        public List<GetMenuQueryResult> GetMenusByIdUser(int idUser)
        {
            _log.LogInformation("MenuRepository: GetMenusByIdUser");
            var qry = @"
                SELECT 
                    DISTINCT (OPERSCREEN.Operation),
                    COLETA.IDScreenMenu AS 'IDSuperiorScreenMenu',
                    COLETA.CODE AS 'MENU', 
                    SCREEN.Code AS 'SCREEN',
                    MAINSCREEN.Name AS 'SCREENNAME',
                    SCREEN.IDScreen,
                    SCREEN.ShortCut,
                    SCREEN.Link,
                    COLETA.MenuOrder AS 'MenuOrder',
                    Screen.MenuOrder AS 'ScreenOrder',
					MAINSCREEN.FlgProduct AS Product
                FROM TBLScreenMenus Coleta 
                    INNER JOIN TBLScreenMenus PCF 
                    ON Coleta.IDSuperiorScreenMenu = PCF.IDScreenMenu
                    INNER JOIN TBLScreenMenus SCREEN
                    ON Coleta.IDScreenMenu = SCREEN.IDSuperiorScreenMenu
                    INNER JOIN TBLScreen AS MAINSCREEN 
                    ON MAINSCREEN.IDScreen = SCREEN.IDScreen
                    INNER JOIN TBLOperationScreen OPERSCREEN
                    ON SCREEN.IDScreen = OPERSCREEN.IDScreen
                    INNER JOIN TBLProfileUserGroup PROF
                    ON OPERSCREEN.IDOperationScreen = PROF.IDOperationScreen
                    INNER JOIN TBLUsrGroup USRGRP 
                    ON PROF.IDUsrGroup = USRGRP.IDUsrGroup
                    INNER JOIN TBLUsrGroupUser USRGRPUSR
                    ON USRGRP.IDUsrGroup = USRGRPUSR.IDUsrGroup
                    INNER JOIN TBLUser USR 
                    ON USR.IDUser = USRGRPUSR.IDUser
                WHERE 
                    PCF.IDSuperiorScreenMenu = -1
                    AND PCF.FlgEnable = 1
                    AND PCF.Code = 'PCF4View'
                    AND Coleta.FlgEnable = 1
                    AND SCREEN.FlgEnable = 1
                    AND SCREEN.ShortCut IS NOT NULL
                    AND USRGRP.FlgEnable = 1
                    AND USR.FlgEnable = 1
                    AND USR.IDUser = @IdUser
                ORDER BY 
                    COLETA.MenuOrder, SCREEN.MenuOrder ,SCREEN.IDScreen, OPERSCREEN.Operation";
            return _context.Connection.Query<GetMenuQueryResult>(qry, new { IdUser = idUser }).ToList();
        }

        public List<MenuSearchControl> GetMenusSearchControl(string lang, int idUser)
        {
            _log.LogInformation("MenuRepository: GetMenusByIdUser");
            var qry = @"
                    SELECT * FROM (
                        SELECT 
                            MENUS.Link AS [PATH],
                            ISNUll(LOC." + lang + @", '') AS CODE
                        FROM TBLScreenMenus MENUS
                            INNER JOIN TBLScreen SCREEN
                                ON MENUS.IDScreen = SCREEN.IDScreen
                            INNER JOIN TBLAplication APP
                                ON SCREEN.IDAplication = APP.IDAplication
                            INNER JOIN TBLLocalizations LOC
                                ON MENUS.IDScreen = LOC.IDScreen
                                AND LOC.TranslationKey = MENUS.Code
							INNER JOIN TBLOperationScreen OPERSCREEN
								ON SCREEN.IDScreen = OPERSCREEN.IDScreen
							INNER JOIN TBLProfileUserGroup PROF
								ON OPERSCREEN.IDOperationScreen = PROF.IDOperationScreen
							INNER JOIN TBLUsrGroup USRGRP 
								ON PROF.IDUsrGroup = USRGRP.IDUsrGroup
							INNER JOIN TBLUsrGroupUser USRGRPUSR
								ON USRGRP.IDUsrGroup = USRGRPUSR.IDUsrGroup
							INNER JOIN TBLUser USR 
								ON USR.IDUser = USRGRPUSR.IDUser
                        WHERE 
                            APP.Code = 'PCF4View'
                            AND MENUS.FlgEnable = 1
                            AND LOC.FlgEnable = 1
							AND USRGRP.FlgEnable = 1
							AND USR.FlgEnable = 1
							AND USR.IDUser = @IdUser
                        UNION 
                            SELECT 
                            '/map' AS [PATH], 
                            ISNUll(LOC." + lang + @", '') AS CODE
                            FROM TBLLocalizations LOC
                            INNER JOIN TBLAplication APP
                                ON LOC.IDApplication = APP.IDAplication
                            WHERE
                                LOC.FlgEnable = 1
                                AND LOC.FlgProduct = 1
                                AND LOC.TranslationKey IS NOT NULL
                                AND LOC.IDScreen = -1
	                            AND APP.Code = 'PCF4View'
	                            AND LOC.TranslationKey = 'VIEW_OEEMAP'
                        UNION 
                            SELECT 
                            '/dashboard' AS [PATH], 
                            ISNUll(LOC." + lang + @", '') AS CODE
                            FROM TBLLocalizations LOC
                            INNER JOIN TBLAplication APP
                                ON LOC.IDApplication = APP.IDAplication
                            WHERE
                                LOC.FlgEnable = 1
                                AND LOC.FlgProduct = 1
                                AND LOC.TranslationKey IS NOT NULL
                                AND LOC.IDScreen = -1
	                            AND APP.Code = 'PCF4View'
	                            AND LOC.TranslationKey = 'VIEW_OEEDASHBOARD'
                        ) A
                        ORDER BY A.CODE
                ";
            return _context.Connection.Query<MenuSearchControl>(qry, new { IdUser = idUser }).ToList();
        }
    }
}
