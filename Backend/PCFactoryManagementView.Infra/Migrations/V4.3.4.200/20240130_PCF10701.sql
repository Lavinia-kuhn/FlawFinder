-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0114–Integration Input Events

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
    INSERT INTO TBLScreen (Code, Name, NameEN, FlgProduct, IDAplication, DtCreation, ContextPrint)
	VALUES ('G0114', 'G0114–Eventos de Entrada de integração', 'G0114–Integration Input Events', 1, (
		SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
	), GETDATE(), 0)
END
GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0114–Integration Input Events

IF NOT EXISTS (
	SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND Operation = 'SIM'
)
BEGIN
	INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
	VALUES ((
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114'AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	), 'SIM', 'SIM', GETDATE())
END
GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0114–Integration Input Events

IF NOT EXISTS (
	SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (
		SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (
			SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
				SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
			)
		) AND Operation = 'SIM'
	) 
	AND IDUsrGroup = (
		SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'
	)
)
BEGIN
	INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
	VALUES ((
		SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen = (
			SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
				SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
			)
		)
	), (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'), GETDATE())
END
GO

-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU
-- --------------------------------------------------------------------------------------
--TELA G0114–Integration Input Events

IF NOT EXISTS (
	SELECT * FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0114' AND IDSuperiorScreenMenu = (
		SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
	)
)
BEGIN
	INSERT INTO TBLScreenMenus (Code, IDSuperiorScreenMenu, MenuOrder, FlgEnable, ShortCut, IDScreen, Link)
	VALUES ('VIEW_MENU_G0114', (
		SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
	), 
	(
		SELECT TOP 1 (MenuOrder + 1) FROM TBLScreenMenus WHERE IDSuperiorScreenMenu = (
			SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
		) AND Code LIKE 'VIEW_MENU_G0%' GROUP BY MenuOrder ORDER BY MenuOrder DESC
	), 1, 'G0114', 
	(
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	), '/report/oee/G0114')
END
GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0114

IF NOT EXISTS (
	SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0114' AND IDApplication = (
		SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
	) AND IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
)
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
	VALUES ('G0114-Eventos de Entrada de integração', 'G0114-Integration Input Events', 'G0114-Eventos de entrada de integración', 1, 1, 'VIEW_MENU_G0114', (
		SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
	), (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
				SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0114

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0114', 'ReportTab', 'ReportTab', 'REPORT', 1, 'TABLETAB', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportChart' AND DefaultValue = 'G0114/v1/Table'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0114', 'table', 'ReportChart', 'TABLETAB', 1, 'G0114/v1/Table', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

--ABA TABELA PRODUTO - G0114

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportTab' AND DefaultValue = 'PRODUCTTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0114', 'ReportTab', 'ReportTab', 'REPORT', 1, 'PRODUCTTAB', 0, 2, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportChart' AND DefaultValue = 'G0114/v1/ProductTable'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0114', 'table', 'ReportChart', 'PRODUCTTAB', 1, 'G0114/v1/ProductTable', 0, 2, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

-- DETALHES DE FILTRO ABA PRINCIPAL
-- Order Code --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'OPCode'
AND FieldName = 'CodeOP'
AND TableName = 'CodeOP'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeOP', 'CodeOP', 'FilterValues','text', 'OPCode' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTRO DE STATUS DE INTEGRAÇÃO --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'INTEGSTATUSFILTER'
AND TableName = 'INTEGSTATUSFILTER'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('INTEGSTATUSFILTER', 'INTEGSTATUSFILTER', 'FilterOptions','checkbox', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Todos os Status
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'INTEGSTATUSFILTER'
AND FieldName = 'ALLSTATUS'
AND TableName = 'ALLSTATUS'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ALLSTATUS', 'ALLSTATUS', 'FilterValues','checkbox', 'INTEGSTATUSFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- A PROCESSAR
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'INTEGSTATUSFILTER'
AND FieldName = 'PROCESS'
AND TableName = 'PROCESS'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('PROCESS', 'PROCESS', 'FilterValues','checkbox', 'INTEGSTATUSFILTER' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- EM PROCESSO
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'INTEGSTATUSFILTER'
AND FieldName = 'INPROCESS'
AND TableName = 'INPROCESS'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('INPROCESS', 'INPROCESS', 'FilterValues','checkbox', 'INTEGSTATUSFILTER' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- INTEGRADO
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'INTEGSTATUSFILTER'
AND FieldName = 'INTEG'
AND TableName = 'INTEG'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('INTEG', 'INTEG', 'FilterValues','checkbox', 'INTEGSTATUSFILTER' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ERRO
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'INTEGSTATUSFILTER'
AND FieldName = 'ERROR'
AND TableName = 'ERROR'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ERROR', 'ERROR', 'FilterValues','checkbox', 'INTEGSTATUSFILTER' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- CANCELADO
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'INTEGSTATUSFILTER'
AND FieldName = 'CANCELED'
AND TableName = 'CANCELED'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CANCELED', 'CANCELED', 'FilterValues','checkbox', 'INTEGSTATUSFILTER' , 1, 'false',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- DETALHES DE FILTRO ABA SECUNDÁRIA
-- FILTRO DE STATUS DE INTEGRAÇÃO --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'PRODUCTTAB'
AND FieldName = 'INTEGSTATUSFILTER'
AND TableName = 'INTEGSTATUSFILTER'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('INTEGSTATUSFILTER', 'INTEGSTATUSFILTER', 'FilterOptions','checkbox', 'PRODUCTTAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTROS DESABILITADOS NA PRIMEIRA ABA
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterTreeView'
	AND GroupName = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0114', 'MainFilterTreeView', 'MainFilterTreeView', 'TABLETAB', 0, '', 1, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = 
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterProductType'
	AND GroupName = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0114', 'MainFilterProductType', 'MainFilterProductType', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = 
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterProductFamily'
	AND GroupName = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0114', 'MainFilterProductFamily', 'MainFilterProductFamily', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = 
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterShift'
	AND GroupName = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0114', 'MainFilterShift', 'MainFilterShift', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = 
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterShiftTeam'
	AND GroupName = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0114', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = 
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTROS DESABILITADOS NA SEGUNDA ABA
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterTreeView'
	AND GroupName = 'PRODUCTTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0114', 'MainFilterTreeView', 'MainFilterTreeView', 'PRODUCTTAB', 0, '', 1, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = 
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterProductType'
	AND GroupName = 'PRODUCTTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0114', 'MainFilterProductType', 'MainFilterProductType', 'PRODUCTTAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = 
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterProductFamily'
	AND GroupName = 'PRODUCTTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0114', 'MainFilterProductFamily', 'MainFilterProductFamily', 'PRODUCTTAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = 
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterShift'
	AND GroupName = 'PRODUCTTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0114', 'MainFilterShift', 'MainFilterShift', 'PRODUCTTAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = 
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterShiftTeam'
	AND GroupName = 'PRODUCTTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0114', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'PRODUCTTAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114' AND IDAplication = 
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO