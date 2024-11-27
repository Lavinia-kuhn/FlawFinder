IF EXISTS (
	SELECT 
		IDScreen 
	FROM TBLSCREENFIELDS WHERE TableName = 'G0015' AND GroupName = 'DURATIONTAB' AND IDScreen = (SELECT 
				IDScreen
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0015')
) AND (SELECT FieldName FROM TBLSCREENFIELDS WHERE TableName = 'G0015' AND GroupName = 'DURATIONTAB' 
AND IDScreen = (SELECT 
					IDScreen
				FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0015')) <> 'paretoDuration'
BEGIN
	UPDATE TBLSCREENFIELDS
		SET FieldName = 'paretoDuration'
	WHERE TableName = 'G0015' AND GroupName = 'DURATIONTAB' AND IDScreen = (SELECT 
				IDScreen
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0015')
 END
GO