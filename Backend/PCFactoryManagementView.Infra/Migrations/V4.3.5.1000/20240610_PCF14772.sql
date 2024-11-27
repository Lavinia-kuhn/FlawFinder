
-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0XXX–Report Name

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
    INSERT INTO TBLScreen (Code, Name, NameEN, FlgProduct, IDAplication, DtCreation, ContextPrint)
	VALUES ('G0047', 'G0047–Causa Raiz', 'G0047–Root Cause', 1, (
		SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
	), GETDATE(), 0)
END
GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0XXX–Report Name
IF NOT EXISTS (
	SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND Operation = 'SIM'
)
BEGIN
	INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
	VALUES ((
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047'AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	), 'SIM', 'SIM', GETDATE())
END
GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0XXX–Report Name

IF NOT EXISTS (
	SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (
		SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (
			SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
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
			SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
				SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
			)
		)
	), (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'), GETDATE())
END
GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU
-- --------------------------------------------------------------------------------------
--TELA G0XXX–Report Name

IF NOT EXISTS (
	SELECT * FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0047' AND IDSuperiorScreenMenu = (
		SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
	)
)
BEGIN
	INSERT INTO TBLScreenMenus (Code, IDSuperiorScreenMenu, MenuOrder, FlgEnable, ShortCut, IDScreen, Link)
	VALUES ('VIEW_MENU_G0047', (
		SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
	), 
	(
		SELECT TOP 1 (MenuOrder + 1) FROM TBLScreenMenus WHERE IDSuperiorScreenMenu = (
			SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
		) AND Code LIKE 'VIEW_MENU_G0%' GROUP BY MenuOrder ORDER BY MenuOrder DESC
	), 1, 'G0047', 
	(
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	), '/report/oee/G0047')
END
GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0XXX
IF NOT EXISTS (
	SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0047' AND IDApplication = (
		SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
	) AND IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
)
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
	VALUES ('G0047-Causa Raíz', 'G0047-Root Cause', 'G0047-Causa Primordial', 1, 1, 'VIEW_MENU_G0047', (
		SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
	), (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
				SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0XXX

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0047', 'ReportTab', 'ReportTab', 'REPORT', 1, 'TABLETAB', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportChart' AND DefaultValue = 'G0047/v1/Table'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0047', 'table', 'ReportChart', 'TABLETAB', 1, 'G0047/v1/Table', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

-- DETALHES DE FILTRO
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'FilterOptions' 
	AND GroupName = 'TABLETAB' 
	AND FieldName = 'OPCode'
	AND TableName = 'OPCode'
	AND FieldType = 'text'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('OPCode', 'OPCode', 'FilterOptions', 'text', 'TABLETAB' , 1, '', 0, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'FilterValues'
	AND GroupName = 'OPCode'
	AND FieldName = 'CodeOP'
	AND TableName = 'CodeOP'
	AND FieldType = 'text'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('CodeOP', 'CodeOP', 'FilterValues', 'text', 'OPCode', 1, '', 0, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - PRODUCT
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterProduct'
	AND GroupName = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0047', 'MainFilterProduct', 'MainFilterProduct', 'TABLETAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - PRODUCTTYPE
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterProductType'
	AND GroupName = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0047', 'MainFilterProductType', 'MainFilterProductType', 'TABLETAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - PRODUCTFAMILY
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterProductFamily'
	AND GroupName = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0047', 'MainFilterProductFamily', 'MainFilterProductFamily', 'TABLETAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - SHIFT
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterShift'
	AND GroupName = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0047', 'MainFilterShift', 'MainFilterShift', 'TABLETAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

-- FILTROS - SHIFTTEAM
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterShiftTeam'
	AND GroupName = 'TABLETAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0047', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'TABLETAB', 0, '', 1, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0047' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO