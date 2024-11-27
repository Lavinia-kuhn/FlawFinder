-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0019

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'PRODUCTPARETOTAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0019', 'ReportTab', 'ReportTab', 'REPORT',1, 'PRODUCTPARETOTAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0019

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'PRODUCTPARETOTAB')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0019', 'pareto', 'ReportChart', 'PRODUCTPARETOTAB' , 1, 'G0019/V1/Product/Pareto ',0,1,'',
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO



--------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE DefaultValue = 'SCRAPTAB' AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019'))
BEGIN
UPDATE TBLScreenFields 
	SET FieldOrder = 0 
WHERE DefaultValue = 'SCRAPTAB' 
	AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019')
END
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE DefaultValue = 'REWORKTAB' AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019'))
BEGIN
UPDATE TBLScreenFields 
	SET FieldOrder = 1 
WHERE DefaultValue = 'REWORKTAB' 
	AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019')
END
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE DefaultValue = 'PARETOTAB' AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019'))
BEGIN	
UPDATE TBLScreenFields 
	SET FieldOrder = 2 
WHERE DefaultValue = 'PARETOTAB' 
	AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019')
END
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE DefaultValue = 'REWORKPARETOTAB' AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019'))	
BEGIN
UPDATE TBLScreenFields 
	SET FieldOrder = 3
WHERE DefaultValue = 'REWORKPARETOTAB' 
	AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019')
END
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE DefaultValue = 'PRODUCTPARETOTAB' AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019'))
BEGIN
UPDATE TBLScreenFields 
	SET FieldOrder = 4
WHERE DefaultValue = 'PRODUCTPARETOTAB' 
	AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019')
END
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------
IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE DefaultValue = 'TABLETAB' AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019'))
BEGIN
UPDATE TBLScreenFields 
	SET FieldOrder = 9 
WHERE DefaultValue = 'TABLETAB' 
	AND IDScreen IN (select IDScreen from TBLScreen where code = 'G0019')
END
GO
--------------------------------------------------------------------------------------------------------------------------------------------------------------------