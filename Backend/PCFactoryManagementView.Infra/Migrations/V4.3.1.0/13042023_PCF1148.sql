---------------------------------------NORMAL---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'NORMAL'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Normal',
			'Normal',
			'Normal',
			1,
			1,
			-1,
			'NORMAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Normal', ENLocal = 'Normal', ESLocal = 'Normal'
		WHERE IDScreen = -1
				AND TranslationKey = 'NORMAL'
END
GO

---------------------------------------ATTENTION---------------------------------------

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'ATTENTION'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Atenção',
			'Attention',
			'Atención',
			1,
			1,
			-1,
			'ATTENTION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Atenção', ENLocal = 'Attention', ESLocal = 'Atención'
		WHERE IDScreen = -1
				AND TranslationKey = 'ATTENTION'
END
GO
---------------------------------------CRITICAL---------------------------------------

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'CRITICAL'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Crítico',
			'Critical',
			'Crítico',
			1,
			1,
			-1,
			'CRITICAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Crítico', ENLocal = 'Critical', ESLocal = 'Crítico'
		WHERE IDScreen = -1
				AND TranslationKey = 'CRITICAL'
END
GO

---------------------------------------BALANCE---------------------------------------

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'BALANCE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Saldo',
			'Balance',
			'Balance',
			1,
			1,
			-1,
			'BALANCE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Saldo', ENLocal = 'Balance', ESLocal = 'Balance'
		WHERE IDScreen = -1
				AND TranslationKey = 'BALANCE'
END
GO