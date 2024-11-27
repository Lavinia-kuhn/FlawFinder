IF NOT EXISTS( 
SELECT IDScreenFields FROM TBLScreenFields WHERE 
TableName = 'VIEWDASHBOARD' 
AND FieldName = 'Card de Indicadores (2x2)' 
AND GroupName = 'DashboardCard' 
AND ComponentType = 'indicatorscardfour'
AND DefaultValue = 'IndicatorsProd/v1/IndicatorsProdSwiper'
AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')
AND FieldType = 'carrossel')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, GroupName, ComponentType, DefaultValue, [Hidden], FieldOrder, [Enabled], CustomField, Nullable, IsPk, IDScreen, FieldType)
	VALUES ('VIEWDASHBOARD', 'Card de Indicadores (2x2)', 'DashboardCard', 'indicatorscardfour', 'IndicatorsProd/V1/IndicatorsProdSwiper', 0, 0, 1, 0, 0, 0, (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'), 'carrossel')
END
GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
	AND [NAME] = 'Card de Indicadores (2x2)' 
	AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
	INSERT INTO TBLPrefs (IDUser,IDScreen, [Name], [Preference]) 
	VALUES ((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
	'Card de Indicadores (2x2)', 
	'{"GridsterConfig":{"Visible":false,"Cols":3,"Rows":2,"IdCard":0,"Widget":"indicatorscardfour","Height":0.0,"Width":0.0,"ChartUrl":"PredictedProd/V1/IndicatorsProdSwiper","X":0,"Y":0,"idLastEditUser":1},"PrefsGrid":null}')
END
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Card de Indicadores (2x2)',
@PTLocal = 'Card de Indicadores (2x2)',
@ENLocal = 'Indicators Card (2x2)',
@ESLocal = 'Card de Indicadores (2x2)',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO