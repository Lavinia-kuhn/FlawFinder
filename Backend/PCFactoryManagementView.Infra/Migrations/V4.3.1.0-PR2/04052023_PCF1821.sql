IF EXISTS (SELECT IDScreen from TBLScreen where Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication where code = 'PCF4VIEW'))
BEGIN
	UPDATE TBLScreen
	SET Name = 'G0005-Linha do Tempo', NameEN = 'G0005-Timeline'
	where  Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication where code = 'PCF4VIEW')
END
GO

IF EXISTS (SELECT IDScreen from TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0005'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
UPDATE TBLLocalizations
SET 
	PTLocal = 'G0005-Linha do Tempo', 
	ENLocal = 'G0005-Timeline', 
	ESLocal = 'G0005-Linea del tiempo'
WHERE TranslationKey = 'VIEW_MENU_G0005'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
END
GO


-- --------------------------------------------------------------------------------------
-- ----------------RELATRIOS (CRIAO DO RELATRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0005Indicadores BTS
IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005'
    AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
    INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)
    VALUES ('G0005', 'G0005-Linha do Tempo', 'G0005Time Line', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)
END
GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0135Relatrio de Distribuio da Gravidade de Manuteno OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VNCULO USURIO ADMIN COM O RELATRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0135Relatrio de Distribuio da Gravidade de Manuteno OM

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO

  
-- --------------------------------------------------------------------------------------
--INSERO DO RELATRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147Analtico de Validao
IF EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0005'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'))

BEGIN
Update TBLScreenMenus SEt FlgEnable = 1 where Code = 'VIEW_MENU_G0005'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO')
END

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0005'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0005', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'), 27, 1, 'G0005',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0005')

END

GO

--TRADUO DO MENU DAS TELAS
--TELA G0135
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0005'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0005-Linha do Tempo','G0005-Time Line', 'G0005-Linea del tiempo',1,1,'VIEW_MENU_G0005',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TIMELINE')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0005', 'ReportTab', 'ReportTab', 'REPORT',1, 'TIMELINE',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRFICO OU TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TIMELINE')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0005', 'timelines', 'ReportChart', 'TIMELINE' , 1, 'G0005/v1/GetResourcesByFilter',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTER --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TIMELINE'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'TIMELINE' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'OPCode'
AND FieldName = 'CodeWODET'
AND TableName = 'CodeWODET'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeWODET', 'CodeWODET', 'FilterValues','text', 'OPCode' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
-- CRIA UM DETAIL FILTER PARA FILTRAR POR LTIMA OPERAO PARA CADA ORDEM --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TIMELINE'
AND FieldName = 'Events'
AND TableName = 'Events'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('Events', 'Events', 'FilterOptions','checkbox', 'TIMELINE' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'AllEvents'
AND TableName = 'AllEvents'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('AllEvents', 'AllEvents', 'FilterValues','checkbox', 'Events' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'ShiftChange'
AND TableName = 'ShiftChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ShiftChange', 'ShiftChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'WoChange'
AND TableName = 'WoChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('WoChange', 'WoChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'OperChange'
AND TableName = 'OperChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OperChange', 'OperChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'RsChange'
AND TableName = 'RsChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('RsChange', 'RsChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'GpChange'
AND TableName = 'GpChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('GpChange', 'GpChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'RwChange'
AND TableName = 'RwChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('RwChange', 'RwChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,6,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'ScChange'
AND TableName = 'ScChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ScChange', 'ScChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,7,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'InspChange'
AND TableName = 'InspChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('InspChange', 'InspChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,8,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'SHIFTCHANGE'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Troca de Turno',
 'Cambiar de Turno',
			'Shift Change',
 1,
 1,
 -1,
 'SHIFTCHANGE')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Troca de Turno', 
ENLocal = 'Cambiar de Turno', 
ESLocal = 'Shift Change'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'SHIFTCHANGE'
END
GO
----------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'WOCHANGE'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Troca de Ordem/Operao',
 'Cambiar de Ordem/Operao',
			'Work Order Change',
 1,
 1,
 -1,
 'WOCHANGE')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Troca de Ordem/Operao', 
ENLocal = 'Cambiar de Ordem/Operao', 
ESLocal = 'Work Order Change'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'WOCHANGE'
END
GO
----------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'OPERCHANGE'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Troca de Operador',
 'Cambiar de Operador',
			'Operator Change',
 1,
 1,
 -1,
 'OPERCHANGE')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Troca de Operador', 
ENLocal = 'Cambiar de Operador', 
ESLocal = 'Operator Change'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'OPERCHANGE'
END
GO
----------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'RSCHANGE'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Troca de Status',
 'Cambiar de Status',
			'Status Change',
 1,
 1,
 -1,
 'RSCHANGE')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Troca de Status', 
ENLocal = 'Cambiar de Status', 
ESLocal = 'Status Change'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'RSCHANGE'
END
GO
----------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'GPCHANGE'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Peas Boas',
 'Peas Boas',
			'Good Pieces',
 1,
 1,
 -1,
 'GPCHANGE')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Peas Boas', 
ENLocal = 'Peas Boas', 
ESLocal = 'Good Pieces'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'GPCHANGE'
END
GO
----------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'RWCHANGE'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Retrabalhos',
 'Retrabalhos',
			'Reworks',
 1,
 1,
 -1,
 'RWCHANGE')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Retrabalhos', 
ENLocal = 'Retrabalhos', 
ESLocal = 'Reworks'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'RWCHANGE'
END
GO
----------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'SCCHANGE'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Refugos',
 'Refugos',
			'Scraps',
 1,
 1,
 -1,
 'SCCHANGE')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Refugos', 
ENLocal = 'Refugos', 
ESLocal = 'Scraps'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'SCCHANGE'
END
GO
----------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'INSPCHANGE'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Inspees',
 'Inspees',
			'Inspections',
 1,
 1,
 -1,
 'INSPCHANGE')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Inspees', 
ENLocal = 'Inspees', 
ESLocal = 'Inspections'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'INSPCHANGE'
END
GO
----------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'TIMELINE'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Linha do Tempo',
 'Linha de Tiempo',
			'Time Line',
 1,
 1,
 -1,
 'TIMELINE')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Linha do Tempo', 
ENLocal = 'Linha de Tiempo', 
ESLocal = 'Time Line'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'TIMELINE'
END
GO

IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'PRODUCTION'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Produo',
 'Production',
			'Produo',
 1,
 1,
 -1,
 'PRODUCTION')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Produo', 
ENLocal = 'Production', 
ESLocal = 'Produo'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'PRODUCTION'
END
GO

--------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'RELEASED'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Liberada',
 'Released',
			'Liberada',
 1,
 1,
 -1,
 'RELEASED')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Liberada', 
ENLocal = 'Released', 
ESLocal = 'Liberada'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'RELEASED'
END
GO

--------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'INTERRUPTED'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Interrompida',
 'Interrupted',
			'Interrompida',
 1,
 1,
 -1,
 'INTERRUPTED')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Interrompida', 
ENLocal = 'Interrupted', 
ESLocal = 'Interrompida'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'INTERRUPTED'
END
GO

--------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'DOWNLOADED'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Baixada',
 'Downloaded',
			'Baixada',
 1,
 1,
 -1,
 'DOWNLOADED')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Baixada', 
ENLocal = 'Downloaded', 
ESLocal = 'Baixada'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'DOWNLOADED'
END
GO

--------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'CLOSED'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Fechada',
 'Closed',
			'Fechada',
 1,
 1,
 -1,
 'CLOSED')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Fechada', 
ENLocal = 'Closed', 
ESLocal = 'Fechada'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'CLOSED'
END
GO

--------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (
 SELECT IDLocalization
 FROM TBLLocalizations
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'CANCELED'
)
BEGIN
 INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
 VALUES (
 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
 'Cancelada',
 'Canceled',
			'Cancelada',
 1,
 1,
 -1,
 'CANCELED')
END
ELSE
BEGIN
 UPDATE TBLLocalizations SET 
PTLocal = 'Cancelada', 
ENLocal = 'Canceled', 
ESLocal = 'Cancelada'
 WHERE IDScreen = -1
 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
 AND TranslationKey = 'CANCELED'
END
GO