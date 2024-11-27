
	IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'HIDDENREPORT' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterDate'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'MainFilterDate'
	AND TableName = 'HIDDENREPORT')
	BEGIN 
		INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
		VALUES ('HIDDENREPORT', 'MainFilterDate', 'MainFilterDate', NULL, 'TABLETAB' , 0, '', 1, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'HIDDENREPORT' AND 
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO