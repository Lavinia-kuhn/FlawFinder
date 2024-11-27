-- CREATE: OEEMAP.DISPLAYSTATUS
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'OEEMAP' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'DISPLAYSTATUS'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Mostrar Status',
			'Display Status',
			'Presentear Status',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'OEEMAP' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'DISPLAYSTATUS')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Mostrar Status', ENLocal = 'Display Status', ESLocal = 'Presentear Status'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'OEEMAP'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'DISPLAYSTATUS'
END
GO


-- UPDATE: GLOBAL.VIEW_GLOBAL_PLANNEDSTOP
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'GLOBAL' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'VIEW_GLOBAL_PLANNEDSTOP'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Parada Planejada 1 ou 2',
			'Planned Stop 1 or 2',
			'Paradas planificadas 1 o 2',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'GLOBAL' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'VIEW_GLOBAL_PLANNEDSTOP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Parada Planejada 1 ou 2', ENLocal = 'Planned Stop 1 or 2', ESLocal = 'Paradas planificadas 1 o 2'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'GLOBAL'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'VIEW_GLOBAL_PLANNEDSTOP'
END
GO

-- --------------------------------------------------------------------------------------
-- -------------------------MENU DE MATERIAIS executar somente 1x------------------------
-- --------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable)

                VALUES ('VIEW_MENU_MANUTENCAO', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View') , 4, 1)

END
GO


-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0135–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0135', 'G0135–Distribuição da Gravidade de Manutenção OM', 'G0135–OM Maintenance Severity Distribution', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0135–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0135–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0135'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0135', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'), 2, 1, 'G0135',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0135')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0135
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0135'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0135-Distribuição da Gravidade de Manutenção OM','G0135-OM Maintenance Severity Distribution', 'G0135-Distribución de Gravedad de Mantenimiento de OM',1,1,'VIEW_MENU_G0135',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0135', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0135', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0135/v1/Table ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterTreeView'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterTreeView'
AND TableName = 'G0135')
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0135', 'MainFilterTreeView', 'MainFilterTreeView', NULL, 'TABLETAB' , 0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterShiftTeam'
AND TableName = 'G0135')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0135', 'MainFilterShiftTeam', 'MainFilterShiftTeam', NULL, 'TABLETAB' , 0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterShift'
AND TableName = 'G0135')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0135', 'MainFilterShift', 'MainFilterShift', NULL, 'TABLETAB' , 0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0134–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0134', 'G0134–Indicadores de Manutenção OEE', 'G0134–Maintenance Indicators OEE', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0134–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0134–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0134'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0134', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'), 2, 1, 'G0134',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0134')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0134
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0134'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0134-Indicadores de Manutenção OEE','G0134-OEE DTM Report', 'G0134-Maintenance Indicators OEE',1,1,'VIEW_MENU_G0134',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0134

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0134', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0134

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0134', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0134/v1/Table ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO




-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0132–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0132', 'G0132–Relatório de DTM OEE', 'G0132–OEE DTM Report', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0132–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0132–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0132'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0132', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'), 2, 1, 'G0132',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0132')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0132
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0132'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('Relatório de DTM OEE','OEE DTM Report', 'Reporte de DTM OEE',1,1,'VIEW_MENU_G0132',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0132

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0132', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0132

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0132', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0132/v1/Table ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'PLANTCODE'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Planta',
			'Plant Code',
			'Cód. Planta',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'PLANTCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Planta', ENLocal = 'Plant Code', ESLocal = 'Cód. Planta'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'PLANTCODE'
END
GO

--PLANTNAME
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'PLANTNAME'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Planta',
			'Plant Name',
			'Nombre Planta',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'PLANTNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Planta', ENLocal = 'Plant Name', ESLocal = 'Nombre Planta'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'PLANTNAME'
END
GO

--PLANTDTMGOAL
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'PLANTDTMGOAL'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta % DTM Planta',
			'Plant % DTM Goal',
			'Meta % DTM Planta',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'PLANTDTMGOAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta % DTM Planta', ENLocal = 'Plant % DTM Goal', ESLocal = 'Meta % DTM Planta'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'PLANTDTMGOAL'
END
GO

--AREACODE
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'AREACODE'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Área',
			'Area Code',
			'Cód. Área',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'AREACODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Área', ENLocal = 'Area Code', ESLocal = 'Cód. Área'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'AREACODE'
END
GO

--AREANAME
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'AREANAME'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Área',
			'Area Name',
			'Nombre Área',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'AREANAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Área', ENLocal = 'Area Name', ESLocal = 'Nombre Área'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'AREANAME'
END
GO

--AREADTMGOAL
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'AREADTMGOAL'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta % DTM Área',
			'Area % DTM Goal',
			'Meta % DTM Área',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'AREADTMGOAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta % DTM Área', ENLocal = 'Area % DTM Goal', ESLocal = 'Meta % DTM Área'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'AREADTMGOAL'
END
GO

--SECTORCODE
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'SECTORCODE'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Setor',
			'Sector Code',
			'Cód. Sector',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'SECTORCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Setor', ENLocal = 'Sector Code', ESLocal = 'Cód. Sector'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'SECTORCODE'
END
GO

--SECTORNAME
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'SECTORNAME'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Setor',
			'Sector Name',
			'Nombre Sector',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'SECTORNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Setor', ENLocal = 'Sector Name', ESLocal = 'Nombre Sector'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'SECTORNAME'
END
GO

--SECTORDTMGOAL
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'SECTORDTMGOAL'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta % DTM Setor',
			'Sector % DTM Goal',
			'Meta % DTM Sector',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'SECTORDTMGOAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta % DTM Setor', ENLocal = 'Sector % DTM Goal', ESLocal = 'Meta % DTM Sector'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'SECTORDTMGOAL'
END
GO

--MNGGROUPCODE
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'MNGGROUPCODE'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Grp. Gerencial',
			'Management Group Code',
			'Cód. Grp. Gestión',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'MNGGROUPCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Grp. Gerencial', ENLocal = 'Management Group Code', ESLocal = 'Cód. Grp. Gestión'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'MNGGROUPCODE'
END
GO

--MNGGROUPNAME
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'MNGGROUPNAME'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Grp. Gerencial',
			'Management Group Name',
			'Cód. Grp. Gestión',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'MNGGROUPNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Grp. Gerencial', ENLocal = 'Management Group Name', ESLocal = 'Cód. Grp. Gestión'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'MNGGROUPNAME'
END
GO

--MNGGROUPDTMGOAL
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'MNGGROUPDTMGOAL'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta % DTM Grp. Gerencial',
			'Management Group % DTM Goal',
			'Meta % DTM Grp. Gestión',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'MNGGROUPDTMGOAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta % DTM Grp. Gerencial', ENLocal = 'Management Group % DTM Goal', ESLocal = 'Meta % DTM Grp. Gestión'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'MNGGROUPDTMGOAL'
END
GO

--RESOURCECODE
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'RESOURCECODE'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Recurso',
			'Resource Code',
			'Cód. Recurso',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'RESOURCECODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Recurso', ENLocal = 'Resource Code', ESLocal = 'Cód. Recurso'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'RESOURCECODE'
END
GO

--RESOURCENAME
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'RESOURCENAME'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Recurso',
			'Resource Name',
			'Nombre Recurso',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'RESOURCENAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Recurso', ENLocal = 'Resource Name', ESLocal = 'Nombre Recurso'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'RESOURCENAME'
END
GO

--RESOURCEDTMGOAL
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'RESOURCEDTMGOAL'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta % DTM Recurso',
			'Resource % DTM Goal',
			'Meta % DTM Recurso',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'RESOURCEDTMGOAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta % DTM Recurso', ENLocal = 'Resource % DTM Goal', ESLocal = 'Meta % DTM Recurso'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'RESOURCEDTMGOAL'
END
GO

--MAINTTIME
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'MAINTTIME'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo de Manutenção',
			'Maintenance Time',
			'Tiempo de mantenimiento',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'MAINTTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo de Manutenção', ENLocal = 'Maintenance Time', ESLocal = 'Tiempo de mantenimiento'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'MAINTTIME'
END
GO

--AVAILABLETIME
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'AVAILABLETIME'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Disponível',
			'Available Time',
			'Tiempo disponible',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'AVAILABLETIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Disponível', ENLocal = 'Available Time', ESLocal = 'Tiempo disponible'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'AVAILABLETIME'
END
GO

--MAINTSTOPPERCENT
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'MAINTSTOPPERCENT'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% Paradas de Manut.',
			'Maint. Stop %',
			'% Paradas Mant.',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'MAINTSTOPPERCENT')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% Paradas de Manut.', ENLocal = 'Maint. Stop %', ESLocal = '% Paradas Mant.'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'MAINTSTOPPERCENT'
END
GO

--DTMPERCENT
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'DTMPERCENT'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% DTM.',
			'% DTM',
			'% DTM',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'DTMPERCENT')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% DTM', ENLocal = '% DTM', ESLocal = '% DTM'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'DTMPERCENT'
END
GO


-- -----------------------------------------ABAS-----------------------------------------
-- --------------------------------------------------------------------------------------
--ABA TABELA - G0132

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportTab'

AND DefaultValue = 'CHARTTAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0132', 'ReportTab', 'ReportTab', 'REPORT',1, 'CHARTTAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0132

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportChart'

AND GroupName = 'CHARTTAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0132', 'goalcolumns', 'ReportChart', 'CHARTTAB' , 1, 'G0132/v1/chart',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

--TRADUÇÃO DA ABA TABELA

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'TABLETAB'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('Tabela','Table',1,1,'TABLETAB',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

--GOALDTM
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'GOALDTM'
				AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta DTM',
			'DTM Goal',
			'Meta DTM',
			1,
			1,
			-1,
			'GOALDTM')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta DTM', ENLocal = 'DTM Goal' , ESLocal = 'Meta DTM'
		WHERE IDScreen = -1
				AND TranslationKey = 'GOALDTM'
				AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

--DTM
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'DTM'
				AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'DTM',
			'DTM',
			'DTM',
			1,
			1,
			-1,
			'DTM')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'DTM', ENLocal = 'DTM' , ESLocal = 'DTM'
		WHERE IDScreen = -1
				AND TranslationKey = 'DTM'
				AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----G0132 RADIO GROUP Hierar
--Para a ABA - TABLETAB
IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'CHARTTAB'
AND FieldName = 'Hierarchy'
AND TableName = 'registersHierarchy'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('registersHierarchy', 'Hierarchy', 'FilterOptions','radio', 'CHARTTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - Plant
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'Plant'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('Plant', 'Plant', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - Area
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'Area'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('Area', 'Area', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - Sector
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'Sector'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('Sector', 'Sector', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - ManagerGroup
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'ManagerGroup'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ManagerGroup', 'ManagerGroup', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - SupLevel1
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'SupLevel1'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('SupLevel1', 'SupLevel1', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
----G0132 RADIO Hierarchy - SupLevel2
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'SupLevel2'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('SupLevel2', 'SupLevel2', 'FilterValues','radio', 'registersHierarchy' , 1, 'false',0,6,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0132 RADIO Hierarchy - Resource
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersHierarchy'
AND FieldName = 'Resource'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('Resource', 'Resource', 'FilterValues','radio', 'registersHierarchy' , 1, 'true',0,7,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
--Traduções
----------------------------------------------------------
-- ADDRESSTYPECLASSIFICATIONSTR - OTHERS
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'OTHERS'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Outros',
'Others',
'Otros',
1,
1,
-1,
'OTHERS')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Outros', ENLocal = 'Others', ESLocal = 'Otros'
WHERE IDScreen = -1
AND TranslationKey = 'OTHERS'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ADDRESSTYPECLASSIFICATIONSTR - EXTERNAL
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'EXTERNAL'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Externo',
'External',
'Externo',
1,
1,
-1,
'EXTERNAL')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Externo', ENLocal = 'External', ESLocal = 'Externo'
WHERE IDScreen = -1
AND TranslationKey = 'EXTERNAL'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ADDRESSTYPECLASSIFICATIONSTR - TOOLS
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'TOOLS'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Ferramentaria',
'Tools',
'Instrumentos',
1,
1,
-1,
'TOOLS')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Ferramentaria', ENLocal = 'Tools', ESLocal = 'Instrumentos'
WHERE IDScreen = -1
AND TranslationKey = 'TOOLS'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ADDRESSTYPECLASSIFICATIONSTR - SUPERMERCADO
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SUPERMERCADO'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Supermercado',
'Supermarket',
'Supermercado',
1,
1,
-1,
'SUPERMERCADO')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Supermercado', ENLocal = 'Supermarket', ESLocal = 'Supermercado'
WHERE IDScreen = -1
AND TranslationKey = 'SUPERMERCADO'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ADDRESSTYPECLASSIFICATIONSTR - INSTRUMENTATIONTABLE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'INSTRUMENTATIONTABLE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Mesa de Instrumentação',
'Instrumentation Table',
'Mesa de Instrumentación',
1,
1,
-1,
'INSTRUMENTATIONTABLE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Mesa de Instrumentação', ENLocal = 'Instrumentation Table', ESLocal = 'Mesa de Instrumentación'
WHERE IDScreen = -1
AND TranslationKey = 'INSTRUMENTATIONTABLE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ORIGIN - REWORK
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'REWORK'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Retrabalho',
'Rework',
'Rehacer',
1,
1,
-1,
'REWORK')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Retrabalho', ENLocal = 'Rework', ESLocal = 'Rehacer'
WHERE IDScreen = -1
AND TranslationKey = 'REWORK'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ORIGIN - SCRAP
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SCRAP'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Refugo',
'Scrap',
'Chatarra',
1,
1,
-1,
'SCRAP')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Refugo', ENLocal = 'Scrap', ESLocal = 'Chatarra'
WHERE IDScreen = -1
AND TranslationKey = 'SCRAP'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ORIGIN - GOODPIECES
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'GOODPIECES'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Peças Boas',
'Good Pieces',
'Buenas Partes',
1,
1,
-1,
'GOODPIECES')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Peças Boas', ENLocal = 'Good Pieces', ESLocal = 'Buenas Partes'
WHERE IDScreen = -1
AND TranslationKey = 'GOODPIECES'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PIECESCOUNTTYPE - SUMMARY
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SUMMARY'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Sumarizado',
'Summary',
'Resumen',
1,
1,
-1,
'SUMMARY')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Sumarizado', ENLocal = 'Summary', ESLocal = 'Resumen'
WHERE IDScreen = -1
AND TranslationKey = 'SUMMARY'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PIECESCOUNTTYPE - ANALYTICAL
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'ANALYTICAL'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Analítico',
'Analytical',
'Analítico',
1,
1,
-1,
'ANALYTICAL')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Analítico', ENLocal = 'Analytical', ESLocal = 'Analítico'
WHERE IDScreen = -1
AND TranslationKey = 'ANALYTICAL'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MAINTTYPECLASSSSTR - PREDICTIVE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'PREDICTIVE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Preditiva',
'Predictive',
'Profético',
1,
1,
-1,
'PREDICTIVE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Preditiva', ENLocal = 'Predictive', ESLocal = 'Profético'
WHERE IDScreen = -1
AND TranslationKey = 'PREDICTIVE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MAINTTYPECLASSSSTR - CORRECTIVE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'CORRECTIVE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Corretiva',
'Corrective',
'Correctivo',
1,
1,
-1,
'CORRECTIVE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Corretiva', ENLocal = 'Corrective', ESLocal = 'Correctivo'
WHERE IDScreen = -1
AND TranslationKey = 'CORRECTIVE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ToolingOrigin - NSN
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'NSN'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'SNS',
'NSN',
'SNS',
1,
1,
-1,
'NSN')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'SNS', ENLocal = 'NSN', ESLocal = 'SNS'
WHERE IDScreen = -1
AND TranslationKey = 'NSN'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ToolingOrigin - MODELTOOLING
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'MODELTOOLING'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Modelo',
'Model',
'Modelo',
1,
1,
-1,
'MODELTOOLING')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Modelo', ENLocal = 'Model', ESLocal = 'Modelo'
WHERE IDScreen = -1
AND TranslationKey = 'MODELTOOLING'
END
GO

----------------------------------------------------------
-- ToolingOrigin - CONTROLLED
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'CONTROLLED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Controlado',
'Controlled',
'Controlada',
1,
1,
-1,
'CONTROLLED')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Controlado', ENLocal = 'Controlled', ESLocal = 'Controlada'
WHERE IDScreen = -1
AND TranslationKey = 'CONTROLLED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- CHARACTYPE - REQUIRED
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'REQUIRED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Obrigatória',
'Required',
'Requerido',
1,
1,
-1,
'REQUIRED')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Obrigatória', ENLocal = 'Required', ESLocal = 'Requerido'
WHERE IDScreen = -1
AND TranslationKey = 'REQUIRED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- CHARACTYPE - NOTREQUIRED
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'NOTREQUIRED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Não Obrigatória',
'Not Required',
'No Requerido',
1,
1,
-1,
'NOTREQUIRED')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Não Obrigatória', ENLocal = 'Not Required', ESLocal = 'No Requerido'
WHERE IDScreen = -1
AND TranslationKey = 'NOTREQUIRED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- CHARACTYPE - ATTRIBUTE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'ATTRIBUTE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Atributo',
'Attribute',
'Atributo',
1,
1,
-1,
'ATTRIBUTE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Atributo', ENLocal = 'Attribute', ESLocal = 'Atributo'
WHERE IDScreen = -1
AND TranslationKey = 'ATTRIBUTE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- CHARACTYPE - VARIABLE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'VARIABLE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Variável',
'Variable',
'Variable',
1,
1,
-1,
'VARIABLE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Variável', ENLocal = 'Variable', ESLocal = 'Variable'
WHERE IDScreen = -1
AND TranslationKey = 'VARIABLE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ATTRCHARTTYPECODE - HISTORIC
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'HISTORIC'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Histórico',
'Historic',
'Histórico',
1,
1,
-1,
'HISTORIC')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Histórico', ENLocal = 'Historic', ESLocal = 'Histórico'
WHERE IDScreen = -1
AND TranslationKey = 'HISTORIC'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- VALUECLASS - APPROVEDDISAPPROVED
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'APPROVEDDISAPPROVED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Aprovado/Reprovado',
'Approved/Disapproved',
'Aprobado/Rechazado',
1,
1,
-1,
'APPROVEDDISAPPROVED')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Aprovado/Reprovado', ENLocal = 'Approved/Disapproved', ESLocal = 'Aprobado/Rechazado'
WHERE IDScreen = -1
AND TranslationKey = 'APPROVEDDISAPPROVED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- VALUECLASS - CHECKLIST
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'CHECKLIST'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Lista de Controle',
'CheckList',
'Lista de Verificación',
1,
1,
-1,
'CHECKLIST')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Lista de Controle', ENLocal = 'CheckList', ESLocal = 'Lista de Verificación'
WHERE IDScreen = -1
AND TranslationKey = 'CHECKLIST'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- VALUECLASS - DATE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'DATE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Data',
'Date',
'Fecha',
1,
1,
-1,
'DATE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Data', ENLocal = 'Date', ESLocal = 'Fecha'
WHERE IDScreen = -1
AND TranslationKey = 'DATE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- VALUECLASS - DATE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'DATE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Data',
'Date',
'Fecha',
1,
1,
-1,
'DATE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Data', ENLocal = 'Date', ESLocal = 'Fecha'
WHERE IDScreen = -1
AND TranslationKey = 'DATE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- VALUECLASS - SAMPLEMINANDMAX
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SAMPLEMINANDMAX'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Mínimo e Máximo das Amostras',
'Sample Minimum and Maximum',
'Mínimo y Máximo de Muestras',
1,
1,
-1,
'SAMPLEMINANDMAX')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Mínimo e Máximo das Amostras', ENLocal = 'Sample Minimum and Maximum', ESLocal = 'Mínimo y Máximo de Muestras'
WHERE IDScreen = -1
AND TranslationKey = 'SAMPLEMINANDMAX'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- VALUECLASS - SAMPLEMAXIMUM
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SAMPLEMAXIMUM'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Máximo das Amostras',
'Sample Maximum',
'Máximo de Muestras',
1,
1,
-1,
'SAMPLEMAXIMUM')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Máximo das Amostras', ENLocal = 'Sample Maximum', ESLocal = 'Máximo de Muestras'
WHERE IDScreen = -1
AND TranslationKey = 'SAMPLEMAXIMUM'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- VALUECLASS - SAMPLEMINIMUM
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SAMPLEMINIMUM'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Mínimo das Amostras',
'Sample Minimum',
'Mínimo de Muestras',
1,
1,
-1,
'SAMPLEMINIMUM')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Mínimo das Amostras', ENLocal = 'Sample Minimum', ESLocal = 'Mínimo de Muestras'
WHERE IDScreen = -1
AND TranslationKey = 'SAMPLEMINIMUM'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- VALUECLASS - SAMPLEMEAN
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SAMPLEMEAN'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Média das Amostras',
'Sample Mean',
'Muestra Promedio',
1,
1,
-1,
'SAMPLEMEAN')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Média das Amostras', ENLocal = 'Sample Mean', ESLocal = 'Muestra Promedio'
WHERE IDScreen = -1
AND TranslationKey = 'SAMPLEMEAN'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- VALUECLASS - SINGLEVALUE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SINGLEVALUE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Valor Único',
'Single Value',
'Valor Único',
1,
1,
-1,
'SINGLEVALUE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Valor Único', ENLocal = 'Single Value', ESLocal = 'Valor Único'
WHERE IDScreen = -1
AND TranslationKey = 'SINGLEVALUE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- VALUECLASS - MINANDMAX
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'MINANDMAX'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Mínimo e Máximo',
'Minimum and Maximum',
'Mínimo y Máximo',
1,
1,
-1,
'MINANDMAX')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Mínimo e Máximo', ENLocal = 'Minimum and Maximum', ESLocal = 'Mínimo y Máximo'
WHERE IDScreen = -1
AND TranslationKey = 'MINANDMAX'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- INPUTTYPE - DATETIME
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'DATETIME'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Data/Hora',
'Date/Time',
'Fecha y Hora',
1,
1,
-1,
'DATETIME')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Data/Hora', ENLocal = 'Date/Time', ESLocal = 'Fecha y Hora'
WHERE IDScreen = -1
AND TranslationKey = 'DATETIME'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- INPUTTYPE - ONLYNUMBER
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'ONLYNUMBER'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Apenas Número',
'Only Number',
'Solo Numero',
1,
1,
-1,
'ONLYNUMBER')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Apenas Número', ENLocal = 'Only Number', ESLocal = 'Solo Numero'
WHERE IDScreen = -1
AND TranslationKey = 'ONLYNUMBER'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- INPUTTYPE - RANGEWITHNUMBER
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'RANGEWITHNUMBER'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Intervalo com Número',
'Range with Number',
'Intervalo con Número',
1,
1,
-1,
'RANGEWITHNUMBER')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Intervalo com Número', ENLocal = 'Range with Number', ESLocal = 'Intervalo con Número'
WHERE IDScreen = -1
AND TranslationKey = 'RANGEWITHNUMBER'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- INPUTTYPE - TOLERANCEWITHNUMBER
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'TOLERANCEWITHNUMBER'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Tolerância com Número',
'Tolerance with Number',
'Tolerancia con Número',
1,
1,
-1,
'TOLERANCEWITHNUMBER')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Tolerância com Número', ENLocal = 'Tolerance with Number', ESLocal = 'Tolerancia con Número'
WHERE IDScreen = -1
AND TranslationKey = 'TOLERANCEWITHNUMBER'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- LOTCLASS - SERIALNUMBER
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SERIALNUMBER'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Número de Serie',
'Serial Number',
'Número de Serie',
1,
1,
-1,
'SERIALNUMBER')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Número de Serie', ENLocal = 'Serial Number', ESLocal = 'Número de Serie'
WHERE IDScreen = -1
AND TranslationKey = 'SERIALNUMBER'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- LOTCLASS - LOT
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'LOT'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Lote',
'Lot',
'Lote',
1,
1,
-1,
'LOT')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Lote', ENLocal = 'Lot', ESLocal = 'Lote'
WHERE IDScreen = -1
AND TranslationKey = 'LOT'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- LOTORIGIN - INSERTED
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'INSERTED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Inserido',
'Inserted',
'Insertado',
1,
1,
-1,
'INSERTED')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Inserido', ENLocal = 'Inserted', ESLocal = 'Insertado'
WHERE IDScreen = -1
AND TranslationKey = 'INSERTED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- LOTORIGIN - IMPORTED
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'IMPORTED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Importado',
'Imported',
'Importado',
1,
1,
-1,
'IMPORTED')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Importado', ENLocal = 'Imported', ESLocal = 'Importado'
WHERE IDScreen = -1
AND TranslationKey = 'IMPORTED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- LOTORIGIN - POINTED
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'POINTED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Apontado',
'Pointed',
'Apontado',
1,
1,
-1,
'POINTED')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Apontado', ENLocal = 'Pointed', ESLocal = 'Apontado'
WHERE IDScreen = -1
AND TranslationKey = 'POINTED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- LOTORIGIN - CALCULATED
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'CALCULATED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Calculado',
'Calculated',
'Calculado',
1,
1,
-1,
'CALCULATED')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Calculado', ENLocal = 'Calculated', ESLocal = 'Calculado'
WHERE IDScreen = -1
AND TranslationKey = 'CALCULATED'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MOHDCLASSICIFICATION - SCHCORRECTIVE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SCHCORRECTIVE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Corretivo Programado',
'Scheduled Corrective',
'Correctivo Programado',
1,
1,
-1,
'SCHCORRECTIVE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Corretivo Programado', ENLocal = 'Scheduled Corrective', ESLocal = 'Correctivo Programado'
WHERE IDScreen = -1
AND TranslationKey = 'SCHCORRECTIVE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MOHDCLASSICIFICATION - PREVENTIVE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'PREVENTIVE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Preventiva',
'Preventive',
'Preventivo',
1,
1,
-1,
'PREVENTIVE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Preventiva', ENLocal = 'Preventive', ESLocal = 'Preventivo'
WHERE IDScreen = -1
AND TranslationKey = 'PREVENTIVE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MOHDCLASSICIFICATION - EMERGENCYCORRECTIVE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'EMERGENCYCORRECTIVE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Corretivo Emergencial',
'Emergency Corrective',
'Correctivo de Emergencia',
1,
1,
-1,
'EMERGENCYCORRECTIVE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Corretivo Emergencial', ENLocal = 'Emergency Corrective', ESLocal = 'Correctivo de Emergencia'
WHERE IDScreen = -1
AND TranslationKey = 'EMERGENCYCORRECTIVE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MOHDTYPE - RUNNINGMACHINE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'RUNNINGMACHINE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Máquina em Funcionamento',
'Running Machine',
'Máquina en Marcha',
1,
1,
-1,
'RUNNINGMACHINE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Máquina em Funcionamento', ENLocal = 'Running Machine', ESLocal = 'Máquina en Marcha'
WHERE IDScreen = -1
AND TranslationKey = 'RUNNINGMACHINE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MOHDTYPE - STOPMACHINE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'STOPMACHINE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Máquina Parada',
'Stop Machine',
'Máquina Parada',
1,
1,
-1,
'STOPMACHINE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Máquina Parada', ENLocal = 'Stop Machine', ESLocal = 'Máquina Parada'
WHERE IDScreen = -1
AND TranslationKey = 'STOPMACHINE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MOACTION - CLOSEOM
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'CLOSEOM'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Fechar OM',
'Close OM',
'Cerrar OM',
1,
1,
-1,
'CLOSEOM')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Fechar OM', ENLocal = 'Close OM', ESLocal = 'Cerrar OM'
WHERE IDScreen = -1
AND TranslationKey = 'CLOSEOM'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MOACTION - REQUIRESOM
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'REQUIRESOM'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Requer OM',
'Requires OM',
'Requiere OM',
1,
1,
-1,
'REQUIRESOM')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Requer OM', ENLocal = 'Requires OM', ESLocal = 'Requiere OM'
WHERE IDScreen = -1
AND TranslationKey = 'REQUIRESOM'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MOACTION - NOACTION
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'NOACTION'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Sem Ação',
'No Action',
'Ninguna Acción',
1,
1,
-1,
'NOACTION')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Sem Ação', ENLocal = 'No Action', ESLocal = 'Ninguna Acción'
WHERE IDScreen = -1
AND TranslationKey = 'NOACTION'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MAINTCLASS - AWAITINGMAINTENANCE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'AWAITINGMAINTENANCE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Esperando Manutenção',
'Awaiting Maintenance',
'En Espera de Mantenimiento',
1,
1,
-1,
'AWAITINGMAINTENANCE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Esperando Manutenção', ENLocal = 'Awaiting Maintenance', ESLocal = 'En Espera de Mantenimiento'
WHERE IDScreen = -1
AND TranslationKey = 'AWAITINGMAINTENANCE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MAINTCLASS - SCHCORRECTIVEMAINTENANCE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SCHCORRECTIVEMAINTENANCE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Manutenção Corretiva Programada',
'Scheduled Corrective Maintenance',
'Manutención Correctivo Programado',
1,
1,
-1,
'SCHCORRECTIVEMAINTENANCE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Manutenção Corretiva Programada', ENLocal = 'Scheduled Corrective Maintenance', ESLocal = 'Manutención Correctivo Programado'
WHERE IDScreen = -1
AND TranslationKey = 'SCHCORRECTIVEMAINTENANCE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MAINTCLASS - PREVENTIVEMAINTENANCE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'PREVENTIVEMAINTENANCE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Manutenção Preventiva',
'Preventive Maintenance',
'Manutención Preventiva',
1,
1,
-1,
'PREVENTIVEMAINTENANCE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Manutenção Preventiva', ENLocal = 'Preventive Maintenance', ESLocal = 'Manutención Preventiva'
WHERE IDScreen = -1
AND TranslationKey = 'PREVENTIVEMAINTENANCE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MAINTCLASS - CORRECTIVEMAINTENANCE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'CORRECTIVEMAINTENANCE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Manutenção Corretiva',
'Corrective Maintenance',
'Manutención Correctivo',
1,
1,
-1,
'CORRECTIVEMAINTENANCE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Manutenção Corretiva', ENLocal = 'Corrective Maintenance', ESLocal = 'Manutención Correctivo'
WHERE IDScreen = -1
AND TranslationKey = 'CORRECTIVEMAINTENANCE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- MAINTCLASS - NOTAPPLICABLE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'NOTAPPLICABLE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Não Aplicável',
'Not Applicable',
'No Aplicable',
1,
1,
-1,
'NOTAPPLICABLE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Não Aplicável', ENLocal = 'Not Applicable', ESLocal = 'No Aplicable'
WHERE IDScreen = -1
AND TranslationKey = 'NOTAPPLICABLE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVCODE - HIERARCHYCHANGE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'HIERARCHYCHANGE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Troca de Hierarquia',
'Hierarchy Change',
'Cambio de Jerarquía',
1,
1,
-1,
'HIERARCHYCHANGE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Troca de Hierarquia', ENLocal = 'Hierarchy Change', ESLocal = 'Cambio de Jerarquía'
WHERE IDScreen = -1
AND TranslationKey = 'HIERARCHYCHANGE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVCODE - LOTCHANGE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'LOTCHANGE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Troca de Lote',
'Lot Change',
'Cambio de Lote',
1,
1,
-1,
'LOTCHANGE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Troca de Lote', ENLocal = 'Lot Change', ESLocal = 'Cambio de Lote'
WHERE IDScreen = -1
AND TranslationKey = 'LOTCHANGE'
END
GO

----------------------------------------------------------
-- PRODUCTIONEVCODE - APPORTIONMENTSTART
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'APPORTIONMENTSTART'
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Ini. ou Fim de Rateio',
'Apportionment Start or End',
'Ini. ou Fin de Asignación',
1,
1,
-1,
'APPORTIONMENTSTART')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Ini. ou Fim de Rateio', ENLocal = 'Apportionment Start or End', ESLocal = 'Ini. ou Fin de Asignación'
WHERE IDScreen = -1
AND TranslationKey = 'APPORTIONMENTSTART'
END
GO

----------------------------------------------------------
-- PRODUCTIONEVCODE - TOOLCHANGE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'TOOLCHANGE'
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Troca de Ferramenta',
'Tool Change',
'Cambio de Herramienta',
1,
1,
-1,
'TOOLCHANGE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Troca de Ferramenta', ENLocal = 'Tool Change', ESLocal = 'Cambio de Herramienta'
WHERE IDScreen = -1
AND TranslationKey = 'TOOLCHANGE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVCODE - FACTORSCHANGE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'FACTORSCHANGE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Troca de Fatores',
'Factor Change',
'Cambio de Factores',
1,
1,
-1,
'FACTORSCHANGE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Troca de Fatores', ENLocal = 'Factor Change', ESLocal = 'Cambio de Factores'
WHERE IDScreen = -1
AND TranslationKey = 'FACTORSCHANGE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVCODE - CREWCHANGE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'CREWCHANGE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Troca de Equipe',
'Crew Change',
'Cambio de Equipo',
1,
1,
-1,
'CREWCHANGE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Troca de Equipe', ENLocal = 'Crew Change', ESLocal = 'Cambio de Equipo'
WHERE IDScreen = -1
AND TranslationKey = 'CREWCHANGE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVCODE - OPERATORCHANGE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'OPERATORCHANGE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Troca de Operador',
'Operator Change',
'Cambio de Operador',
1,
1,
-1,
'OPERATORCHANGE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Troca de Operador', ENLocal = 'Operator Change', ESLocal = 'Cambio de Operador'
WHERE IDScreen = -1
AND TranslationKey = 'OPERATORCHANGE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVCODE - WORKORDERSTART
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'WORKORDERSTART'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Ini. ou Interrup. de OP',
'Operation Start or Interruption',
'Ini. ou Interrup. del OP',
1,
1,
-1,
'WORKORDERSTART')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Ini. ou Interrup. de OP', ENLocal = 'Operation Start or Interruption', ESLocal = 'Ini. ou Interrup. del OP'
WHERE IDScreen = -1
AND TranslationKey = 'WORKORDERSTART'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVCODE - SHIFTCLOSING
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SHIFTCLOSING'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Fechamento de Turno',
'Shift Closing',
'Cierre de Turno',
1,
1,
-1,
'SHIFTCLOSING')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Fechamento de Turno', ENLocal = 'Shift Closing', ESLocal = 'Cierre de Turno'
WHERE IDScreen = -1
AND TranslationKey = 'SHIFTCLOSING'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVCODE - RESOURCECREATION
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'RESOURCECREATION'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Online/Criação do Recurso',
'Online/Resource Creation',
'Online/Creación de Recurso',
1,
1,
-1,
'RESOURCECREATION')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Online/Criação do Recurso', ENLocal = 'Online/Resource Creation', ESLocal = 'Online/Creación de Recurso'
WHERE IDScreen = -1
AND TranslationKey = 'RESOURCECREATION'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- TIMELINE - PAST
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'PAST'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Passado',
'Past',
'Pasado',
1,
1,
-1,
'PAST')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Passado', ENLocal = 'Past', ESLocal = 'Pasado'
WHERE IDScreen = -1
AND TranslationKey = 'PAST'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVTYPE - APPORTIONMENTSON
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'APPORTIONMENTSON'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Filho de Rateio',
'Apportionment Son',
'Hijo de Asignación',
1,
1,
-1,
'APPORTIONMENTSON')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Filho de Rateio', ENLocal = 'Apportionment Son', ESLocal = 'Hijo de Asignación'
WHERE IDScreen = -1
AND TranslationKey = 'APPORTIONMENTSON'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVTYPE - APPORTIONMENTPARENT
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'APPORTIONMENTPARENT'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Pai de Rateio',
'Apportionment Parent',
'Padre de Asignación',
1,
1,
-1,
'APPORTIONMENTPARENT')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Pai de Rateio', ENLocal = 'Apportionment Parent', ESLocal = 'Padre de Asignación'
WHERE IDScreen = -1
AND TranslationKey = 'APPORTIONMENTPARENT'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- PRODUCTIONEVTYPE - SIMPLE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SIMPLE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Simples',
'Simple',
'Sencillo',
1,
1,
-1,
'SIMPLE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Simples', ENLocal = 'Simple', ESLocal = 'Sencillo'
WHERE IDScreen = -1
AND TranslationKey = 'SIMPLE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - BREAKS6
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS6'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Inter. T6',
'Break S6',
'Rotura C6',
1,
1,
-1,
'BREAKS6')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Inter. T6', ENLocal = 'Break S6', ESLocal = 'Rotura C6'
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS6'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - BREAKS5/S6
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS5/S6'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Inter. T5/T6',
'Break S5/S6',
'Rotura C5/C6',
1,
1,
-1,
'BREAKS5/S6')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Inter. T5/T6', ENLocal = 'Break S5/S6', ESLocal = 'Rotura C5/C6'
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS5/S6'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - BREAKS4/S5
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS4/S5'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Inter. T4/T5',
'Break S4/S5',
'Rotura C4/C5',
1,
1,
-1,
'BREAKS4/S5')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Inter. T4/T5', ENLocal = 'Break S4/S5', ESLocal = 'Rotura C4/C5'
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS4/S5'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - BREAKS3/S4
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS3/S4'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Inter. T3/T4',
'Break S3/S4',
'Rotura C3/C4',
1,
1,
-1,
'BREAKS3/S4')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Inter. T3/T4', ENLocal = 'Break S3/S4', ESLocal = 'Rotura C3/C4'
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS3/S4'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - BREAKS2/S3
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS2/S3'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Inter. T2/T3',
'Break S2/S3',
'Rotura C2/C3',
1,
1,
-1,
'BREAKS2/S3')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Inter. T2/T3', ENLocal = 'Break S2/S3', ESLocal = 'Rotura C2/C3'
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS2/S3'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - BREAKS1/S2
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS1/S2'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Inter. T1/T2',
'Break S1/S2',
'Rotura C1/C2',
1,
1,
-1,
'BREAKS1/S2')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Inter. T1/T2', ENLocal = 'Break S1/S2', ESLocal = 'Rotura C1/C2'
WHERE IDScreen = -1
AND TranslationKey = 'BREAKS1/S2'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - SHIFT6
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT6'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Turno 6',
'Shift 6',
'Cambio 6',
1,
1,
-1,
'SHIFT6')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Turno 6', ENLocal = 'Shift 6', ESLocal = 'Cambio 6'
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT6'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - SHIFT5
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT5'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Turno 5',
'Shift 5',
'Cambio 5',
1,
1,
-1,
'SHIFT5')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Turno 5', ENLocal = 'Shift 5', ESLocal = 'Cambio 5'
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT5'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - SHIFT4
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT4'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Turno 4',
'Shift 4',
'Cambio 4',
1,
1,
-1,
'SHIFT4')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Turno 4', ENLocal = 'Shift 4', ESLocal = 'Cambio 4'
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT4'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - SHIFT3
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT3'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Turno 3',
'Shift 3',
'Cambio 3',
1,
1,
-1,
'SHIFT3')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Turno 3', ENLocal = 'Shift 3', ESLocal = 'Cambio 3'
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT3'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - SHIFT2
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT2'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Turno 2',
'Shift 2',
'Cambio 2',
1,
1,
-1,
'SHIFT2')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Turno 2', ENLocal = 'Shift 2', ESLocal = 'Cambio 2'
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT2'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - SHIFT1
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT1'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Turno 1',
'Shift 1',
'Cambio 1',
1,
1,
-1,
'SHIFT1')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Turno 1', ENLocal = 'Shift 1', ESLocal = 'Cambio 1'
WHERE IDScreen = -1
AND TranslationKey = 'SHIFT1'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - OFFSHIFT
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'OFFSHIFT'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Fora de Turno',
'Off Shift',
'Fuera de Turno',
1,
1,
-1,
'OFFSHIFT')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Fora de Turno', ENLocal = 'Off Shift', ESLocal = 'Fuera de Turno'
WHERE IDScreen = -1
AND TranslationKey = 'OFFSHIFT'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- SHIFT - HOLIDAY
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'HOLIDAY'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Feriado',
'Holiday',
'Vacaciones',
1,
1,
-1,
'HOLIDAY')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Feriado', ENLocal = 'Holiday', ESLocal = 'Vacaciones'
WHERE IDScreen = -1
AND TranslationKey = 'HOLIDAY'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- ORDEM PRODUCAO - MULTWO
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'MULTWO'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Múltiplas Ordens',
'Multiple Orders',
'Múltiples Órdenes',
1,
1,
-1,
'MULTWO')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Múltiplas Ordens', ENLocal = 'Multiple Orders', ESLocal = 'Múltiples Órdenes'
WHERE IDScreen = -1
AND TranslationKey = 'MULTWO'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- RSCLASSIFICATION - PRODUCTION
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'PRODUCTION'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Produção',
'Production',
'Producción',
1,
1,
-1,
'PRODUCTION')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Produção', ENLocal = 'Production', ESLocal = 'Producción'
WHERE IDScreen = -1
AND TranslationKey = 'PRODUCTION'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- RSCLASSIFICATION - UNPLANNEDSTOP
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'UNPLANNEDSTOP'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Parada Não Planejada',
'Unplanned Stop',
'Parada No Planificada',
1,
1,
-1,
'UNPLANNEDSTOP')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Parada Não Planejada', ENLocal = 'Unplanned Stop', ESLocal = 'Parada No Planificada'
WHERE IDScreen = -1
AND TranslationKey = 'UNPLANNEDSTOP'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- RSCLASSIFICATION - PLANNEDSTOPII
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'PLANNEDSTOPII'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Parada Planejada II',
'Planned Stop II',
'Parada Planificada II',
1,
1,
-1,
'PLANNEDSTOPII')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Parada Planejada II', ENLocal = 'Planned Stop II', ESLocal = 'Parada Planificada II'
WHERE IDScreen = -1
AND TranslationKey = 'PLANNEDSTOPII'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- RSCLASSIFICATION - PLANNEDSTOPI
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'PLANNEDSTOPI'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Parada Planejada I',
'Planned Stop I',
'Parada Planificada I',
1,
1,
-1,
'PLANNEDSTOPI')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Parada Planejada I', ENLocal = 'Planned Stop I', ESLocal = 'Parada Planificada I'
WHERE IDScreen = -1
AND TranslationKey = 'PLANNEDSTOPI'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- RSCLASSIFICATION - TIMEOFFSHIFT
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'TIMEOFFSHIFT'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Tempo Fora de Turno',
'Time Off Shift',
'Tiempo Fuera de Turno',
1,
1,
-1,
'TIMEOFFSHIFT')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Tempo Fora de Turno', ENLocal = 'Time Off Shift', ESLocal = 'Tiempo Fuera de Turno'
WHERE IDScreen = -1
AND TranslationKey = 'TIMEOFFSHIFT'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- RESOURCECLASSIFICATION - PERSON
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'PERSON'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Homem',
'Person',
'Hombre',
1,
1,
-1,
'PERSON')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Homem', ENLocal = 'Person' , ESLocal = 'Hombre'
WHERE IDScreen = -1
AND TranslationKey = 'PERSON'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO

----------------------------------------------------------
-- RESOURCECLASSIFICATION - MACHINE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = -1
AND TranslationKey = 'MACHINE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Máquina',
'Machine',
'Maquina',
1,
1,
-1,
'MACHINE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Máquina', ENLocal = 'Machine' , ESLocal = 'Maquina'
WHERE IDScreen = -1
AND TranslationKey = 'MACHINE'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
END
GO


