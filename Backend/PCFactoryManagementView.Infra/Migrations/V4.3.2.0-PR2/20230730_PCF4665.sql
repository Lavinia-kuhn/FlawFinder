
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab' AND DefaultValue = 'SANKEYTAB')
BEGIN

                INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0018', 'ReportTab', 'ReportTab', 'REPORT',1, 'SANKEYTAB',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND IDAplication = 
				(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


-- ---------------------------------------REPORTS----------------------------------------
-- --------------------------------------------------------------------------------------

--REPORT / TIPO DE GRFICO OU TABELA - G0018

IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'SANKEYTAB')
BEGIN
                INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
                VALUES ('G0018', 'sankey', 'ReportChart', 'SANKEYTAB' , 1, 'G0018/v1/GetSankeyData',0,0,'', 
				(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO


-- FILTER --
IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'SANKEYTAB'
AND FieldName = 'FILTERS'
AND TableName = 'filtersGen'
AND FieldType = 'radio')
BEGIN
INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('filtersGen', 'FILTERS', 'FilterOptions','radio', 'SANKEYTAB' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
