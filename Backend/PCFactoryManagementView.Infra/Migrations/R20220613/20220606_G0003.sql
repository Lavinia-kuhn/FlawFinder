IF NOT EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0003' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterDate' AND GroupName = 'TABLETAB')
BEGIN

 INSERT INTO TBLScreenFields (TableName, FieldName, ComponentType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
VALUES ('G0003', 'MainFilterDate', 'MainFilterDate', 'TABLETAB',0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0003' AND IDAplication =
(SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
END
GO
