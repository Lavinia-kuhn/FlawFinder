
	IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'ReportChart' AND GroupName = 'CHARTTAB' AND DefaultValue <> 'G0021/v1/Association')
	BEGIN
		UPDATE TBLScreenFields 
		SET DefaultValue = 'G0021/v1/Association', FieldName = 'association'
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021') AND FieldOrder = 0 AND GroupName = 'CHARTTAB' 
	END
	GO