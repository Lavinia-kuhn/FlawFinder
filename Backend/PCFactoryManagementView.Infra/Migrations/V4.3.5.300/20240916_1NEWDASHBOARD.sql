

-- --------------------------------------------------------------CARDS
IF OBJECT_ID('TBLMVCards', 'U') IS NULL
BEGIN
	CREATE TABLE TBLMVCards (
		IDCard INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		CardName VARCHAR(MAX),
		CardUrl VARCHAR(MAX),
		CardType VARCHAR(MAX),
		Pillar VARCHAR(MAX),
		Filters VARCHAR(MAX),
		DtCreation DATETIME,
		IDUserCreation INT FOREIGN KEY REFERENCES TBLUser(IDUser),
		IDPref INT FOREIGN KEY REFERENCES TBLPrefs(IDPref),
		DuplicatedCard INT,
		SavedForMore INT,
		Height INT,
		Width INT,
		FlgPreference INT
	);
END

IF OBJECT_ID('TBLMVCardsUsrGroup', 'U') IS NULL
BEGIN
	CREATE TABLE TBLMVCardsUsrGroup (
		IDMVCardsUsrGroup INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		IDCard INT NOT NULL,
		IDUsrGroup INT NOT NULL,
		FlgEnable INT,
		FOREIGN KEY (IDCard) REFERENCES TBLMVCards(IDCard),
		FOREIGN KEY (IDUsrGroup) REFERENCES TBLUsrGroup(IDUsrGroup)
	);
END

-- --------------------------------------------------------------ANDON
IF OBJECT_ID('TBLMvAndonHD', 'U') IS NULL
BEGIN
   CREATE TABLE TBLMVAndonHD (
		IDAndonHD INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		AndonName VARCHAR(MAX),
		Link VARCHAR(MAX),
		IDResourceMapHD INT FOREIGN KEY REFERENCES TBLResourceMapHD(IDResourceMapHD),
		IDAddressMapHD INT FOREIGN KEY REFERENCES TBLAddressMapHD(IDAddressMapHD),
		PeriodFilter INT,
		CardTime INT,
		ChangePageTime INT,
		RefreshTime INT,
		FlgEnable INT,
		DtCreation DATETIME,
		IDUserCreation INT FOREIGN KEY REFERENCES TBLUser(IDUser),
		SavedForMore INT
	);
END

IF OBJECT_ID('TBLMVAndonDet', 'U') IS NULL
BEGIN
	CREATE TABLE TBLMVAndonDet (
		IDAndonDet INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		IDAndonHD INT NOT NULL,
		IDCard INT NOT NULL,
		GridsterPref VARCHAR(MAX),
		FilterPref VARCHAR(MAX),
		FOREIGN KEY (IDAndonHD) REFERENCES TBLMVAndonHD(IDAndonHD),
		FOREIGN KEY (IDCard) REFERENCES TBLMVCards(IDCard)
	);
END

IF OBJECT_ID('TBLMVAndonUsrGroup', 'U') IS NULL
BEGIN
	CREATE TABLE TBLMVAndonUsrGroup  (
		IDAndonUsrGroup INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		IDAndonHD INT NOT NULL,
		IDUsrGroup INT NOT NULL,
		FlgEnable INT,
		FOREIGN KEY (IDAndonHD) REFERENCES TBLAndonHD(IDAndonHD),
		FOREIGN KEY (IDUsrGroup) REFERENCES TBLUsrGroup(IDUsrGroup)
	);
END 

-- --------------------------------------------------------------DASHBOARD
IF OBJECT_ID('TBLMVDashboardHD', 'U') IS NOT NULL
BEGIN
	ALTER TABLE TBLMVDashboardHD
		ADD SavedForMore integer;
END


IF OBJECT_ID('TBLMVDashboardDet', 'U') IS NOT NULL
BEGIN
	ALTER TABLE TBLMVDashboardDet ADD 
		IDCard INT,
		GridsterPref VARCHAR(MAX),
		FiltersPref VARCHAR(MAX),
		DtLastUpdate DATETIME,
		IDUserLastUpdate INT

		ALTER TABLE TBLMVDashboardDet ADD 
		CONSTRAINT FK_TBLMVDASH_IDCARD FOREIGN KEY (IDCard) REFERENCES TBLMVCards(IDCard),
		CONSTRAINT FK_TBLMVDASH_IDUSERUPD FOREIGN KEY (IDUserLastUpdate) REFERENCES TBLUser(IDUser)
END

IF OBJECT_ID('TBLMVDashboardUsrGroup', 'U') IS NULL
BEGIN
	CREATE TABLE TBLMVDashboardUsrGroup  (
		IDDashboardUsrGroup INT IDENTITY(1,1) PRIMARY KEY NOT NULL,
		IDDashboardHD INT NOT NULL,
		IDUsrGroup INT NOT NULL,
		FlgEnable INT,
		FOREIGN KEY (IDDashboardHD) REFERENCES TBLMVDashboardHD(IDDashboardHD),
		FOREIGN KEY (IDUsrGroup) REFERENCES TBLUsrGroup(IDUsrGroup)
	);
END

