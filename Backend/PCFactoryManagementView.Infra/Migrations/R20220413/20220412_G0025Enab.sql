IF EXISTS (
	SELECT 
		IDScreen 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0025'
) AND (SELECT FlgEnable FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0025' 
AND IDScreen = (SELECT 
					IDScreen
				FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0025')) <> 1
BEGIN
	UPDATE TBLScreenMenus
		SET FlgEnable = 1
	WHERE Code = 'VIEW_MENU_G0025' AND IDScreen = (SELECT 
					IDScreen
				FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0025')
 END
GO