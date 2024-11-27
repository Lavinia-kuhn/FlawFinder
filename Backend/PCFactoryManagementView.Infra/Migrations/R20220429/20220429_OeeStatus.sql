IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
		AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
			AND ComponentType = 'table'
				AND GroupName = 'DashboardCard'
					AND FieldName = 'OEE | Status Atual'
						AND TableName = 'VIEWDASHBOARD')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName, [Hidden], DefaultValue, FieldOrder, [Enabled], CustomField, GroupName, ComponentType, Nullable, IsPk, IDScreen, ScreenFormat) 
VALUES ('VIEWDASHBOARD', 'OEE | Status Atual', 0, 'OeeIndicators/V1/TableOCS', 3, 1, 0, 'DashboardCard', 'table',	0,	0, 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
		AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '4' )
END
GO
IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
		AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
			AND [NAME] = 'OEE | Status Atual' 
			AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
INSERT INTO TBLPrefs 
(IDUser,IDScreen, [Name], [Preference]) 
VALUES 
((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
'OEE | Status Atual', 
'{
"visible": true,
"size": 8,
"position": 0
}')
END
GO