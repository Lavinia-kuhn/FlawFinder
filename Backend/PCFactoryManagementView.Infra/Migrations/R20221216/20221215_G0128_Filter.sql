
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'SELECTION'
	AND TableName = 'SELECTION'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('SELECTION', 'SELECTION', 'FilterOptions','radio', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'SELECTION'
	AND FieldName = 'SELECTALL'
	AND TableName = 'SELECTALL'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('SELECTALL', 'SELECTALL', 'FilterValues','radio', 'SELECTION' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'SELECTION'
	AND FieldName = 'SELECTONE'
	AND TableName = 'SELECTONE'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('SELECTONE', 'SELECTONE', 'FilterValues','radio', 'SELECTION' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'SELECTION'
	AND FieldName = 'SELECTTWO'
	AND TableName = 'SELECTTWO'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('SELECTTWO', 'SELECTTWO', 'FilterValues','radio', 'SELECTION' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'SELECTION'
	AND FieldName = 'SELECTTHREE'
	AND TableName = 'SELECTTHREE'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('SELECTTHREE', 'SELECTTHREE', 'FilterValues','radio', 'SELECTION' , 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO