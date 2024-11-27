--Tradução
IF NOT EXISTS (
     SELECT IDLocalization
        FROM TBLLocalizations
            WHERE IDScreen = (select IDScreen from TBLScreen where Code = 'G0012')
                AND TranslationKey = 'SHIFT2'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
        VALUES (
            (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
            'Turno 2',
            'Shift 2',
            'Turno 2',
            1,
            1,
            (select IDScreen from TBLScreen where Code = 'G0012'),
            'SHIFT2')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Turno 2', ENLocal = 'Shift 2', ESLocal = 'Turno 2'
        WHERE IDScreen = (select IDScreen from TBLScreen where Code = 'G0012')
                AND TranslationKey = 'SHIFT2'
END
GO