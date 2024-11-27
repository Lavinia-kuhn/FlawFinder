-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0108–Eficiência de Separação

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)
                VALUES ('G0108', 'G0108–Eficiência de Separação', 'G0108–Separation Efficiency', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)
END
GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0108–Eficiência de Separação

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM')
BEGIN
                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
                VALUES (
                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108'
                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())
END
GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0108–Eficiência de Separação

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (
                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))
BEGIN
                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
                VALUES (
                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =
                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108'
                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())
END
GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0108–Eficiência de Separação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0108'
                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_LOGISTICA'))
BEGIN
                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)
                VALUES ('VIEW_MENU_G0108', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_LOGISTICA'), 52, 1, 'G0108',
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/log/G0108')
END
GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0108
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0108'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('G0108-Eficiência de Separação','G0108-Separation Efficiency', 'G0108-Eficiencia de separación',1,1,'VIEW_MENU_G0108',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0108

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'CONSOLIDATED')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0108', 'ReportTab', 'ReportTab', 'REPORT',1, 'CONSOLIDATED',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart' AND DefaultValue = 'G0108/v1/Consolidated')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0108', 'table', 'ReportChart', 'CONSOLIDATED',1, 'G0108/v1/Consolidated',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'ANALYTICAL')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0108', 'ReportTab', 'ReportTab', 'REPORT',1, 'ANALYTICAL',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart' AND DefaultValue = 'G0108/v1/Analytical')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0108', 'table', 'ReportChart', 'ANALYTICAL',1, 'G0108/v1/Analytical',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTRO DE QUEBRA --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'CONSOLIDATED'
AND FieldName = 'BREAKFILTER'
AND TableName = 'BREAKFILTER'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('BREAKFILTER', 'BREAKFILTER', 'FilterOptions','radio', 'CONSOLIDATED' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Depósito de Origem
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'BREAKFILTER'
AND FieldName = 'ORIGINWAREHOUSE'
AND TableName = 'ORIGINWAREHOUSE'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ORIGINWAREHOUSE', 'ORIGINWAREHOUSE', 'FilterValues','radio', 'BREAKFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Depósito de Destino
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'BREAKFILTER'
AND FieldName = 'ENDWAREHOUSE'
AND TableName = 'ENDWAREHOUSE'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ENDWAREHOUSE', 'ENDWAREHOUSE', 'FilterValues','radio', 'BREAKFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Grupo de Endereço de Origem
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'BREAKFILTER'
AND FieldName = 'ORIGINADDRESSGROUP'
AND TableName = 'ORIGINADDRESSGROUP'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ORIGINADDRESSGROUP', 'ORIGINADDRESSGROUP', 'FilterValues','radio', 'BREAKFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Grupo de Endereço de Destino
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'BREAKFILTER'
AND FieldName = 'ENDADDRESSGROUP'
AND TableName = 'ENDADDRESSGROUP'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ENDADDRESSGROUP', 'ENDADDRESSGROUP', 'FilterValues','radio', 'BREAKFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Endereço de Destino
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'BREAKFILTER'
AND FieldName = 'ENDADDRESS'
AND TableName = 'ENDADDRESS'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('ENDADDRESS', 'ENDADDRESS', 'FilterValues','radio', 'BREAKFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- FILTRO DE TEMPOS --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'CONSOLIDATED'
AND FieldName = 'PENDINGFILTER'
AND TableName = 'PENDINGFILTER'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('PENDINGFILTER', 'PENDINGFILTER', 'FilterOptions','checkbox', 'CONSOLIDATED' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Incluir valores pendentes
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'PENDINGFILTER'
AND FieldName = 'INCLUDE'
AND TableName = 'INCLUDE'
AND FieldType = 'checkbox')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('INCLUDE', 'INCLUDE', 'FilterValues','checkbox', 'PENDINGFILTER' , 1, 'true',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


----------- Campos Disabilidados --------------
-----------        G0108         --------------


IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterRoute' AND GroupName = 'CONSOLIDATED')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0108', 'MainFilterRoute', 'MainFilterRoute', 'CONSOLIDATED',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterRoute' AND GroupName = 'ANALYTICAL')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0108', 'MainFilterRoute', 'MainFilterRoute', 'ANALYTICAL',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0108' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----------- Traduções --------------


IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'YES'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('Sim', 'Yes', 'Sí',1,1,'YES',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO

IF NOT EXISTS (SELECT * FROM TBLLocalizations WHERE TranslationKey = 'NO'
                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)
                VALUES ('Não', 'No', 'No',1,1,'NO',
                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), -1)
END
GO