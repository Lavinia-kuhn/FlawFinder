IF NOT EXISTS(
SELECT IDScreenFields FROM TBLScreenFields WHERE
TableName = 'VIEWDASHBOARD'
AND FieldName = 'Fila de Ordens'
AND GroupName = 'DashboardCard'
AND ComponentType = 'gantt'
AND DefaultValue = 'G0022/V1/QueueOrder'
AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')
AND FieldType = 'NULL')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName, GroupName, ComponentType, DefaultValue, [Hidden], FieldOrder, [Enabled], CustomField, Nullable, IsPk, IDScreen, FieldType)
VALUES ('VIEWDASHBOARD', 'Fila de Ordens', 'DashboardCard', 'gantt', 'G0022/V1/QueueOrder', 0, 0, 1, 0, 0, 0, (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'), 'NULL')
END
GO



IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND [NAME] = 'Fila de Ordens'
AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
INSERT INTO TBLPrefs (IDUser,IDScreen, [Name], [Preference])
VALUES ((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'),
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
'Fila de Ordens',
'{"GridsterConfig":{"Visible":false,"Cols":3,"Rows":1,"IdCard":0,"Widget":"gantt","Height":0.0,"Width":0.0,"ChartUrl":"G0022/V1/QueueOrder","X":0,"Y":0,"idLastEditUser":1},"PrefsGrid":null}')
END
GO
