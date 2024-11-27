IF EXISTS(
    SELECT IdScreenFields FROM TBLScreenFields WHERE TableName = 'VIEWDASHBOARD' AND FieldName = 'OEE | Status Atual'
        AND DefaultValue = 'OeeIndicators/V1/TableOCS' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE code = 'PCF4View'))
)
BEGIN
    UPDATE TBLScreenFields SET FieldName = 'Indicadores | Status Atual' WHERE IDScreenFields = (
        SELECT IdScreenFields FROM TBLScreenFields WHERE TableName = 'VIEWDASHBOARD' AND FieldName = 'OEE | Status Atual'
            AND DefaultValue = 'OeeIndicators/V1/TableOCS')
END
GO

IF EXISTS(
	SELECT IDPref FROM TBLPrefs WHERE Name = 'OEE | Status Atual' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
		AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
)
BEGIN
	UPDATE TBLPrefs SET Name = 'Indicadores | Status Atual' WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
		AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND Name = 'OEE | Status Atual'
END
GO

IF EXISTS(
    SELECT IdScreenFields FROM TBLScreenFields WHERE TableName = 'VIEWDASHBOARD' AND FieldName = 'OEE'
        AND DefaultValue = 'OeeIndicators/V1/Table' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE code = 'PCF4View'))
)
BEGIN
    UPDATE TBLScreenFields SET FieldName = 'Indicadores' WHERE IDScreenFields = (
        SELECT IdScreenFields FROM TBLScreenFields WHERE TableName = 'VIEWDASHBOARD' AND FieldName = 'OEE'
            AND DefaultValue = 'OeeIndicators/V1/Table')
END
GO

IF EXISTS(
	SELECT IDPref FROM TBLPrefs WHERE Name = 'OEE' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
		AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
)
BEGIN
	UPDATE TBLPrefs SET Name = 'Indicadores' WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
		AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND Name = 'OEE'
END
GO