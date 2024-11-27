IF EXISTS (Select idLocalization from TBLLocalizations where TranslationKey = 'PACE' and IDScreen = -1)
BEGIN
	Update TBLLocalizations set PTLocal = 'Ritmo' where TranslationKey = 'PACE' and IDScreen = -1
END