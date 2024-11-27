IF NOT EXISTS(
	SELECT IDScreen FROM TBLScreen WHERE Code = 'GLOBAL_MV_REPORT'
)
BEGIN
	INSERT INTO TBLScreen (Name, IDAplication, Code, NameEN, DtCreation, FlgProduct, ContextPrint)
	VALUES (
		'GLOBAL_MV_REPORT', 
		(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
		'GLOBAL_MV_REPORT',
		'GLOBAL_MV_REPORT',
		GETDATE(),
		1,
		0
	)
END

IF NOT EXISTS (SELECT * FROM SYSOBJECTS WHERE name = 'TBLMVPrefsUsrGrp')
BEGIN
	CREATE TABLE TBLMVPrefsUsrGrp (
		IDPrefsUsrGrp INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		IDPrefs INT NOT NULL,
		IDUsrGrp INT NOT NULL,
		FlgEnable INT NOT NULL
	);
END
GO

IF NOT EXISTS (
	SELECT 
		* 
	FROM TBLOperationScreen 
	WHERE 
		Operation = 'SALVAR_PARA_OUTROS_GRUPOS'
		AND IDScreen = (
			SELECT 
				IDScreen
			FROM TBLScreen 
			WHERE 
				Code = 'GLOBAL_MV_REPORT'
		)
) 
BEGIN 
    INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation) 
	VALUES (
		(
			SELECT 
				IDScreen
			FROM TBLScreen 
			WHERE 
				Code = 'GLOBAL_MV_REPORT'
		), 'SALVAR_PARA_OUTROS_GRUPOS', 'SAVE_FOR_OTHER_GROUPS', GETDATE()
	) 
END
GO

IF NOT EXISTS (
	SELECT 
		* 
	FROM TBLProfileUserGroup 
	WHERE 
		IDOperationScreen IN (
			SELECT TOP 1 
				IDOperationScreen 
			FROM TBLOperationScreen 
			WHERE 
				Operation = 'SALVAR_PARA_OUTROS_GRUPOS' 
				AND IDScreen = (
					SELECT 
						IDScreen
					FROM TBLScreen 
					WHERE 
						Code = 'GLOBAL_MV_REPORT'
				)
		)
)
BEGIN 
	INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation) 
	VALUES (
		(
		SELECT TOP 1 
			IDOperationScreen 
		FROM TBLOperationScreen 
		WHERE 
			Operation = 'SALVAR_PARA_OUTROS_GRUPOS'
			AND IDScreen = (
				SELECT 
					IDScreen
				FROM TBLScreen 
				WHERE 
					Code = 'GLOBAL_MV_REPORT'
			)
		), 1, GETDATE()
	) 
END
GO