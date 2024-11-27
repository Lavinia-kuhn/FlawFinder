IF EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProduct'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterProduct'
AND TableName = 'G0018')
BEGIN
DELETE FROM TBLScreenFields WHERE IDScreenFields = (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProduct'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterProduct'
AND TableName = 'G0018')
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProduct'
AND GroupName = 'TABLETAB'
AND FieldName = 'MainFilterProduct'
AND TableName = 'G0018')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0018', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO