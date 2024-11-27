--==========================================================================
--Inicio - Relatorios de Producao

-- VIEW_MENU_G0001
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0001'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0001' AND ShortCut = 'G0001' GROUP BY MenuOrder) <> 0
BEGIN
	UPDATE TBLScreenMenus
		SET MenuOrder = 0
	WHERE Code = 'VIEW_MENU_G0001' AND ShortCut = 'G0001'
 END
GO

-- VIEW_MENU_G0002
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0002'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0002' AND ShortCut = 'G0002' GROUP BY MenuOrder) <> 1
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 1
 WHERE Code = 'VIEW_MENU_G0002' AND ShortCut = 'G0002'
 END

GO

-- VIEW_MENU_G0003
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0003'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0003' AND ShortCut = 'G0003' GROUP BY MenuOrder) <> 2
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 2
 WHERE Code = 'VIEW_MENU_G0003' AND ShortCut = 'G0003'
 END

GO

-- VIEW_MENU_G0004
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0004'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0004' AND ShortCut = 'G0004' GROUP BY MenuOrder) <> 3
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 3
 WHERE Code = 'VIEW_MENU_G0004' AND ShortCut = 'G0004'
 END

GO

-- VIEW_MENU_G0005
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0005'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0005' AND ShortCut = 'G0005' GROUP BY MenuOrder) <> 4
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 4
 WHERE Code = 'VIEW_MENU_G0005' AND ShortCut = 'G0005'
 END

GO

-- VIEW_MENU_G0006
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0006'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0006' AND ShortCut = 'G0006' GROUP BY MenuOrder) <> 5
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 5
 WHERE Code = 'VIEW_MENU_G0006' AND ShortCut = 'G0006'
 END

GO

-- VIEW_MENU_G0007
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0007'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0007' AND ShortCut = 'G0007' GROUP BY MenuOrder) <> 6
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 6
 WHERE Code = 'VIEW_MENU_G0007' AND ShortCut = 'G0007'
 END

GO

-- VIEW_MENU_G0008
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0008'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0008' AND ShortCut = 'G0008' GROUP BY MenuOrder) <> 7
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 7
 WHERE Code = 'VIEW_MENU_G0008' AND ShortCut = 'G0008'
 END

GO

-- VIEW_MENU_G0009
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0009'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0009' AND ShortCut = 'G0009' GROUP BY MenuOrder) <> 8
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 8
 WHERE Code = 'VIEW_MENU_G0009' AND ShortCut = 'G0009'
 END

GO

-- VIEW_MENU_G0010
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0010'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0010' AND ShortCut = 'G0010' GROUP BY MenuOrder) <> 9
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 9
 WHERE Code = 'VIEW_MENU_G0010' AND ShortCut = 'G0010'
 END

GO

-- VIEW_MENU_G0011
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0011'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0011' AND ShortCut = 'G0011' GROUP BY MenuOrder) <> 10
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 10
 WHERE Code = 'VIEW_MENU_G0011' AND ShortCut = 'G0011'
 END

GO

-- VIEW_MENU_G0013
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0013'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0013' AND ShortCut = 'G0013' GROUP BY MenuOrder) <> 11
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 11
 WHERE Code = 'VIEW_MENU_G0013' AND ShortCut = 'G0013'
 END

GO

-- VIEW_MENU_G0015
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0015'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0015' AND ShortCut = 'G0015' GROUP BY MenuOrder) <> 12
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 12
 WHERE Code = 'VIEW_MENU_G0015' AND ShortCut = 'G0015'
 END

GO

-- VIEW_MENU_G0019
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0019'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0019' AND ShortCut = 'G0019' GROUP BY MenuOrder) <> 13
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 13
 WHERE Code = 'VIEW_MENU_G0019' AND ShortCut = 'G0019'
 END

GO

-- VIEW_MENU_G0020
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0020'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0020' AND ShortCut = 'G0020' GROUP BY MenuOrder) <> 14
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 14
 WHERE Code = 'VIEW_MENU_G0020' AND ShortCut = 'G0020'
 END

GO

-- VIEW_MENU_G0021
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0021'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0021' AND ShortCut = 'G0021' GROUP BY MenuOrder) <> 15
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 15
 WHERE Code = 'VIEW_MENU_G0021' AND ShortCut = 'G0021'
 END

GO

-- VIEW_MENU_G0022
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0022'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0022' AND ShortCut = 'G0022' GROUP BY MenuOrder) <> 16
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 16
 WHERE Code = 'VIEW_MENU_G0022' AND ShortCut = 'G0022'
 END

GO

-- VIEW_MENU_G0023
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0023'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0023' AND ShortCut = 'G0023' GROUP BY MenuOrder) <> 17
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 17
 WHERE Code = 'VIEW_MENU_G0023' AND ShortCut = 'G0023'
 END

GO

-- VIEW_MENU_G0025
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0025'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0025' AND ShortCut = 'G0025' GROUP BY MenuOrder) <> 18
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 18
 WHERE Code = 'VIEW_MENU_G0025' AND ShortCut = 'G0025'
 END

GO

-- VIEW_MENU_G0029
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0029'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0029' AND ShortCut = 'G0029' GROUP BY MenuOrder) <> 19
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 19
 WHERE Code = 'VIEW_MENU_G0029' AND ShortCut = 'G0029'
 END

GO

-- VIEW_MENU_G0033
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0033'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0033' AND ShortCut = 'G0033' GROUP BY MenuOrder) <> 20
BEGIN
 UPDATE TBLScreenMenus
	SET MenuOrder = 20
 WHERE Code = 'VIEW_MENU_G0033' AND ShortCut = 'G0033'
 END

GO

-- VIEW_MENU_G0041
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0041'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0041' AND ShortCut = 'G0041' GROUP BY MenuOrder) <> 21
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 21
 WHERE Code = 'VIEW_MENU_G0041' AND ShortCut = 'G0041'
 END

GO

-- VIEW_MENU_G0043
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0043'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0043' AND ShortCut = 'G0043' GROUP BY MenuOrder) <> 22
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 22
 WHERE Code = 'VIEW_MENU_G0043' AND ShortCut = 'G0043'
 END

GO

-- VIEW_MENU_G0050
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0050'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0050' AND ShortCut = 'G0050' GROUP BY MenuOrder) <> 23
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 23
 WHERE Code = 'VIEW_MENU_G0050' AND ShortCut = 'G0050'
 END

GO

-- VIEW_MENU_G0099
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0099'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0099' AND ShortCut = 'G0099' GROUP BY MenuOrder) <> 24
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 24
 WHERE Code = 'VIEW_MENU_G0099' AND ShortCut = 'G0099'
 END

GO

-- VIEW_MENU_G0100
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0100'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0100' AND ShortCut = 'G0100' GROUP BY MenuOrder) <> 25
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 25
 WHERE Code = 'VIEW_MENU_G0100' AND ShortCut = 'G0100'
 END

GO

-- VIEW_MENU_G0103
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0103'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0103' AND ShortCut = 'G0103' GROUP BY MenuOrder) <> 26
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 26
 WHERE Code = 'VIEW_MENU_G0103' AND ShortCut = 'G0103'
 END

GO

-- H8001
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'H8001'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_PRODUCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'H8001' AND ShortCut = 'H8001' GROUP BY MenuOrder) <> 27
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 27
 WHERE Code = 'H8001' AND ShortCut = 'H8001'
 END

GO

--Fim - Relatorios de Producao
--==========================================================================

--Inicio - Relatorios de Ferramental

-- VIEW_MENU_G0150
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0150'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_FERRAMENTAL'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0150' AND ShortCut = 'G0150' GROUP BY MenuOrder) <> 28
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 28
 WHERE Code = 'VIEW_MENU_G0150' AND ShortCut = 'G0150'
 END

GO

-- VIEW_MENU_G0151
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0151'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_FERRAMENTAL'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0151' AND ShortCut = 'G0151' GROUP BY MenuOrder) <> 29
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 29
 WHERE Code = 'VIEW_MENU_G0151' AND ShortCut = 'G0151'
 END

GO

-- VIEW_MENU_G0152
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0152'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_FERRAMENTAL'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0152' AND ShortCut = 'G0152' GROUP BY MenuOrder) <> 30
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 30
 WHERE Code = 'VIEW_MENU_G0152' AND ShortCut = 'G0152'
 END

GO

-- VIEW_MENU_G0153
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0153'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_FERRAMENTAL'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0153' AND ShortCut = 'G0153' GROUP BY MenuOrder) <> 31
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 31
 WHERE Code = 'VIEW_MENU_G0153' AND ShortCut = 'G0153'
 END

GO

-- VIEW_MENU_G0154
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0154'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_FERRAMENTAL'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0154' AND ShortCut = 'G0154' GROUP BY MenuOrder) <> 32
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 32
 WHERE Code = 'VIEW_MENU_G0154' AND ShortCut = 'G0154'
 END

GO

-- VIEW_MENU_G0155
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0155'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_FERRAMENTAL'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0155' AND ShortCut = 'G0155' GROUP BY MenuOrder) <> 33
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 33
 WHERE Code = 'VIEW_MENU_G0155' AND ShortCut = 'G0155'
 END

GO

-- VIEW_MENU_G0156
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0156'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_FERRAMENTAL'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0156' AND ShortCut = 'G0156' GROUP BY MenuOrder) <> 34
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 34
 WHERE Code = 'VIEW_MENU_G0156' AND ShortCut = 'G0156'
 END

GO

-- VIEW_MENU_G0157
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0157'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_FERRAMENTAL'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0157' AND ShortCut = 'G0157' GROUP BY MenuOrder) <> 35
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 35
 WHERE Code = 'VIEW_MENU_G0157' AND ShortCut = 'G0157'
 END

GO

--Fim - Relatorios de Ferramental
--==========================================================================

--Inicio - Relatorios de Qualidade

-- VIEW_MENU_G0138
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0138'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0138' AND ShortCut = 'G0138' GROUP BY MenuOrder) <> 36
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 36
 WHERE Code = 'VIEW_MENU_G0138' AND ShortCut = 'G0138'
 END

GO

-- VIEW_MENU_G0140
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0140'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0140' AND ShortCut = 'G0140' GROUP BY MenuOrder) <> 37
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 37
 WHERE Code = 'VIEW_MENU_G0140' AND ShortCut = 'G0140'
 END

GO

-- VIEW_MENU_G0141
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0141'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0141' AND ShortCut = 'G0141' GROUP BY MenuOrder) <> 38
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 38
 WHERE Code = 'VIEW_MENU_G0141' AND ShortCut = 'G0141'
 END

GO

-- VIEW_MENU_G0142
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0142'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0142' AND ShortCut = 'G0142' GROUP BY MenuOrder) <> 39
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 39
 WHERE Code = 'VIEW_MENU_G0142' AND ShortCut = 'G0142'
 END

GO

-- VIEW_MENU_G0143
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0143'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0143' AND ShortCut = 'G0143' GROUP BY MenuOrder) <> 40
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 40
 WHERE Code = 'VIEW_MENU_G0143' AND ShortCut = 'G0143'
 END

GO

-- VIEW_MENU_G0145
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0145'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0145' AND ShortCut = 'G0145' GROUP BY MenuOrder) <> 41
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 41
 WHERE Code = 'VIEW_MENU_G0145' AND ShortCut = 'G0145'
 END

GO

-- VIEW_MENU_G0147
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0147'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0147' AND ShortCut = 'G0147' GROUP BY MenuOrder) <> 42
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 42
 WHERE Code = 'VIEW_MENU_G0147' AND ShortCut = 'G0147'
 END

GO

-- VIEW_MENU_G0148
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0148'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0148' AND ShortCut = 'G0148' GROUP BY MenuOrder) <> 43
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 43
 WHERE Code = 'VIEW_MENU_G0148' AND ShortCut = 'G0148'
 END

GO

-- VIEW_MENU_G0160
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0160'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_QUALIDADE'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0160' AND ShortCut = 'G0160' GROUP BY MenuOrder) <> 44
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 44
 WHERE Code = 'VIEW_MENU_G0160' AND ShortCut = 'G0160'
 END

GO

--Fim - Relatorios de Qualidade
--==========================================================================

--Inicio - Relatorios de Materiais

-- VIEW_MENU_G0012
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0012'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0012' AND ShortCut = 'G0012' GROUP BY MenuOrder) <> 45
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 45
 WHERE Code = 'VIEW_MENU_G0012' AND ShortCut = 'G0012'
 END

GO

-- VIEW_MENU_G0014
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0014'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0014' AND ShortCut = 'G0014' GROUP BY MenuOrder) <> 46
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 46
 WHERE Code = 'VIEW_MENU_G0014' AND ShortCut = 'G0014'
 END

GO

-- VIEW_MENU_G0016
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0016'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0016' AND ShortCut = 'G0016' GROUP BY MenuOrder) <> 47
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 47
 WHERE Code = 'VIEW_MENU_G0016' AND ShortCut = 'G0016'
 END

GO

-- VIEW_MENU_G0017
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0017'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0017' AND ShortCut = 'G0017' GROUP BY MenuOrder) <> 48
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 48
 WHERE Code = 'VIEW_MENU_G0017' AND ShortCut = 'G0017'
 END

GO

-- VIEW_MENU_G0018
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0018'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0018' AND ShortCut = 'G0018' GROUP BY MenuOrder) <> 49
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 49
 WHERE Code = 'VIEW_MENU_G0018' AND ShortCut = 'G0018'
 END

GO

-- VIEW_MENU_G0125
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0125'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0125' AND ShortCut = 'G0125' GROUP BY MenuOrder) <> 50
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 50
 WHERE Code = 'VIEW_MENU_G0125' AND ShortCut = 'G0125'
 END

GO
-- VIEW_MENU_G0126
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0126'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0126' AND ShortCut = 'G0126' GROUP BY MenuOrder) <> 51
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 51
 WHERE Code = 'VIEW_MENU_G0126' AND ShortCut = 'G0126'
 END

GO
-- VIEW_MENU_G0128
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0128'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MATERIAIS'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0128' AND ShortCut = 'G0128' GROUP BY MenuOrder) <> 52
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 52
 WHERE Code = 'VIEW_MENU_G0128' AND ShortCut = 'G0128'
 END

GO
--Fim - Relatorios de Materiais
--==========================================================================

--Inicio - Relatorios de Manutencao

-- VIEW_MENU_G0131
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0131'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0131' AND ShortCut = 'G0131' GROUP BY MenuOrder) <> 53
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 53
 WHERE Code = 'VIEW_MENU_G0131' AND ShortCut = 'G0131'
 END

GO

-- VIEW_MENU_G0132
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0132'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0132' AND ShortCut = 'G0132' GROUP BY MenuOrder) <> 54
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 54
 WHERE Code = 'VIEW_MENU_G0132' AND ShortCut = 'G0132'
 END

GO

-- VIEW_MENU_G0133
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0133'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0133' AND ShortCut = 'G0133' GROUP BY MenuOrder) <> 55
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 55
 WHERE Code = 'VIEW_MENU_G0133' AND ShortCut = 'G0133'
 END

GO

-- VIEW_MENU_G0134
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0134'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0134' AND ShortCut = 'G0134' GROUP BY MenuOrder) <> 56
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 56
 WHERE Code = 'VIEW_MENU_G0134' AND ShortCut = 'G0134'
 END

GO

-- VIEW_MENU_G0135
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0135'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0135' AND ShortCut = 'G0135' GROUP BY MenuOrder) <> 57
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 57
 WHERE Code = 'VIEW_MENU_G0135' AND ShortCut = 'G0135'
 END

GO

-- VIEW_MENU_G0137
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0137'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0137' AND ShortCut = 'G0137' GROUP BY MenuOrder) <> 58
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 58
 WHERE Code = 'VIEW_MENU_G0137' AND ShortCut = 'G0137'
 END

GO

-- VIEW_MENU_G0144
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0144'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0144' AND ShortCut = 'G0144' GROUP BY MenuOrder) <> 59
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 59
 WHERE Code = 'VIEW_MENU_G0144' AND ShortCut = 'G0144'
 END

GO

-- VIEW_MENU_G0146
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0146'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0146' AND ShortCut = 'G0146' GROUP BY MenuOrder) <> 60
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 60
 WHERE Code = 'VIEW_MENU_G0146' AND ShortCut = 'G0146'
 END

GO

-- VIEW_MENU_G0149
IF EXISTS (
	SELECT 
		IDScreenMenu 
	FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0149'
		AND IDSuperiorScreenMenu = (
			SELECT 
				IDScreenMenu 
			FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_MANUTENCAO'
			)
) AND (SELECT MenuOrder FROM TBLScreenMenus WHERE Code = 'VIEW_MENU_G0149' AND ShortCut = 'G0149' GROUP BY MenuOrder) <> 61
BEGIN
UPDATE TBLScreenMenus
	SET MenuOrder = 61
 WHERE Code = 'VIEW_MENU_G0149' AND ShortCut = 'G0149'
 END

GO

--Fim - Relatorios de Manutencao
--==========================================================================