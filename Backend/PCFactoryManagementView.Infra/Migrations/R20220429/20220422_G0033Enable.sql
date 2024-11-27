IF EXISTS (
	SELECT 
		IDScreen 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0033'
) AND (SELECT FlgEnable FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0033' 
AND IDScreen = (SELECT 
					IDScreen
				FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0033')) <> 1
BEGIN
	UPDATE TBLScreenMenus
		SET FlgEnable = 1
	WHERE Code = 'VIEW_MENU_G0033' AND IDScreen = (SELECT 
					IDScreen
				FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0033')
 END
GO