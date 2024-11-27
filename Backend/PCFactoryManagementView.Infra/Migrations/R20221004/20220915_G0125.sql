----------------------------------------------------------------------------------------
------------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
----------------------------------------------------------------------------------------
--TELA G0125–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

 INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

 VALUES ('G0125', 'G0125–Sumarizado de Contagem de Inventario', 'G0125–Inventory Count Summary', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

----------------------------------------------------------------------------------------
-------------------------------------OPERATION SCREEN-----------------------------------
----------------------------------------------------------------------------------------
--TELA G0125–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 ) AND Operation = 'SIM')

BEGIN

 INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

 VALUES (

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0125–Relatório de Sumarizado de Contagem de Inventario

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

 SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

 INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

 VALUES (

 (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0125'

 AND IDSuperiorScreenMenu = (SELECT TOP 1 IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'))

BEGIN

 INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

 VALUES ('VIEW_MENU_G0125', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'), 6, 1, 'G0125',

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/movmat/G0125')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0125
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0125'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('G0125–Sumarizado de Contagem de Inventario', 'G0125–Inventory Count Summary', 'G0125-Resumen de Recuento de Inventario',1,1,'VIEW_MENU_G0125',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0125

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0125', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0125

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0125', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0125/v1/Table ',0,1,'',
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTER --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'TABLETAB' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'OPCode'
AND FieldName = 'CodeOP'
AND TableName = 'CodeOP'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeOP', 'CodeOP', 'FilterValues','text', 'OPCode' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'OPCode'
AND FieldName = 'CodeInv'
AND TableName = 'CodeInv'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeInv', 'CodeInv', 'FilterValues','text', 'OPCode' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'OPCode'
AND FieldName = 'CodeOrder'
AND TableName = 'CodeOrder'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeOrder', 'CodeOrder', 'FilterValues','text', 'OPCode' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Disabled --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterDate'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterDate'
AND TableName = 'G0125'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0125', 'MainFilterDate', 'MainFilterDate','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
-- Disabled --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterUnMov'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterUnMov'
AND TableName = 'G0125'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0125', 'MainFilterUnMov', 'MainFilterUnMov','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
-- Disabled --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterMovType'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterMovType'
AND TableName = 'G0125'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0125', 'MainFilterMovType', 'MainFilterMovType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Disabled --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProductFamily'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterProductFamily'
AND TableName = 'G0125'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0125', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO