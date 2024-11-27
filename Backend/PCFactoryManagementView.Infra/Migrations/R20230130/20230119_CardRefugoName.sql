IF EXISTS(
    SELECT IdScreenFields FROM TBLScreenFields WHERE TableName = 'VIEWDASHBOARD' AND FieldName = 'Qualidade'
        AND DefaultValue = 'G0019/v1/Scrap/Pareto' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
        AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE code = 'PCF4View'))
)
BEGIN
    UPDATE TBLScreenFields SET FieldName = 'Refugo' WHERE IDScreenFields = (
        SELECT IdScreenFields FROM TBLScreenFields WHERE TableName = 'VIEWDASHBOARD' AND FieldName = 'Qualidade'
            AND DefaultValue = 'G0019/v1/Scrap/Pareto')
END
GO

IF EXISTS(
	SELECT IDPref FROM TBLPrefs WHERE Name = 'QUALIDADE' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
		AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
)
BEGIN
	UPDATE TBLPrefs SET Name = 'REFUGO' WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'
		AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND Name = 'QUALIDADE'
END
GO