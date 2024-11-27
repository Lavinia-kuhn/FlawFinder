-- FILTRO DE HIERARQUIA --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'SCRAPTAB'
AND FieldName = 'HIERARCHY'
AND TableName = 'HIERARCHY'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('HIERARCHY', 'HIERARCHY', 'FilterOptions','radio', 'SCRAPTAB' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--RECURSO
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'HIERARCHY'
AND FieldName = 'RESOURCE'
AND TableName = 'RESOURCE'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('RESOURCE', 'RESOURCE', 'FilterValues','radio', 'HIERARCHY' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--GRUPO GERENCIAL
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'HIERARCHY'
AND FieldName = 'MANAGERGRP'
AND TableName = 'MANAGERGRP'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('MANAGERGRP', 'MANAGERGRP', 'FilterValues','radio', 'HIERARCHY' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--SETOR
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'HIERARCHY'
AND FieldName = 'SECTOR'
AND TableName = 'SECTOR'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('SECTOR', 'SECTOR', 'FilterValues','radio', 'HIERARCHY' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--AREA
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'HIERARCHY'
AND FieldName = 'AREA'
AND TableName = 'AREA'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('AREA', 'AREA', 'FilterValues','radio', 'HIERARCHY' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--PLANT
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'HIERARCHY'
AND FieldName = 'PLANT'
AND TableName = 'PLANT'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('PLANT', 'PLANT', 'FilterValues','radio', 'HIERARCHY' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTRO DE TEMPOS --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'SCRAPTAB'
AND FieldName = 'TIMEFILTER'
AND TableName = 'TIMEFILTER'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('TIMEFILTER', 'TIMEFILTER', 'FilterOptions','radio', 'SCRAPTAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--PERIODO
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TIMEFILTER'
AND FieldName = 'PERIOD'
AND TableName = 'PERIOD'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('PERIOD', 'PERIOD', 'FilterValues','radio', 'TIMEFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--SEMANAL
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TIMEFILTER'
AND FieldName = 'WEEKLY'
AND TableName = 'WEEKLY'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('WEEKLY', 'WEEKLY', 'FilterValues','radio', 'TIMEFILTER' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--MENSAL
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TIMEFILTER'
AND FieldName = 'MONTHLY'
AND TableName = 'MONTHLY'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('MONTHLY', 'MONTHLY', 'FilterValues','radio', 'TIMEFILTER' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--TRIMESTRAL
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TIMEFILTER'
AND FieldName = 'QUARTERLY'
AND TableName = 'QUARTERLY'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('QUARTERLY', 'QUARTERLY', 'FilterValues','radio', 'TIMEFILTER' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

Update TBLScreenFields set DefaultValue = 'G0001/v2/Indicators' where TableName = 'G0001' and FieldName = 'goalcolumns' and GroupName = 'SCRAPTAB'
