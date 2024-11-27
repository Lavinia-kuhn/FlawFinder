-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0021–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0021', 'G0021–Gestão de Ciclos', 'G0021–Cycle Management', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

IF EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
	UPDATE TBLScreen set Name = 'G0021–Gestão de Ciclos', NameEN = 'G0021–Cycle Management' where IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
END

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0021–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0021–Relatório de DTM OEE

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0021'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0021', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'), 17, 1, 'G0021',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0021')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0021
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0021'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0021-Gestão de Ciclos','G0021-Cycle Management', 'G0021-Gerenciamento Ciclo',1,1,'VIEW_MENU_G0021',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO


-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0021

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0021', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0021

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldType, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0021', 'tree', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0021/v1/Table',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TABLETAB'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Ev. com Ciclos',
			'Ev. with Cycles',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'TABLETAB')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Ev. com Ciclos', ENLocal = 'Ev. with Cycles' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TABLETAB'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Recurso',
			'Resource Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'RESCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Recurso', ENLocal = 'Resource Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Recurso',
			'Resource Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'RESNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Recurso', ENLocal = 'Resource Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESNICKNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Apelido Recurso',
			'Resource Nickname',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'RESNICKNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Apelido Recurso', ENLocal = 'Resource Nickname' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESNICKNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESNICKNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Apelido Recurso',
			'Resource Nickname',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'RESNICKNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Apelido Recurso', ENLocal = 'Resource Nickname' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'RESNICKNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DTPROD'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Data de Produção',
			'Production Date',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'DTPROD')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Data de Produção', ENLocal = 'Production Date' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DTPROD'
END
GO


IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'SHIFT'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Turno',
			'Shift',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'SHIFT')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Turno', ENLocal = 'Shift' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'SHIFT'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DTTIMESTAMP'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Data Apont.',
			'Date/Time',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'DTTIMESTAMP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Data Apont.', ENLocal = 'Date/Time' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DTTIMESTAMP'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'SHIFTDTSTART'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Data Ini. Evento',
			'Event Start Date',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'SHIFTDTSTART')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Data Ini. Evento', ENLocal = 'Event Start Date' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'SHIFTDTSTART'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'SHIFTDTEND'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Data Final Evento',
			'Event End Date',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'SHIFTDTEND')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Data Final Evento', ENLocal = 'Event End Date' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'SHIFTDTEND'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TIMELINE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Linha do Tempo',
			'Timeline',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'TIMELINE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Linha do Tempo', ENLocal = 'Timeline' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TIMELINE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WOHDCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Ordem',
			'Work Order Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'WOHDCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Ordem', ENLocal = 'Work Order Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WOHDCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Operação',
			'Oper. Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'WODETCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Operação', ENLocal = 'Oper. Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODUCTCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Produto',
			'Product Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'PRODUCTCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Produto', ENLocal = 'Product Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODUCTCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODUCTNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Produto',
			'Product Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'PRODUCTNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Produto', ENLocal = 'Product Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODUCTNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TOOLINGCODE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cód. Ferramenta',
			'Tooling Code',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'TOOLINGCODE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cód. Ferramenta', ENLocal = 'Tooling Code' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TOOLINGCODE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TOOLINGNAME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Nome Ferramenta',
			'Tooling Name',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'TOOLINGNAME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Nome Ferramenta', ENLocal = 'Tooling Name' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TOOLINGNAME'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'STDSPEED'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Vel. Padrão',
			'Std. Speed',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'STDSPEED')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Tempo Padrão', ENLocal = 'Std. Speed' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'STDSPEED'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'STDSPEEDFORMAT'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Formato Tempo Padrão',
			'Std. Speed Format',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'STDSPEEDFORMAT')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Formato Tempo Padrão', ENLocal = 'Std. Speed Format' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'STDSPEEDFORMAT'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UNIT1FACTOR'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Cavidades',
			'Cavities',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'UNIT1FACTOR')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Cavidades', ENLocal = 'Cavities' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'UNIT1FACTOR'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'QTDPROD'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qtd. Prod. Turno',
			'Shift Prod. Qty.',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'QTDPROD')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qtd. Prod. Turno', ENLocal = 'Shift Prod. Qty.' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'QTDPROD'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'QTDSCRAP'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qtd. Refugada Turno',
			'Shift Scrap Qty.',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'QTDSCRAP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qtd. Refugada Turno', ENLocal = 'Shift Scrap Qty.' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'QTDSCRAP'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'QTDREWORK'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qtd. Retrabalhada Turno',
			'Shift Rework. Qty.',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'QTDREWORK')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qtd. Retrabalhada Turno', ENLocal = 'Shift Rework Qty.' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'QTDREWORK'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'POINT'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Ponto',
			'Point',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'POINT')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Ponto', ENLocal = 'Point' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'POINT'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DATETIME'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Data/hora',
			'Date/Time',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'DATETIME')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Data/Hora', ENLocal = 'Date/Time' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DATETIME'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VALUE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Valor',
			'Value',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'VALUE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Valor', ENLocal = 'Value' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'VALUE'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TOOL'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Ferramenta',
			'Tooling',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'TOOL')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Ferramenta', ENLocal = 'Tooling' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'TOOL'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PERF'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Performance',
			'Performance',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'PERF')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Performance', ENLocal = 'Performance' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PERF'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'EFFICIENCY'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Eficiencia',
			'Efficiency',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'EFFICIENCY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Eficiencia', ENLocal = 'Efficiency' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'EFFICIENCY'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DEFAULTCYCLE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Ciclo Padrão',
			'Default Cycle',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'DEFAULTCYCLE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Ciclo Padrão', ENLocal = 'Default Cycle' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DEFAULTCYCLE'
END
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'AVGCYCLE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Ciclo Médio',
			'Average Cycle',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'AVGCYCLE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Ciclo Médio', ENLocal = 'Average Cycle' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'AVGCYCLE'
END
GO
GO
IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DRILLDOWNTITLE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Ciclos',
			'Cycles',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'DRILLDOWNTITLE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Ciclos', ENLocal = 'Cycles' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DRILLDOWNTITLE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODUCTIONEVTYPE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Modo de Operação',
			'Operational Mode',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'PRODUCTIONEVTYPE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Modo de Operação', ENLocal = 'Operational Mode' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'PRODUCTIONEVTYPE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WOHDTOTALQTY'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qtd. Prev. Ordem',
			'WO. Prev. Qty',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'WOHDTOTALQTY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qtd. Prev. Ordem', ENLocal = 'WO. Prev. Qty' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WOHDTOTALQTY'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETQTY'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qtd. Prev. Oper.',
			'Oper. Prev. Qty',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'WODETQTY')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qtd. Prev. Oper.', ENLocal = 'Oper. Prev. Qty' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETQTY'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETPROD'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qtd. Prod. Oper.',
			'Oper. Qty',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'WODETPROD')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qtd. Prod. Oper.', ENLocal = 'Oper. Qty' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETPROD'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETPROD'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qtd. Prod. Oper.',
			'Oper. Qty',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'WODETPROD')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qtd. Prod. Oper.', ENLocal = 'Oper. Qty' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETPROD'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETSCRAP'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qtd. Refugada Oper.',
			'Oper. Scrap Qty',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'WODETSCRAP')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qtd. Refugada Oper.', ENLocal = 'Oper. Scrap Qty' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETSCRAP'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETREWORK'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Qtd. Retrab. Oper.',
			'Oper. Rework Qty',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'WODETREWORK')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Qtd. Retrab. Oper.', ENLocal = 'Oper. Rework Qty' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'WODETREWORK'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DIFFSTDCYCLE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Atenção: foram encontrados tempos de ciclo divergentes ou nulos entre a(s) OP/Operação(ões) alocada(s) neste recurso. O Gráfico não será plotado.',
			'Attention: diverging or null cycle times were found between OPs/Operations allocated in this resource. The Chart will not be plotted.',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'DIFFSTDCYCLE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Atenção: foram encontrados tempos de ciclo divergentes ou nulos entre a(s) OP/Operação(ões) alocada(s) neste recurso. O Gráfico não será plotado.', ENLocal = 'Attention: diverging or null cycle times were found between OPs/Operations allocated in this resource. The Chart will not be plotted.' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'DIFFSTDCYCLE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
	FROM TBLLocalizations
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') 
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'MESSAGE'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Mensagem',
			'Message',
			1,
			1,
			(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021'),
			'MESSAGE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Mensagem', ENLocal = 'Message' 
	WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021')
	AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
	AND TranslationKey = 'MESSAGE'
END
GO



