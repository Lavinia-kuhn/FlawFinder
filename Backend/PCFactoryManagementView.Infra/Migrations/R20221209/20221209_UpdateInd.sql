
IF EXISTS(Select IDScreenFields from TBLScreenFields  where FieldName = 'Agrupado de Indicadores' and TableName = 'VIEWDASHBOARD')
BEGIN
Update TBLScreenFields set FieldName = 'Card de Indicadores (3x2)' where FieldName = 'Agrupado de Indicadores' and TableName = 'VIEWDASHBOARD'
END
GO

IF EXISTS(Select IDPref from TBLPrefs where Name = 'Agrupado de Indicadores' and IDScreen = (Select IDScreen from TBLScreen where Code = 'VIEWDASHBOARD'))
BEGIN
Update TBLPrefs set Name = 'Card de Indicadores (3x2)' where Name = 'Agrupado de Indicadores' and IDScreen = (Select IDScreen from TBLScreen where Code = 'VIEWDASHBOARD')
END
GO

