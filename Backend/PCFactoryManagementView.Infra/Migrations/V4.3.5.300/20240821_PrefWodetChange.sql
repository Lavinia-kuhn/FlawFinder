
	IF EXISTS (
		SELECT 
			PREF.IDPref
		FROM TBLPrefs PREF WHERE Preference LIKE '%OPCode%' AND Preference LIKE '%CodeWODET%' AND IDScreen IN (
			SELECT IDScreen FROM TBLScreen WHERE IDAplication = (
				SELECT IDAplication FROM TBLAplication WHERE [Name] = 'PCFManagementView'
			)
		)
	)
	BEGIN
		UPDATE TBLPrefs
		SET Preference = REPLACE(CAST(Preference AS NVARCHAR(MAX)), 'CodeWODET', 'CodeOrder')
		WHERE Preference LIKE '%OPCode%' AND Preference LIKE '%CodeWODET%' AND IDScreen IN (
			SELECT IDScreen FROM TBLScreen WHERE IDAplication = (
				SELECT IDAplication FROM TBLAplication WHERE [Name] = 'PCFManagementView'
			)
		)
	END