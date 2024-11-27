-- --------------------------------------------------------------------------------------
-- ----------------RELATﾓRIOS (CRIAﾇﾃO DO RELATﾓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0111傍arefa de Transporte

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)
                VALUES ('G0111', 'G0111傍arefa de Transporte', 'G0111傍ransport Task', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)
END
GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0111傍arefa de Transporte

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM')
BEGIN
                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
                VALUES (
                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111'
                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())
END
GO

-- --------------------------------------------------------------------------------------
---------------------------VﾍNCULO USUﾁRIO ADMIN COM O RELATﾓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0111傍arefa de Transporte

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (
                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))
BEGIN
                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
                VALUES (
                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =
                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111'
                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())
END
GO
  
-- --------------------------------------------------------------------------------------
--INSERﾇﾃO DO RELATﾓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0111傍arefa de Transporte

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0111'
                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_LOGISTICA'))
BEGIN
                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)
                VALUES ('VIEW_MENU_G0111', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_LOGISTICA'), 53, 1, 'G0111',
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/log/G0111')
END
GO

--TRADUﾇﾃO DO MENU DAS TELAS
--TELA G0111
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0111'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('G0111傍arefa de Transporte','G0111-Transport Task', 'G0111-Tarea de transporte',1,1,'VIEW_MENU_G0111',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0111

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0111', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart' AND DefaultValue = 'G0111/v1/Table')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0111', 'table', 'ReportChart', 'TABLETAB',1, 'G0111/v1/Table',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTRO DE STATUS --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'TASKSTATUSFILTER'
AND TableName = 'TASKSTATUSFILTER'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('TASKSTATUSFILTER', 'TASKSTATUSFILTER', 'FilterOptions','checkbox', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Todos os Status
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'ALLSTATUS'
AND TableName = 'ALLSTATUS'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ALLSTATUS', 'ALLSTATUS', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Aguardando Libera鈬o 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'AWAITINGRELEASE'
AND TableName = 'AWAITINGRELEASE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('AWAITINGRELEASE', 'AWAITINGRELEASE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Liberado para Transporte
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'RELEASEDFORTRANSPORT'
AND TableName = 'RELEASEDFORTRANSPORT'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('RELEASEDFORTRANSPORT', 'RELEASEDFORTRANSPORT', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Solicita鈬o enviada 
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'REQUESTSENT'
AND TableName = 'REQUESTSENT'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('REQUESTSENT', 'REQUESTSENT', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Transportador a caminho para retirada (AGV)
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'ONMYWAY'
AND TableName = 'ONMYWAY'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ONMYWAY', 'ONMYWAY', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Material Retirado ・Em tr穗sito
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'INTRANSIT'
AND TableName = 'INTRANSIT'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('INTRANSIT', 'INTRANSIT', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,5,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Material Entregue
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'DELIVERED'
AND TableName = 'DELIVERED'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('DELIVERED', 'DELIVERED', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,6,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Conclu冝o
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'DONE'
AND TableName = 'DONE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('DONE', 'DONE', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,8,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Cancelado
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'TASKSTATUSFILTER'
AND FieldName = 'CANCELED'
AND TableName = 'CANCELED'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('CANCELED', 'CANCELED', 'FilterValues','checkbox', 'TASKSTATUSFILTER' , 1, 'false',0,9,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


----------- Campos Disabilidados --------------
-----------        G0111         --------------



IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterOriginAddressGroup')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0111', 'MainFilterOriginAddressGroup', 'MainFilterOriginAddressGroup', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0111' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


----------- Traducao --------------

-- Status de Transporte

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Transport_10'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('10 ・Aguardando Libera鈬o','10 - Awaiting Release', '10 - En espera de liberaci',1,1,'TBLLog_Transport_10',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Transport_20'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('20 ・Liberado para Transporte','20 ・Released for Transport', '20 ・Liberado para el transporte',1,1,'TBLLog_Transport_20',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Transport_30'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('30 ・Solicita鈬o enviada','30 ・Request Sent', '30 ・Solicitud enviada',1,1,'TBLLog_Transport_30',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Transport_40'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('40 ・Transportador a caminho para retirada','40 ・Conveyor on the way to pick up', '40 ・Transportador en camino a recoger',1,1,'TBLLog_Transport_40',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Transport_50'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('50 ・Material Retirado ・Em tr穗sito','50 ・Material Withdrawn - In transit', '50 ・Material Retirado - En tr疣sito',1,1,'TBLLog_Transport_50',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Transport_60'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('60 ・Material Entregue','60 ・Material Delivered', '60 ・Material entregado',1,1,'TBLLog_Transport_60',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Transport_70'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('70 ・Conclu冝o','70 ・Done', '70 ・Concluido',1,1,'TBLLog_Transport_70',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO


IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'TBLLog_Transport_100'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('100 ・Cancelado','100 ・Canceled', '100 ・Cancelado',1,1,'TBLLog_Transport_100',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

