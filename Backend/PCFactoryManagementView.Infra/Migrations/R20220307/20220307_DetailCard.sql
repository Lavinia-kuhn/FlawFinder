-- DASHBOARD - DETALHES DE PRODUÇÃO - MULTWOPRODUCTION
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = (select IDScreen from TBLScreen where Code = 'VIEWDASHBOARD')
AND TranslationKey = 'MULTWOPRODUCTION'
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Operando em múltiplas ordens',
'Operating in multiple orders',
'Operando en múltiples órdenes',
1,
1,
(select IDScreen from TBLScreen where Code = 'VIEWDASHBOARD'),
'MULTWOPRODUCTION')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Operando em múltiplas ordens', ENLocal = 'Operating in multiple orders', ESLocal = 'Operando en múltiples órdenes'
WHERE IDScreen = (select IDScreen from TBLScreen where Code = 'VIEWDASHBOARD')
AND TranslationKey = 'MULTWOPRODUCTION'
END
GO

-- DASHBOARD - DETALHES DE PRODUÇÃO - NOPRODUCTIVE
IF NOT EXISTS (
SELECT IDLocalization
FROM TBLLocalizations
WHERE IDScreen = (select IDScreen from TBLScreen where Code = 'VIEWDASHBOARD')
AND TranslationKey = 'NOPRODUCTIVE'
)
BEGIN
INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
VALUES (
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
'Sem ordem de produção',
'No production order',
'Sin orden de producción',
1,
1,
(select IDScreen from TBLScreen where Code = 'VIEWDASHBOARD'),
'NOPRODUCTIVE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Sem ordem de produção', ENLocal = 'No production order', ESLocal = 'Sin orden de producción'
WHERE IDScreen = (select IDScreen from TBLScreen where Code = 'VIEWDASHBOARD')
AND TranslationKey = 'NOPRODUCTIVE'
END
GO