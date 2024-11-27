IF NOT EXISTS( 
SELECT IDScreenFields FROM TBLScreenFields WHERE 
TableName = 'VIEWDASHBOARD' 
AND FieldName = 'Indicadores Det. (8x3)' 
AND GroupName = 'DashboardCard' 
AND ComponentType = 'indicatorscarddetails'
AND DefaultValue = 'IndicatorsProd/v1/IndicatorsProdDets'
AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')
AND FieldType = 'carrossel')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, GroupName, ComponentType, DefaultValue, [Hidden], FieldOrder, [Enabled], CustomField, Nullable, IsPk, IDScreen, FieldType)
	VALUES ('VIEWDASHBOARD', 'Indicadores Det. (8x3)', 'DashboardCard', 'indicatorscarddetails', 'IndicatorsProd/V1/IndicatorsProdDets', 0, 0, 1, 0, 0, 0, (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'), 'carrossel')
END
GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
	AND [NAME] = 'Indicadores Det. (8x3)' 
	AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
	INSERT INTO TBLPrefs (IDUser,IDScreen, [Name], [Preference]) 
	VALUES ((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
	'Indicadores Det. (8x3)', 
	'{"GridsterConfig":{"Visible":false,"Cols":3,"Rows":2,"IdCard":0,"Widget":"indicatorscarddetails","Height":0.0,"Width":0.0,"ChartUrl":"PredictedProd/V1/IndicatorsProdDets","X":0,"Y":0,"idLastEditUser":1},"PrefsGrid":null}')
END
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Indicadores Det. (8x3)',
@PTLocal = 'Indicadores Det. (8x3)',
@ENLocal = 'Indicators Card (8x3)',
@ESLocal = 'Indicadores Det. (8x3)',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO