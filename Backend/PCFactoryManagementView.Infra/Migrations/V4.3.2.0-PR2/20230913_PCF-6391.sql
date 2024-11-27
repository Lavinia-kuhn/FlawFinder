-- Ajuste de filtro para o Relatório G0019 --
-- Filtro Codigo da Operação --

-- Adição do campo nas tabelas --

-- Ocorrências Refugo
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'SCRAPTAB'
AND FieldName = 'CodeOperation'
AND TableName = 'CodeOperation'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'SCRAPTAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO

-- Ocorrências Retrabalho
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'REWORKTAB'
AND FieldName = 'CodeOperation'
AND TableName = 'CodeOperation'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'REWORKTAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO

-- Tabela
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'CodeOperation'
AND TableName = 'CodeOperation'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO

-- Pareto Refugo
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'PARETOTAB'
AND FieldName = 'CodeOperation'
AND TableName = 'CodeOperation'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'PARETOTAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO


-- Pareto Retrabalho
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'REWORKPARETOTAB'
AND FieldName = 'CodeOperation'
AND TableName = 'CodeOperation'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'REWORKPARETOTAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO


-- Pareto Ref. Produto
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'PRODUCTPARETOTAB'
AND FieldName = 'CodeOperation'
AND TableName = 'CodeOperation'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'PRODUCTPARETOTAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO

-- Adição do valor --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'CodeOperation'
AND FieldName = 'OperationCode'
AND TableName = 'OperationCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OperationCode', 'OperationCode', 'FilterValues','text',
'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO

-- Filtro de Ordem --

-- Adição do campo nas tabelas --

-- Ocorrências Refugo
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'SCRAPTAB'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'SCRAPTAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO

-- Ocorrências Retrabalho
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'REWORKTAB'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'REWORKTAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO

-- Tabela
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'TABLETAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO

-- Pareto Refugo
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'PARETOTAB'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'PARETOTAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO


-- Pareto Retrabalho
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'REWORKPARETOTAB'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'REWORKPARETOTAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO


-- Pareto Ref. Produto
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'PRODUCTPARETOTAB'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'PRODUCTPARETOTAB'
, 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO

-- Adição do valor --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'OPCode'
AND FieldName = 'CodeWOHD'
AND TableName = 'CodeWOHD'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType,
GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeWOHD', 'CodeWOHD', 'FilterValues','text',
'OPCode' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code =
'PCF4View')))
END
GO

-- Liberar campos de filtro --

-- Produto
IF EXISTS(
SELECT
*
FROM TBLScreenFields
WHERE IDScreen = (
SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019'
) AND GroupName = 'PRODUCTPARETOTAB' AND FieldName =
'MainFilterProduct'
AND Hidden = 0
AND Enabled = 0
)
BEGIN
UPDATE TBLScreenFields SET Hidden = 1, Enabled = 1
WHERE IDScreenFields = (
SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen
= (
SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019'
) AND GroupName = 'PRODUCTPARETOTAB' AND FieldName =
'MainFilterProduct'
)
END

-- Produto Familia
IF EXISTS(
SELECT
*
FROM TBLScreenFields
WHERE IDScreen = (
SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019'
) AND GroupName = 'PRODUCTPARETOTAB' AND FieldName =
'MainFilterProductFamily'
AND Hidden = 0
AND Enabled = 0
)
BEGIN
UPDATE TBLScreenFields SET Hidden = 1, Enabled = 1
WHERE IDScreenFields = (
SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen
= (
SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019'
) AND GroupName = 'PRODUCTPARETOTAB' AND FieldName =
'MainFilterProductFamily'
)
END

-- Produto Tipo
IF EXISTS(
SELECT
*
FROM TBLScreenFields
WHERE IDScreen = (
SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019'
) AND GroupName = 'PRODUCTPARETOTAB' AND FieldName =
'MainFilterProductType'
AND Hidden = 0
AND Enabled = 0
)
BEGIN
UPDATE TBLScreenFields SET Hidden = 1, Enabled = 1
WHERE IDScreenFields = (
SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen
= (
SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019'
) AND GroupName = 'PRODUCTPARETOTAB' AND FieldName =
'MainFilterProductType'
)
END