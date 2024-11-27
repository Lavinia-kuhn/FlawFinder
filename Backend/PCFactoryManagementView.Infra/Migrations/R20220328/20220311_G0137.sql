-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0137', 'G0137-DTM OM', 'G0137–DTM OM', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0146–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0137'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0137', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'), 2, 1, 'G0137',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0137')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0146
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0137'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0137-DTM OM','G0137-DTM OM', 'G0137-DTM OM',1,1,'VIEW_MENU_G0137',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0137

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0137', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0146

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0137', 'apitable', 'ReportChart', 'TABLETAB' , 1, 'G0137/v1/Table ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO



----G0137 RADIO GROUP Hierar
--Para a ABA - TABLETAB
IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'statusMo'
AND TableName = 'registersStatusMo'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('registersStatusMo', 'statusMo', 'FilterOptions','radio', 'TABLETAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0137 RADIO statusMo - All
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersStatusMo'
AND FieldName = 'All'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('All', 'All', 'FilterValues','radio', 'registersStatusMo' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0137 RADIO statusMo - Closed
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersStatusMo'
AND FieldName = 'Closed'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('Closed', 'Closed', 'FilterValues','radio', 'registersStatusMo' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0137 RADIO statusMo - Open
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersStatusMo'
AND FieldName = 'Open'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('Open', 'Open', 'FilterValues','radio', 'registersStatusMo' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
