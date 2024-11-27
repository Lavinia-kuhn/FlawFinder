-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0020–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0020', 'G0020–OEE Hora a Hora', 'G0020–OEE Hourly', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0020–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0020

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0020'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0020', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'), 11, 1, 'G0020',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0020')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0020
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0020'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0020-OEE Hora a Hora','G0020-OEE Hourly', 'G0020-OEE Hora por Hora',1,1,'VIEW_MENU_G0020',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO




--ABA Oee

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportTab'

AND DefaultValue = 'OEETABLETAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0020', 'ReportTab', 'ReportTab', 'REPORT',1, 'OEETABLETAB',0,0,'', 
					(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = 
						(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

--REPORT / TIPO DE GRÁFICO OU TABELA

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportChart'

AND GroupName = 'OEETABLETAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0020', 'table', 'ReportChart', 'OEETABLETAB' , 1, 'G0020/v1/OeeTable',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO


GO


--ABA Scrap

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportTab'

AND DefaultValue = 'SCRAPTABLETAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0020', 'ReportTab', 'ReportTab', 'REPORT',1, 'SCRAPTABLETAB',0,0,'', 
					(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = 
						(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

--REPORT / TIPO DE GRÁFICO OU TABELA

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportChart'

AND GroupName = 'SCRAPTABLETAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0020', 'table', 'ReportChart', 'SCRAPTABLETAB' , 1, 'G0020/v1/ScrapTable',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO



--ABA Rework

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportTab'

AND DefaultValue = 'REWORKTABLETAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0020', 'ReportTab', 'ReportTab', 'REPORT',1, 'REWORKTABLETAB',0,0,'', 
					(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = 
						(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

--REPORT / TIPO DE GRÁFICO OU TABELA

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =

(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

AND ComponentType = 'ReportChart'

AND GroupName = 'REWORKTABLETAB')

BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)

                VALUES ('G0020', 'table', 'ReportChart', 'REWORKTABLETAB' , 1, 'G0020/v1/ReworkTable',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END

GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'SCRAP'
			)
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
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'SCRAP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Refugo', ENLocal = 'Scrap', ESLocal = 'Chatarra'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'SCRAP'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'REWORK'
			)
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
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'REWORK')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Retrabalho', ENLocal = 'Rework', ESLocal = 'Rehacer'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'REWORK'
END
GO



IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam' and GroupName = 'OEETABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0020', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'OEETABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift' and GroupName = 'OEETABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0020', 'MainFilterShift', 'MainFilterShift', 'OEETABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END


GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam' and GroupName = 'SCRAPTABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0020', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'SCRAPTABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift'  and GroupName = 'SCRAPTABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0020', 'MainFilterShift', 'MainFilterShift', 'SCRAPTABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam'   and GroupName = 'REWORKTABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0020', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'REWORKTABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift'  and GroupName = 'REWORKTABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0020', 'MainFilterShift', 'MainFilterShift', 'REWORKTABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO