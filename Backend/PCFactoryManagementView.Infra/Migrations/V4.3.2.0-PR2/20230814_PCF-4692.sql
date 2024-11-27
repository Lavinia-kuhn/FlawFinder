-- Hora a hora
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'LINETIMEFILTER'
AND FieldName = 'HOURLY'
AND TableName = 'HOURLY'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('HOURLY', 'HOURLY', 'FilterValues','radio', 'LINETIMEFILTER' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- AQUI É A CRIAÇÃO DO FILTRO PARA O CARD NO DASHBOARD
-- Criação do filter option do acumulado (sendo um switch no frontend)
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'OEE Sumarizado'
AND FieldName = 'ACCUMULATEDOPTION'
AND TableName = 'ACCUMULATEDOPTION'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ACCUMULATEDOPTION', 'ACCUMULATEDOPTION', 'FilterOptions','checkbox', 'OEE Sumarizado' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Filter value acumulado
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'ACCUMULATEDOPTION'
AND FieldName = 'ACCUMULATED'
AND TableName = 'ACCUMULATED'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields
(TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ACCUMULATED', 'ACCUMULATED', 'FilterValues','checkbox', 'ACCUMULATEDOPTION' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- AQUI É A CRIAÇÃO DO FILTRO PARA O RELATÓRIO G0001 - SUMARIZADO
-- Criação do filter option do acumulado (sendo um switch no frontend)
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'LINETAB'
AND FieldName = 'ACCUMULATEDOPTION'
AND TableName = 'ACCUMULATEDOPTION'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ACCUMULATEDOPTION', 'ACCUMULATEDOPTION', 'FilterOptions','checkbox', 'LINETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Filter value acumulado
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'ACCUMULATEDOPTION'
AND FieldName = 'ACCUMULATED'
AND TableName = 'ACCUMULATED'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields
(TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ACCUMULATED', 'ACCUMULATED', 'FilterValues','checkbox', 'ACCUMULATEDOPTION' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO