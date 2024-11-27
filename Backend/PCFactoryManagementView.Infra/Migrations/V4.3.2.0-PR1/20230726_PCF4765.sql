
	IF ((SELECT Link FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0014') = '/report/movmat/G0014')
	BEGIN
		UPDATE TBLScreenMenus SET Link = '/report/unmov/G0014' WHERE Code = 'VIEW_MENU_G0014'
	END

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'DownloadedStatus'
	AND TableName = 'DownloadedStatus'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('DownloadedStatus', 'DownloadedStatus', 'FilterOptions','radio', 'TABLETAB' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'DownloadedStatus'
	AND FieldName = 'AllStatus'
	AND TableName = 'AllStatus'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('AllStatus', 'AllStatus', 'FilterValues','radio', 'DownloadedStatus' , 1, 'true',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO

	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'DownloadedStatus'
	AND FieldName = 'OpenStatus'
	AND TableName = 'OpenStatus'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('OpenStatus', 'OpenStatus', 'FilterValues','radio', 'DownloadedStatus' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO
	
	IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'DownloadedStatus'
	AND FieldName = 'DownStatus'
	AND TableName = 'DownStatus'
	AND FieldType = 'radio')
	BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('DownStatus', 'DownStatus', 'FilterValues','radio', 'DownloadedStatus' , 1, '',0,3,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0014' AND
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
	END
	GO