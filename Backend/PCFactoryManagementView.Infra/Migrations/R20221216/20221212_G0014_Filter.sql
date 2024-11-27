
	-- FILTER ORIGINWOHD - ORIGINWDT --
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'ORIGINWOHD'
	AND TableName = 'ORIGINWOHD'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ORIGINWOHD', 'ORIGINWOHD', 'FilterOptions','text', 'TABLETAB' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'ORIGINWOHD'
	AND FieldName = 'WOHDORIGIN'
	AND TableName = 'WOHDORIGIN'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('WOHDORIGIN', 'WOHDORIGIN', 'FilterValues','text', 'ORIGINWOHD' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'ORIGINWOHD'
	AND FieldName = 'WDTORIGIN'
	AND TableName = 'WDTORIGIN'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('WDTORIGIN', 'WDTORIGIN', 'FilterValues','text', 'ORIGINWOHD' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-- FILTER COMMITEDWOHD - WDTCOMMITED --
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'COMMITEDWOHD'
	AND TableName = 'COMMITEDWOHD'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('COMMITEDWOHD', 'COMMITEDWOHD', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'COMMITEDWOHD'
	AND FieldName = 'WOHDCOMMITED'
	AND TableName = 'WOHDCOMMITED'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('WOHDCOMMITED', 'WOHDCOMMITED', 'FilterValues','text', 'COMMITEDWOHD' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'ORIGINWOHD'
	AND FieldName = 'WDTCOMMITED'
	AND TableName = 'WDTCOMMITED'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('WDTCOMMITED', 'WDTCOMMITED', 'FilterValues','text', 'COMMITEDWOHD' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-- FILTER INPROGRESSWOHD - WDTINPROGRESS --
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'INPROGRESSWOHD'
	AND TableName = 'INPROGRESSWOHD'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('INPROGRESSWOHD', 'INPROGRESSWOHD', 'FilterOptions','text', 'TABLETAB' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'INPROGRESSWOHD'
	AND FieldName = 'WOHDINPROGRESS'
	AND TableName = 'WOHDINPROGRESS'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('WOHDINPROGRESS', 'WOHDINPROGRESS', 'FilterValues','text', 'INPROGRESSWOHD' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'ORIGINWOHD'
	AND FieldName = 'WDTINPROGRESS'
	AND TableName = 'WDTINPROGRESS'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('WDTINPROGRESS', 'WDTINPROGRESS', 'FilterValues','text', 'INPROGRESSWOHD' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-- FILTER STSQUALITY --
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'STSQUALITY'
	AND TableName = 'STSQUALITY'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('STSQUALITY', 'STSQUALITY', 'FilterOptions','text', 'TABLETAB' , 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'STSQUALITY'
	AND FieldName = 'QUALITYSTS'
	AND TableName = 'QUALITYSTS'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('QUALITYSTS', 'QUALITYSTS', 'FilterValues','text', 'STSQUALITY' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-- FILTER PRINTED --
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'PRINTED'
	AND TableName = 'PRINTED'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('PRINTED', 'PRINTED', 'FilterOptions','radio', 'TABLETAB' , 1, '',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'PRINTED'
	AND FieldName = 'PRINTALL'
	AND TableName = 'PRINTALL'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('PRINTALL', 'PRINTALL', 'FilterValues','radio', 'PRINTED' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'PRINTED'
	AND FieldName = 'PRINTYES'
	AND TableName = 'PRINTYES'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('PRINTYES', 'PRINTYES', 'FilterValues','radio', 'PRINTED' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'PRINTED'
	AND FieldName = 'PRINTNO'
	AND TableName = 'PRINTNO'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('PRINTNO', 'PRINTNO', 'FilterValues','radio', 'PRINTED' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	-- FILTER COMMITED --
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'COMMITED'
	AND TableName = 'COMMITED'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('COMMITED', 'COMMITED', 'FilterOptions','radio', 'TABLETAB' , 1, '',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'COMMITED'
	AND FieldName = 'COMMITEDALL'
	AND TableName = 'COMMITEDALL'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('COMMITEDALL', 'COMMITEDALL', 'FilterValues','radio', 'COMMITED' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'COMMITED'
	AND FieldName = 'COMMITEDYES'
	AND TableName = 'COMMITEDYES'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('COMMITEDYES', 'COMMITEDYES', 'FilterValues','radio', 'COMMITED' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'COMMITED'
	AND FieldName = 'COMMITEDNO'
	AND TableName = 'COMMITEDNO'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('COMMITEDNO', 'COMMITEDNO', 'FilterValues','radio', 'COMMITED' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
