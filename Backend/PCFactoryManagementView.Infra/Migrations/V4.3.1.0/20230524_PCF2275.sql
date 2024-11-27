	
	-- HABILITAR FILTRO G0018
		IF EXISTS(SELECT * FROM TBLScreenFields WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018') AND FieldName = 'MainFilterProductFamily' AND Enabled = 0)
		BEGIN
			UPDATE TBLScreenFields SET Enabled = 1 WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018') AND FieldName = 'MainFilterProductFamily'
		END

	-- HABILITAR FILTRO G0124
		IF EXISTS(SELECT * FROM TBLScreenFields WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0124') AND FieldName = 'MainFilterProductFamily' AND Enabled = 0)
		BEGIN
			UPDATE TBLScreenFields SET Enabled = 1 WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0124') AND FieldName = 'MainFilterProductFamily'
		END

	-- HABILITAR FILTRO G0125
		IF EXISTS(SELECT * FROM TBLScreenFields WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125') AND FieldName = 'MainFilterProductFamily' AND Enabled = 0)
		BEGIN
			UPDATE TBLScreenFields SET Enabled = 1 WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125') AND FieldName = 'MainFilterProductFamily'
		END

	-- HABILITAR FILTRO G0126
		IF EXISTS(SELECT * FROM TBLScreenFields WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0126') AND FieldName = 'MainFilterProductFamily' AND Enabled = 0)
		BEGIN
			UPDATE TBLScreenFields SET Enabled = 1 WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0126') AND FieldName = 'MainFilterProductFamily'
		END

	-- HABILITAR FILTRO G0128
		IF EXISTS(SELECT * FROM TBLScreenFields WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128') AND FieldName = 'MainFilterProductFamily' AND Enabled = 0)
		BEGIN
			UPDATE TBLScreenFields SET Enabled = 1 WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128') AND FieldName = 'MainFilterProductFamily'
		END

	-- HABILITAR FILTRO G0129
		IF EXISTS(SELECT * FROM TBLScreenFields WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129') AND FieldName = 'MainFilterProduct' AND Enabled = 0)
		BEGIN
			UPDATE TBLScreenFields SET Enabled = 1 WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129') AND FieldName = 'MainFilterProduct'
		END

		IF EXISTS(SELECT * FROM TBLScreenFields WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129') AND FieldName = 'MainFilterProductFamily' AND Enabled = 0)
		BEGIN
			UPDATE TBLScreenFields SET Enabled = 1 WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129') AND FieldName = 'MainFilterProductFamily'
		END

	-- PILAR DE PRODUÇÃO --
	-- G0001 -- PRIMEIRA ABA
		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'SCRAPTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0001'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0001', 'MainFilterProduct', 'MainFilterProduct','NULL', 'SCRAPTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'SCRAPTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0001'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0001', 'MainFilterProductType', 'MainFilterProductType','NULL', 'SCRAPTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'SCRAPTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0001'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0001', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'SCRAPTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0001 -- SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'LINETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0001'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0001', 'MainFilterProduct', 'MainFilterProduct','NULL', 'LINETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'LINETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0001'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0001', 'MainFilterProductType', 'MainFilterProductType','NULL', 'LINETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'LINETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0001'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0001', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'LINETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO
		
	-- G0004

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0004' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABELA'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0004'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0004', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABELA' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0004' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0004' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABELA'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0004'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0004', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABELA' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0004' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0004' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABELA'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0004'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0004', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABELA' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0004' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO	

	-- G0005

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TIMELINE'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0005'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0005', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TIMELINE' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TIMELINE'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0005'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0005', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TIMELINE' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TIMELINE'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0005'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0005', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TIMELINE' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0005' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0007 - PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0007'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0007', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0007'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0007', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0007'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0007', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0007 - SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETABRESUME'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0007'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0007', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETABRESUME' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETABRESUME'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0007'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0007', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETABRESUME' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETABRESUME'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0007'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0007', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETABRESUME' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0007 - TERCEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'BARTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0007'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0007', 'MainFilterProduct', 'MainFilterProduct','NULL', 'BARTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'BARTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0007'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0007', 'MainFilterProductType', 'MainFilterProductType','NULL', 'BARTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'BARTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0007'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0007', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'BARTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0007' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0009 - PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'STATUSSUMMARYCHARTTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0009'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0009', 'MainFilterProduct', 'MainFilterProduct','NULL', 'STATUSSUMMARYCHARTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'STATUSSUMMARYCHARTTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0009'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0009', 'MainFilterProductType', 'MainFilterProductType','NULL', 'STATUSSUMMARYCHARTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'STATUSSUMMARYCHARTTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0009'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0009', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'STATUSSUMMARYCHARTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0009 - SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0009'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0009', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0009'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0009', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0009'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0009', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0009 - TERCEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TYPESTATUSTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0009'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0009', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TYPESTATUSTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TYPESTATUSTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0009'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0009', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TYPESTATUSTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TYPESTATUSTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0009'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0009', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TYPESTATUSTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0009' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0019 - PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'SCRAPTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProduct', 'MainFilterProduct','NULL', 'SCRAPTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'SCRAPTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductType', 'MainFilterProductType','NULL', 'SCRAPTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'SCRAPTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'SCRAPTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0019 - SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'REWORKTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProduct', 'MainFilterProduct','NULL', 'REWORKTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'REWORKTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductType', 'MainFilterProductType','NULL', 'REWORKTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'REWORKTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'REWORKTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0019 - TERCEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0019 - QUARTA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'PARETOTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProduct', 'MainFilterProduct','NULL', 'PARETOTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'PARETOTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductType', 'MainFilterProductType','NULL', 'PARETOTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'PARETOTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'PARETOTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0019 - QUINTA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'REWORKPARETOTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProduct', 'MainFilterProduct','NULL', 'REWORKPARETOTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'REWORKPARETOTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductType', 'MainFilterProductType','NULL', 'REWORKPARETOTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'REWORKPARETOTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'REWORKPARETOTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0019 - SEXTA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'PRODUCTPARETOTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProduct', 'MainFilterProduct','NULL', 'PRODUCTPARETOTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'PRODUCTPARETOTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductType', 'MainFilterProductType','NULL', 'PRODUCTPARETOTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'PRODUCTPARETOTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0019'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0019', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'PRODUCTPARETOTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0019' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0020 - PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'OEETABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProduct', 'MainFilterProduct','NULL', 'OEETABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'OEETABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProductType', 'MainFilterProductType','NULL', 'OEETABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'OEETABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'OEETABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0020 - SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'SCRAPTABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProduct', 'MainFilterProduct','NULL', 'SCRAPTABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'SCRAPTABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProductType', 'MainFilterProductType','NULL', 'SCRAPTABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'SCRAPTABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'SCRAPTABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0020 - TERCEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'REWORKTABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProduct', 'MainFilterProduct','NULL', 'REWORKTABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'REWORKTABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProductType', 'MainFilterProductType','NULL', 'REWORKTABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'REWORKTABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'REWORKTABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0020 - QUARTA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'PERFORMANCETABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProduct', 'MainFilterProduct','NULL', 'PERFORMANCETABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'PERFORMANCETABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProductType', 'MainFilterProductType','NULL', 'PERFORMANCETABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'PERFORMANCETABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'PERFORMANCETABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0020 - QUINTA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'QUALITYTABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProduct', 'MainFilterProduct','NULL', 'QUALITYTABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'QUALITYTABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProductType', 'MainFilterProductType','NULL', 'QUALITYTABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'QUALITYTABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0020'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0020', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'QUALITYTABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0020' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0026 - PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0026'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0026', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0026'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0026', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0026'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0026', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0026 - SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'PARETOFREQTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0026'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0026', 'MainFilterProduct', 'MainFilterProduct','NULL', 'PARETOFREQTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'PARETOFREQTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0026'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0026', 'MainFilterProductType', 'MainFilterProductType','NULL', 'PARETOFREQTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'PARETOFREQTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0026'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0026', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'PARETOFREQTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0026 - TERCEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'PARETODURTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0026'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0026', 'MainFilterProduct', 'MainFilterProduct','NULL', 'PARETODURTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'PARETODURTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0026'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0026', 'MainFilterProductType', 'MainFilterProductType','NULL', 'PARETODURTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'PARETODURTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0026'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0026', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'PARETODURTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0026' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0100 - PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0100'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0100', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0100'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0100', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0100'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0100', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0100 - SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETABBTS'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0100'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0100', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETABBTS' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETABBTS'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0100'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0100', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETABBTS' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETABBTS'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0100'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0100', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETABBTS' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0100' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0103 - PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0103'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0103', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0103'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0103', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0103'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0103', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0103 - SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETABRESUME'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0103'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0103', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETABRESUME' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETABRESUME'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0103'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0103', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETABRESUME' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETABRESUME'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0103'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0103', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETABRESUME' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0103 - TERCEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'BARTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0103'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0103', 'MainFilterProduct', 'MainFilterProduct','NULL', 'BARTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'BARTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0103'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0103', 'MainFilterProductType', 'MainFilterProductType','NULL', 'BARTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'BARTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0103'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0103', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'BARTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0103' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0105 - PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'RESTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0105'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0105', 'MainFilterProduct', 'MainFilterProduct','NULL', 'RESTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'RESTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0105'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0105', 'MainFilterProductType', 'MainFilterProductType','NULL', 'RESTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'RESTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0105'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0105', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'RESTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0105 - SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TRAININGTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0105'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0105', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TRAININGTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TRAININGTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0105'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0105', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TRAININGTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TRAININGTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0105'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0105', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TRAININGTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0105 - TERCEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'VERSATILITYTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0105'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0105', 'MainFilterProduct', 'MainFilterProduct','NULL', 'VERSATILITYTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'VERSATILITYTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0105'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0105', 'MainFilterProductType', 'MainFilterProductType','NULL', 'VERSATILITYTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'VERSATILITYTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0105'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0105', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'VERSATILITYTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0105' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- PILAR DE QUALIDADE --
	-- G0138

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0138'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0138', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0138'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0138', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0138'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0138', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0138' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- PILAR DE QUALIDADE --
	-- G0141

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0141'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0141', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0141'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0141', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0141'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0141', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0141' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- FILTRO DE OPERAÇÃO
	-- PILAR DE PRODUÇÃO
	-- G0002

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0002' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABELA'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABELA' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0002' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0002' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0002' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0003

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0003' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0003' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0003' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0003' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0006

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0006' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABELA'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABELA' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0006' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0006' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0006' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0008

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0008' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABELA'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABELA' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0008' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0008' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0008' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0010

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0010' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABELA'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABELA' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0010' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0010' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0010' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO
		
	-- G0013
	-- PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0013' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0013' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0013' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0013' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0013
	-- SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0013' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'LINETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'LINETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0013' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0013' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0013' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO
	
	-- G0015
	-- PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0015
	-- SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'PARETOTAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'PARETOTAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0015
	-- TERCEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'DURATIONTAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'DURATIONTAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0015' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0021
	-- PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'CHARTTAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'CHARTTAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0021
	-- SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0021' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO
		
	-- G0022
	-- PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0022
	-- SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'GANTTTAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'GANTTTAB' , 0, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 0, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'GANTTTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0022'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0022', 'MainFilterProduct', 'MainFilterProduct','NULL', 'GANTTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'GANTTTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0022'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0022', 'MainFilterProductType', 'MainFilterProductType','NULL', 'GANTTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'GANTTTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0022'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0022', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'GANTTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0022' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0025

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0025' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0025' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0025' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0025' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0033

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0033' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0033' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0033' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0033' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0043
	-- PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0043
	-- SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'JUSTIFICATIVSTAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'JUSTIFICATIVSTAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0043' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0050

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0099

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0099' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0099' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0099' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0099' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- PILAR DE MATERIAIS
	-- G0012

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0012' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0016

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0016' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0017

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0017' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0017' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0017' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0017' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0018

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0018' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0124

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0124' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0124' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0124' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0124' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0125

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0125' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0126

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0126' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0126' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0126' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0126' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0128

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0128' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0129

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'TABLETAB' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0129' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO
		
	-- PILAR DE MANUTENÇÃO
	-- G0131
	-- PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0131'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0131', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0131'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0131', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0131'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0131', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'CHARTTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0131'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0131', 'MainFilterProduct', 'MainFilterProduct','NULL', 'CHARTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'CHARTTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0131'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0131', 'MainFilterProductType', 'MainFilterProductType','NULL', 'CHARTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'CHARTTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0131'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0131', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'CHARTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0131' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0132
	-- PRIMEIRA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0132'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0132', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0132'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0132', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0132'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0132', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- SEGUNDA ABA

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'CHARTTAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0132'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0132', 'MainFilterProduct', 'MainFilterProduct','NULL', 'CHARTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'CHARTTAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0132'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0132', 'MainFilterProductType', 'MainFilterProductType','NULL', 'CHARTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'CHARTTAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0132'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0132', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'CHARTTAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0132' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0134

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0134'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0134', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0134'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0134', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0134'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0134', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0134' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0137

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0137'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0137', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0137'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0137', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0137'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0137', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0137' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0149

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0149'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0149', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0149'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0149', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0149'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0149', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0149' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- PILAR DE FERRAMENTAL
	-- G0150

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0150' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0150'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0150', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0150' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0150' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0150'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0150', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0150' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0150' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0150'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0150', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0150' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0151

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0151' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0151'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0151', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0151' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0151' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0151'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0151', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0151' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0151' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0151'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0151', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0151' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0152

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0152' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0152'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0152', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0152' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0152' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0152'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0152', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0152' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0152' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0152'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0152', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0152' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0153

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0153' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0153'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0153', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0153' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0153' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0153'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0153', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0153' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0153' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0153'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0153', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0153' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0154

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0154' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0154'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0154', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0154' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0154' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0154'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0154', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0154' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0154' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0154'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0154', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0154' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0155

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0155' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0155'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0155', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0155' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0155' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0155'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0155', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0155' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0155' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0155'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0155', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0155' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0156

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0156' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0156'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0156', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0156' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0156' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0156'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0156', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0156' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0156' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0156'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0156', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0156' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- G0157

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0157' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProduct'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProduct'
		AND TableName = 'G0157'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0157', 'MainFilterProduct', 'MainFilterProduct','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0157' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0157' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductType'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductType'
		AND TableName = 'G0157'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0157', 'MainFilterProductType', 'MainFilterProductType','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0157' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0157' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'MainFilterProductFamily'
		AND GroupName = 'TABLETAB'
		AND FieldName = 'MainFilterProductFamily'
		AND TableName = 'G0157'
		AND FieldType = 'NULL')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('G0157', 'MainFilterProductFamily', 'MainFilterProductFamily','NULL', 'TABLETAB' , 0, '',0,0,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0157' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	--------------------------------------------------
	-- DASHBOARD CARDS
	-- HISTÓRICO DE ALARMES

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'Histórico de Alarmes'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'Histórico de Alarmes' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO
		
		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- SINÓPTICO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'Sinóptico'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'Sinóptico' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO
		
		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- PARADAS

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'Paradas'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'Paradas' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO
		
		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- PARADAS POR DURAÇÃO

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'Paradas por Duração'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'Paradas por Duração' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO
		
		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO

	-- PARETO JUSTIFICATIVA DE ALARME

		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterOptions'
		AND GroupName = 'Pareto Justificativa de Alarme'
		AND FieldName = 'CodeOperation'
		AND TableName = 'CodeOperation'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('CodeOperation', 'CodeOperation', 'FilterOptions','text', 'Pareto Justificativa de Alarme' , 1, '',0,2,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO
		
		IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
		(SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
		AND ComponentType = 'FilterValues'
		AND GroupName = 'CodeOperation'
		AND FieldName = 'OperationCode'
		AND TableName = 'OperationCode'
		AND FieldType = 'text')
		BEGIN
		INSERT INTO TBLScreenFields (TableName, FieldName,ComponentType,FieldType, GroupName, [Enabled], DefaultValue, [Hidden], FieldOrder, CustomField,IdScreen)
		VALUES ('OperationCode', 'OperationCode', 'FilterValues','text', 'CodeOperation' , 1, '',0,1,'', (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD' AND
		IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')))
		END
		GO