
IF NOT EXISTS( 
SELECT IDScreenFields FROM TBLScreenFields WHERE 
TableName = 'VIEWDASHBOARD' 
AND FieldName = 'OE Hora a Hora' 
AND GroupName = 'DashboardCard' 
AND ComponentType = 'column'
AND DefaultValue = 'G0020/v1/OeHourly'
AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')
AND FieldType = 'carrossel')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, GroupName, ComponentType, DefaultValue, [Hidden], FieldOrder, [Enabled], CustomField, Nullable, IsPk, IDScreen, FieldType)
	VALUES ('VIEWDASHBOARD', 'OE Hora a Hora', 'DashboardCard','column', 'G0020/v1/OeHourly', 0, 0, 1, 0, 0, 0, (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'), 'carrossel')
END
GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
	AND [NAME] = 'OE Hora a Hora' 
	AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
	INSERT INTO TBLPrefs (IDUser,IDScreen, [Name], [Preference]) 
	VALUES ((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
	'OE Hora a Hora', 
	'{"GridsterConfig":{"Visible":false,"Cols":1,"Rows":1,"IdCard":0,"Widget":"column","Height":0.0,"Width":0.0,"ChartUrl":"G0020/v1/OeHourly","X":0,"Y":0,"idLastEditUser":1},"PrefsGrid":null}')
END
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'OE Hora a Hora',
@PTLocal = 'OE Hora a Hora',
@ENLocal = 'Hourly OE',
@ESLocal = 'OE por hora',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSOE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'OEE',
			'OEE',
			'OEE',
			1,
			1,
			-1,
			'PCFACINDICATORSOE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'OEE', ENLocal = 'OEE', ESLocal = 'OEE'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSOE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSOE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'OE',
			'OE',
			'OE',
			1,
			1,
			-1,
			'MVINDICATORSOE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'OE', ENLocal = 'OE', ESLocal = 'OE'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSOE'
END
GO
