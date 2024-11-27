-- -----------------------------------------ABAS-----------------------------------------
--ABA TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'CYCLETAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0021', 'ReportTab', 'ReportTab', 'REPORT',1, 'CYCLETAB',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRFICO OU TABELA - G0135

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'CYCLETAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName, FieldType,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0021', 'table', 'tree', 'ReportChart', 'CYCLETAB' , 1, 'G0021/v1/CycleTab',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


