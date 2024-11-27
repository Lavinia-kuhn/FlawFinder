-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0129-Tarefas de Armazenamento
IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0129', 'G0129–Tarefas de Armazenamento', 'G0129–Storage Job', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0129–Tarefas de Armazenamento

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0129–Tarefas de Armazenamento

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0129–Tarefas de Armazenamento

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0129'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0129', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'), 2, 1, 'G0129',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/movmat/G0129')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0129
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0129'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0129-Tarefas de Armazenamento','G0129-Storage Job', 'G0129-Trabajo de Almacenamiento',1,1,'VIEW_MENU_G0129',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0129

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0129', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0129

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0129', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0129/v1/Table',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'StatusType'
AND TableName = 'StatusSelection')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('StatusSelection', 'StatusType', 'FilterOptions', 'checkbox', 'TABLETAB' , 1, '', 0, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'StatusSelection'
AND FieldName = 'StatusAll'
AND TableName = 'StatusAll')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('StatusAll', 'StatusAll', 'FilterValues', 'checkbox', 'StatusSelection' , 1, 'true', 0, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'StatusSelection'
AND FieldName = 'StatusQueue'
AND TableName = 'StatusQueue')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('StatusQueue', 'StatusQueue', 'FilterValues', 'checkbox', 'StatusSelection' , 1, 'true', 0, 1, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'StatusSelection'
AND FieldName = 'StatusPendency'
AND TableName = 'StatusPendency')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('StatusPendency', 'StatusPendency', 'FilterValues', 'checkbox', 'StatusSelection' , 1, 'true', 0, 2, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'StatusSelection'
AND FieldName = 'StatusInProgress'
AND TableName = 'StatusInProgress')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('StatusInProgress', 'StatusInProgress', 'FilterValues', 'checkbox', 'StatusSelection' , 1, 'true', 0, 3, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- HEADER FILTERS
IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterAddress'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterAddress'
AND TableName = 'G0129')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0129', 'MainFilterAddress', 'MainFilterAddress', NULL, 'TABLETAB' , 0, '', 0, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
	
IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterLot'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterLot'
AND TableName = 'G0129')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0129', 'MainFilterLot', 'MainFilterLot', NULL, 'TABLETAB' , 0, '', 0, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
	
IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterUnMov'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterUnMov'
AND TableName = 'G0129')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0129', 'MainFilterUnMov', 'MainFilterUnMov', NULL, 'TABLETAB' , 0, '', 0, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterMovType'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterMovType'
AND TableName = 'G0129')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0129', 'MainFilterMovType', 'MainFilterMovType', NULL, 'TABLETAB' , 0, '', 0, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProductFamily'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterProductFamily'
AND TableName = 'G0129')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0129', 'MainFilterProductFamily', 'MainFilterProductFamily', NULL, 'TABLETAB' , 0, '', 0, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProduct'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterProduct'
AND TableName = 'G0129')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0129', 'MainFilterProduct', 'MainFilterProduct', NULL, 'TABLETAB' , 0, '', 0, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProduct'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterProduct'
AND TableName = 'G0129')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0129', 'MainFilterProduct', 'MainFilterProduct', NULL, 'TABLETAB' , 0, '', 0, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO