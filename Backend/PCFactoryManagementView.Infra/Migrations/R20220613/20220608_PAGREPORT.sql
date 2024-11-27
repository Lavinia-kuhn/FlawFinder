IF EXISTS (
	SELECT IDPref FROM TBLPrefs WHERE Name = 'PAGINATIONREPORT' 
	AND IDUser = 1 
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE code = 'MAINVIEW' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4VIEW'))
)
BEGIN
	UPDATE TBLPrefs SET Preference = '10000' WHERE Name = 'PAGINATIONREPORT' 
	AND IDUser = 1 
	AND Preference = '100'
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE code = 'MAINVIEW' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4VIEW'))
END
GO