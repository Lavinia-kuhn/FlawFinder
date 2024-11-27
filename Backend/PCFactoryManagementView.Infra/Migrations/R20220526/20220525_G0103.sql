
-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0103–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

 INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

 VALUES ('G0103', 'G0103–Performance de Ferramental', 'G0103–Tooling Performance', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0103–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 ) AND Operation = 'SIM')

BEGIN

 INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

 VALUES (

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0103–Relatório de Auditoria de Ordens

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

 SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

 INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

 VALUES (

 (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0103'

 AND IDSuperiorScreenMenu = (SELECT TOP 1 IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'))

BEGIN

 INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

 VALUES ('VIEW_MENU_G0103', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'), 2, 1, 'G0103',

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0103')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0103
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0103'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('G0103–Performance de Ferramental', 'G0103–Tooling Performance', 'G0103-Rendimiento de Herramientas',1,1,'VIEW_MENU_G0103',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

-- --------------------------------------------------------------------------------------
--ABA
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0103', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- REPORTS
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0103', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0103/v1/Table ',0,2,'',
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- --------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETABRESUME')
BEGIN

INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0103', 'ReportTab', 'ReportTab', 'REPORT' , 1, 'TABLETABRESUME',0,3,'',
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETABRESUME')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen, FieldType)
VALUES ('G0103', 'table', 'ReportChart', 'TABLETABRESUME' , 1, 'G0103/V1/TableIndicators',0,3,'',
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 'tree')
END
GO

-- --------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'BARTAB')
BEGIN

INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0103', 'ReportTab', 'ReportTab', 'REPORT' , 1, 'BARTAB',0,1,'',
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'BARTAB')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0103', 'stackedbar', 'ReportChart', 'BARTAB' , 1, 'G0103/V1/BarTab',0,1,'',
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- --------------------------------------------------------------------------------------

--Translation
IF NOT EXISTS(select idLocalization from TBLLocalizations where TranslationKey = 'MVINDICATORSTEOPRODUCTIVEGROSSTIME')
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, IDScreen, TranslationKey, FlgProduct)
VALUES (61, 'Tempo Produtivo Bruto Teorico', 'Teoric Gross Productive Time', 1, -1, 'MVINDICATORSTEOPRODUCTIVEGROSSTIME', 1)
END 
GO

--Translation
IF NOT EXISTS(select idLocalization from TBLLocalizations where TranslationKey = 'MVINDICATORSPERDACAVIDADE')
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, IDScreen, TranslationKey, FlgProduct)
VALUES (61, 'Perda Ferramental', 'Tooling Loss', 1, -1, 'MVINDICATORSPERDACAVIDADE', 1)
END 
GO