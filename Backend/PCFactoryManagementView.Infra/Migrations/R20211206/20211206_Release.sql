IF EXISTS(SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
	(select IDScreen from TBLScreen where code = 'G0150' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab')
BEGIN 
	UPDATE TBLScreenFields SET Nullable = 1 WHERE IDScreen = (select IDScreen from TBLScreen where code = 'G0150' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab'
END
GO
IF EXISTS(SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
	(select IDScreen from TBLScreen where code = 'G0151' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab')
BEGIN 
	UPDATE TBLScreenFields SET Nullable = 1 WHERE IDScreen = (select IDScreen from TBLScreen where code = 'G0151' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab'
END
GO
IF EXISTS(SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
	(select IDScreen from TBLScreen where code = 'G0155' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab')
BEGIN 
	UPDATE TBLScreenFields SET Nullable = 1 WHERE IDScreen = (select IDScreen from TBLScreen where code = 'G0155' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab'
END
GO
IF EXISTS(SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
	(select IDScreen from TBLScreen where code = 'G0157' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab')
BEGIN 
	UPDATE TBLScreenFields SET Nullable = 1 WHERE IDScreen = (select IDScreen from TBLScreen where code = 'G0157' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab'
END
GO
IF EXISTS(SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
	(select IDScreen from TBLScreen where code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab')
BEGIN 
	UPDATE TBLScreenFields SET Nullable = 1 WHERE IDScreen = (select IDScreen from TBLScreen where code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab'
END
GO
IF EXISTS(SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
	(select IDScreen from TBLScreen where code = 'G0016' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab')
BEGIN 
	UPDATE TBLScreenFields SET Nullable = 1 WHERE IDScreen = (select IDScreen from TBLScreen where code = 'G0016' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab'
END
GO
IF EXISTS(SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
	(select IDScreen from TBLScreen where code = 'G0017' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab')
BEGIN 
	UPDATE TBLScreenFields SET Nullable = 1 WHERE IDScreen = (select IDScreen from TBLScreen where code = 'G0017' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab'
END
GO
IF EXISTS(SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
	(select IDScreen from TBLScreen where code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab')
BEGIN 
	UPDATE TBLScreenFields SET Nullable = 1 WHERE IDScreen = (select IDScreen from TBLScreen where code = 'G0041' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE CODE = 'PCF4VIEW'))
	AND ComponentType = 'ReportTab'
END
GO

--TELA EDITARANDON
IF NOT EXISTS (SELECT IDScreen  FROM TBLScreen WHERE Code = 'ANDON'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)
                VALUES ('ANDON', 'ANDON', 'ANDON', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 1)
END
GO

-- OPERATION SCREEN-----------------------------------
--TELA EDITARANDON

IF NOT EXISTS (SELECT IDOperationScreen  FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'ANDON'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) AND Operation = 'EDITARANDON')
BEGIN
                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
                VALUES ((SELECT IDScreen FROM TBLScreen WHERE Code = 'ANDON'
				AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'EDITARANDON','EDITARANDON',GETDATE())
END
GO

--VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
--TELA EDITARANDON
IF NOT EXISTS (SELECT IDProfileUserGroup  FROM TBLProfileUserGroup WHERE IDOperationScreen = (
                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'ANDON'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'EDITARANDON') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))
BEGIN
                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
                VALUES ((SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'EDITARANDON' AND IDScreen =
                         (SELECT IDScreen FROM TBLScreen WHERE Code = 'ANDON'
						  AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())
END
GO


-- OPERATION SCREEN-----------------------------------
--TELA DELETEANDON

IF NOT EXISTS (SELECT IDOperationScreen  FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'ANDON'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) AND Operation = 'DELETEANDON')
BEGIN
                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
                VALUES ((SELECT IDScreen FROM TBLScreen WHERE Code = 'ANDON'
				AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'DELETEANDON','DELETEANDON',GETDATE())
END
GO

--VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
--TELA DELETEANDON
IF NOT EXISTS (SELECT IDProfileUserGroup  FROM TBLProfileUserGroup WHERE IDOperationScreen = (
                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'ANDON'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'DELETEANDON') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))
BEGIN
                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
                VALUES ((SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'DELETEANDON' AND IDScreen =
                         (SELECT IDScreen FROM TBLScreen WHERE Code = 'ANDON'
						  AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View') 
				AND TranslationKey = 'VIEW_GLOBAL_TIMEFILTERCOMPARE'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Comparação por Filtro de Tempo',
			'Comparison by Time Filter',
			NULL,
			1,
			1,
			-1,
			'VIEW_GLOBAL_TIMEFILTERCOMPARE')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Comparação por Filtro de Tempo', ENLocal = 'Comparison by Time Filter', ESLocal = NULL 
		WHERE IDScreen = -1
			AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'VIEW_GLOBAL_TIMEFILTERCOMPARE'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View') 
				AND TranslationKey = 'VIEW_GLOBAL_DEFAULTTIMEFILTER'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Padrão',
			'Default',
			NULL,
			1,
			1,
			-1,
			'VIEW_GLOBAL_DEFAULTTIMEFILTER')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Padrão', ENLocal = 'Default', ESLocal = NULL 
		WHERE IDScreen = -1
			AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'VIEW_GLOBAL_DEFAULTTIMEFILTER'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View') 
				AND TranslationKey = 'VIEW_GLOBAL_WEEKLYTIMEFILTER'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Semanal',
			'Weekly',
			NULL,
			1,
			1,
			-1,
			'VIEW_GLOBAL_WEEKLYTIMEFILTER')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Semanal', ENLocal = 'Weekly', ESLocal = NULL 
		WHERE IDScreen = -1
			AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'VIEW_GLOBAL_WEEKLYTIMEFILTER'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View') 
				AND TranslationKey = 'VIEW_GLOBAL_MONTHLYTIMEFILTER'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Mensal',
			'Monthly',
			NULL,
			1,
			1,
			-1,
			'VIEW_GLOBAL_MONTHLYTIMEFILTER')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Mensal', ENLocal = 'Monthly', ESLocal = NULL 
		WHERE IDScreen = -1
			AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'VIEW_GLOBAL_MONTHLYTIMEFILTER'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View') 
				AND TranslationKey = 'VIEW_GLOBAL_QUARTERLYTIMEFILTER'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Trimestral',
			'Quarterly',
			NULL,
			1,
			1,
			-1,
			'VIEW_GLOBAL_QUARTERLYTIMEFILTER')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Trimestral', ENLocal = 'Quarterly', ESLocal = NULL 
		WHERE IDScreen = -1
			AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'VIEW_GLOBAL_QUARTERLYTIMEFILTER'
END
GO

IF NOT EXISTS (
	SELECT IDLocalization
		FROM TBLLocalizations
			WHERE IDScreen = -1
				AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View') 
				AND TranslationKey = 'VIEW_GLOBAL_PERIOD'
			
)
BEGIN
    INSERT INTO TBLLocalizations (IDApplication, PTLocal, ENLocal, ESLocal, FlgEnable, FlgProduct, IDScreen, TranslationKey)
		VALUES (
			(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'),
			'Período',
			'Period',
			NULL,
			1,
			1,
			-1,
			'VIEW_GLOBAL_PERIOD')
END
ELSE
BEGIN
    UPDATE TBLLocalizations SET PTLocal = 'Período', ENLocal = 'Period', ESLocal = NULL 
		WHERE IDScreen = -1
			AND IDApplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
				AND TranslationKey = 'VIEW_GLOBAL_PERIOD'
END
GO
IF EXISTS (Select idScreenFields from TBLScreenFields where IDScreen = (select IDScreen from TBLScreen where code = 'G0007') and FieldName = 'TableTabResume')
begin
	Update TBLScreenFields set FieldType = 'tree' where IDScreenFields = 
	(Select idScreenFields from TBLScreenFields where IDScreen = (select IDScreen from TBLScreen where code = 'G0007') and FieldName = 'TABLETABRESUME')
end
go
IF EXISTS (select * from TBLScreenFields where IDScreen = (select IDScreen from TBLScreen where code = 'G0009') and FieldType = 'radio')
BEGIN
	DELETE from TBLScreenFields 
		where IDScreen = (select IDScreen from TBLScreen where code = 'G0009') 
			and FieldType = 'radio'
END
GO

----G0009 RADIO GROUP StatusType
--Para a ABA - STATUSSUMMARYCHARTTAB
IF NOT EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'STATUSSUMMARYCHARTTAB'
AND FieldName = 'StatusType'
AND TableName = 'registersStatus'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('registersStatus', 'StatusType', 'FilterOptions','radio', 'STATUSSUMMARYCHARTTAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0009 RADIO StatusType - ResourceStatus
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersStatus'
AND FieldName = 'ResourceStatus'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('ResourceStatus', 'ResourceStatus', 'FilterValues','radio', 'registersStatus' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0009 RADIO StatusType - DetailStatus
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersStatus'
AND FieldName = 'DetailStatus'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('DetailStatus', 'DetailStatus', 'FilterValues','radio', 'registersStatus' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0009 RADIO StatusType - GrpStatus
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersStatus'
AND FieldName = 'GrpStatus'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('GrpStatus', 'GrpStatus', 'FilterValues','radio', 'registersStatus' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----G0009 RADIO StatusType - GrpCorp
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen = 
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersStatus'
AND FieldName = 'GrpCorp'
AND FieldType = 'radio')
BEGIN 
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('GrpCorp', 'GrpCorp', 'FilterValues','radio', 'registersStatus' , 1, '',0,4,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' 
	AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
--Tela Andon
IF NOT EXISTS (SELECT IDScreen  FROM TBLScreen WHERE Code = 'VIEWANDON'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
BEGIN
                INSERT INTO TBLScreen (Code,Name,NameEN,FlgProduct,IDAplication,DtCreation, ContextPrint)
                VALUES ('VIEWANDON', 'Andon', 'Andon', 1, (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'), GETDATE(), 1)
END
GO
-- OPERATION SCREEN-----------------------------------
--Tela Andon

IF NOT EXISTS (SELECT IDOperationScreen  FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWANDON'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) AND Operation = 'SIM')
BEGIN
                INSERT INTO TBLOperationScreen (IDScreen, Operation, OperationEN, DtCreation)
                VALUES ((SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWANDON'
				AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')),'SIM','SIM',GETDATE())
END
GO

--VÍNCULO USUÁRIO ADMIN COM O RELATÓRIO-------------------------
--Tela Andon
IF NOT EXISTS (SELECT IDProfileUserGroup  FROM TBLProfileUserGroup WHERE IDOperationScreen = (
                SELECT IDOperationScreen FROM TBLOperationScreen WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWANDON'
                AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')
                ) AND Operation = 'SIM') AND IDUsrGroup = (SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'))
BEGIN
                INSERT INTO TBLProfileUserGroup (IDOperationScreen, IDUsrGroup, DtCreation)
                VALUES ((SELECT IDOperationScreen FROM TBLOperationScreen WHERE Operation = 'SIM' AND IDScreen =
                         (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWANDON'
						  AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))),(SELECT IDUsrGroup FROM TBLUsrGroup WHERE Code = 'ADMIN'),GETDATE())
END
GO
 

-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - Andon

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWANDON' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'TABLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('VIEWANDON', 'ReportTab', 'ReportTab', 'REPORT',1, 'TABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWANDON' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--Report Andon

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWANDON' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('VIEWANDON', 'table', 'ReportChart', 'TABLETAB' , 1, 'andon/v1/table ',0,1,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWANDON' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
