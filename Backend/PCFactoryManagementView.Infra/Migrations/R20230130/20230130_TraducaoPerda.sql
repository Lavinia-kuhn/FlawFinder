---------------------------------------TEOPRODUCTIVEGROSSTIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERDAFERRAMENTAL'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Perda Ferramental',
			'Tooling Loss',
			'Perda Ferramental',
			1,
			1,
			-1,
			'MVINDICATORSPERDAFERRAMENTAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Perda Ferramental', ENLocal = 'Tooling Loss', ESLocal = 'Perda Ferramental'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERDAFERRAMENTAL'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERDAFERRAMENTAL'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Perda Ferramental',
			'Tooling Loss',
			'Perda Ferramental',
			1,
			1,
			-1,
			'PCFACINDICATORSPERDAFERRAMENTAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Perda Ferramental', ENLocal = 'Tooling Loss', ESLocal = 'Perda Ferramental'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERDAFERRAMENTAL'
END
GO
