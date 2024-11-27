
	IF EXISTS(SELECT * FROM TBLScreenFields WHERE FieldName = 'Performace Hora a Hora' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'))
	BEGIN
		UPDATE TBLScreenFields SET FieldName = 'Performance Hora a Hora' WHERE FieldName = 'Performace Hora a Hora' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')
	END

	IF EXISTS(SELECT * FROM TBLPrefs WHERE Name = 'Performace Hora a Hora' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD'))
	BEGIN
		UPDATE TBLPrefs SET Name = 'Performance Hora a Hora' WHERE Name = 'Performace Hora a Hora' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')
	END
