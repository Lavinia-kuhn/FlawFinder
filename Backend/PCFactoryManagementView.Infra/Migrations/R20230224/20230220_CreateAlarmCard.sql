IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
            AND ComponentType = 'table'
                AND GroupName = 'DashboardCard'
                    AND FieldName = 'Histórico de Alarmes'
                        AND TableName = 'VIEWDASHBOARD')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName, [Hidden], DefaultValue, FieldOrder, [Enabled], CustomField, GroupName, ComponentType, Nullable, IsPk, IDScreen, ScreenFormat) 
VALUES ('VIEWDASHBOARD', 'Histórico de Alarmes', 0, 'G0043/v1/CardGrid', 3, 1, 0, 'DashboardCard', 'table',    0,    0, 
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '4' )
END
GO
IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = 
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
            AND [NAME] = 'Histórico de Alarmes' 
            AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
INSERT INTO TBLPrefs 
(IDUser,IDScreen, [Name], [Preference]) 
VALUES 
((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
'Histórico de Alarmes', 
'{
"visible": true,
"size": 8,
"position": 0
}')
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'Histórico de Alarmes'
AND FieldName = 'AUTALARMCARD'
AND TableName = 'AUTALARMCARD'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('AUTALARMCARD', 'AUTALARMCARD', 'FilterOptions','checkbox', 'Histórico de Alarmes' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'AUTALARMCARD'
AND FieldName = 'ALARMAUTCARD'
AND TableName = 'ALARMAUTCARD'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ALARMAUTCARD', 'ALARMAUTCARD', 'FilterValues','checkbox', 'AUTALARMCARD' , 1, '', 0, 1, '', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO