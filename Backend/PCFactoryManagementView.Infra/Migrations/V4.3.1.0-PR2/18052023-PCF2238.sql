--SCRIPT PARA DESABILITAR 
--FILTRO RÁPIDO DE DATAS EM 
--TODOS OS RELATÓRIOS DE QUALIDADE
--EXCETO G0160


------------------- G0138 -------------------
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'TABLETAB'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0138'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0138', 'QuickFilterDate', 'QuickFilterDate','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

------------------- G0140 -------------------
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0140' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'TABLETAB'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0140'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0140', 'QuickFilterDate', 'QuickFilterDate','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0140' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

------------------- G0141 -------------------
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'TABLETAB'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0141'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0141', 'QuickFilterDate', 'QuickFilterDate','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

------------------- G0142 -------------------
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'TABLETAB'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0142'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0142', 'QuickFilterDate', 'QuickFilterDate','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

------------------- G0143 -------------------
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0143' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'TABLETAB'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0143'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0143', 'QuickFilterDate', 'QuickFilterDate','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0143' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

------------------- G0145 -------------------
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0145' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'TABLETAB'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0145'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0145', 'QuickFilterDate', 'QuickFilterDate','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0145' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

------------------- G0147 -------------------
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0147' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'TABLETAB'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0147'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0147', 'QuickFilterDate', 'QuickFilterDate','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0147' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

------------------- G0148 -------------------
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'TABLETAB'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0148'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0148', 'QuickFilterDate', 'QuickFilterDate','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'CHARTTABESTRAT'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0148'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0148', 'QuickFilterDate', 'QuickFilterDate','NULL', 'CHARTTABESTRAT' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'CHARTTABSALDO'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0148'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0148', 'QuickFilterDate', 'QuickFilterDate','NULL', 'CHARTTABSALDO' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

------------------- G0160 -------------------
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0160' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'QuickFilterDate'
AND GroupName = 'TABLETAB'
AND FieldName = 'QuickFilterDate'
AND TableName = 'G0160'
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0160', 'QuickFilterDate', 'QuickFilterDate','NULL', 'TABLETAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0160' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO