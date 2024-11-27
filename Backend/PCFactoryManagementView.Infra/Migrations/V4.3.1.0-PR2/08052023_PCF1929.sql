
IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam'
AND GroupName = 'RESTAB'
AND FieldName = 'MainFilterShiftTeam'
AND TableName = 'G0105')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0105', 'MainFilterShiftTeam', 'MainFilterShiftTeam', NULL, 'RESTAB' , 0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam'
AND GroupName = 'VERSATILITYTAB'
AND FieldName = 'MainFilterShiftTeam'
AND TableName = 'G0105')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0105', 'MainFilterShiftTeam', 'MainFilterShiftTeam', NULL, 'VERSATILITYTAB' , 0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam'
AND GroupName = 'TRAININGTAB'
AND FieldName = 'MainFilterShiftTeam'
AND TableName = 'G0105')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0105', 'MainFilterShiftTeam', 'MainFilterShiftTeam', NULL, 'TRAININGTAB' , 0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
