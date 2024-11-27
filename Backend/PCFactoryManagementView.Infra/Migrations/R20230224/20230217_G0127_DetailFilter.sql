
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'CONTSTATUS'
	AND TableName = 'CONTSTATUS'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('CONTSTATUS', 'CONTSTATUS', 'FilterOptions','checkbox', 'TABLETAB', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CONTSTATUS'
	AND FieldName = 'ALL'
	AND TableName = 'ALL'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ALL', 'ALL', 'FilterValues','checkbox', 'CONTSTATUS', 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CONTSTATUS'
	AND FieldName = 'AVAILABLE'
	AND TableName = 'AVAILABLE'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('AVAILABLE', 'AVAILABLE', 'FilterValues','checkbox', 'CONTSTATUS', 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CONTSTATUS'
	AND FieldName = 'RESERVED'
	AND TableName = 'RESERVED'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('RESERVED', 'RESERVED', 'FilterValues','checkbox', 'CONTSTATUS', 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CONTSTATUS'
	AND FieldName = 'INSUPPLY'
	AND TableName = 'INSUPPLY'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('INSUPPLY', 'INSUPPLY', 'FilterValues','checkbox', 'CONTSTATUS', 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CONTSTATUS'
	AND FieldName = 'UNLOADING'
	AND TableName = 'UNLOADING'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('UNLOADING', 'UNLOADING', 'FilterValues','checkbox', 'CONTSTATUS', 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CONTSTATUS'
	AND FieldName = 'INPROCESS'
	AND TableName = 'INPROCESS'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('INPROCESS', 'INPROCESS', 'FilterValues','checkbox', 'CONTSTATUS', 1, '',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CONTSTATUS'
	AND FieldName = 'FULL'
	AND TableName = 'FULL'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('FULL', 'FULL', 'FilterValues','checkbox', 'CONTSTATUS', 1, '',0,6,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CONTSTATUS'
	AND FieldName = 'BLOCKED'
	AND TableName = 'BLOCKED'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('BLOCKED', 'BLOCKED', 'FilterValues','checkbox', 'CONTSTATUS', 1, '',0,7,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CONTSTATUS'
	AND FieldName = 'ONCARRIAGE'
	AND TableName = 'ONCARRIAGE'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ONCARRIAGE', 'ONCARRIAGE', 'FilterValues','checkbox', 'CONTSTATUS', 1, '',0,8,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'CONTSTATUS'
	AND FieldName = 'DISCARDED'
	AND TableName = 'DISCARDED'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('DISCARDED', 'DISCARDED', 'FilterValues','checkbox', 'CONTSTATUS', 1, '',0,9,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO