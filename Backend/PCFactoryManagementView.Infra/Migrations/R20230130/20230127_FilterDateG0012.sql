-- FILTER --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'DateFilter'
AND TableName = 'DateFilter'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('DateFilter', 'DateFilter', 'FilterOptions','radio', 'TABLETAB' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'DateFilter'
AND FieldName = 'byDtMov'
AND TableName = 'byDtMov'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('byDtMov', 'byDtMov', 'FilterValues','radio', 'DateFilter' , 1, 'true',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'DateFilter'
AND FieldName = 'byTimestamp'
AND TableName = 'byTimestamp'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('byTimestamp', 'byTimestamp', 'FilterValues','radio', 'DateFilter' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


