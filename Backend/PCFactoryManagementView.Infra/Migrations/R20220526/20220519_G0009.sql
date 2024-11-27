--FILTER --
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'STATUSSUMMARYCHARTTAB'
AND FieldName = 'statusClassification'
AND TableName = 'registerStsClass'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('registerStsClass', 'statusClassification', 'FilterOptions','checkbox', 'STATUSSUMMARYCHARTTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--FILTER --
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'statusClassification'
AND TableName = 'registerStsClass'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('registerStsClass', 'statusClassification', 'FilterOptions','checkbox', 'TABLETAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0009 RADIO Hierarchy - Plant
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registerStsClass'
AND FieldName = 'production'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('production', 'production', 'FilterValues','checkbox', 'registerStsClass' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registerStsClass'
AND FieldName = 'unplannedstop'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('unplannedstop', 'unplannedstop', 'FilterValues','checkbox', 'registerStsClass' , 1, 'false',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registerStsClass'
AND FieldName = 'plannedstop2'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('plannedstop2', 'plannedstop2', 'FilterValues','checkbox', 'registerStsClass' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registerStsClass'
AND FieldName = 'plannedstop1'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('plannedstop1', 'plannedstop1', 'FilterValues','checkbox', 'registerStsClass' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registerStsClass'
AND FieldName = 'timeoffshift'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('timeoffshift', 'timeoffshift', 'FilterValues','checkbox', 'registerStsClass' , 1, 'false',0,6,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registerStsClass'
AND FieldName = 'allstatus'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('allstatus', 'allstatus', 'FilterValues','checkbox', 'registerStsClass' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'STATUSSUMMARYCHARTTAB'
AND FieldName = 'prodType'
AND TableName = 'registersType'
AND FieldType = 'checkbox')
BEGIN
Delete From TBLScreenFields 
where IDScreenFields = (
	SELECT IDScreenFields 
	FROM TBLScreenFields 
	WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'STATUSSUMMARYCHARTTAB'
	AND FieldName = 'prodType'
	AND TableName = 'registersType'
	AND FieldType = 'checkbox'
)
END
GO

IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersType'
AND FieldName = 'productionstatus'
AND FieldType = 'checkbox')
BEGIN
Delete From TBLScreenFields 
where IDScreenFields =
(
	SELECT IDScreenFields 
	FROM TBLScreenFields 
	WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'registersType'
	AND FieldName = 'productionstatus'
	AND FieldType = 'checkbox'
)
END
GO