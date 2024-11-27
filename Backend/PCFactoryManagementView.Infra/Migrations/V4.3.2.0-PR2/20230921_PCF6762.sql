IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'G0019_LOWERED'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Baixada', 'Lowered', 'Descargado', 1, 1,'G0019_LOWERED',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'G0019_PRODUCTION'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Produção', 'Production', 'Producción', 1, 1,'G0019_PRODUCTION',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'G0019_INTERRUPTED'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Interrompida', 'Interrupted', 'Interrumpido', 1, 1,'G0019_INTERRUPTED',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'G0019_CLOSED'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Encerrada', 'Closed', 'Cerrado', 1, 1,'G0019_CLOSED',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'WORKORDER'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Ordem', 'Work Order', 'Orden', 1, 1,'WORKORDER',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'GOODPIECES'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Peças Boas', 'Good Pieces', 'Buenas Piezas', 1, 1,'GOODPIECES',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'REWORKPIECES'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Peças Retrabalhadas', 'Reworked Pieces', 'Piezas reelaboradas', 1, 1,'REWORKPIECES',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'SCRAPPIECES'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Peças Refugadas', 'Scrap Pieces', 'Piezas rechazadas', 1, 1,'SCRAPPIECES',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'INSPECTION'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Inspeção', 'Inspection', 'Inspecion', 1, 1,'INSPECTION',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'LACKOFMATERIALS'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Falta de Matéria Prima', 'Lack of Raw Material', 'Falta de Materia Prima', 1, 1,'LACKOFMATERIALS',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'UNIDENTIFIEDSTOP'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Parada Não Identificada', 'Unidentified Stop', 'Parada Nao Identificada', 1, 1,'UNIDENTIFIEDSTOP',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'NOSERVICE'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Sem Serviço', 'No Service', 'Sem Serviço', 1, 1,'NOSERVICE',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'NONOTE'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Sem Apontamento', 'No Note', 'Sem Apontamento', 1, 1,'NONOTE',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'NOOPERATOR'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Sem Operador', 'No Operator', 'Sem Operador', 1, 1,'NOOPERATOR',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'MECHMAINTENANCE'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Manutenção Mecânica', 'Mechanical Maintenance', 'Manutenção Mecânica', 1, 1,'MECHMAINTENANCE',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'WAITINGMAINTENANCE'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Esperando Manutenção', 'Waiting Maintenance', 'Esperando Manutenção', 1, 1,'WAITINGMAINTENANCE',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'INDIRECTWORK'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Trabalho Indireto', 'Indirect work', 'Trabalho Indireto', 1, 1,'INDIRECTWORK',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'ELECTRICALMAINTENANCE'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Manutenção Elétrica', 'Electrical Maintenance', 'Manutenção Elétrica', 1, 1,'ELECTRICALMAINTENANCE',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'TOTALTIME'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Tempo Total', 'Total Time', 'Tiempo Total', 1, 1,'TOTALTIME',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'TIMEOUTSHIFT'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Tempo Fora de Turno', 'Time Out Shift', 'Tiempo Fora del Turno', 1, 1,'TIMEOUTSHIFT',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'LOADTIME'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Tempo de Carga', 'Load Time', 'Tiempo del carga', 1, 1,'LOADTIME',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'PLANNEDSTOP1'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Parada Planejada 1', 'Planned Stop 1', 'Parada Planejada 1', 1, 1,'PLANNEDSTOP1',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'PLANNEDSTOP2'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Parada Planejada 2', 'Planned Stop 2', 'Parada Planejada 2', 1, 1,'PLANNEDSTOP2',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'AVAILABLETIME'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Tempo Disponível', 'Available Time', 'Tempo Disponível', 1, 1,'AVAILABLETIME',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'UNPLANNEDSTOP'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Parada Não Planejada', 'Unplanned Stop', 'Parada Não Planejada', 1, 1,'UNPLANNEDSTOP',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'WORKEDTIME'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Tempo Trabalhado', 'Worked Time', 'Tiempo Trabajado', 1, 1,'WORKEDTIME',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'RHYTHM'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Ritmo', 'Rhythm', 'Ritmo', 1, 1,'RHYTHM',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'GROSSPRODTIME'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Tempo Produtivo Bruto', 'Gross Productive Time', 'Tiempo Productivo Bruto', 1, 1,'GROSSPRODTIME',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'SCRAP'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Refugo', 'Scrap', 'Rechazo', 1, 1,'SCRAP',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'REWORK'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Retrabalho', 'Rework', 'Retrabajo', 1, 1,'REWORK',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'NETPRODTIME'
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
	INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
		VALUES ('Tempo Produtivo Líquido', 'Net Productive Time', 'Tiempo Productivo Neto', 1, 1,'NETPRODTIME',
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0011' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO