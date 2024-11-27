IF NOT EXISTS( 
SELECT IDScreenFields FROM TBLScreenFields WHERE 
TableName = 'VIEWDASHBOARD' 
AND FieldName = 'Card de Indicadores' 
AND GroupName = 'DashboardCard' 
AND ComponentType = 'indicatorscard'
AND DefaultValue = 'IndicatorsProd/V1/IndicatorsProd'
AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')
AND FieldType = 'carrossel')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, GroupName, ComponentType, DefaultValue, [Hidden], FieldOrder, [Enabled], CustomField, Nullable, IsPk, IDScreen, FieldType)
	VALUES ('VIEWDASHBOARD', 'Card de Indicadores', 'DashboardCard', 'indicatorscard', 'IndicatorsProd/V1/IndicatorsProd', 0, 0, 1, 0, 0, 0, (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'), 'carrossel')
END
GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
	AND [NAME] = 'Card de Indicadores' 
	AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
	INSERT INTO TBLPrefs (IDUser,IDScreen, [Name], [Preference]) 
	VALUES ((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
	'Card de Indicadores', 
	'{"GridsterConfig":{"Visible":false,"Cols":3,"Rows":1,"IdCard":0,"Widget":"indicatorscard","Height":0.0,"Width":0.0,"ChartUrl":"PredictedProd/V1/PredictedProdCard","X":0,"Y":0,"idLastEditUser":1},"PrefsGrid":null}')
END
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Card de Indicadores',
@PTLocal = 'Card de Indicadores',
@ENLocal = 'Indicators Card',
@ESLocal = 'Card de Indicadores',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO