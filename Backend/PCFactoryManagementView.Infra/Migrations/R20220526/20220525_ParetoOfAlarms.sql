IF NOT EXISTS( 
SELECT IDScreenFields FROM TBLScreenFields WHERE 
TableName = 'VIEWDASHBOARD' 
AND FieldName = 'Pareto Justificativa de Alarme' 
AND GroupName = 'DashboardCard' 
AND ComponentType = 'pareto'
AND DefaultValue = 'G0043/V1/ParetoJustificativs'
AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')
AND FieldType IS NULL)
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName, GroupName, ComponentType, DefaultValue, [Hidden], FieldOrder, [Enabled], CustomField, Nullable, IsPk, IDScreen, FieldType)
	VALUES ('VIEWDASHBOARD', 'Pareto Justificativa de Alarme', 'DashboardCard', 'pareto', 'G0043/V1/ParetoJustificativs', 0, 0, 1, 0, 0, 0, (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'), null)
END
GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
	AND [NAME] = 'Pareto Justificativa de Alarme' 
	AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
	INSERT INTO TBLPrefs (IDUser,IDScreen, [Name], [Preference]) 
	VALUES ((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
	'Pareto Justificativa de Alarme', 
	'{"GridsterConfig":{"Visible":false,"Cols":3,"Rows":1,"IdCard":0,"Widget":"pareto","Height":0.0,"Width":0.0,"ChartUrl":"G0043/V1/ParetoJustificativs","X":0,"Y":0,"idLastEditUser":1},"PrefsGrid":null}')
END
GO

EXEC SP_TBLLocalizations22 @ScreenCode = 'VIEWDASHBOARD', @TranslationKey = 'Pareto Justificativa de Alarme',
@PTLocal = 'Pareto Justificativa de Alarme',
@ENLocal = 'Pareto Alarm Justification',
@ESLocal = 'Pareto Justificación de Alarma',
@AplicationCode = 'PCF4View', @FlgProduct = 1
GO