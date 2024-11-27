
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'AUTALARM'
	AND TableName = 'AUTALARM'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('AUTALARM', 'AUTALARM', 'FilterOptions','checkbox', 'TABLETAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'AUTALARM'
	AND FieldName = 'ALARMAUT'
	AND TableName = 'ALARMAUT'
	AND FieldType = 'checkbox')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ALARMAUT', 'ALARMAUT', 'FilterValues','checkbox', 'AUTALARM' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO