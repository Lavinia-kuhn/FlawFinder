
	IF EXISTS(SELECT * FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0132') AND NOT EXISTS(SELECT * FROM TBLLocalizations WHERE PTLocal = 'G0132-DTM OEE') 
	BEGIN
		UPDATE TBLLocalizations SET PTLocal = 'G0132-DTM OEE', ENLocal = 'G0132-OEE DTM', ESLocal = 'G0132-DTM OEE' WHERE TranslationKey = 'VIEW_MENU_G0132'
	END

	IF EXISTS(SELECT * FROM TBLLocalizations WHERE TranslationKey = 'VIEW_MENU_G0001') AND NOT EXISTS(SELECT * FROM TBLLocalizations WHERE PTLocal = 'G0001-Indicadores OEE')
	BEGIN
		UPDATE TBLLocalizations SET PTLocal = 'G0001-Indicadores OEE', ENLocal = 'G0001-OEE Indicators', ESLocal = 'G0001-Indicadores OEE' WHERE TranslationKey = 'VIEW_MENU_G0001'
	END
