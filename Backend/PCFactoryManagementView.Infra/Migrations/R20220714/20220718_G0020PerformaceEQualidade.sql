-- Performace
-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0020

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'PERFORMANCETABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0020', 'ReportTab', 'ReportTab', 'REPORT',1, 'PERFORMANCETABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0020

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'PERFORMANCETABLETAB')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0020', 'table', 'ReportChart', 'PERFORMANCETABLETAB' , 1, 'G0020/v1/PerformanceTable',0,1,'',
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

/*
	 Desabilitação dos filtros não utilizados no relatório.
*/
--	==== G0020 Turma do turno ====
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam' AND GroupName = 'PERFORMANCETABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0020', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'PERFORMANCETABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--	==== G0020 Turno ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift' AND GroupName = 'PERFORMANCETABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0020', 'MainFilterShift', 'MainFilterShift', 'PERFORMANCETABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- Qualidade
-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0020

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'QUALITYTABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0020', 'ReportTab', 'ReportTab', 'REPORT',1, 'QUALITYTABLETAB',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRÁFICO OU TABELA - G0020

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'QUALITYTABLETAB')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0020', 'table', 'ReportChart', 'QUALITYTABLETAB' , 1, 'G0020/v1/QualityTable',0,1,'',
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

/*
	 Desabilitação dos filtros não utilizados no relatório.
*/
--	==== G0020 Turma do turno ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShiftTeam' AND GroupName = 'QUALITYTABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0020', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'QUALITYTABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--	==== G0020 Turno ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterShift' AND GroupName = 'QUALITYTABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0020', 'MainFilterShift', 'MainFilterShift', 'QUALITYTABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
