----------- Inventory Code ---------------


---- G0125 -----
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'CodeInventory'
AND TableName = 'CodeInventory'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeInventory', 'CodeInventory', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'CodeInventory'
AND FieldName = 'InventoryCode'
AND TableName = 'InventoryCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('InventoryCode', 'InventoryCode', 'FilterValues','text', 'CodeInventory' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

---- G0126 -----
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0126' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'CodeInventory'
AND TableName = 'CodeInventory'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeInventory', 'CodeInventory', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0126' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0126' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'CodeInventory'
AND FieldName = 'InventoryCode'
AND TableName = 'InventoryCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('InventoryCode', 'InventoryCode', 'FilterValues','text', 'CodeInventory' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0126' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


---- G0128 -----
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'CodeInventory'
AND TableName = 'CodeInventory'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeInventory', 'CodeInventory', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'CodeInventory'
AND FieldName = 'InventoryCode'
AND TableName = 'InventoryCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('InventoryCode', 'InventoryCode', 'FilterValues','text', 'CodeInventory' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO