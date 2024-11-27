-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0110–Tarefa de Separação

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)
                VALUES ('G0110', 'G0110–Tarefa de Separação', 'G0110–Separation Task', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)
END
GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0110–Tarefa de Separação

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM')
BEGIN
                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
                VALUES (
                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110'
                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())
END
GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0110–Tarefa de Separação

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (
                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))
BEGIN
                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
                VALUES (
                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =
                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110'
                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())
END
GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0110–Tarefa de Separação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0110'
                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_LOGISTICA'))
BEGIN
                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)
                VALUES ('VIEW_MENU_G0110', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_LOGISTICA'), 53, 1, 'G0110',
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/log/G0110')
END
GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0110
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0110'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('G0110–Tarefa de Separação','G0110-Separation Task', 'G0110-Tarea de separación',1,1,'VIEW_MENU_G0110',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0110

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0110', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart' AND DefaultValue = 'G0110/v1/Table')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0110', 'table', 'ReportChart', 'TABLETAB',1, 'G0110/v1/Table',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTRO DE TEMPOS --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'TASKSTATUSFILTER'
AND TableName = 'TASKSTATUSFILTER'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('TASKSTATUSFILTER', 'TASKSTATUSFILTER', 'FilterOptions','checkbox', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Todos os Status
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'ALLSTATUS'
AND TableName = 'ALLSTATUS'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ALLSTATUS', 'ALLSTATUS', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Aguardando Liberação 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'AWAITINGRELEASE'
AND TableName = 'AWAITINGRELEASE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('AWAITINGRELEASE', 'AWAITINGRELEASE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--Fila de Coleta
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'COLLECTIONQUEUE'
AND TableName = 'COLLECTIONQUEUE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('COLLECTIONQUEUE', 'COLLECTIONQUEUE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Em Coleta 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'COLLECT'
AND TableName = 'COLLECT'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('COLLECT', 'COLLECT', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Fila de Separação
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'PICKQUEUE'
AND TableName = 'PICKQUEUE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('PICKQUEUE', 'PICKQUEUE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Em Separação 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'SEPARATION'
AND TableName = 'SEPARATION'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('SEPARATION', 'SEPARATION', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Fila de Checkout  
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'CHECHKOUTQUEUE'
AND TableName = 'CHECHKOUTQUEUE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CHECHKOUTQUEUE', 'CHECHKOUTQUEUE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,6,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Em Checkout
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'CHECHKOUT'
AND TableName = 'CHECHKOUT'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CHECHKOUT', 'CHECHKOUT', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,7,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Concluído
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'DONE'
AND TableName = 'DONE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('DONE', 'DONE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,8,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Cancelado
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'CANCELED'
AND TableName = 'CANCELED'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CANCELED', 'CANCELED', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,9,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Task Code
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'CodeTask'
AND TableName = 'CodeTask'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CodeTask', 'CodeTask', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'CodeTask'
AND FieldName = 'TaskCode'
AND TableName = 'TaskCode'
AND FieldType = 'text')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('TaskCode', 'TaskCode', 'FilterValues','text', 'CodeTask' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


----------- Campos Disabilidados --------------
-----------        G0110         --------------


IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterEndAddress')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0110', 'MainFilterEndAddress', 'MainFilterEndAddress', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterRoute')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0110', 'MainFilterRoute', 'MainFilterRoute', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0110' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----------- Tradução --------------

-- Origem

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Origin_10'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('10 - Integração','10 - Integration', '10 - Integración',1,1,'TBLLog_Origin_10',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Origin_20'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('20 – Manual','20 – Manual', '20 – Manual',1,1,'TBLLog_Origin_20',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Origin_30'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('30 – Ponto Ressuprimento','30 – Resupply Point', '30 – Punto de reabastecimiento',1,1,'TBLLog_Origin_30',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Origin_40'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('40 – Demanda de Ordens Sequenciadas','40 – Demand for Sequenced Orders', '40 – Demanda de Órdenes Secuenciadas',1,1,'TBLLog_Origin_40',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Origin_50'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('50 – Coletor','50 – Collector', '50 – Coleccionista',1,1,'TBLLog_Origin_50',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Origin_60'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('60 – Leitura Cartão Kanban','60 – Kanban Card Reading', '60 – Lectura de tarjetas Kanban',1,1,'TBLLog_Origin_60',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Origin_70'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('70 – Pendência','70 – Pending', '70 – Pendiente',1,1,'TBLLog_Origin_70',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Origin_80'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('80 – Outros','80 – Others', '80 – Otros',1,1,'TBLLog_Origin_80',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Origin_90'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('90 – Pendência de Montagem','90 – Pending Assembly', '90 – Asamblea Pendiente',1,1,'TBLLog_Origin_90',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

-- Fornecedor

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Supplier_10'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('10 - ERP','10 - ERP', '10 - ERP',1,1,'TBLLog_Supplier_10',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Supplier_20'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('20 - MES','20 – MES', '20 – MES',1,1,'TBLLog_Supplier_20',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Supplier_30'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('30 - WMS','30 - WMS', '30 - WMS',1,1,'TBLLog_Supplier_30',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Supplier_40'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('40 – Outros','40 – Other', '40 – Otros',1,1,'TBLLog_Supplier_40',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO