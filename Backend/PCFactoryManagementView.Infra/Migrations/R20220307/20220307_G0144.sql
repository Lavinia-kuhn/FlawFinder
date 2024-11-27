--COMMIT (FINAL DO CODE)
--ROLLBACK (CASE DÊ RUIM) 
/*SELECT * FROM TBLScreenFields
WHERE TableName = 'G0144'*/

/*select * from TBLScreenMenus 
where Code = 'VIEW_MENU_G0144'
*/
-- --------------------------------------------------------------------------------------
-- -------------------------MENU DE MATERIAIS executar somente 1x------------------------
-- --------------------------------------------------------------------------------------
IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'
 AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View'))

BEGIN

 INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable)

 VALUES ('VIEW_MENU_MANUTENCAO', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View') , 4, 1)

END

GO

-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0144–Relatório Analítico de OM

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

 INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

 VALUES ('G0144', 'G0144–Analítico de OM', 'G0144–OM Analytics', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0144–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 ) AND Operation = 'SIM')

BEGIN

 INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

 VALUES (

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0144–Relatório de Analítico de OM

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

 SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

 INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

 VALUES (

 (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0144'

 AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'))

BEGIN

 INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

 VALUES ('VIEW_MENU_G0144', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'), 2, 1, 'G0144',

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144'

 AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0144')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0144
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0144'

 AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

 AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

 INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

 VALUES ('G0144–Analítico de OM', 'G0144–OM Analytics', 'G0144-Análisis de OM',1,1,'VIEW_MENU_G0144',

 (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

 (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0144

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0144', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0144

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0144', 'table', 'ReportChart', 'TABLETAB' , 1, 'G0144/v1/Table ',0,1,'',
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--FILTER MACHINE STATUS--
--G0144 RADIO GROUP Hierar
--Para a ABA - TABLETAB
IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'MachineStatus'
AND TableName = 'registerMachine'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('registerMachine', 'MachineStatus', 'FilterOptions','radio', 'TABLETAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


----G0144 RADIO Hierarchy - Plant
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registerMachine'
AND FieldName = 'Stopped'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('Stopped', 'Stopped', 'FilterValues','radio', 'registerMachine' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registerMachine'
AND FieldName = 'Working'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('Working', 'Working', 'FilterValues','radio', 'registerMachine' , 1, 'false',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registerMachine'
AND FieldName = 'All'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('All', 'All', 'FilterValues','radio', 'registerMachine' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--FILTER OM STATUS
--Para a ABA - TABLETAB
IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'OmStatus'
AND TableName = 'registersOmStatus'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('registersOmStatus', 'OmStatus', 'FilterOptions','radio', 'TABLETAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO



----G0144 RADIO Hierarchy - Plant
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersOmStatus'
AND FieldName = 'AllStatus'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('AllStatus', 'AllStatus', 'FilterValues','radio', 'registersOmStatus' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


----G0144 RADIO Hierarchy - Area
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersOmStatus'
AND FieldName = 'Open'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('Open', 'Open', 'FilterValues','radio', 'registersOmStatus' , 1, 'false',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


----G0144 RADIO Hierarchy - Sector
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersOmStatus'
AND FieldName = 'Closed'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('Closed', 'Closed', 'FilterValues','radio', 'registersOmStatus' , 1, 'false',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--remove turno
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam' and GroupName = 'TABLETAB')
BEGIN
 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0144', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift' and GroupName = 'TABLETAB')
BEGIN
 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0144', 'MainFilterShift', 'MainFilterShift', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--Remove Treeview
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterTreeView' and GroupName = 'TABLETAB')
BEGIN
 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0144', 'MainFilterTreeView', 'MainFilterTreeView', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterTreeView' and GroupName = 'TABLETAB')
BEGIN
 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0144', 'MainFilterTreeView', 'MainFilterTreeView', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
