-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0105–Indicadores BTS

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0105', 'G0105–Matriz de Habilidades', 'G0105–Skills Matrix', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0135–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0135–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0105'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0105', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'), 27, 1, 'G0105',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0105')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0135
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0105'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0105-Matriz de Habilidades','G0105-Skill Matrix', 'G0105-Matriz de Habilidades',1,1,'VIEW_MENU_G0105',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'RESTAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0105', 'ReportTab', 'ReportTab', 'REPORT',1, 'RESTAB',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'RESTAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0105', 'heatmap', 'ReportChart', 'RESTAB' , 1, 'G0105/v1/GetResourceHeatmap',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TRAININGTAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0105', 'ReportTab', 'ReportTab', 'REPORT',1, 'TRAININGTAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TRAININGTAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0105', 'heatmap', 'ReportChart', 'TRAININGTAB' , 1, 'G0105/v1/GetTrainingHeatmap',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'VERSATILITYTAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0105', 'ReportTab', 'ReportTab', 'REPORT',1, 'VERSATILITYTAB',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'VERSATILITYTAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0105', 'threegauges', 'ReportChart', 'VERSATILITYTAB' , 1, 'G0105/v1/GetVersatility',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'RESTAB'
AND FieldName = 'UserCode'
AND TableName = 'userCode'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('userCode', 'UserCode', 'FilterOptions','text', 'RESTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TRAININGTAB'
AND FieldName = 'UserCode'
AND TableName = 'userCode'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('userCode', 'UserCode', 'FilterOptions','text', 'TRAININGTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'VERSATILITYTAB'
AND FieldName = 'UserCode'
AND TableName = 'userCode'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('userCode', 'UserCode', 'FilterOptions','text', 'VERSATILITYTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'RESTAB'
AND FieldName = 'GrpUserCode'
AND TableName = 'grpUserCode'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('grpUserCode', 'GrpUserCode', 'FilterOptions','text', 'RESTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TRAININGTAB'
AND FieldName = 'GrpUserCode'
AND TableName = 'grpUserCode'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('grpUserCode', 'GrpUserCode', 'FilterOptions','text', 'TRAININGTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'VERSATILITYTAB'
AND FieldName = 'GrpUserCode'
AND TableName = 'grpUserCode'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('grpUserCode', 'GrpUserCode', 'FilterOptions','text', 'VERSATILITYTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'userCode'
AND FieldName = 'UserCode'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('UserCode', 'UserCode', 'FilterValues','text', 'userCode' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'grpUserCode'
AND FieldName = 'GrpUserCode'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('GrpUserCode', 'GrpUserCode', 'FilterValues','text', 'grpUserCode' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterDate' AND DefaultValue = 'RESTAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0105', 'MainFilterDate', 'MainFilterDate', 'RESTAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterDate' AND DefaultValue = 'TRAININGTAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0105', 'MainFilterDate', 'MainFilterDate', 'TRAININGTAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterDate' AND DefaultValue = 'VERSATILITYTAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0105', 'MainFilterDate', 'MainFilterDate', 'VERSATILITYTAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterTreeView'
AND GroupName = 'TRAININGTAB'
AND FieldName = 'MainFilterTreeView'
AND TableName = 'G0105')
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0105', 'MainFilterTreeView', 'MainFilterTreeView', NULL, 'TRAININGTAB' , 0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'VERSATILITYTAB'
AND FieldName = 'ResCount'
AND TableName = 'resCount'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('resCount', 'ResCount', 'FilterOptions','text', 'VERSATILITYTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'resCount'
AND FieldName = 'resCounttxt'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('resCount', 'resCounttxt', 'FilterValues','text', 'resCount' , 1, '3',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'VERSATILITYTAB'
AND FieldName = 'UserCount'
AND TableName = 'userCount'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('userCount', 'UserCount', 'FilterOptions','text', 'VERSATILITYTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'userCount'
AND FieldName = 'userCounttxt'
AND FieldType = 'text')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('userCount', 'userCounttxt', 'FilterValues','text', 'userCount' , 1, '3',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (
    SELECT IDLocalization
    FROM TBLLocalizations
    WHERE IDScreen = -1 
    AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
    AND TranslationKey = 'VIEW_GLOBAL_SEMCADASTRO'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
        VALUES (
            (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
            'Sem cadastro',
            'No record',
			'Sin registro',
            1,
            1,
            -1,
            'VIEW_GLOBAL_SEMCADASTRO')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Sem Cadastro', ENLocal = 'No record' , ESLocal = 'Sin registro'
    WHERE IDScreen = -1
    AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
    AND TranslationKey = 'VIEW_GLOBAL_SEMCADASTRO'
END
GO

IF NOT EXISTS (
    SELECT IDLocalization
    FROM TBLLocalizations
    WHERE IDScreen = -1 
    AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
    AND TranslationKey = '100APTO'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
        VALUES (
            (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
            'Pessoas Aptas a trabalhar em todas as máquinas (%)',
            'People Able to work on all machines (%)',
			'Personas Capaces de trabajar en todas las máquinas (%)',
            1,
            1,
            -1,
            '100APTO')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET
		PTLocal = 'Pessoas Aptas a trabalhar em todas as máquinas (%)', 
		ENLocal = 'People Able to work on all machines (%)', 
		ESLocal = 'Personas Capaces de trabajar en todas las máquinas (%)'
    WHERE IDScreen = -1
    AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
    AND TranslationKey = '100APTO'
END
GO


IF NOT EXISTS (
    SELECT IDLocalization
    FROM TBLLocalizations
    WHERE IDScreen = -1 
    AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
    AND TranslationKey = 'RESBYUSR'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
        VALUES (
            (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
            'Percentual de recursos com mais de X pessoas aptas a trabalharem nele',
            'Percentage of resources with more than X operators able to work on it',
			'Porcentaje de recursos con más de X operadores capaces de trabajar en él',
            1,
            1,
            -1,
            'RESBYUSR')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET 
PTLocal = 'Percentual de recursos com mais de X operadores aptos a trabalharem nele', 
ENLocal = 'Percentage of resources with more than X operators able to work on it' , 
ESLocal = 'Porcentaje de recursos con más de X operadores capaces de trabajar en él'
    WHERE IDScreen = -1
    AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
    AND TranslationKey = 'RESBYUSR'
END
GO


IF NOT EXISTS (
    SELECT IDLocalization
    FROM TBLLocalizations
    WHERE IDScreen = -1 
    AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
    AND TranslationKey = 'USRBYRES'
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
        VALUES (
            (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
            'Percentual de operadores aptas a trabalhar em mais de X recursos',
            'Percentage of operators able to work on more than X resources',
			'Porcentaje de operadores capaces de trabajar en más de X recursos',
            1,
            1,
            -1,
            'USRBYRES')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET 
PTLocal = 'Percentual de operadores aptas a trabalhar em mais de X recursos', 
ENLocal = 'Percentage of operators able to work on more than X resources' , 
ESLocal = 'Porcentaje de operadores capaces de trabajar en más de X recursos'
    WHERE IDScreen = -1
    AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
    AND TranslationKey = 'USRBYRES'
END
GO