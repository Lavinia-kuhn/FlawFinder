IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'AVAILABLE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Disponível',
			'Available',
			'Disponible',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127'),
			'AVAILABLE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Disponível', ENLocal = 'Available', ESLocal = 'Disponible'
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'AVAILABLE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESERVED'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Reservado',
			'Reserved',
			'Reservado',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127'),
			'RESERVED')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Reservado', ENLocal = 'Reserved', ESLocal = 'Reservado'
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESERVED'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'INSUPPLY'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Em Abastecimento',
			'In Supply',
			'En Suministro',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127'),
			'INSUPPLY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Em Abastecimento', ENLocal = 'In Supply', ESLocal = 'En Suministro'
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'INSUPPLY'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UNLOADING'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Descarregando',
			'Unloading',
			'Descarga',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127'),
			'UNLOADING')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Descarregando', ENLocal = 'Unloading', ESLocal = 'Descarga'
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UNLOADING'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'INPROCESS'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Em Processo',
			'In Process',
			'En Proceso',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127'),
			'INPROCESS')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Em Processo', ENLocal = 'In Process', ESLocal = 'En Proceso'
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'INPROCESS'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'FULL'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cheio',
			'Full',
			'Lleno',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127'),
			'FULL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cheio', ENLocal = 'Full', ESLocal = 'Lleno'
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'FULL'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'BLOCKED'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Bloqueado',
			'Blocked',
			'Obstruido',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127'),
			'BLOCKED')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Bloqueado', ENLocal = 'Blocked', ESLocal = 'Obstruido'
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'BLOCKED'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ONCARRIAGE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Em Transporte',
			'On Carriage',
			'En Carro',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127'),
			'ONCARRIAGE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Em Transporte', ENLocal = 'On Carriage', ESLocal = 'En Carro'
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'ONCARRIAGE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DISCARDED'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Descartado',
			'Discarded',
			'Descartado',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127'),
			'DISCARDED')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Descartado', ENLocal = 'Discarded', ESLocal = 'Descartado'
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0127') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DISCARDED'
END
GO