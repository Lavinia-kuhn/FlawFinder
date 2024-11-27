
	IF EXISTS(SELECT * FROM TBLMVDashboardHD WHERE ViewName = 'Visão Atual')
	BEGIN
		UPDATE TBLMVDashboardHD SET ViewName = 'VisaoAtual' WHERE ViewName = 'Visão Atual'
	END