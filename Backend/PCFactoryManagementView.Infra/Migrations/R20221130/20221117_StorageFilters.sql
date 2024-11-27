-- Fila de Ordens --
--------------------------------------------------------------------------------
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'Tarefas de Armazenamento'
AND FieldName = 'STORAGESTATUS'
AND TableName = 'STORAGESTATUS'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('STORAGESTATUS', 'STORAGESTATUS', 'FilterOptions','checkbox', 'Tarefas de Armazenamento' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'STORAGESTATUS'
AND FieldName = 'StorageStatusAll'
AND TableName = 'StorageStatusAll'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('StorageStatusAll', 'StorageStatusAll', 'FilterValues','checkbox', 'STORAGESTATUS' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'STORAGESTATUS'
AND FieldName = 'StorageStatusInProgress'
AND TableName = 'StorageStatusInProgress'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('StorageStatusInProgress', 'StorageStatusInProgress', 'FilterValues','checkbox', 'STORAGESTATUS' , 1, 'true',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'STORAGESTATUS'
AND FieldName = 'StorageStatusPendency'
AND TableName = 'StorageStatusPendency'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('StorageStatusPendency', 'StorageStatusPendency', 'FilterValues','checkbox', 'STORAGESTATUS' , 1, 'true',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'STORAGESTATUS'
AND FieldName = 'StorageStatusQueue'
AND TableName = 'StorageStatusQueue'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('StorageStatusQueue', 'StorageStatusQueue', 'FilterValues','checkbox', 'STORAGESTATUS' , 1, 'true',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO