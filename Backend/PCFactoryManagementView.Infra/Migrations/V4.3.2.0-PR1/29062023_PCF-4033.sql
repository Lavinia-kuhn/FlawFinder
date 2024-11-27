IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
            AND ComponentType = 'temporalline'
                AND GroupName = 'DashboardCard'
                    AND FieldName = 'OEE Sumarizado'
                        AND TableName = 'VIEWDASHBOARD')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName, [Hidden], DefaultValue, FieldOrder, [Enabled], CustomField, GroupName, ComponentType, Nullable, IsPk, IDScreen, ScreenFormat) 
VALUES ('VIEWDASHBOARD', 'OEE Sumarizado', 0, 'G0001/v1/TemporalOeeDashboard', 1, 1, 0, 'DashboardCard', 'temporalline',    0,    0, 
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '4' )
END
GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = 
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
            AND [NAME] = 'OEE Sumarizado' 
            AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
INSERT INTO TBLPrefs 
(IDUser,IDScreen, [Name], [Preference]) 
VALUES 
((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
'OEE Sumarizado', 
'{
"visible": true,
"size": 8,
"position": 0
}')
END
GO

-- FILTRO DE TEMPOS --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'OEE Sumarizado'
AND FieldName = 'LINETIMEFILTER'
AND TableName = 'LINETIMEFILTER'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('LINETIMEFILTER', 'LINETIMEFILTER', 'FilterOptions','radio', 'OEE Sumarizado' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--PERIODO
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'LINETIMEFILTER'
AND FieldName = 'PERIOD'
AND TableName = 'PERIOD'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('PERIOD', 'PERIOD', 'FilterValues','radio', 'LINETIMEFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--DIARIO
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'LINETIMEFILTER'
AND FieldName = 'DAILY'
AND TableName = 'DAILY'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('DAILY', 'DAILY', 'FilterValues','radio', 'LINETIMEFILTER' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--SEMANAL
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'LINETIMEFILTER'
AND FieldName = 'WEEKLY'
AND TableName = 'WEEKLY'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('WEEKLY', 'WEEKLY', 'FilterValues','radio', 'LINETIMEFILTER' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--MENSAL
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'LINETIMEFILTER'
AND FieldName = 'MONTHLY'
AND TableName = 'MONTHLY'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('MONTHLY', 'MONTHLY', 'FilterValues','radio', 'LINETIMEFILTER' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--TRIMESTRAL
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'LINETIMEFILTER'
AND FieldName = 'QUARTERLY'
AND TableName = 'QUARTERLY'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('QUARTERLY', 'QUARTERLY', 'FilterValues','radio', 'LINETIMEFILTER' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO