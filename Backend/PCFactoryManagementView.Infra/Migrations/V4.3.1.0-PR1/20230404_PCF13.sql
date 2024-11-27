IF OBJECT_ID('tempdb..#tempTable') IS NOT NULL DROP TABLE #tempTable
	
	IF NOT EXISTS (SELECT * FROM SYSOBJECTS WHERE name = 'TBLMVDashboardHD')
	BEGIN
		CREATE TABLE TBLMVDashboardHD
		(
			IDDashboardHD INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
			ViewName NVARCHAR(MAX) NOT NULL,
			ViewPreference NVARCHAR(MAX) NOT NULL,
			DtCreation DATETIME NOT NULL,
			IDUserCreation INT NOT NULL,
			DtLastUpdate DATETIME NOT NULL,
			IDUserLastUpdate INT NOT NULL
		);
	END 

	IF NOT EXISTS (SELECT * FROM SYSOBJECTS WHERE name = 'TBLMVDashboardDet')
	BEGIN
		CREATE TABLE TBLMVDashboardDet
		(
			IDDashboardDet INT IDENTITY(1, 1) PRIMARY KEY NOT NULL,
			IDDashboardHD INT NOT NULL,
			CardName NVARCHAR(MAX) NULL,
			CardPreference NVARCHAR(MAX) NULL,
			CardType NVARCHAR(MAX) NULL
		);

		SELECT IDUser, Code INTO #tempTable FROM TBLUser WHERE IDUser IN (SELECT IDUser FROM TBLPrefs WHERE IDScreen = (SELECT idScreen FROM TblScreen WHERE code = 'VIEWDASHBOARD') GROUP BY IDUser)

		DECLARE @i INT SET @i = 1
		DECLARE @j INT SET @j = 1
		DECLARE @keyHD INT SET @keyHD = 1
		DECLARE @keyDet INT SET @keyDet = 1

		WHILE (@i <= (SELECT MAX(IDUser) FROM #tempTable))
		BEGIN
			IF EXISTS(SELECT IDUser, Code FROM #tempTable WHERE IDUser = @i)
			BEGIN
				INSERT INTO TBLMVDashboardHD
				VALUES (
					'VisaoAtual', 
					'',
					GETDATE(),
					(SELECT IDUser FROM TBLUser WHERE IDUser = @i),
					GETDATE(), 
					(SELECT IDUser FROM TBLUser WHERE IDUser = @i)
				)

				SET @j = 1
			
				IF OBJECT_ID('tempdb..#tempTablePrefs') IS NOT NULL DROP TABLE #tempTablePrefs

				SELECT *, (ROW_NUMBER() OVER(ORDER BY Name)) AS RN INTO #tempTablePrefs 
				FROM TBLPrefs 
				WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD') AND IDUser = @i AND Name NOT LIKE '%QUICKACCESS%' ORDER BY Name

				WHILE (@j <= (SELECT MAX(RN) FROM #tempTablePrefs))
				BEGIN

					INSERT INTO TBLMVDashboardDet
					VALUES (
						(SELECT TOP 1 IDDashboardHD FROM TBLMVDashboardHD WHERE IDUserCreation = @i), 
						(SELECT TOP 1 Name FROM TBLPrefs WHERE IDUser = @i AND IDPref = (SELECT TOP 1 IDPref FROM #tempTablePrefs WHERE RN = @j)),
						(SELECT TOP 1 Preference FROM TBLPrefs WHERE IDUser = @i AND IDPref = (SELECT TOP 1 IDPref FROM #tempTablePrefs WHERE RN = @j)),
						(SELECT TOP 1 GroupName FROM TBLScreenFields SF INNER JOIN TBLScreen SC ON SF.IDScreen = SC.IDScreen 
							WHERE SC.Code = 'VIEWDASHBOARD' AND SF.[Enabled] = 1 AND SF.FieldName = (SELECT TOP 1 Name FROM TBLPrefs WHERE IDUser = @i AND IDPref = (SELECT TOP 1 IDPref FROM #tempTablePrefs WHERE RN = @j)))
					)

				SET @j = @j + 1
				END

				IF OBJECT_ID('tempdb..#tempTablePrefs') IS NOT NULL DROP TABLE #tempTablePrefs
			END

			SET @i = @i + 1
		END
	END

	IF OBJECT_ID('tempdb..#tempTable') IS NOT NULL DROP TABLE #tempTable