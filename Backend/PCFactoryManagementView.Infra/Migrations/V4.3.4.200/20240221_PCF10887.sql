-- --------------------------------------------------------------------------------------
-- ----------------                   Salvar Filtros                     ----------------
-- --------------------------------------------------------------------------------------
-- Adição do ViewFilters na TBLMVDashboard


IF NOT EXISTS (SELECT 1 FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_NAME = 'TBLMVDashboardHD' AND COLUMN_NAME = 'ViewFilters')
BEGIN
    ALTER TABLE TBLMVDashboardHD ADD ViewFilters NVARCHAR(MAX);
END
GO
