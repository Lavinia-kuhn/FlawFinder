IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0003' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterShiftTeam'
AND TableName = 'G0003')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0003', 'MainFilterShiftTeam', 'MainFilterShiftTeam', NULL, 'TABLETAB' , 0, '', 1, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0003' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields, * FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0003' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterShift'
AND TableName = 'G0003')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField, IdScreen)
	VALUES ('G0003', 'MainFilterShift', 'MainFilterShift', NULL, 'TABLETAB' , 0, '', 1, 0, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0003' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF (SELECT FlgEnable FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0003' AND ShortCut = 'G0003' GROUP BY FlgEnable) <> 1
BEGIN
	UPDATE TBLScreenMenus SET FlgEnable = 1 WHERE Code = 'VIEW_MENU_G0003'
END
GO