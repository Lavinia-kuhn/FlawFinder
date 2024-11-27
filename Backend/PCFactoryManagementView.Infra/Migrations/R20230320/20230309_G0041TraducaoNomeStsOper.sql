-----------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'PRODUCTION'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('Produção', 'Production', 'Producción',1,1,'PRODUCTION',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'RELEASED'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('Liberação', 'Released', 'Liberar',1,1,'RELEASED',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'PLANNED'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('Planejada', 'Planned', 'Planificado',1,1,'PLANNED',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'INTERRUPTED'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('Interrompida', 'Interrupted', 'Interrumpido',1,1,'INTERRUPTED',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'DOWNLOADED'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('Baixada', 'Downloaded', 'Descargado',1,1,'DOWNLOADED',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'CLOSED'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('Encerrada', 'Closed', 'Cerrado',1,1,'CLOSED',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'CANCELED'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('Cancelada', 'Canceled', 'Cancelado',1,1,'CANCELED',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
-----------------------------------------------------------------------------------------------------------------------------------------------------------------