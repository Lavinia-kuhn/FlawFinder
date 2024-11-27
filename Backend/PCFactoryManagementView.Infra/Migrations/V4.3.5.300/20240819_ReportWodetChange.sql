
	IF EXISTS(
		SELECT 
			SCNFLD.IDScreenFields 
		FROM TBLScreenFields SCNFLD 
		WHERE FieldName LIKE '%CodeWODET%' AND ComponentType = 'FilterValues'
	)
	BEGIN
		UPDATE TBLScreenFields 
		SET TableName = 'CodeOrder', FieldName = 'CodeOrder' 
		WHERE FieldName LIKE '%CodeWODET%' AND ComponentType = 'FilterValues'
	END
