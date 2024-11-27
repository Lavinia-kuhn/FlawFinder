
	-- FILTER WOHD --
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'WOHDCode'
	AND TableName = 'WOHDCode'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('WOHDCode', 'WOHDCode', 'FilterOptions','text', 'TABLETAB' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'WOHDCode'
	AND FieldName = 'CodeWOHD'
	AND TableName = 'CodeWOHD'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CodeWOHD', 'CodeWOHD', 'FilterValues','text', 'WOHDCode' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'WOHDCode'
	AND FieldName = 'CodeWODET'
	AND TableName = 'CodeWODET'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CodeWODET', 'CodeWODET', 'FilterValues','text', 'WOHDCode' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	-- FILTER DIFF --
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'DIFFZERO'
	AND TableName = 'DIFFZERO'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('DIFFZERO', 'DIFFZERO', 'FilterOptions','checkbox', 'TABLETAB' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'DIFFZERO'
	AND FieldName = 'CHECKDIFF'
	AND TableName = 'CHECKDIFF'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CHECKDIFF', 'CHECKDIFF', 'FilterValues','checkbox', 'DIFFZERO' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
