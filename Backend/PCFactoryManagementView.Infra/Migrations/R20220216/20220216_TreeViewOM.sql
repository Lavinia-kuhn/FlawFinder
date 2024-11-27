update TBLScreenFields set Hidden = 0, Enabled = 1 where TableName = 'G0133' AND FieldName = 'MainFilterTreeView'

update TBLScreenFields set Hidden = 0, Enabled = 1 where TableName = 'G0144' AND FieldName = 'MainFilterTreeView'

update TBLScreenMenus set Link = '/report/manut/G0133' where Code = 'VIEW_MENU_G0133' AND ShortCut = 'G0133'

update TBLScreenMenus set Link = '/report/manut/G0144' where Code = 'VIEW_MENU_G0144' AND ShortCut = 'G0144'

IF NOT EXISTS(SELECT IDScreenFields from TblScreenFields where IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0133' AND 
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) and FieldName = 'MainFilterTreeViewOM')
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0133', 'MainFilterTreeViewOM', 'MainFilterTreeViewOM', null, 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0133' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS(SELECT IDScreenFields from TblScreenFields where IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND 
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) and FieldName = 'MainFilterTreeViewOM')
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0144', 'MainFilterTreeViewOM', 'MainFilterTreeViewOM', null, 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0144' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

----------------------------------------------------------------------------------------------------

update TBLScreenFields set Hidden = 0, Enabled = 1 where TableName = 'G0146' and FieldName = 'MainFilterTreeView'

update TBLScreenFields set Hidden = 0, Enabled = 0 where TableName = 'G0146' and FieldName = 'MainFilterTreeViewOM'

update TBLScreenFields set Hidden = 0, Enabled = 1 where TableName = 'G0135' and FieldName = 'MainFilterTreeView'

update TBLScreenFields set Hidden = 0, Enabled = 1 where TableName = 'G0135' and FieldName = 'MainFilterTreeViewOM'

update TBLScreenMenus set Link = '/report/manut/G0135' where Code = 'VIEW_MENU_G0135' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND 
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))

update TBLScreenMenus set Link = '/report/manut/G0146' where Code = 'VIEW_MENU_G0146' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND 
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))


IF NOT EXISTS(SELECT IDScreenFields from TblScreenFields where IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND 
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) and FieldName = 'MainFilterTreeViewOM')
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0135', 'MainFilterTreeViewOM', 'MainFilterTreeViewOM', null, 'TABLETAB' , 1, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF NOT EXISTS(SELECT IDScreenFields from TblScreenFields where IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0135' AND 
IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) and FieldName = 'MainFilterTreeViewOM')
BEGIN
	INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
	VALUES ('G0146', 'MainFilterTreeViewOM', 'MainFilterTreeViewOM', null, 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0146' AND 
	IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO