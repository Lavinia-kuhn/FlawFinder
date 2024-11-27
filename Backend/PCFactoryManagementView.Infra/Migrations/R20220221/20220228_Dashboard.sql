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
'Sem produção turno atual',
'No current production shift',
'Sin producción cambio actual',
1,
1,
(select IDScreen from TBLScreen where Code = 'VIEWDASHBOARD'),
'NOPRODUCTIVE')
END
ELSE
BEGIN
UPDATE TBLLocalizations SET PTLocal = 'Sem produção turno atual', ENLocal = 'No current production shift', ESLocal = 'Sin producción cambio actual'
WHERE IDScreen = (select IDScreen from TBLScreen where Code = 'VIEWDASHBOARD')
AND TranslationKey = 'NOPRODUCTIVE'
END
GO