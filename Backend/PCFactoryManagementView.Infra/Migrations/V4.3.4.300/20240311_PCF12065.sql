
	IF NOT EXISTS (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_INTEGRACAO')
	BEGIN
		INSERT INTO TBLScreenMenus (IDSuperiorScreenMenu, MenuOrder, Code, FlgEnable)
		VALUES ((
					SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'PCF4View'
				),
				1,
				'VIEW_MENU_INTEGRACAO',
				1
		)
	END

	IF (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_INTEGRACAO') <> (SELECT IDSuperiorScreenMenu FROM TBLScreenMenus WHERE Code LIKE 'VIEW_MENU_G0113')
	BEGIN
		UPDATE TBLScreenMenus SET IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_INTEGRACAO'), Link = '/report/integ/G0113' 
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0113')
	END

	IF (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_INTEGRACAO') <> (SELECT IDSuperiorScreenMenu FROM TBLScreenMenus WHERE Code LIKE 'VIEW_MENU_G0114')
	BEGIN
		UPDATE TBLScreenMenus SET IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_INTEGRACAO'), Link = '/report/integ/G0114' 
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0114')
	END

	IF (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_INTEGRACAO') <> (SELECT IDSuperiorScreenMenu FROM TBLScreenMenus WHERE Code LIKE 'VIEW_MENU_G0115')
	BEGIN
		UPDATE TBLScreenMenus SET IDSuperiorScreenMenu = (SELECT IDScreenMenu FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_INTEGRACAO'), Link = '/report/integ/G0115' 
		WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0115')
	END