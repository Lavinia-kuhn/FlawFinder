-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0XXX

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportTab' AND DefaultValue = 'GROUPEDSTATUSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0009', 'ReportTab', 'ReportTab', 'REPORT', 1, 'GROUPEDSTATUSTAB', 0, 3, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

IF NOT EXISTS (
	SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) AND ComponentType = 'ReportChart' AND DefaultValue = 'G0009/v1/GroupedStatus'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0009', 'stackedcolumn', 'ReportChart', 'GROUPEDSTATUSTAB', 1, 'G0009/v1/GroupedStatus', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		))
	)
END
GO

-- DETALHES DE FILTROS
-- COD. ORDEM

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'FilterOptions' 
	AND GroupName = 'GROUPEDSTATUSTAB' 
	AND FieldName = 'OPCode'
	AND TableName = 'OPCode'
	AND FieldType = 'text'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('OPCode', 'OPCode', 'FilterOptions', 'text', 'GROUPEDSTATUSTAB' , 1, '', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
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
	VALUES ('CodeOP', 'CodeOP', 'FilterValues', 'text', 'OPCode', 1, '', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

------------------------------
-- COD. OPERACAO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'FilterOptions' 
	AND GroupName = 'GROUPEDSTATUSTAB' 
	AND FieldName = 'CodeOperation'
	AND TableName = 'CodeOperation'
	AND FieldType = 'text'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions', 'text', 'GROUPEDSTATUSTAB' , 1, '', 0, 2, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CodeOperation'
	AND FieldName = 'OperationCode'
	AND TableName = 'OperationCode'
	AND FieldType = 'text'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('OperationCode', 'OperationCode', 'FilterValues', 'text', 'CodeOperation', 1, '', 0, 1, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

------------------------------
-- FILTROS
-- PRODUCT
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterProduct'
	AND GroupName = 'GROUPEDSTATUSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0009', 'MainFilterProduct', 'MainFilterProduct', 'GROUPEDSTATUSTAB', 0, '', 0, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

------------------------------
-- PRODUCTTYPE
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	) 
	AND ComponentType = 'MainFilterProductType'
	AND GroupName = 'GROUPEDSTATUSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0009', 'MainFilterProductType', 'MainFilterProductType', 'GROUPEDSTATUSTAB', 0, '', 0, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO

------------------------------
-- PRODUCTFAMILY
IF NOT EXISTS (
	SELECT * FROM TBLScreenFields WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	)
	AND ComponentType = 'MainFilterProductFamily'
	AND GroupName = 'GROUPEDSTATUSTAB'
)
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0009', 'MainFilterProductFamily', 'MainFilterProductFamily', 'GROUPEDSTATUSTAB', 0, '', 0, 0, '', (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (
			SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'
		)
	))
END
GO