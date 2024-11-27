--Verifica se a coluna já existe 
IF NOT EXISTS (SELECT * FROM sys.columns WHERE Name = N'ViewName' AND Object_ID = Object_ID(N'TBLMVDashboardDet'))
BEGIN
    -- Adiciona a nova coluna à tabela
    ALTER TABLE TBLMVDashboardDet
    ADD ViewName NVARCHAR(50);
END
ELSE
BEGIN
    PRINT 'A coluna ViewName já existe na tabela TBLMVDashboardDet.';
END