-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0026', 'G0026–Pendências', 'G0026–Pendencies', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU
-- --------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0026'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0026', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'), 2, 1, 'G0026',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0026')

END

GO

--TRADUÇÃO DO MENU DAS TELAS

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0026'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0026-Pendências','G0026-Pendencies', 'G0026-Pendencias',1,1,'VIEW_MENU_G0026',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

-- -----------------------------------------ABAS-----------------------------------------

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0026', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'PARETOFREQTAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0026', 'ReportTab', 'ReportTab', 'REPORT',1, 'PARETOFREQTAB',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'PARETODURTAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0026', 'ReportTab', 'ReportTab', 'REPORT',1, 'PARETODURTAB',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0026', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0026/v1/Table ',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'PARETOFREQTAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0026', 'pareto', 'ReportChart', 'PARETOFREQTAB' , 1, 'G0026/v1/Frequency ',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'PARETODURTAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0026', 'paretoDuration', 'ReportChart', 'PARETODURTAB' , 1, 'G0026/v1/Duration ',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

	-------------------------------------------FILTERS-----------------------------------------

	-------------------------------------------STATUS PENDENCIA TABELA-----------------------------------------

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'STATUS'
	AND TableName = 'STATUS'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUS', 'STATUS', 'FilterOptions','checkbox', 'TABLETAB', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUS'
	AND FieldName = 'ALL'
	AND TableName = 'ALL'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ALL', 'ALL', 'FilterValues','checkbox', 'STATUS', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUS'
	AND FieldName = 'STATUS10'
	AND TableName = 'STATUS10'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUS10', 'STATUS10', 'FilterValues','checkbox', 'STATUS', 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUS'
	AND FieldName = 'STATUS20'
	AND TableName = 'STATUS20'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUS20', 'STATUS20', 'FilterValues','checkbox', 'STATUS', 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUS'
	AND FieldName = 'STATUS30'
	AND TableName = 'STATUS30'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUS30', 'STATUS30', 'FilterValues','checkbox', 'STATUS', 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-------------------------------------------CLASSIFICACAO TIPO PENDENCIA TABELA-----------------------------------------

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'CLASSIFICATION'
	AND TableName = 'CLASSIFICATION'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASSIFICATION', 'CLASSIFICATION', 'FilterOptions','checkbox', 'TABLETAB', 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSIFICATION'
	AND FieldName = 'ALL'
	AND TableName = 'ALL'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ALL', 'ALL', 'FilterValues','checkbox', 'CLASSIFICATION', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSIFICATION'
	AND FieldName = 'CLASS10'
	AND TableName = 'CLASS10'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS10', 'CLASS10', 'FilterValues','checkbox', 'CLASSIFICATION', 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSIFICATION'
	AND FieldName = 'CLASS20'
	AND TableName = 'CLASS20'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS20', 'CLASS20', 'FilterValues','checkbox', 'CLASSIFICATION', 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSIFICATION'
	AND FieldName = 'CLASS30'
	AND TableName = 'CLASS30'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS30', 'CLASS30', 'FilterValues','checkbox', 'CLASSIFICATION', 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSIFICATION'
	AND FieldName = 'CLASS40'
	AND TableName = 'CLASS40'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS40', 'CLASS40', 'FilterValues','checkbox', 'CLASSIFICATION', 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-------------------------------------------STATUS PENDENCIA PARETO FREQUENCIA-----------------------------------------

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'PARETOFREQTAB'
	AND FieldName = 'STATUSFREQ'
	AND TableName = 'STATUSFREQ'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUSFREQ', 'STATUSFREQ', 'FilterOptions','checkbox', 'PARETOFREQTAB', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUSFREQ'
	AND FieldName = 'ALL'
	AND TableName = 'ALL'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ALL', 'ALL', 'FilterValues','checkbox', 'STATUSFREQ', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUSFREQ'
	AND FieldName = 'STATUS10'
	AND TableName = 'STATUS10'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUS10', 'STATUS10', 'FilterValues','checkbox', 'STATUSFREQ', 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUSFREQ'
	AND FieldName = 'STATUS20'
	AND TableName = 'STATUS20'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUS20', 'STATUS20', 'FilterValues','checkbox', 'STATUSFREQ', 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUSFREQ'
	AND FieldName = 'STATUS30'
	AND TableName = 'STATUS30'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUS30', 'STATUS30', 'FilterValues','checkbox', 'STATUSFREQ', 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-------------------------------------------CLASSIFICACAO TIPO PENDENCIA PARETO FREQUENCIA-----------------------------------------
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'PARETOFREQTAB'
	AND FieldName = 'CLASSFREQ'
	AND TableName = 'CLASSFREQ'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASSFREQ', 'CLASSFREQ', 'FilterOptions','checkbox', 'PARETOFREQTAB', 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSFREQ'
	AND FieldName = 'ALL'
	AND TableName = 'ALL'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ALL', 'ALL', 'FilterValues','checkbox', 'CLASSFREQ', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSFREQ'
	AND FieldName = 'CLASS10'
	AND TableName = 'CLASS10'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS10', 'CLASS10', 'FilterValues','checkbox', 'CLASSFREQ', 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSFREQ'
	AND FieldName = 'CLASS20'
	AND TableName = 'CLASS20'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS20', 'CLASS20', 'FilterValues','checkbox', 'CLASSFREQ', 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSFREQ'
	AND FieldName = 'CLASS30'
	AND TableName = 'CLASS30'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS30', 'CLASS30', 'FilterValues','checkbox', 'CLASSFREQ', 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSFREQ'
	AND FieldName = 'CLASS40'
	AND TableName = 'CLASS40'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS40', 'CLASS40', 'FilterValues','checkbox', 'CLASSFREQ', 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-------------------------------------------STATUS PENDENCIA PARETO DURACAO-----------------------------------------

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'PARETODURTAB'
	AND FieldName = 'STATUSDUR'
	AND TableName = 'STATUSDUR'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUSDUR', 'STATUSDUR', 'FilterOptions','checkbox', 'PARETODURTAB', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUSDUR'
	AND FieldName = 'ALL'
	AND TableName = 'ALL'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ALL', 'ALL', 'FilterValues','checkbox', 'STATUSDUR', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUSDUR'
	AND FieldName = 'STATUS10'
	AND TableName = 'STATUS10'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUS10', 'STATUS10', 'FilterValues','checkbox', 'STATUSDUR', 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUSDUR'
	AND FieldName = 'STATUS20'
	AND TableName = 'STATUS20'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUS20', 'STATUS20', 'FilterValues','checkbox', 'STATUSDUR', 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STATUSDUR'
	AND FieldName = 'STATUS30'
	AND TableName = 'STATUS30'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STATUS30', 'STATUS30', 'FilterValues','checkbox', 'STATUSDUR', 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-------------------------------------------CLASSIFICACAO TIPO PENDENCIA PARETO DURACAO-----------------------------------------
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'PARETODURTAB'
	AND FieldName = 'CLASSDUR'
	AND TableName = 'CLASSDUR'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASSDUR', 'CLASSDUR', 'FilterOptions','checkbox', 'PARETODURTAB', 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSDUR'
	AND FieldName = 'ALL'
	AND TableName = 'ALL'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ALL', 'ALL', 'FilterValues','checkbox', 'CLASSDUR', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSDUR'
	AND FieldName = 'CLASS10'
	AND TableName = 'CLASS10'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS10', 'CLASS10', 'FilterValues','checkbox', 'CLASSDUR', 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSDUR'
	AND FieldName = 'CLASS20'
	AND TableName = 'CLASS20'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS20', 'CLASS20', 'FilterValues','checkbox', 'CLASSDUR', 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSDUR'
	AND FieldName = 'CLASS30'
	AND TableName = 'CLASS30'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS30', 'CLASS30', 'FilterValues','checkbox', 'CLASSDUR', 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CLASSDUR'
	AND FieldName = 'CLASS40'
	AND TableName = 'CLASS40'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CLASS40', 'CLASS40', 'FilterValues','checkbox', 'CLASSDUR', 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-------------------------------------------DESATIVAR FILTRO TURMA DE TURNO-----------------------------------------

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterShiftTeam'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'MainFilterShiftTeam'
	AND TableName = 'G0026')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0026', 'MainFilterShiftTeam', 'MainFilterShiftTeam','', 'TABLETAB', 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterShiftTeam'
	AND GroupName = 'PARETOFREQTAB'
	AND FieldName = 'MainFilterShiftTeam'
	AND TableName = 'G0026')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0026', 'MainFilterShiftTeam', 'MainFilterShiftTeam','', 'PARETOFREQTAB', 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterShiftTeam'
	AND GroupName = 'PARETODURTAB'
	AND FieldName = 'MainFilterShiftTeam'
	AND TableName = 'G0026')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0026', 'MainFilterShiftTeam', 'MainFilterShiftTeam','', 'PARETODURTAB', 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-------------------------------------------DESATIVAR FILTRO TURNO-----------------------------------------

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterShift'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'MainFilterShift'
	AND TableName = 'G0026')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0026', 'MainFilterShift', 'MainFilterShift','', 'TABLETAB', 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterShift'
	AND GroupName = 'PARETOFREQTAB'
	AND FieldName = 'MainFilterShift'
	AND TableName = 'G0026')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0026', 'MainFilterShift', 'MainFilterShift','', 'PARETOFREQTAB', 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterShift'
	AND GroupName = 'PARETODURTAB'
	AND FieldName = 'MainFilterShift'
	AND TableName = 'G0026')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0026', 'MainFilterShift', 'MainFilterShift','', 'PARETODURTAB', 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
