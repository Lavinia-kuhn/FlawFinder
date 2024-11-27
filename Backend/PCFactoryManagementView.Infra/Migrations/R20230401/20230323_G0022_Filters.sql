
	IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterDate' AND GroupName = 'TABLETAB')
	BEGIN

	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0022', 'MainFilterDate', 'MainFilterDate', 'TABLETAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication =
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterDate' AND GroupName = 'GANTTTAB')
	BEGIN

	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0022', 'MainFilterDate', 'MainFilterDate', 'GANTTTAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication =
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterShiftTeam' AND GroupName = 'GANTTTAB')
	BEGIN

	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0022', 'MainFilterShiftTeam', 'MainFilterShiftTeam', 'GANTTTAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication =
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'MainFilterShift' AND GroupName = 'GANTTTAB')
	BEGIN

	INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0022', 'MainFilterShift', 'MainFilterShift', 'GANTTTAB',0, '',1,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication =
	(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO