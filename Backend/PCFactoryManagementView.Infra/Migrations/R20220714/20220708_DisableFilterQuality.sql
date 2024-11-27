/*
	 Desabilitação dos filtros não utilizados nos relatórios de Quality.
*/
--	==== G0141 Lot ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterLot' AND GroupName = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0141', 'MainFilterLot', 'MainFilterLot', 'TABLETAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--	==== G0141 UnMov ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterUnMov' AND GroupName = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0141', 'MainFilterUnMov', 'MainFilterUnMov', 'TABLETAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
--	==== G0141 Product ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProduct' AND GroupName = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0141', 'MainFilterProduct', 'MainFilterProduct', 'TABLETAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--	==== G0141 WOHD ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterWohd' AND GroupName = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0141', 'MainFilterWohd', 'MainFilterWohd', 'TABLETAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--	==== G0141 WODET ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterWodet' AND GroupName = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0141', 'MainFilterWodet', 'MainFilterWodet', 'TABLETAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--	==== G0141 RESOURCE ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterResource' AND GroupName = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0141', 'MainFilterResource', 'MainFilterResource', 'TABLETAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterDate' AND GroupName = 'TABLETAB' and Enabled = 0)
BEGIN
    UPDATE TBLScreenFields
        set Enabled = 1
    where IDScreenFields in (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0142' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterDate' AND GroupName = 'TABLETAB')
END
GO

--	==== G0143 UnMov ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0143' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterUnMov' AND GroupName = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0143', 'MainFilterUnMov', 'MainFilterUnMov', 'TABLETAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0143' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO

--	==== G0145 UnMov ====
IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0145' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterUnMov' AND GroupName = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0145', 'MainFilterUnMov', 'MainFilterUnMov', 'TABLETAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0145' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO