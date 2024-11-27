-- FILTER --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0004' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABELA'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'TABELA' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0004' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0004' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'OPCode'
AND FieldName = 'CodeWODET'
AND TableName = 'CodeWODET'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeWODET', 'CodeWODET', 'FilterValues','text', 'OPCode' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0004' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

