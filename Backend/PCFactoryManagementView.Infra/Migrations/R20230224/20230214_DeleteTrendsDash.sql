IF EXISTS(
    SELECT IDScreenFields FROM TBLScreenFields WHERE FieldName = 'Microtendências'
		AND TableName = 'VIEWDASHBOARD' 
		AND DefaultValue = 'OeeDashboard/V1/Trends'
		AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
)
BEGIN
    DELETE FROM TBLScreenFields WHERE IDScreenFields = (
        SELECT IDScreenFields FROM TBLScreenFields WHERE TableName = 'VIEWDASHBOARD' AND FieldName = 'Microtendências'
            AND DefaultValue = 'OeeDashboard/V1/Trends')
		AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
END
GO

IF EXISTS(
    SELECT IDPref FROM TBLPrefs WHERE Name = 'Microtendências' AND IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
)
BEGIN
    DELETE FROM TBLPrefs WHERE IDScreen = (
		SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4VIEW'))
			AND Name = 'Microtendências'
END
GO