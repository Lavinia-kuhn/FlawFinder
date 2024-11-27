
	IF NOT EXISTS (SELECT * FROM SYSOBJECTS WHERE name = 'TBLMVDashboardUsrConfig')
	BEGIN
		CREATE TABLE TBLMVDashboardUsrConfig (
			IDDashboardHD INT,
			IDUser INT,
			MainView INT,
			FOREIGN KEY (IDDashboardHD) REFERENCES TBLMVDashboardHD(IDDashboardHD),
			FOREIGN KEY (IDUser) REFERENCES TBLUser(IDUser)
		);
	END