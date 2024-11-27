IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
            AND ComponentType = 'timelines'
                AND GroupName = 'DashboardCard'
                    AND FieldName = 'Linha do Tempo'
                        AND TableName = 'VIEWDASHBOARD')
BEGIN
    INSERT INTO TBLScreenFields (TableName, FieldName, GroupName, ComponentType, DefaultValue, [Hidden], FieldOrder, [Enabled], CustomField, Nullable, IsPk, IDScreen, FieldType)
    VALUES ('VIEWDASHBOARD', 'Linha do Tempo', 'DashboardCard', 'timelines', 'G0005/v1/GetDashResourcesByFilter', 0, 0, 1, 0, 0, 0,
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '')
END
GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = 
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
            AND [NAME] = 'Linha do Tempo' 
            AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
INSERT INTO TBLPrefs 
(IDUser, IDScreen, [Name], [Preference]) 
VALUES 
((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
'Linha do Tempo', 
'{"GridsterConfig":{"Visible":false,"Cols":1,"Rows":1,"IdCard":0,"Widget":"timelines","Height":0.0,"Width":0.0,"ChartUrl":"G0005/v1/GetDashResourcesByFilter","X":0,"Y":0,"idLastEditUser":1,"idPref":0,"idPrefOrigin":0,"isPrefCard":false,"pillar":null},"filter":[],"PrefsGrid":null}')
END
GO


-- FILTER --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'Linha do Tempo'
AND FieldName = 'OPCode'
AND TableName = 'OPCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OPCode', 'OPCode', 'FilterOptions','text', 'Linha do Tempo' , 1, '',0,1,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'OPCode'
AND FieldName = 'CodeWODET'
AND TableName = 'CodeWODET'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeWODET', 'CodeWODET', 'FilterValues','text', 'OPCode' , 1, '',0,1,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
-- CRIA UM DETAIL FILTER PARA FILTRAR POR LTIMA OPERAO PARA CADA ORDEM --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'Linha do Tempo'
AND FieldName = 'Events'
AND TableName = 'Events'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('Events', 'Events', 'FilterOptions','checkbox', 'Linha do Tempo' , 1, '',0,1,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'AllEvents'
AND TableName = 'AllEvents'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('AllEvents', 'AllEvents', 'FilterValues','checkbox', 'Events' , 1, 'true',0,0,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'ShiftChange'
AND TableName = 'ShiftChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ShiftChange', 'ShiftChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,1,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'WoChange'
AND TableName = 'WoChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('WoChange', 'WoChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,2,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'OperChange'
AND TableName = 'OperChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('OperChange', 'OperChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,3,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'RsChange'
AND TableName = 'RsChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('RsChange', 'RsChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,4,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'GpChange'
AND TableName = 'GpChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('GpChange', 'GpChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,5,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'RwChange'
AND TableName = 'RwChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('RwChange', 'RwChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,6,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'ScChange'
AND TableName = 'ScChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ScChange', 'ScChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,7,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen = (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Events'
AND FieldName = 'InspChange'
AND TableName = 'InspChange'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('InspChange', 'InspChange', 'FilterValues','checkbox', 'Events' , 1, 'true',0,8,'', (Select TOP 1 IDScreen from TBLScreen where Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO