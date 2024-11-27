IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
            AND ComponentType = 'indicatorscardone'
                AND GroupName = 'DashboardCard'
                    AND FieldName = 'Oee Mobile'
                        AND TableName = 'VIEWDASHBOARD')
BEGIN
    INSERT INTO TBLScreenFields (TableName, FieldName, GroupName, ComponentType, DefaultValue, [Hidden], FieldOrder, [Enabled], CustomField, Nullable, IsPk, IDScreen, FieldType)
    VALUES ('VIEWDASHBOARD', 'Oee Mobile', 'DashboardCard', 'indicatorscardone', 'IndicatorsProd/V1/radial', 0, 0, 1, 0, 0, 0,
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 'carrossel')
END
GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = 
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
            AND [NAME] = 'Oee Mobile' 
            AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
INSERT INTO TBLPrefs 
(IDUser, IDScreen, [Name], [Preference]) 
VALUES 
((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
'Oee Mobile', 
'{"GridsterConfig":{"Visible":false,"Cols":1,"Rows":1,"IdCard":0,"Widget":"indicatorscardone","Height":0.0,"Width":0.0,"ChartUrl":"IndicatorsProd/V1/radial","X":0,"Y":0,"idLastEditUser":1,"idPref":0,"idPrefOrigin":0,"isPrefCard":false,"pillar":null},"filter":[],"PrefsGrid":null}')
END
GO