-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0115–Report Name

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
    INSERT INTO TBLScreen (Code, Name, NameEN, FlgProduct, IDAplication, DtCreation, ContextPrint)
	VALUES ('G0115', 'G0115–Configuração de integração', 'G0115–Integration Configuration', 1, (
		SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
	), GETDATE(), 0)
END
GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0115–Report Name
IF NOT EXISTS (
	SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND Operation = 'SIM'
)
BEGIN
	INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
	VALUES ((
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115'AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	), 'SIM', 'SIM', GETDATE())
END
GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0115–Report Name

IF NOT EXISTS (
	SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (
		SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (
			SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
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
			SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
				SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
			)
		)
	), (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'), GETDATE())
END
GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU
-- --------------------------------------------------------------------------------------
--TELA G0115–Report Name

IF NOT EXISTS (
	SELECT * FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0115' AND IDSuperiorScreenMenu = (
		SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
	)
)
BEGIN
	INSERT INTO TBLScreenMenus (Code, IDSuperiorScreenMenu, MenuOrder, FlgEnable, ShortCut, IDScreen, Link)
	VALUES ('VIEW_MENU_G0115', (
		SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
	), 
	(
		SELECT TOP 1 (MenuOrder + 1) FROM TBLScreenMenus WHERE IDSuperiorScreenMenu = (
			SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
		) AND Code LIKE 'VIEW_MENU_G0%' GROUP BY MenuOrder ORDER BY MenuOrder DESC
	), 1, 'G0115', 
	(
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	), '/report/integ/G0115')
END
GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0115
IF NOT EXISTS (
	SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0115' AND IDApplication = (
		SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
	) AND IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
)
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
	VALUES ('G0115-Configuração de Integração', 'G0115-Integration Configuration', 'G0115-Configuración de Integración', 1, 1, 'VIEW_MENU_G0115', (
		SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
	), (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
				SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA CONFIGURAÇÃO - G0115

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportTab' AND DefaultValue = 'CONFIGURATIONTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'ReportTab', 'ReportTab', 'REPORT', 1, 'CONFIGURATIONTAB', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportChart' AND DefaultValue = 'G0115/v1/Configuration'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'table', 'ReportChart', 'CONFIGURATIONTAB', 1, 'G0115/v1/Configuration', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

--ABA TOTVS - G0115

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportTab' AND DefaultValue = 'TOTVSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'ReportTab', 'ReportTab', 'REPORT', 0, 'TOTVSTAB', 0, 2, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportChart' AND DefaultValue = 'G0115/v1/Totvs'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'table', 'ReportChart', 'TOTVSTAB', 0, 'G0115/v1/Totvs', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

-- FIRST TAB
-- FILTROS - TREEVIEW
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterTreeView'
	AND GroupName = 'CONFIGURATIONTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterTreeView', 'MainFilterTreeView', 'CONFIGURATIONTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - DATE
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterDate'
	AND GroupName = 'CONFIGURATIONTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterDate', 'MainFilterDate', 'CONFIGURATIONTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - PRODUCT
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterProduct'
	AND GroupName = 'CONFIGURATIONTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterProduct', 'MainFilterProduct', 'CONFIGURATIONTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - PRODUCTTYPE
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterProductType'
	AND GroupName = 'CONFIGURATIONTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterProductType', 'MainFilterProductType', 'CONFIGURATIONTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - PRODUCTFAMILY
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterProductFamily'
	AND GroupName = 'CONFIGURATIONTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterProductFamily', 'MainFilterProductFamily', 'CONFIGURATIONTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - SHIFT
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterShift'
	AND GroupName = 'CONFIGURATIONTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterShift', 'MainFilterShift', 'CONFIGURATIONTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - SHIFTTEAM
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterShiftTeam'
	AND GroupName = 'CONFIGURATIONTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'CONFIGURATIONTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FIRST TAB
-- FILTROS - TREEVIEW
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterTreeView'
	AND GroupName = 'TOTVSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterTreeView', 'MainFilterTreeView', 'TOTVSTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - DATE
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterDate'
	AND GroupName = 'TOTVSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterDate', 'MainFilterDate', 'TOTVSTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - PRODUCT
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterProduct'
	AND GroupName = 'TOTVSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterProduct', 'MainFilterProduct', 'TOTVSTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - PRODUCTTYPE
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterProductType'
	AND GroupName = 'TOTVSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterProductType', 'MainFilterProductType', 'TOTVSTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - PRODUCTFAMILY
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterProductFamily'
	AND GroupName = 'TOTVSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterProductFamily', 'MainFilterProductFamily', 'TOTVSTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - SHIFT
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterShift'
	AND GroupName = 'TOTVSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterShift', 'MainFilterShift', 'TOTVSTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - SHIFTTEAM
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterShiftTeam'
	AND GroupName = 'TOTVSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0115', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'TOTVSTAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO