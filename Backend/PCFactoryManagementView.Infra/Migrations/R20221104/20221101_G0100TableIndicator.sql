
	IF EXISTS(
		SELECT IDScreenFields 
		FROM TBLScreenFields 
		WHERE IDScreen = (
				SELECT 
					IDScreen 
				FROM TBLScreen 
				WHERE 
					Code = 'G0100' 
					AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
		)
		AND FieldName = 'table'
		AND DefaultValue = 'G0100/v1/Table'
	)
	BEGIN
		UPDATE TBLScreenFields 
		SET DefaultValue = 'G0100/v1/TableIndicators' 
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100') 
		AND FieldName = 'table'
	END
	GO