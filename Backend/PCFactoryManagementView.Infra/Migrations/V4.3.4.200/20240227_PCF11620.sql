-- --------------------------------------------------------------------------------------
-- ----------------PILAR (CRIAÇÃO DO PILAR DE MISCELÂNEA)----------------
-- --------------------------------------------------------------------------------------
-- Inserção do Pilar de miscelãnea

IF NOT EXISTS (
    SELECT IDScreenMenu FROM TBLScreenMenus
    WHERE IDSuperiorScreenMenu = (Select IDScreenMenu FROM TBLScreenMenus WHERE Code =	'PCF4View')
    AND Code = 'VIEW_MENU_MISCELANEA'
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
        'VIEW_MENU_MISCELANEA',
        1
    )
END
GO


-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0030–Auditoria de Configurações

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)
                VALUES ('G0030', 'G0030–Auditoria de Configurações', 'G0030–Configuration Audit', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)
END
GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0030–Auditoria de Configurações

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM')
BEGIN
                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
                VALUES (
                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030'
                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())
END
GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0030–Auditoria de Configurações

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (
                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))
BEGIN
                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
                VALUES (
                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =
                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030'
                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())
END
GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU
-- --------------------------------------------------------------------------------------
--TELA G0030–Auditoria de Configurações

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0030'
                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MISCELANEA'))
BEGIN
                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)
                VALUES ('VIEW_MENU_G0030', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MISCELANEA'), 1, 1, 'G0030',
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0030')
END
GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0030
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0030'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('G0030-Auditoria de Configurações','G0030-Configuration Audit', 'G0030-Auditoría de configuración',1,1,'VIEW_MENU_G0030',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0030

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0030', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart' AND DefaultValue = 'G0030/v1/Table')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0030', 'table', 'ReportChart', 'TABLETAB',1, 'G0030/v1/Table',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----------- Campos Disabilidados --------------
-----------        G0030         --------------


IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProduct')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0030', 'MainFilterProduct', 'MainFilterProduct', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProductType')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0030', 'MainFilterProductType', 'MainFilterProductType', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProductFamily')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0030', 'MainFilterProductFamily', 'MainFilterProductFamily', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0030', 'MainFilterShift', 'MainFilterShift', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0030', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterTreeView')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0030', 'MainFilterTreeView', 'MainFilterTreeView', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- --------------------------------------------------------------------------------------
-- ----------------FILTROS DO RELATÓRIO (DETALHES DE FILTRO)----------------
-- --------------------------------------------------------------------------------------
---- FILTRO DE TABELAS ---

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'CodeAuditTrailTable'
AND TableName = 'CodeAuditTrailTable'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeAuditTrailTable', 'CodeAuditTrailTable', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'CodeAuditTrailTable'
AND FieldName = 'AuditTrailTableCode'
AND TableName = 'AuditTrailTableCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('AuditTrailTableCode', 'AuditTrailTableCode', 'FilterValues','text', 'CodeAuditTrailTable' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

---- FILTRO DE USUÁRIOS ---
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'CodeUser'
AND TableName = 'CodeUser'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeUser', 'CodeUser', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'CodeUser'
AND FieldName = 'UserCode'
AND TableName = 'UserCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('UserCode', 'UserCode', 'FilterValues','text', 'CodeUser' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

---- FILTRO DE CÓDIGO ---
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'Code'
AND TableName = 'Code'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('Code', 'Code', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'Code'
AND FieldName = 'FilterCode'
AND TableName = 'FilterCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('FilterCode', 'FilterCode', 'FilterValues','text', 'Code' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTRO DE AÇÃO --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'ACTIONFILTER'
AND TableName = 'ACTIONFILTER'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ACTIONFILTER', 'ACTIONFILTER', 'FilterOptions','checkbox', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Todos os Status
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'ACTIONFILTER'
AND FieldName = 'ALLSTATUS'
AND TableName = 'ALLSTATUS'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ALLSTATUS', 'ALLSTATUS', 'FilterValues','checkbox', 'ACTIONFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Aguardando Liberação 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'ACTIONFILTER'
AND FieldName = 'NEWREGISTRATION'
AND TableName = 'NEWREGISTRATION'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('NEWREGISTRATION', 'NEWREGISTRATION', 'FilterValues','checkbox', 'ACTIONFILTER' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--Fila de Coleta
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'ACTIONFILTER'
AND FieldName = 'EDITION'
AND TableName = 'EDITION'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('EDITION', 'EDITION', 'FilterValues','checkbox', 'ACTIONFILTER' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Em Coleta 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'ACTIONFILTER'
AND FieldName = 'EXCLUSION'
AND TableName = 'EXCLUSION'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('EXCLUSION', 'EXCLUSION', 'FilterValues','checkbox', 'ACTIONFILTER' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0030' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

