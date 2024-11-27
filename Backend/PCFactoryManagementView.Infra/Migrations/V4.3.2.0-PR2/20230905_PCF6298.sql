-------------------------------------- Atualização dos filtros antigos que eram switch's --------------------------------------

-- Update do FilterOption
IF EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterOptions'
AND GroupName = 'TABLETAB'
AND FieldName = 'PiecesType'
AND TableName = 'registersType'
AND FieldType = 'checkbox')
BEGIN
	UPDATE TBLScreenFields 
	SET FieldType = 'radio'
	WHERE IDScreenFields = (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterOptions'
	AND GroupName = 'TABLETAB'
	AND FieldName = 'PiecesType'
	AND TableName = 'registersType'
	AND FieldType = 'checkbox')
END
GO

-- Update do FilterValue de Peças boas
IF EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersType'
AND FieldName = 'GoodPieces'
AND TableName = 'GoodPieces'
AND FieldType = 'checkbox')
BEGIN
	UPDATE TBLScreenFields 
	SET FieldType = 'radio'
	WHERE IDScreenFields = (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'registersType'
	AND FieldName = 'GoodPieces'
	AND TableName = 'GoodPieces'
	AND FieldType = 'checkbox')
END
GO

-- Update do FilterValue de Refugo
IF EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersType'
AND FieldName = 'Scrap'
AND TableName = 'Scrap'
AND FieldType = 'checkbox')
BEGIN
	UPDATE TBLScreenFields
	SET FieldType = 'radio'
	WHERE IDScreenFields = (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
	(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
	AND ComponentType = 'FilterValues'
	AND GroupName = 'registersType'
	AND FieldName = 'Scrap'
	AND TableName = 'Scrap'
	AND FieldType = 'checkbox')
END
GO

-- Update do FilterValue de Retrabalho
IF EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'FilterValues'
AND GroupName = 'registersType'
AND FieldName = 'Rework'
AND TableName = 'Rework'
AND FieldType = 'checkbox')
BEGIN
    UPDATE TBLScreenFields
    SET FieldType = 'radio'
    WHERE IDScreenFields = (SELECT IDScreenFields FROM TBLScreenFields WHERE IDScreen =
    (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0050' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
    AND ComponentType = 'FilterValues'
    AND GroupName = 'registersType'
    AND FieldName = 'Rework'
    AND TableName = 'Rework'
    AND FieldType = 'checkbox')
END
GO
