IF EXISTS (SELECT IDScreen, Name from TBLScreen where Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication where code = 'PCF4VIEW'))
BEGIN
	UPDATE TBLScreen
	SET Name = 'G0011-Gerencial', NameEN = 'G0011-Management'
	where  Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication where code = 'PCF4VIEW')
END
GO


IF EXISTS (SELECT IDScreen from TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0011'
AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
UPDATE TBLLocalizations
SET 
	PTLocal = 'G0011-Gerencial', 
	ENLocal = 'G0011-Management', 
	ESLocal = 'G0011-Gestión'
WHERE TranslationKey = 'VIEW_MENU_G0011'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
END
GO

UPDATE TBLScreenFields 
	SET FieldName = 'managementchart' 
WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011') 
	AND GroupName = 'TABLETAB' 
		AND DefaultValue = 'G0011/v1/GetManagerTable'

-- FILTER --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'CodeUnit'
AND TableName = 'CodeUnit'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeUnit', 'CodeUnit', 'FilterOptions','radio', 'TABLETAB' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'CodeUnit'
AND FieldName = 'unit1Factor'
AND TableName = 'unit1Factor'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('unit1Factor', 'unit1Factor', 'FilterValues','radio', 'CodeUnit' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'CodeUnit'
AND FieldName = 'unit2Factor'
AND TableName = 'unit2Factor'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('unit2Factor', 'unit2Factor', 'FilterValues','radio', 'CodeUnit' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'CodeUnit'
AND FieldName = 'unit3Factor'
AND TableName = 'unit3Factor'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('unit3Factor', 'unit3Factor', 'FilterValues','radio', 'CodeUnit' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


