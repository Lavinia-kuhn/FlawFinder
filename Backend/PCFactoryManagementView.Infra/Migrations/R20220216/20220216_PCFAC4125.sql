IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'MAINVIEW' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
		AND [NAME] = 'HEIGHTROWS' 
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
		'HEIGHTROWS',
		'LARGE'
	)
END
GO



