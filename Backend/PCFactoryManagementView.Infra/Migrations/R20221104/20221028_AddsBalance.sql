IF NOT EXISTS( 
SELECT IDScreenFields FROM TBLScreenFields WHERE 
TableName = 'VIEWDASHBOARD' 
AND FieldName = 'Saldo de Endereços' 
AND GroupName = 'DashboardCard' 
AND ComponentType = 'addressbalance'
AND DefaultValue = 'MovDashboard/v1/addressBalance'
AND DefaultValue = 'MovDashboard/v1/addressBalance'
AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')
AND FieldType = 'carrossel')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, GroupName, ComponentType, DefaultValue, [Hidden], FieldOrder, [Enabled], CustomField, Nullable, IsPk, IDScreen, FieldType)
	VALUES ('VIEWDASHBOARD', 'Saldo de Endereços', 'DashboardCard', 'addressbalance', 'MovDashboard/v1/addressBalance', 0, 0, 1, 0, 0, 0, (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'), 'carrossel')
END
GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
	AND [NAME] = 'Saldo de Endereços' 
	AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
	INSERT INTO TBLPrefs (IDUser,IDScreen, [Name], [Preference]) 
	VALUES ((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
	'Saldo de Endereços', 
	'{"GridsterConfig":{"Visible":false,"Cols":3,"Rows":2,"IdCard":0,"Widget":"addressbalance","Height":0.0,"Width":0.0,"ChartUrl":"MovDashboard/v1/addressBalance","X":0,"Y":0,"idLastEditUser":1},"PrefsGrid":null}')
END
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Saldo de Endereços',
@PTLocal = 'Saldo de Endereços',
@ENLocal = 'Address Balance',
@ESLocal = 'Saldo de dirección',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO