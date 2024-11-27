IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'HIDDENREPORT' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
BEGIN
UPDATE TBLScreenFields SET DefaultValue = 'workorder/v1/table' WHERE IDScreenFields = (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'HIDDENREPORT' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportChart'AND GroupName = 'TABLETAB')
END
GO
