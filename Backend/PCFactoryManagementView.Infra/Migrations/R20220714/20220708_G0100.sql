-- --------------------------------------------------------------------------------------
-- ----------------RELATÓRIOS (CRIAÇÃO DO RELATÓRIO COMO TELA DO SISTEMA)----------------
-- --------------------------------------------------------------------------------------
--TELA G0100–Indicadores BTS

IF NOT EXISTS (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

BEGIN

                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)

                VALUES ('G0100', 'G0100–Aderência ao Sequenciamento', 'G0100–Build to Schedule', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 0)

END

GO

-- --------------------------------------------------------------------------------------
-- -----------------------------------OPERATION SCREEN-----------------------------------
-- --------------------------------------------------------------------------------------
--TELA G0135–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM')

BEGIN

                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)

                VALUES (

                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100'

                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())

END

GO

-- --------------------------------------------------------------------------------------
---------------------------VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
-- --------------------------------------------------------------------------------------
--TELA G0135–Relatório de Distribuição da Gravidade de Manutenção OM

IF NOT EXISTS (SELECT IDProfileUserGroup FROM TBLProfileUserGroup WHERE IDOperationScreen = (

                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))

BEGIN

                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)

                VALUES (

                               (SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =

                                               (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100'

                                               AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())

END

GO
  
-- --------------------------------------------------------------------------------------
--INSERÇÃO DO RELATÓRIO NO MENU (repetir para todos os reports de Qualidade))
-- --------------------------------------------------------------------------------------
--TELA G0147–Analítico de Validação

IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0100'

                AND IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'))

BEGIN

                INSERT INTO TBLScreenMenus (Code,IDSuperiorScreenMenu, MenuOrder,FlgEnable, ShortCut, IDScreen, Link)

                VALUES ('VIEW_MENU_G0100', (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'), 2, 1, 'G0100',

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100'

                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')), '/report/oee/G0100')

END

GO

--TRADUÇÃO DO MENU DAS TELAS
--TELA G0135
IF NOT EXISTS (SELECT IDLocalization FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0100'

                AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')

                AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

BEGIN

                INSERT INTO TBLLocalizations (PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, TranslationKey, IDApplication, IDScreen)

                VALUES ('G0100-Aderência ao Sequenciamento','G0100-Build to Schedule', 'G0100-Adherencia a la Secuenciación',1,1,'VIEW_MENU_G0100',

                (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),

                (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))

END
GO

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0100', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0100', 'goalcolumns', 'ReportChart', 'TABLETAB' , 1, 'G0100/v1/Indicators ',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO