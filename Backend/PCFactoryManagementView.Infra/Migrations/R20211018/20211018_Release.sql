IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'MAINVIEW'
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
		AND [NAME] = 'LANGUAGE' 
			AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN

	INSERT INTO TBLPrefs (
		IDUser,
		IDScreen, 
		[Name], 
		[Preference]
	) 
	VALUES (
		(SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'MAINVIEW' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
		'LANGUAGE',
		'pt'
	)
END
GO
IF EXISTS(Select * from TBLScreenFields where IDScreen = (select IDScreen from TBLScreen where code = 'g0001') and FieldName = 'stackedcolumn')
begin
	Update TBLScreenFields 
	SET FieldName = 'goalcolumns',
	DefaultValue = 'G0001/v1/Indicators'
	where IDScreen = (select IDScreen from TBLScreen where code = 'g0001') and FieldName = 'stackedcolumn' and TableName = 'G0001'
END
GO