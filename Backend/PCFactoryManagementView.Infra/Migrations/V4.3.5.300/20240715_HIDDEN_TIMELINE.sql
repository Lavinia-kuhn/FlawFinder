
	IF (
		SELECT 
			FlgEnable 
		FROM TBLScreenMenus 
		WHERE 
			IDScreen = (
				SELECT 
					IDScreen 
				FROM TBLScreen 
				WHERE Code = 'G0005'
			)
		) = 1
	BEGIN
		UPDATE TBLScreenMenus 
		SET FlgEnable = 0 
		WHERE 
			IDScreen = (
				SELECT 
					IDScreen 
				FROM TBLScreen 
				WHERE 
					Code = 'G0005'
			)
	END

	IF (
		SELECT 
			[Enabled] 
		FROM TBLScreenFields 
		WHERE 
			IDScreen = (
				SELECT 
					IDScreen 
				FROM TBLScreen 
				WHERE 
					Code = 'VIEWDASHBOARD'
			)
		AND FieldName = 'Linha do Tempo'
	) = 1
	BEGIN
		UPDATE TBLScreenFields 
		SET [Enabled] = 0 
		WHERE 
			IDScreen = (
				SELECT 
					IDScreen 
				FROM TBLScreen 
				WHERE 
					Code = 'VIEWDASHBOARD'
			)
		AND FieldName = 'Linha do Tempo'
	END