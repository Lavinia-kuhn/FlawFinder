IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'MAINVIEW' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
	AND [NAME] = 'FAVORITES' 
	AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
	INSERT INTO TBLPrefs ([NAME], Preference, IDScreen, IDUser)
	VALUES ('FAVORITES', '', 
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'MAINVIEW' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
	(SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
END
GO 

Update TBLPrefs set Preference = ''

WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'MAINVIEW' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
	AND [NAME] = 'FAVORITES' 
	AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN')