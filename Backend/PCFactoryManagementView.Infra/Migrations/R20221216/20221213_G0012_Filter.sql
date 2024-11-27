
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'OPCode'
	AND FieldName = 'CodeWODET'
	AND TableName = 'CodeWODET'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CodeWODET', 'CodeWODET', 'FilterValues','text', 'OPCode' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'LOTDEST'
	AND TableName = 'LOTDEST'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('LOTDEST', 'LOTDEST', 'FilterOptions','text', 'TABLETAB' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'LOTDEST'
	AND FieldName = 'LOTTEXT'
	AND TableName = 'LOTTEXT'
	AND FieldType = 'text')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('LOTTEXT', 'LOTTEXT', 'FilterValues','text', 'LOTDEST' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'EMPENHO'
	AND TableName = 'EMPENHO'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('EMPENHO', 'EMPENHO', 'FilterOptions','radio', 'TABLETAB' , 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'EMPENHO'
	AND FieldName = 'EMPENHONO'
	AND TableName = 'EMPENHONO'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('EMPENHONO', 'EMPENHONO', 'FilterValues','radio', 'EMPENHO' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'EMPENHO'
	AND FieldName = 'EMPENHOYES'
	AND TableName = 'EMPENHOYES'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('EMPENHOYES', 'EMPENHOYES', 'FilterValues','radio', 'EMPENHO' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'EMPENHO'
	AND FieldName = 'EMPENHOALL'
	AND TableName = 'EMPENHOALL'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('EMPENHOALL', 'EMPENHOALL', 'FilterValues','radio', 'EMPENHO' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO