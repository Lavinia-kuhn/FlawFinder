IF EXISTS (SELECT IDScreenFields from TBLScreenFields where IDScreen IN (SELECT IDScreen FROM TblScreen WHERE Code IN ('G0050','G0099')) 
AND FieldType = 'radio' AND (GroupName = 'registersUni' OR TableName = 'registersUni') )
BEGIN
	DELETE FROM TBLScreenFields 
	WHERE IDScreen IN (SELECT IDScreen FROM TblScreen WHERE Code IN ('G0050','G0099')) 
	AND FieldType = 'radio' AND (GroupName = 'registersUni' OR TableName = 'registersUni')
END
GO
