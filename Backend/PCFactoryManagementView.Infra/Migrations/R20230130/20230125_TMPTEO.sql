---------------------------------------TEOPRODUCTIVEGROSSTIME---------------------------------------
--Tradução
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
			'Tempo Produtivo Bruto Teórico',
			'Theoretical Gross Productive Time',
			'Tiempo productivo Bruto Teórico',
			1,
			1,
			-1,
			'MVINDICATORSTEOPRODUCTIVEGROSSTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Produtivo Bruto Teórico', ENLocal = 'Theoretical Gross Productive Time', ESLocal = 'Tiempo productivo Bruto Teórico'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSTEOPRODUCTIVEGROSSTIME'
END
GO

--Tradução
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
			'Tempo Produtivo Bruto Teórico',
			'Theoretical Gross Productive Time',
			'Tiempo productivo Bruto Teórico',
			1,
			1,
			-1,
			'PCFACINDICATORSTEOPRODUCTIVEGROSSTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Produtivo Bruto Teórico', ENLocal = 'Theoretical Gross Productive Time', ESLocal = 'Tiempo productivo Bruto Teórico'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSTEOPRODUCTIVEGROSSTIME'
END
GO
