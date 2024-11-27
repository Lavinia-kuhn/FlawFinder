--BTS
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'BTS'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('BTS','BTS', 'BTS',1,1,'BTS',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

--MIX
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'MIX'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('MIX','MIX', 'MIX',1,1,'MIX',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

--SEQUENCE
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'SEQUENCE'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('SEQUENCE','SEQUENCE', 'SEQUENCE',1,1,'SEQUENCE',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

--VOLUME
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VOLUME'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('VOLUME','VOLUME', 'VOLUME',1,1,'VOLUME',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO