
IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE FieldName = 'GANTT' AND TableName = 'VIEWDASHBOARD' AND DefaultValue = '' AND GroupName = 'GANTT')
BEGIN
DELETE FROM TBLScreenFields WHERE FieldName = 'GANTT' AND TableName = 'VIEWDASHBOARD' AND DefaultValue = '' AND GroupName = 'GANTT'
END
GO

IF EXISTS (SELECT IDScreenFields FROM TBLScreenFields WHERE FieldName = 'top' AND TableName = 'VIEWDASHBOARD' AND DefaultValue = '100' AND GroupName = 'GANTT')
BEGIN
DELETE FROM TBLScreenFields WHERE FieldName = 'top' AND TableName = 'VIEWDASHBOARD' AND DefaultValue = '100' AND GroupName = 'GANTT'
END
GO

UPDATE TBLPrefs SET Preference = '{"GridsterConfig":{"Visible":false,"Cols":3,"Rows":1,"IdCard":0,"Widget":"gantt","Height":0.0,"Width":0.0,"ChartUrl":"OEEDASHBOARD/v1/Gantt","X":0,"Y":0,"idLastEditUser":64,"idPref":0,"idPrefOrigin":0},"filter":[],"PrefsGrid":null}'
WHERE [Name] = 'GANTT' AND Preference = '{"Visible":false,"Size":24,"Position":1,"Parameters":[]}' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')

UPDATE TBLPrefs SET Preference = '{"GridsterConfig":{"Visible":false,"Cols":1,"Rows":1,"IdCard":0,"Widget":"pareto","Height":570.0,"Width":570.0,"ChartUrl":"G0015/v1/ParetoParadas","X":0,"Y":0,"idLastEditUser":1,"idPref":0,"idPrefOrigin":0},"filter":[],"PrefsGrid":null}'
WHERE [Name] = 'PARADAS' AND Preference = '{"Visible":false,"Size":16,"Position":0,"Parameters":[]}' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')

UPDATE TBLPrefs SET Preference = '{"GridsterConfig":{"Visible":false,"Cols":3,"Rows":1,"IdCard":0,"Widget":"pareto","Height":0.0,"Width":0.0,"ChartUrl":"G0019/v1/Scrap/Pareto","X":0,"Y":1,"idLastEditUser":1},"filter":[],"PrefsGrid":null}'
WHERE [Name] = 'REFUGO' AND Preference = '{"Visible":false,"Size":16,"Position":0,"Parameters":[]}' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')

UPDATE TBLPrefs SET Preference = '{"GridsterConfig":{"Visible":false,"Cols":3,"Rows":1,"IdCard":0,"Widget":"pareto","Height":537.0,"Width":1631.0,"ChartUrl":"G0019/v1/Rework/Pareto","X":0,"Y":5,"idLastEditUser":1,"idPref":0,"idPrefOrigin":0},"filter":[],"PrefsGrid":null}'
WHERE [Name] = 'RETRABALHO' AND Preference = '{"Visible":false,"Size":16,"Position":0,"Parameters":[]}' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')

UPDATE TBLPrefs SET Preference = '{"GridsterConfig":{"Visible":false,"Cols":1,"Rows":1,"IdCard":0,"Widget":"table","Height":0.0,"Width":0.0,"ChartUrl":"G0009/v1/Table/Dashboard","X":1,"Y":2,"idLastEditUser":1,"idPref":0,"idPrefOrigin":0},"filter":[],"PrefsGrid":null}'
WHERE [Name] = 'STATUS' AND Preference = '{"Visible":false,"Size":24,"Position":0,"Parameters":[]}' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')

UPDATE TBLPrefs SET Preference = '{"GridsterConfig":{"Visible":false,"Cols":1,"Rows":1,"IdCard":0,"Widget":"table","Height":0.0,"Width":0.0,"ChartUrl":"OeeIndicators/V1/Table","X":1,"Y":2,"idLastEditUser":1,"idPref":0,"idPrefOrigin":0},"filter":[],"PrefsGrid":null}'
WHERE [Name] = 'OEE' AND Preference = '{"Visible":false,"Size":16,"Position":0,"Parameters":[]}' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')

UPDATE TBLPrefs SET Preference = '{"GridsterConfig":{"Visible":false,"Cols":2,"Rows":1,"IdCard":0,"Widget":"table","Height":570.0,"Width":1150.0,"ChartUrl":"ProductionDetail/V1/Table","X":1,"Y":0,"idLastEditUser":1,"idPref":0,"idPrefOrigin":0},"filter":[],"PrefsGrid":null}'
WHERE [Name] = 'Detalhes de Produção' AND Preference = '{"Visible":false,"Size":16,"Position":0,"Parameters":[]}' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')

UPDATE TBLPrefs SET Preference = '{"GridsterConfig":{"Visible":false,"Cols":3,"Rows":1,"IdCard":0,"Widget":"paretolines","Height":0.0,"Width":0.0,"ChartUrl":"OeeDashboard/V1/Trends","X":0,"Y":3,"idLastEditUser":64,"idPref":0,"idPrefOrigin":0},"filter":[],"PrefsGrid":null}'
WHERE [Name] = 'Microtendências' AND Preference = '{"Visible":false,"Size":24,"Position":0,"Parameters":[]}' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')

UPDATE TBLPrefs SET Preference = '{"GridsterConfig":{"Visible":false,"Cols":1,"Rows":1,"IdCard":0,"Widget":"table","Height":0.0,"Width":0.0,"ChartUrl":"G0015/V1/Table/StatusCurrent","X":2,"Y":2,"idLastEditUser":64,"idPref":0,"idPrefOrigin":0},"filter":[{"label":"Status Atual.GRIDCOLUMNS","type":"radio","hidden":0,"filterId":"Status Atual","options":[{"label":"Status Atual.AUTOSIZE","value":"true","name":"AUTOSIZE","Id":1,"startTime":null,"endTime":null},{"label":"Status Atual.SKIPHEADER","value":"false","name":"SKIPHEADER","Id":3,"startTime":null,"endTime":null},{"label":"Status Atual.SIZETOFIT","value":"false","name":"SIZETOFIT","Id":2,"startTime":null,"endTime":null},{"label":"Status Atual.CUSTOM","value":"true","name":"CUSTOM","Id":1,"startTime":null,"endTime":null}]}],"PrefsGrid":null}'
WHERE [Name] = 'Status Atual' AND Preference = '{"Visible":false,"Size":8,"Position":0,"Parameters":[]}' AND IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'VIEWDASHBOARD')