-- --------------------------------------------------------------------------------------
-- ----------------                 Trocar tipo de Card                  ----------------
-- --------------------------------------------------------------------------------------
-- Tipo Column para GoalColumn em OEE Hora a Hora

IF NOT EXISTS (SELECT 
                    SF.FieldName AS [Label],
                    SF.ComponentType AS ChartType,
                    SF.DefaultValue AS ChartUrl
                FROM TBLScreenFields SF
                WHERE 
                    SF.GroupName = 'DashboardCard'
					AND SF.ComponentType = 'goalcolumnline'
					AND SF.FieldName = 'OEE Hora a Hora')
BEGIN
	UPDATE TBLScreenFields
	SET ComponentType = 'goalcolumnline'
	WHERE 
    GroupName = 'DashboardCard'
	AND FieldName = 'OEE Hora a Hora'

END
GO

-- Tipo Column para GoalColumn em Performance Hora a Hora

IF NOT EXISTS (SELECT 
                    SF.FieldName AS [Label],
                    SF.ComponentType AS ChartType,
                    SF.DefaultValue AS ChartUrl
                FROM TBLScreenFields SF
                WHERE 
                    SF.GroupName = 'DashboardCard'
					AND SF.ComponentType = 'goalcolumnline'
					AND SF.FieldName = 'Performance Hora a Hora')
BEGIN
	UPDATE TBLScreenFields
	SET ComponentType = 'goalcolumnline'
	WHERE 
    GroupName = 'DashboardCard'
	AND FieldName = 'Performance Hora a Hora'

END
GO

-- Tipo Column para GoalColumn em OE Hora a Hora

IF NOT EXISTS (SELECT 
                    SF.FieldName AS [Label],
                    SF.ComponentType AS ChartType,
                    SF.DefaultValue AS ChartUrl
                FROM TBLScreenFields SF
                WHERE 
                    SF.GroupName = 'DashboardCard'
					AND SF.ComponentType = 'goalcolumnline'
					AND SF.FieldName = 'OE Hora a Hora')
BEGIN
	UPDATE TBLScreenFields
	SET ComponentType = 'goalcolumnline'
	WHERE 
    GroupName = 'DashboardCard'
	AND FieldName = 'OE Hora a Hora'

END
GO