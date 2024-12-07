---------------------------------------TEOPRODUCTIVEGROSSTIME---------------------------------------
--Tradu��o
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSTEOPRODUCTIVEGROSSTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Produtivo Bruto Te�rico',
			'Theoretical Gross Productive Time',
			'Tiempo productivo Bruto Te�rico',
			1,
			1,
			-1,
			'MVINDICATORSTEOPRODUCTIVEGROSSTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Produtivo Bruto Te�rico', ENLocal = 'Theoretical Gross Productive Time', ESLocal = 'Tiempo productivo Bruto Te�rico'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSTEOPRODUCTIVEGROSSTIME'
END
GO

--Tradu��o
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSTEOPRODUCTIVEGROSSTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Produtivo Bruto Te�rico',
			'Theoretical Gross Productive Time',
			'Tiempo productivo Bruto Te�rico',
			1,
			1,
			-1,
			'PCFACINDICATORSTEOPRODUCTIVEGROSSTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Produtivo Bruto Te�rico', ENLocal = 'Theoretical Gross Productive Time', ESLocal = 'Tiempo productivo Bruto Te�rico'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSTEOPRODUCTIVEGROSSTIME'
END
GO
