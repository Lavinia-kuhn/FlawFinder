-- Remoção da Comparação de Data OEE TABLE
IF EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab'AND GroupName = 'REPORT' AND DefaultValue = 'OEETABLETAB' AND Nullable = 0)
BEGIN 
	UPDATE TBLScreenFields set Nullable = 1 WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab'AND GroupName = 'REPORT' AND DefaultValue = 'OEETABLETAB'
END

-- Remoção da Comparação de Data SCRAP TABLE
IF EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab'AND GroupName = 'REPORT' AND DefaultValue = 'SCRAPTABLETAB' AND Nullable = 0)
BEGIN 
	UPDATE TBLScreenFields set Nullable = 1 WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab'AND GroupName = 'REPORT' AND DefaultValue = 'SCRAPTABLETAB'
END

-- Remoção da Comparação de Data REWORK TABLE
IF EXISTS (SELECT IDScreenFields,* FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab'AND GroupName = 'REPORT' AND DefaultValue = 'REWORKTABLETAB' AND Nullable = 0)
BEGIN 
	UPDATE TBLScreenFields set Nullable = 1 WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'ReportTab'AND GroupName = 'REPORT' AND DefaultValue = 'REWORKTABLETAB'
END

