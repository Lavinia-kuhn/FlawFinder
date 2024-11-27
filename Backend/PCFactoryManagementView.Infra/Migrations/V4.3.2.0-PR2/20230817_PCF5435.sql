-- --------------------------------------------------------------------------------------
-- ----------------PILAR (CRIAÇÃO DO PILAR DE LOGÍSTICA)----------------
-- --------------------------------------------------------------------------------------
-- Inserção do Pilar de logística

IF NOT EXISTS (
    SELECT IDScreenMenu FROM TBLScreenMenus
    WHERE IDSuperiorScreenMenu = (Select IDScreenMenu FROM TBLScreenMenus WHERE Code =	'PCF4View')
    AND Code = 'VIEW_MENU_LOGISTICA'
)
BEGIN
    INSERT INTO TBLScreenMenus (
        IDSuperiorScreenMenu,
        MenuOrder,
        Code,
        FlgEnable
    )
    VALUES (
        (Select IDScreenMenu FROM TBLScreenMenus WHERE Code =	'PCF4View'),
        1,
        'VIEW_MENU_LOGISTICA',
        1
    )
END
GO


-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0106–Alarme de Tarefa de Separação

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)
                VALUES ('G0106', 'G0106–Alarme de Tarefa de Separação', 'G0106–Separation Task Alarm', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)
END
GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0106–Alarme de Tarefa de Separação

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM')
BEGIN
                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
                VALUES (
                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106'
                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())
END
GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0106–Alarme de Tarefa de Separação

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (
                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))
BEGIN
                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
                VALUES (
                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =
                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106'
                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())
END
GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0106–Alarme de Tarefa de Separação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0106'
                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_LOGISTICA'))
BEGIN
                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)
                VALUES ('VIEW_MENU_G0106', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_LOGISTICA'), 19, 1, 'G0106',
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/log/G0106')
END
GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0106
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0106'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('G0106-Alarme de Tarefa de Separação','G0106-Separation Task Alarm', 'G0106-Alarma de tarea de clasificación',1,1,'VIEW_MENU_G0106',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0106

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0106', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart' AND DefaultValue = 'G0106/v1/Table')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0106', 'table', 'ReportChart', 'TABLETAB',1, 'G0106/v1/Table',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTRO DE TEMPOS --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'TASKSTATUSFILTER'
AND TableName = 'TASKSTATUSFILTER'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('TASKSTATUSFILTER', 'TASKSTATUSFILTER', 'FilterOptions','checkbox', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Todos os Status
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'ALLSTATUS'
AND TableName = 'ALLSTATUS'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ALLSTATUS', 'ALLSTATUS', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Aguardando Liberação 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'AWAITINGRELEASE'
AND TableName = 'AWAITINGRELEASE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('AWAITINGRELEASE', 'AWAITINGRELEASE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--Fila de Coleta
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'COLLECTIONQUEUE'
AND TableName = 'COLLECTIONQUEUE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('COLLECTIONQUEUE', 'COLLECTIONQUEUE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Em Coleta 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'COLLECT'
AND TableName = 'COLLECT'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('COLLECT', 'COLLECT', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Fila de Separação
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'PICKQUEUE'
AND TableName = 'PICKQUEUE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('PICKQUEUE', 'PICKQUEUE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Em Separação 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'SEPARATION'
AND TableName = 'SEPARATION'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('SEPARATION', 'SEPARATION', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Fila de Checkout  
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'CHECHKOUTQUEUE'
AND TableName = 'CHECHKOUTQUEUE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CHECHKOUTQUEUE', 'CHECHKOUTQUEUE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,6,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Em Checkout
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'CHECHKOUT'
AND TableName = 'CHECHKOUT'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CHECHKOUT', 'CHECHKOUT', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,7,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Concluído
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'DONE'
AND TableName = 'DONE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('DONE', 'DONE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,8,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Cancelado
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'CANCELED'
AND TableName = 'CANCELED'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CANCELED', 'CANCELED', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,9,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0106' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0107–Alarme de Tarefa de Transporte

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)
                VALUES ('G0107', 'G0107–Alarme de Tarefa de Transporte', 'G0107–Transport Task Alarm', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)
END
GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0107–Alarme de Tarefa de Transporte

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM')
BEGIN
                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
                VALUES (
                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107'
                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())
END
GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0107–Alarme de Tarefa de Transporte

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (
                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))
BEGIN
                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
                VALUES (
                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =
                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107'
                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())
END
GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0107–Alarme de Tarefa de Transporte

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0107'
                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_LOGISTICA'))
BEGIN
                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)
                VALUES ('VIEW_MENU_G0107', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_LOGISTICA'), 19, 1, 'G0107',
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/log/G0107')
END
GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0107
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0107'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('G0107-Alarme de Tarefa de Transporte','G0107-Transport Task Alarm', 'G0107-Alarma de tarea de transporte',1,1,'VIEW_MENU_G0107',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0107

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0107', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart' AND DefaultValue = 'G0107/v1/Table')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0107', 'table', 'ReportChart', 'TABLETAB',1, 'G0107/v1/Table',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTRO DE TEMPOS --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'TASKSTATUSFILTER'
AND TableName = 'TASKSTATUSFILTER'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('TASKSTATUSFILTER', 'TASKSTATUSFILTER', 'FilterOptions','checkbox', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Todos os Status
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'ALLSTATUS'
AND TableName = 'ALLSTATUS'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ALLSTATUS', 'ALLSTATUS', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Aguardando Liberação 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'AWAITINGRELEASE'
AND TableName = 'AWAITINGRELEASE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('AWAITINGRELEASE', 'AWAITINGRELEASE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--Fila de Coleta
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'COLLECTIONQUEUE'
AND TableName = 'COLLECTIONQUEUE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('COLLECTIONQUEUE', 'COLLECTIONQUEUE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Em Coleta 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'COLLECT'
AND TableName = 'COLLECT'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('COLLECT', 'COLLECT', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Fila de Separação
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'PICKQUEUE'
AND TableName = 'PICKQUEUE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('PICKQUEUE', 'PICKQUEUE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Em Separação 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'SEPARATION'
AND TableName = 'SEPARATION'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('SEPARATION', 'SEPARATION', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Fila de Checkout  
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'CHECHKOUTQUEUE'
AND TableName = 'CHECHKOUTQUEUE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CHECHKOUTQUEUE', 'CHECHKOUTQUEUE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,6,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Em Checkout
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'CHECHKOUT'
AND TableName = 'CHECHKOUT'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CHECHKOUT', 'CHECHKOUT', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,7,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Concluído
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'DONE'
AND TableName = 'DONE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('DONE', 'DONE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,8,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Cancelado
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'CANCELED'
AND TableName = 'CANCELED'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CANCELED', 'CANCELED', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,9,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0107' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Traduções

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Stauts_5'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('05 - Aguardando Liberação','05 - Awaiting Release', '05 - Esperando Liberación',1,1,'TBLLog_Stauts_5',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Stauts_10'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('10 - Fila de Coleta','10 - Collection Queue', '10 - Cola de Recolección',1,1,'TBLLog_Stauts_10',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Stauts_20'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('20 - Em Coleta','20 - In Collection', '20 - En Recolección',1,1,'TBLLog_Stauts_20',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Stauts_30'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('30 - Fila de Separação','30 - Pick Queue', '30 - Cola de Separación',1,1,'TBLLog_Stauts_30',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Stauts_40'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('40 - Em Separação','40 - In Separation', '40 - En Separación',1,1,'TBLLog_Stauts_40',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Stauts_50'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('50 - Fila de Checkout','50 - Checkout Queue', '50 - Cola de Checkout',1,1,'TBLLog_Stauts_50',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Stauts_60'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('60 - Em Checkout','60 - In Checkout', '60 - En Checkout',1,1,'TBLLog_Stauts_60',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Stauts_70'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('70 - Concluído','70 - Completed', '70 - Completado',1,1,'TBLLog_Stauts_70',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Stauts_100'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('100 - Cancelado','100 - Cancelled', '100 - Cancelado',1,1,'TBLLog_Stauts_100',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO