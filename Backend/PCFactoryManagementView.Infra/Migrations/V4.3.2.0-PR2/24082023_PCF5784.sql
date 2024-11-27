-- Filter Option da aba de Pareto Ref. Produto
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'PRODUCTPARETOTAB'
AND FieldName = 'ParetoContext'
AND TableName = 'ParetoContext'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ParetoContext', 'ParetoContext', 'FilterOptions','radio', 'PRODUCTPARETOTAB' , 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Filter Option da aba de Pareto Retrabalho
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'REWORKPARETOTAB'
AND FieldName = 'ParetoContext'
AND TableName = 'ParetoContext'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ParetoContext', 'ParetoContext', 'FilterOptions','radio', 'REWORKPARETOTAB' , 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Filter Option da aba de Pareto Refugo
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'PARETOTAB'
AND FieldName = 'ParetoContext'
AND TableName = 'ParetoContext'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ParetoContext', 'ParetoContext', 'FilterOptions','radio', 'PARETOTAB' , 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Quantidade
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'ParetoContext'
AND FieldName = 'quantity'
AND TableName = 'quantity'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('quantity', 'quantity', 'FilterValues','radio', 'ParetoContext' , 1, 'true',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Tempo
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'ParetoContext'
AND FieldName = 'time'
AND TableName = 'time'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('time', 'time', 'FilterValues','radio', 'ParetoContext' , 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO