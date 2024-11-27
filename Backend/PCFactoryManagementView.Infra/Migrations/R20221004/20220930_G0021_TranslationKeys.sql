	GO
		IF (
			SELECT 
				ESLocal 
			FROM TBLLocalizations 
			WHERE 
				TranslationKey = 'POINT' AND 
				IDScreen = 2882
		) IS NULL
		BEGIN
			UPDATE TBLLocalizations SET ESLocal = 'Puntaje' WHERE TranslationKey = 'POINT' AND IDScreen = 2882
		END
	GO
	GO
		IF (
			SELECT 
				ESLocal 
			FROM TBLLocalizations 
			WHERE 
				TranslationKey = 'DATETIME' AND 
				IDScreen = 2882
		) IS NULL
		BEGIN
			UPDATE TBLLocalizations SET ESLocal = 'Fecha/Hora' WHERE TranslationKey = 'DATETIME' AND IDScreen = 2882
		END
	GO
	GO
		IF (
			SELECT 
				ESLocal 
			FROM TBLLocalizations 
			WHERE 
				TranslationKey = 'VALUE' AND 
				IDScreen = 2882
		) IS NULL
		BEGIN
			UPDATE TBLLocalizations SET ESLocal = 'Valor' WHERE TranslationKey = 'VALUE' AND IDScreen = 2882
		END
	GO
	GO
		IF (
			SELECT 
				ESLocal 
			FROM TBLLocalizations 
			WHERE 
				TranslationKey = 'TOOL' AND 
				IDScreen = 2882
		) IS NULL
		BEGIN
			UPDATE TBLLocalizations SET ESLocal = 'Herramienta' WHERE TranslationKey = 'TOOL' AND IDScreen = 2882
		END
	GO
	GO
		IF (
			SELECT 
				ESLocal 
			FROM TBLLocalizations 
			WHERE 
				TranslationKey = 'PERF' AND 
				IDScreen = 2882
		) IS NULL
		BEGIN
			UPDATE TBLLocalizations SET ESLocal = 'Performance' WHERE TranslationKey = 'PERF' AND IDScreen = 2882
		END
	GO
	GO
		IF (
			SELECT 
				ESLocal 
			FROM TBLLocalizations 
			WHERE 
				TranslationKey = 'EFFICIENCY' AND 
				IDScreen = 2882
		) IS NULL
		BEGIN
			UPDATE TBLLocalizations SET ESLocal = 'Eficiencia' WHERE TranslationKey = 'EFFICIENCY' AND IDScreen = 2882
		END
	GO
	GO
		IF (
			SELECT 
				ESLocal 
			FROM TBLLocalizations 
			WHERE 
				TranslationKey = 'DEFAULTCYCLE' AND 
				IDScreen = 2882
		) IS NULL
		BEGIN
			UPDATE TBLLocalizations SET ESLocal = 'Ciclo Estándar' WHERE TranslationKey = 'DEFAULTCYCLE' AND IDScreen = 2882
		END
	GO
		IF (
			SELECT 
				ESLocal 
			FROM TBLLocalizations 
			WHERE 
				TranslationKey = 'AVGCYCLE' AND 
				IDScreen = 2882
		) IS NULL
		BEGIN
			UPDATE TBLLocalizations SET ESLocal = 'Ciclo Promedio' WHERE TranslationKey = 'AVGCYCLE' AND IDScreen = 2882
		END
	GO