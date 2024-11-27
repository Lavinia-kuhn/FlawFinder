--CARDS MAP
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'map'
AND GroupName = 'DashboardCard'
AND FieldName = 'Mapa'
AND TableName = 'VIEWDASHBOARD')
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName, [Hidden], DefaultValue, FieldOrder, Enabled, CustomField, GroupName, ComponentType, Nullable,IsPk, IDScreen, ScreenFormat) 
	VALUES ('VIEWDASHBOARD', 'Mapa', 0, '', 10, 1, 0, 'DashboardCard', 'map',    0,    0, (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '4' )
END
GO

--CARDS MAP
IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
	AND [NAME] = 'Mapa' 
	AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN
	INSERT INTO TBLPrefs (IDUser,IDScreen, [Name], [Preference]) VALUES ((SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 'Mapa', '{"Visible":false,"Size":24, "Height": 2,"Position":0,"Parameters":[],"idLastEditUser":1}')
END
GO

---------------------------------------TEEP---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSTEEP'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'TEEP',
			'TEEP',
			'TEEP',
			1,
			1,
			-1,
			'MVINDICATORSTEEP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'TEEP', ENLocal = 'TEEP', ESLocal = 'TEEP'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSTEEP'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSTEEP'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'AE',
			'AE',
			'AE',
			1,
			1,
			-1,
			'PCFACINDICATORSTEEP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'AE', ENLocal = 'AE', ESLocal = 'AE'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSTEEP'
END
GO
---------------------------------------GOALTEEP---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALTEEP'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta TEEP',
			'Goal TEEP',
			'Meta TEEP',
			1,
			1,
			-1,
			'MVINDICATORSGOALTEEP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta TEEP', ENLocal = 'Goal TEEP', ESLocal = 'Meta TEEP'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALTEEP'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALTEEP'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta AE',
			'Goal AE',
			'Meta AE',
			1,
			1,
			-1,
			'PCFACINDICATORSGOALTEEP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta AE', ENLocal = 'Goal AE', ESLocal = 'Meta AE'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALTEEP'
END
GO

---------------------------------------OE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSOE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'OE',
			'OE',
			'OE',
			1,
			1,
			-1,
			'MVINDICATORSOE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'OE', ENLocal = 'OE', ESLocal = 'OE'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSOE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSOE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'OEE',
			'OEE',
			'OEE',
			1,
			1,
			-1,
			'PCFACINDICATORSOE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'OEE', ENLocal = 'OEE', ESLocal = 'OEE'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSOE'
END
GO

---------------------------------------GOALOE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALOE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta OE',
			'Goal OE',
			'Meta OE',
			1,
			1,
			-1,
			'MVINDICATORSGOALOE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta OE', ENLocal = 'Goal OE', ESLocal = 'Meta OE'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALOE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALOE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta OEE',
			'Goal OEE',
			'Meta OEE',
			1,
			1,
			-1,
			'PCFACINDICATORSGOALOE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta OEE', ENLocal = 'Goal OEE', ESLocal = 'Meta OEE'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALOE'
END
GO

---------------------------------------UTILIZATION---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSUTILIZATION'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Utilização',
			'Utilization',
			'Usar',
			1,
			1,
			-1,
			'MVINDICATORSUTILIZATION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Utilização', ENLocal = 'Utilization', ESLocal = 'Usar'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSUTILIZATION'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSUTILIZATION'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Disponibilidade',
			'Availability',
			'Disponibilidad',
			1,
			1,
			-1,
			'PCFACINDICATORSUTILIZATION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Disponibilidade', ENLocal = 'Availability', ESLocal = 'Disponibilidad'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSUTILIZATION'
END
GO
---------------------------------------GOALUTILIZATION---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALUTILIZATION'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta Utilização',
			'Goal Utilization',
			'Meta Usar',
			1,
			1,
			-1,
			'MVINDICATORSGOALUTILIZATION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta Utilização', ENLocal = 'Goal Utilization', ESLocal = 'Meta Usar'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALUTILIZATION'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALUTILIZATION'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta Disponibilidade',
			'Goal Availability',
			'Meta Disponibilidad',
			1,
			1,
			-1,
			'PCFACINDICATORSGOALUTILIZATION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta Disponibilidade', ENLocal = 'Goal Availability', ESLocal = 'Meta Disponibilidad'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALUTILIZATION'
END
GO

---------------------------------------OEE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSOEE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'OEE',
			'OEE',
			'OEE',
			1,
			1,
			-1,
			'MVINDICATORSOEE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'OEE', ENLocal = 'OEE', ESLocal = 'OEE'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSOEE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSOEE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Produtividade',
			'Productivity',
			'Productividad',
			1,
			1,
			-1,
			'PCFACINDICATORSOEE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Produtividade', ENLocal = 'Productivity', ESLocal = 'Productividad'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSOEE'
END
GO

---------------------------------------GOALOEE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALOEE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta OEE',
			'Goal OEE',
			'Meta OEE',
			1,
			1,
			-1,
			'MVINDICATORSGOALOEE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta OEE', ENLocal = 'Goal OEE', ESLocal = 'Meta OEE'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALOEE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALOEE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta Produtividade',
			'Goal Productivity',
			'Meta Productividad',
			1,
			1,
			-1,
			'PCFACINDICATORSGOALOEE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta Produtividade', ENLocal = 'Goal Productivity', ESLocal = 'Meta Productividad'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALOEE'
END
GO

---------------------------------------AVAILABILITY---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSAVAILABILITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Disponibilidade',
			'Availability',
			'Disponibilidad',
			1,
			1,
			-1,
			'MVINDICATORSAVAILABILITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Disponibilidade', ENLocal = 'Availability', ESLocal = 'Disponibilidad'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSAVAILABILITY'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSAVAILABILITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Utilização',
			'Utilization',
			'Usar',
			1,
			1,
			-1,
			'PCFACINDICATORSAVAILABILITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Utilização', ENLocal = 'Utilization', ESLocal = 'Usar'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSAVAILABILITY'
END
GO

---------------------------------------GOALAVAILABILITY---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALAVAILABILITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta Disponibilidade',
			'Goal Availability',
			'Meta Disponibilidad',
			1,
			1,
			-1,
			'MVINDICATORSGOALAVAILABILITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta Disponibilidade', ENLocal = 'Goal Availability', ESLocal = 'Meta Disponibilidad'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALAVAILABILITY'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALAVAILABILITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta Utilização',
			'Goal Utilization',
			'Meta Usar',
			1,
			1,
			-1,
			'PCFACINDICATORSGOALAVAILABILITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta Utilização', ENLocal = 'Goal Utilization', ESLocal = 'Meta Usar'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALAVAILABILITY'
END
GO
---------------------------------------PERFORMANCE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERFORMANCE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Performance',
			'Performance',
			'Performance',
			1,
			1,
			-1,
			'MVINDICATORSPERFORMANCE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Performance', ENLocal = 'Performance', ESLocal = 'Performance'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERFORMANCE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERFORMANCE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Performance',
			'Performance',
			'Performance',
			1,
			1,
			-1,
			'PCFACINDICATORSPERFORMANCE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Performance', ENLocal = 'Performance', ESLocal = 'Performance'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERFORMANCE'
END
GO

---------------------------------------GOALPERFORMANCE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALPERFORMANCE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta Performance',
			'Goal Performance',
			'Meta Performance',
			1,
			1,
			-1,
			'MVINDICATORSGOALPERFORMANCE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta Performance', ENLocal = 'Goal Performance', ESLocal = 'Meta Performance'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALPERFORMANCE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALPERFORMANCE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta Performance',
			'Goal Performance',
			'Meta Performance',
			1,
			1,
			-1,
			'PCFACINDICATORSGOALPERFORMANCE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta Performance', ENLocal = 'Goal Performance', ESLocal = 'Meta Performance'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALPERFORMANCE'
END
GO

---------------------------------------QUALITY---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSQUALITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qualidade',
			'Quality',
			'Calidad',
			1,
			1,
			-1,
			'MVINDICATORSQUALITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qualidade', ENLocal = 'Quality', ESLocal = 'Calidad'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSQUALITY'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSQUALITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'FTT',
			'FTT',
			'FTT',
			1,
			1,
			-1,
			'PCFACINDICATORSQUALITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'FTT', ENLocal = 'FTT', ESLocal = 'FTT'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSQUALITY'
END
GO

---------------------------------------GOALQUALITY---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALQUALITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta Qualidade',
			'Goal Quality',
			'Meta Calidad',
			1,
			1,
			-1,
			'MVINDICATORSGOALQUALITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta Qualidade', ENLocal = 'Goal Quality', ESLocal = 'Meta Calidad'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSGOALQUALITY'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALQUALITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Meta FTT',
			'Goal FTT',
			'Meta FTT',
			1,
			1,
			-1,
			'PCFACINDICATORSGOALQUALITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Meta FTT', ENLocal = 'Goal FTT', ESLocal = 'Meta FTT'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSGOALQUALITY'
END
GO

---------------------------------------TOTALTIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSTOTALTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Total',
			'Total Time',
			'Tiempo Total',
			1,
			1,
			-1,
			'MVINDICATORSTOTALTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Total', ENLocal = 'Total Time', ESLocal = 'Tiempo Total'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSTOTALTIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSTOTALTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Total',
			'Total Time',
			'Tiempo Total',
			1,
			1,
			-1,
			'PCFACINDICATORSTOTALTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Total', ENLocal = 'Total Time', ESLocal = 'Tiempo Total'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSTOTALTIME'
END
GO

---------------------------------------LOADTIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSLOADTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo de Carga',
			'Load Time',
			'Tiempo de Carga',
			1,
			1,
			-1,
			'MVINDICATORSLOADTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo de Carga', ENLocal = 'Load Time', ESLocal = 'Tiempo de Carga'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSLOADTIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSLOADTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Disponível',
			'Available Time',
			'Tiempo Disponible',
			1,
			1,
			-1,
			'PCFACINDICATORSLOADTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Disponível', ENLocal = 'Available Time', ESLocal = 'Tiempo Disponible'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSLOADTIME'
END
GO

---------------------------------------AVAILABLETIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSAVAILABLETIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Disponível',
			'Available Time',
			'Tiempo Disponible',
			1,
			1,
			-1,
			'MVINDICATORSAVAILABLETIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Disponível', ENLocal = 'Available Time', ESLocal = 'Tiempo Disponible'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSAVAILABLETIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSAVAILABLETIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Operacional',
			'Uptime',
			'Tiempo de Actividad',
			1,
			1,
			-1,
			'PCFACINDICATORSAVAILABLETIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Operacional', ENLocal = 'Uptime', ESLocal = 'Tiempo de Actividad'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSAVAILABLETIME'
END
GO

---------------------------------------WORKTIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSWORKTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Trabalhado',
			'Work Time',
			'Tiempo Trabajado',
			1,
			1,
			-1,
			'MVINDICATORSWORKTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Trabalhado', ENLocal = 'Work Time', ESLocal = 'Tiempo Trabajado'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSWORKTIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSWORKTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Trabalhado',
			'Work Time',
			'Tiempo Trabajado',
			1,
			1,
			-1,
			'PCFACINDICATORSWORKTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Trabalhado', ENLocal = 'Work Time', ESLocal = 'Tiempo Trabajado'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSWORKTIME'
END
GO

---------------------------------------PRODUCTIVEGROSSTIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPRODUCTIVEGROSSTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Produtivo Bruto',
			'Gross Productive Time',
			'Tiempo Productivo Bruto',
			1,
			1,
			-1,
			'MVINDICATORSPRODUCTIVEGROSSTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Produtivo Bruto', ENLocal = 'Gross Productive Time', ESLocal = 'Tiempo Productivo Bruto'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPRODUCTIVEGROSSTIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPRODUCTIVEGROSSTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Produtivo Bruto',
			'Gross Productive Time',
			'Tiempo Productivo Bruto',
			1,
			1,
			-1,
			'PCFACINDICATORSPRODUCTIVEGROSSTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Produtivo Bruto', ENLocal = 'Gross Productive Time', ESLocal = 'Tiempo Productivo Bruto'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPRODUCTIVEGROSSTIME'
END
GO

---------------------------------------PRODUCTIVETIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPRODUCTIVETIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Produtivo Líquido',
			'Net Productive Time',
			'Tiempo productivo neto',
			1,
			1,
			-1,
			'MVINDICATORSPRODUCTIVETIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Produtivo Líquido', ENLocal = 'Net Productive Time', ESLocal = 'Tiempo productivo neto'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPRODUCTIVETIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPRODUCTIVETIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Produtivo Líquido',
			'Net Productive Time',
			'Tiempo productivo neto',
			1,
			1,
			-1,
			'PCFACINDICATORSPRODUCTIVETIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Produtivo Líquido', ENLocal = 'Net Productive Time', ESLocal = 'Tiempo productivo neto'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPRODUCTIVETIME'
END
GO

---------------------------------------PLANNEDSTOP1---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PLANNEDSTOP1'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Parada Planejada 1',
			'Planned Stop 1',
			'Parada planificada 1',
			1,
			1,
			-1,
			'PLANNEDSTOP1')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Parada Planejada 1', ENLocal = 'Planned Stop 1', ESLocal = 'Parada planificada 1'
		WHERE IDScreen = -1
				AND TranslationKey = 'PLANNEDSTOP1'
END
GO

---------------------------------------NSHIFTTIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'NSHIFTTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Fora de Turno',
			'Off Shift Time',
			'Tiempo fuera de turno',
			1,
			1,
			-1,
			'NSHIFTTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Fora de Turno', ENLocal = 'Off Shift Time', ESLocal = 'Tiempo fuera de turno'
		WHERE IDScreen = -1
				AND TranslationKey = 'NSHIFTTIME'
END
GO

---------------------------------------PLANNEDSTOP2---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PLANNEDSTOP2'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Parada Planejada 2',
			'Planned Stop 2',
			'Parada planificada 2',
			1,
			1,
			-1,
			'PLANNEDSTOP2')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Parada Planejada 2', ENLocal = 'Planned Stop 2', ESLocal = 'Parada planificada 2'
		WHERE IDScreen = -1
				AND TranslationKey = 'PLANNEDSTOP2'
END
GO

---------------------------------------UNPLANNEDSTOP---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'UNPLANNEDSTOP'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Parada Não Planejada',
			'Unplanned Stop',
			'Parada No Planificada',
			1,
			1,
			-1,
			'UNPLANNEDSTOP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Parada Não Planejada', ENLocal = 'Unplanned Stop', ESLocal = 'Parada No Planificada'
		WHERE IDScreen = -1
				AND TranslationKey = 'UNPLANNEDSTOP'
END
GO

---------------------------------------PACE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PACE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Rítmo',
			'Pace',
			'Ritmo',
			1,
			1,
			-1,
			'PACE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Rítmo', ENLocal = 'Pace', ESLocal = 'Ritmo'
		WHERE IDScreen = -1
				AND TranslationKey = 'PACE'
END
GO

---------------------------------------SCRAP---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'SCRAP'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Refugo',
			'Scrap',
			'Basura',
			1,
			1,
			-1,
			'SCRAP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Refugo', ENLocal = 'Scrap', ESLocal = 'Basura'
		WHERE IDScreen = -1
				AND TranslationKey = 'SCRAP'
END
GO

---------------------------------------REWORK---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'REWORK'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Retrabalho',
			'Rework',
			'Retrabajo',
			1,
			1,
			-1,
			'REWORK')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Retrabalho', ENLocal = 'Rework', ESLocal = 'Retrabajo'
		WHERE IDScreen = -1
				AND TranslationKey = 'REWORK'
END
GO

---------------------------------------PERCENTTEEP---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTTEEP'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% TEEP',
			'% TEEP',
			'% TEEP',
			1,
			1,
			-1,
			'MVINDICATORSTEEP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% TEEP', ENLocal = '% TEEP', ESLocal = '% TEEP'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTTEEP'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTTEEP'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% AE',
			'% AE',
			'% AE',
			1,
			1,
			-1,
			'PCFACINDICATORSPERCENTTEEP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% AE', ENLocal = '% AE', ESLocal = '% AE'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTTEEP'
END
GO

---------------------------------------PERCENTOE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTOE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% OE',
			'% OE',
			'% OE',
			1,
			1,
			-1,
			'MVINDICATORSPERCENTOE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% OE', ENLocal = '% OE', ESLocal = '% OE'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSOE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTOE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% OEE',
			'% OEE',
			'% OEE',
			1,
			1,
			-1,
			'PCFACINDICATORSPERCENTOE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% OEE', ENLocal = '% OEE', ESLocal = '% OEE'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTOE'
END
GO

---------------------------------------PERCENTUTILIZATION---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTUTILIZATION'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% Utilização',
			'% Utilization',
			'% Usar',
			1,
			1,
			-1,
			'MVINDICATORSPERCENTUTILIZATION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% Utilização', ENLocal = '% Utilization', ESLocal = '% Usar'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTUTILIZATION'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTUTILIZATION'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% Disponibilidade',
			'% Availability',
			'% Disponibilidad',
			1,
			1,
			-1,
			'PCFACINDICATORSPERCENTUTILIZATION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% Disponibilidade', ENLocal = '% Availability', ESLocal = '% Disponibilidad'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTUTILIZATION'
END
GO

---------------------------------------PERCENTOEE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTOEE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% OEE',
			'% OEE',
			'% OEE',
			1,
			1,
			-1,
			'MVINDICATORSPERCENTOEE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% OEE', ENLocal = '% OEE', ESLocal = '% OEE'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTOEE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTOEE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% Produtividade',
			'% Productivity',
			'% Productividad',
			1,
			1,
			-1,
			'PCFACINDICATORSPERCENTOEE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% Produtividade', ENLocal = '% Productivity', ESLocal = '% Productividad'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTOEE'
END
GO

---------------------------------------PERCENTAVAILABILITY---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTAVAILABILITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% Disponibilidade',
			'% Availability',
			'% Disponibilidad',
			1,
			1,
			-1,
			'MVINDICATORSPERCENTAVAILABILITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% Disponibilidade', ENLocal = '% Availability', ESLocal = '% Disponibilidad'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTAVAILABILITY'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTAVAILABILITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% Utilização',
			'% Utilization',
			'% Usar',
			1,
			1,
			-1,
			'PCFACINDICATORSPERCENTAVAILABILITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% Utilização', ENLocal = '% Utilization', ESLocal = '% Usar'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTAVAILABILITY'
END
GO

---------------------------------------PERCENTPERFORMANCE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTPERFORMANCE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% Performance',
			'% Performance',
			'% Performance',
			1,
			1,
			-1,
			'MVINDICATORSPERCENTPERFORMANCE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% Performance', ENLocal = '% Performance', ESLocal = '% Performance'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTPERFORMANCE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTPERFORMANCE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% Performance',
			'% Performance',
			'% Performance',
			1,
			1,
			-1,
			'PCFACINDICATORSPERCENTPERFORMANCE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% Performance', ENLocal = '% Performance', ESLocal = '% Performance'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTPERFORMANCE'
END
GO

---------------------------------------PERCENTQUALITY---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTQUALITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% Qualidade',
			'% Quality',
			'% Calidad',
			1,
			1,
			-1,
			'MVINDICATORSPERCENTQUALITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% Qualidade', ENLocal = '% Quality', ESLocal = '% Calidad'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSPERCENTQUALITY'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTQUALITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'% FTT',
			'% FTT',
			'% FTT',
			1,
			1,
			-1,
			'PCFACINDICATORSPERCENTQUALITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = '% FTT', ENLocal = '% FTT', ESLocal = '% FTT'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSPERCENTQUALITY'
END
GO

---------------------------------------SHORTTEEP---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTTEEP'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'TEEP',
			'TEEP',
			'TEEP',
			1,
			1,
			-1,
			'MVINDICATORSSHORTTEEP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'TEEP', ENLocal = 'TEEP', ESLocal = 'TEEP'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTTEEP'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTTEEP'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'AE',
			'AE',
			'AE',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTTEEP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'AE', ENLocal = 'AE', ESLocal = 'AE'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTTEEP'
END
GO

---------------------------------------SHORTOE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTOE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'OE',
			'OE',
			'OE',
			1,
			1,
			-1,
			'MVINDICATORSSHORTOE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'OE', ENLocal = 'OE', ESLocal = 'OE'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTOE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTOE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'OEE',
			'OEE',
			'OEE',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTOE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'OEE', ENLocal = 'OEE', ESLocal = 'OEE'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTOE'
END
GO

---------------------------------------SHORTUTILIZATION---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTUTILIZATION'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Util.',
			'Util.',
			'Usar',
			1,
			1,
			-1,
			'MVINDICATORSSHORTUTILIZATION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Util.', ENLocal = 'Util.', ESLocal = 'Usar'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTUTILIZATION'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTUTILIZATION'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Disp.',
			'Avail.',
			'Disp.',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTUTILIZATION')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Disp.', ENLocal = 'Avail.', ESLocal = 'Disp.'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTUTILIZATION'
END
GO

---------------------------------------SHORTOEE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTOEE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'OEE',
			'OEE',
			'OEE',
			1,
			1,
			-1,
			'MVINDICATORSSHORTOEE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'OEE', ENLocal = 'OEE', ESLocal = 'OEE'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTOEE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTOEE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Prod.',
			'Prod.',
			'Prod.',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTOEE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Prod.', ENLocal = 'Prod.', ESLocal = 'Prod.'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTOEE'
END
GO

---------------------------------------SHORTAVAILABILITY---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTAVAILABILITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Disp.',
			'Avail.',
			'Disp.',
			1,
			1,
			-1,
			'MVINDICATORSSHORTAVAILABILITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Disp.', ENLocal = 'Avail.', ESLocal = 'Disp.'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTAVAILABILITY'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTAVAILABILITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Util.',
			'Util.',
			'Usar',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTAVAILABILITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Util.', ENLocal = 'Util.', ESLocal = 'Usar'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTAVAILABILITY'
END
GO

---------------------------------------SHORTPERFORMANCE---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTPERFORMANCE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Perf.',
			'Perf.',
			'Perf.',
			1,
			1,
			-1,
			'MVINDICATORSSHORTPERFORMANCE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Perf.', ENLocal = 'Perf.', ESLocal = 'Perf.'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTPERFORMANCE'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTPERFORMANCE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Perf.',
			'Perf.',
			'Perf.',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTPERFORMANCE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Perf.', ENLocal = 'Perf.', ESLocal = 'Perf.'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTPERFORMANCE'
END
GO

---------------------------------------SHORTQUALITY---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTQUALITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qualidade',
			'Quality',
			'Calidad',
			1,
			1,
			-1,
			'MVINDICATORSSHORTQUALITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qualidade', ENLocal = 'Quality', ESLocal = 'Calidad'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTQUALITY'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTQUALITY'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'FTT',
			'FTT',
			'FTT',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTQUALITY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'FTT', ENLocal = 'FTT', ESLocal = 'FTT'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTQUALITY'
END
GO

---------------------------------------SHORTTOTALTIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTTOTALTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Total',
			'Total Time',
			'Tiempo Total',
			1,
			1,
			-1,
			'MVINDICATORSSHORTTOTALTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Total', ENLocal = 'Total Time', ESLocal = 'Tiempo Total'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTTOTALTIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTTOTALTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Total',
			'Total Time',
			'Tiempo Total',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTTOTALTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Total', ENLocal = 'Total Time', ESLocal = 'Tiempo Total'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTTOTALTIME'
END
GO

---------------------------------------SHORTLOADTIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTLOADTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Temp. Carga',
			'Load Time',
			'Tiemp. Carga',
			1,
			1,
			-1,
			'MVINDICATORSSHORTLOADTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Temp. Carga', ENLocal = 'Load Time', ESLocal = 'Tiemp. Carga'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTLOADTIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTLOADTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Disp.',
			'Avail. Time',
			'Tiempo Disp.',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTLOADTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Disp.', ENLocal = 'Avail. Time', ESLocal = 'Tiempo Disp.'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTLOADTIME'
END
GO

---------------------------------------SHORTAVAILABLETIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTAVAILABLETIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Disp.',
			'Avail. Time',
			'Tiempo Disp.',
			1,
			1,
			-1,
			'MVINDICATORSSHORTAVAILABLETIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Disp.', ENLocal = 'Avail. Time', ESLocal = 'Tiempo Disp.'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTAVAILABLETIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTAVAILABLETIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Opera.',
			'Uptime',
			'Tiempo de Activ.',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTAVAILABLETIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Opera.', ENLocal = 'Uptime', ESLocal = 'Tiempo de Activ.'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTAVAILABLETIME'
END
GO

---------------------------------------SHORTWORKTIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTWORKTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Trab.',
			'Work Time',
			'Tiempo Trab.',
			1,
			1,
			-1,
			'MVINDICATORSSHORTWORKTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Trab.', ENLocal = 'Work Time', ESLocal = 'Tiempo Trab.'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTWORKTIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTWORKTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Trab.',
			'Work Time',
			'Tiempo Trab.',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTWORKTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Trab.', ENLocal = 'Work Time', ESLocal = 'Tiempo Trab.'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTWORKTIME'
END
GO

---------------------------------------SHORTPRODUCTIVEGROSSTIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTPRODUCTIVEGROSSTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Prod. Bruto',
			'Gross Prod. Time',
			'Tiempo Prod. Bruto',
			1,
			1,
			-1,
			'MVINDICATORSSHORTPRODUCTIVEGROSSTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Prod. Bruto', ENLocal = 'Gross Prod. Time', ESLocal = 'Tiempo Prod. Bruto'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTPRODUCTIVEGROSSTIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTPRODUCTIVEGROSSTIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Prod. Bruto',
			'Gross Prod. Time',
			'Tiempo Productivo Bruto',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTPRODUCTIVEGROSSTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Prod. Bruto', ENLocal = 'Gross Prod. Time', ESLocal = 'Tiempo Prod. Bruto'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTPRODUCTIVEGROSSTIME'
END
GO

---------------------------------------SHORTPRODUCTIVETIME---------------------------------------
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTPRODUCTIVETIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Prod. Líq.',
			'Net Prod. Time',
			'Tiempo prod. neto',
			1,
			1,
			-1,
			'MVINDICATORSSHORTPRODUCTIVETIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Prod. Líq.', ENLocal = 'Net Prod. Time', ESLocal = 'Tiempo prod. neto'
		WHERE IDScreen = -1
				AND TranslationKey = 'MVINDICATORSSHORTPRODUCTIVETIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTPRODUCTIVETIME'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Prod. Líq.',
			'Net Prod. Time',
			'Tiempo prod. neto',
			1,
			1,
			-1,
			'PCFACINDICATORSSHORTPRODUCTIVETIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Prod. Líq.', ENLocal = 'Net Prod. Time', ESLocal = 'Tiempo prod. neto'
		WHERE IDScreen = -1
				AND TranslationKey = 'PCFACINDICATORSSHORTPRODUCTIVETIME'
END
GO
--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'ELAPSEDTIME'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Tempo Decorrido',
			'Elapsed Time',
			'Tiempo Transcurrido',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'ELAPSEDTIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Decorrido', ENLocal = 'Elapsed Time' , ESLocal = 'Tiempo Transcurrido'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'ELAPSEDTIME'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'CONFIRMED'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Confirmado',
			'Confirmed',
			'Confirmado',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'CONFIRMED')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Confirmado', ENLocal = 'Confirmed' , ESLocal = 'Confirmado'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'CONFIRMED'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'TOTAL'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Total',
			'Total',
			'Total',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'TOTAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Total', ENLocal = 'Total' , ESLocal = 'Total'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'TOTAL'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'TOTAL'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Total',
			'Total',
			'Total',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'TOTAL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Total', ENLocal = 'Total' , ESLocal = 'Total'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'TOTAL'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'UNVALUED'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Não Validados Mesmo Dia',
			'Not Validated Same Day',
			'No validado el mismo día',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'UNVALUED')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Não Validados Mesmo Dia', ENLocal = 'Not Validated Same Day' , ESLocal = 'No validado el mismo día'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'UNVALUED'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'TOTALVALIDATED'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Validados 100%',
			'100% Validated',
			'Validado 100%',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'TOTALVALIDATED')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Validados 100%', ENLocal = '100% Validated' , ESLocal = 'Validado 100%'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'TOTALVALIDATED'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'VALIDATED'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Validados',
			'Validated',
			'Validado',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'VALIDATED')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Validados', ENLocal = 'Validated' , ESLocal = 'Validado'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'VALIDATED'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'DISAPPROVED'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Reprovados',
			'Disapproved',
			'Fallido',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'DISAPPROVED')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Reprovados', ENLocal = 'Disapproved' , ESLocal = 'Fallido'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'DISAPPROVED'
END
GO

--Tradução
IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'TOBEVALIDATED'
			)
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'A Validar',
			'To be Validated',
			'Deberá ser Validada',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),
			'TOBEVALIDATED')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'A validar', ENLocal = 'To be Validated' , ESLocal = 'Deberá ser Validada'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0148'
			AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
				AND TranslationKey = 'TOBEVALIDATED'
END
GO

IF NOT EXISTS (SELECT IDPref FROM TBLPrefs WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'MAINVIEW' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) 
		AND [NAME] = 'INDICATORS' 
			AND IDUser = (SELECT IDUser FROM TBLUSER WHERE Code = 'ADMIN'))
BEGIN

	INSERT INTO TBLPrefs (
		IDUser,
		IDScreen, 
		[Name], 
		[Preference]
	) 
	VALUES (
		(SELECT IDUser FROM TBLUser WHERE Code = 'ADMIN'), 
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'MAINVIEW' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), 
		'INDICATORS',
		'MVINDICATORS'
	)
END
GO
if exists (select IDScreenFields from TBLScreenFields where IDScreen = 
				(select IDScreen from TBLScreen where Code = 'G0050' AND IDAplication = 
								(select IDAplication from TBLAplication where Code = 'PCF4View')) AND TableName = 'GoodPieces')

begin

update TBLScreenFields set DefaultValue = 'true' where IDScreen = (select IDScreen from TBLScreen where Code = 'G0050' AND IDAplication = 
								(select IDAplication from TBLAplication where Code = 'PCF4View')) AND TableName = 'GoodPieces'

end
go

