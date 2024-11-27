IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0140'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0140' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('G0140–Analítico de Inspeção', 'G0140–Inspection Analytics', 'G0140-Análisis de inspección',1,1,'VIEW_MENU_G0140',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0140' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0132'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('G0132–DTM OEE', 'G0132–DTM OEE', 'G0132-DTM OEE',1,1,'VIEW_MENU_G0132',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0145'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0145' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('G0145–Analítico de Alarmes', 'G0145–Alarm Analytics', 'G0145-Análisis de alarmas',1,1,'VIEW_MENU_G0145',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0145' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_ G0148'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('G0148–Estatístico de Validação', 'G0148–Validation Statistical', 'G0148-Validación Estadística',1,1,'VIEW_MENU_G0148',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO
------------------------------------------------------------------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0160'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0160' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('G0160–Múltiplas Inspeções', 'G0160–Multiple Inspections', 'G0160-Múltiples Inspecciones',1,1,'VIEW_MENU_G0160',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0160' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO