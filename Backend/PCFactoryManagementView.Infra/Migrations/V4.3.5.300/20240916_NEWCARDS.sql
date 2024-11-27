--Card de Efici�ncia
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'EFFICIENCYCARD' AND CardType = 'basiccard-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('EFFICIENCYCARD','basiccard-carousel', 'PredictedProd/V1/PredictedProdCard', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Card de Indicadores
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'INDICATORCARD' AND CardType = 'indicatorscard-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('INDICATORCARD','indicatorscard-carousel', 'IndicatorsProd/V1/IndicatorsProd', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Card de Indicadores (2x2)
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'INDICATORCARD2X2' AND CardType = 'indicatorscardfour-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('INDICATORCARD2X2','indicatorscardfour-carousel', 'IndicatorsProd/V1/IndicatorsProdSwiper', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Card de Indicadores (3x2)
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'INDICATORCARD3X2' AND CardType = 'indicatorscardswiper-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('INDICATORCARD3X2','indicatorscardswiper-carousel', 'IndicatorsProd/V1/IndicatorsProdSwiper', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Card de Indicadores (8x3)
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'INDICATORCARD8X3' AND CardType = 'indicatorscardv2-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('INDICATORCARD8X3','indicatorscardv2-carousel', 'IndicatorsProd/V1/IndicatorsProdV2', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Detalhes de Produ��o
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'PRODUCTIONDETAILS' AND CardType = 'table')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('PRODUCTIONDETAILS','table', 'ProductionDetail/V1/Table', 'production', '', GETDATE(), 0, 0, 0)
END
GO      

--Fila de Ordens
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'ORDERQUEUE' AND CardType = 'gantt')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('ORDERQUEUE','gantt', 'G0022/V1/QueueOrder', 'production', '[{"label": "PERFORMANCE","type": "radio","hidden": 0,"filterId": "ORDERQUEUE","options":[{"label": "AFFECTED","name": "AFFECTED","Value": "true","id": 1},{"label": "NOTAFFECTED","name": "NOTAFFECTED","Value": "false","id": 2}]}]',
	GETDATE(), 0, 0, 0)
END
GO

--Gantt
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'GANTT' AND CardType = 'gantt')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('GANTT','gantt', 'OEEDASHBOARD/v1/Gantt', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Gr�fico de Efici�ncia
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'EFFICIENCYCHART' AND CardType = 'groupedcolumn-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('EFFICIENCYCHART','groupedcolumn-carousel', 'PredictedProd/V1/PredictedProdGraphic', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Hist�rico de Alarmes
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'ALARMHISTORY' AND CardType = 'table')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('ALARMHISTORY','table', 'G0043/v1/CardGrid', 'production', '[{"label":"ALARM","type":"checkbox","hidden":0,"filterId":"ALARMHISTORY","options":[{"label":"STANDALONEALARM","name":"STANDALONEALARM","Value":"false","id":1}]}]',
	GETDATE(), 0, 0, 0)
END
GO

--Indicadores
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'INDICATORS' AND CardType = 'table')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('INDICATORS','table', 'OeeIndicators/V1/Table', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Indicadores | Status Atual
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'INDICATORSCURRENTSTATUS' AND CardType = 'table')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('INDICATORSCURRENTSTATUS','table', 'OeeIndicators/V1/TableOCS', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Linha do Tempo
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'TIMELINE' AND CardType = 'timelines')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('TIMELINE','timelines', 'G0005/v1/GetDashResourcesByFilter', 'production', '[{"label":"EVENTS","type":"checkbox","hidden":0,"filterId":"TIMELINE","options":[{"label":"ALLEVENTS","name":"ALLEVENTS","Value":"true","id":1},{"label":"SHIFT","name":"SHIFT","Value":"true","id":2},{"label":"WO","name":"WO","Value":"true","id":3},{"label":"OPERATOR","name":"OPERATOR","Value":"true","id":4},{"label":"STATUS","name":"STATUS","Value":"true","id":5},{"label":"GOODPIECES","name":"GOODPIECES","Value":"true","id":6},{"label":"REWORK","name":"REWORK","Value":"true","id":7},{"label":"SCRAP","name":"SCRAP","Value":"true","id":8},{"label":"INSPECTION","name":"INSPECTION","Value":"true","id":9}]},{"label":"WODET","type":"text","hidden":0,"filterId":"TIMELINE","options":[{"label":"WODETCODE","name":"WODETCODE","Value":"","id":1}]}]', 
	GETDATE(), 0, 0, 0)
END
GO

--Mapa
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'MAP' AND CardType = 'map')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('MAP','map', '', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--OE Hora a Hora
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'OEHOURBYHOUR' AND CardType = 'goalcolumnline-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('OEHOURBYHOUR','goalcolumnline-carousel', 'G0020/v1/OeHourly', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--OEE Hora a Hora
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'OEEHOURBYHOUR' AND CardType = 'goalcolumnline-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('OEEHOURBYHOUR','goalcolumnline-carousel', 'G0020/v1/OeeHourly', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Oee Mobile
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'OEEMOBILE' AND CardType = 'indicatorscardone-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('OEEMOBILE','indicatorscardone-carousel', 'IndicatorsProd/V1/radial', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Paradas
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'STOP' AND CardType = 'pareto')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('STOP','pareto', 'G0015/v1/ParetoParadas', 'production', '[{"label":"WODET","type":"text","hidden":0,"filterId":"STOP","options":[{"label":"WODETCODE","name":"WODETCODE","Value":"","id":1}]}]', 
	GETDATE(), 0, 0, 0)
END
GO

--Paradas por Dura��o
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'STOPBYDURATION' AND CardType = 'paretoduration')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('STOPBYDURATION','paretoduration', 'G0015/V1/paretoDuration', 'production', '[{"label":"WODET","type":"text","hidden":0,"filterId":"STOPBYDURATION","options":[{"label":"WODETCODE","name":"WODETCODE","Value":"","id":1}]}]', 
	GETDATE(), 0, 0, 0)
END
GO

--Pareto Justificativa de Alarme
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'ALARMJUSTIFICATION' AND CardType = 'pareto')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('ALARMJUSTIFICATION','pareto', 'G0043/V1/ParetoJustificativs', 'production', '[{"label":"WODET","type":"text","hidden":0,"filterId":"ALARMJUSTIFICATION","options":[{"label":"WODETCODE","name":"WODETCODE","Value":"","id":1}]}]', 
	GETDATE(), 0, 0, 0)
END
GO

--Performance Hora a Hora
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'HOURLYPERFORMANCE' AND CardType = 'goalcolumnline-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('HOURLYPERFORMANCE','goalcolumnline-carousel', 'G0020/v1/PerformanceHourly', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Qualidade Hora a Hora
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'HOURLYQUALITY' AND CardType = 'column-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('HOURLYQUALITY','column-carousel', 'G0020/v1/QualityHourly', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Refugo
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'SCRAP' AND CardType = 'pareto')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('SCRAP','pareto', 'G0019/v1/Scrap/Pareto', 'production', '[{"label": "UNITY","type": "radio","hidden": 0,"filterId": "SCRAP","options":[{"label": "UND1","name": "UND1","Value": "true","id": 1},{"label": "UND2","name": "UND2","Value": "false","id": 2},{"label": "UND3","name": "UND3","Value": "false","id": 3}]}]',
	GETDATE(), 0, 0, 0)
END
GO

--Retrabalho
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'REWORK' AND CardType = 'pareto')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('REWORK','pareto', 'G0019/v1/Rework/Pareto', 'production', '[{"label": "UNITY","type": "radio","hidden": 0,"filterId": "REWORK","options":[{"label": "UND1","name": "UND1","Value": "true","id": 1},{"label": "UND2","name": "UND2","Value": "false","id": 2},{"label": "UND3","name": "UND3","Value": "false","id": 3}]}]',
	GETDATE(), 0, 0, 0)
END
GO

--Saldo de Endere�os
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'ADDRESSBALANCE' AND CardType = 'addressbalance-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('ADDRESSBALANCE','addressbalance-carousel', 'MovDashboard/v1/addressBalance', 'movmat', '', GETDATE(), 0, 0, 0)
END
GO

--Sin�ptico
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'SYNOPTIC' AND CardType = 'table')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('SYNOPTIC','table', 'G0003/V1/Synoptic', 'production', '[{"label": "UNITY","type": "radio","hidden": 0,"filterId": "SYNOPTIC","options":[{"label": "UND1","name": "UND1","Value": "true","id": 1},{"label": "UND2","name": "UND2","Value": "false","id": 2},{"label": "UND3","name": "UND3","Value": "false","id": 3}]},{"label": "WODET","type": "text","hidden": 0,"filterId": "SYNOPTIC","options":[{"label": "WODETCODE","name": "WODETCODE","Value": "","id": 1}]}]'
	  , GETDATE(), 0, 0, 0)
END
GO

--Status
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'STATUS' AND CardType = 'table')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('STATUS','table', 'G0009/v1/TABLE/Dashboard', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Status Atual
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'CURRENTSTATUS' AND CardType = 'table')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('CURRENTSTATUS','table', 'G0015/V1/Table/StatusCurrent', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Tabela de Tempos
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'TIMETABLE' AND CardType = 'table')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('TIMETABLE','table', 'G0007/V1/Table', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--Tarefas de Armazenamento
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'STORAGETASKS' AND CardType = 'table')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('STORAGETASKS','table', 'G0129/V1/Table', 'movmat', '', GETDATE(), 0, 0, 0)
END
GO

--Card de Indicadores (8x3) Det
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'INDICATORCARD8X3DET' AND CardType = 'indicatorscarddetails-carousel')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('INDICATORCARD8X3DET','indicatorscarddetails-carousel', 'IndicatorsProd/v1/IndicatorsProdDets', 'production', '', GETDATE(), 0, 0, 0)
END
GO

--OEE Sumarizado
IF NOT EXISTS (SELECT IDCard FROM TBLMVCards WHERE CardName = 'SUMMARIZEDOEE' AND CardType = 'temporalline')
BEGIN
	INSERT INTO TBLMVCards (CardName, CardType, CardUrl, Pillar, Filters, DtCreation, FlgPreference, SavedForMore, DuplicatedCard)
	VALUES('SUMMARIZEDOEE','temporalline', 'G0001/v1/TemporalOeeDashboard', 'production', '[{"label": "ACCUMULATED","type": "checkbox","hidden": 0,"filterId": "SUMMARIZEDOEE","options":[{"label": "ACCUMULATED","name": "ACCUMULATED","Value": "false","id": 1}]},{"label":"LINETIME","type":"radio","hidden":0,"filterId":"SUMMARIZEDOEE","options":[{"label":"PERIOD","name":"PERIOD","Value":"true","id":1},{"label":"DAILY","name":"DAILY","Value":"false","id":2},{"label":"WEEKLY","name":"WEEKLY","Value":"false","id":3},{"label":"MONTHLY","name":"MONTHLY","Value":"false","id":4},{"label":"QUARTERLY","name":"QUARTERLY","Value":"false","id":5},{"label":"HOURLY","name":"HOURLY","Value":"false","id":6}]}]'
		, GETDATE(), 0, 0, 0)
END
GO