--- Atualizar Ordem de apresentação Tipo do Status.
IF NOT EXISTS (Select * from TBLScreenFields where TableName = 'GrpCorp' and FieldOrder = 1)
 begin
	update TBLScreenFields set FieldOrder = 1 where TableName = 'GrpCorp'
 end

IF NOT EXISTS (Select * from TBLScreenFields where TableName = 'GrpStatus' and FieldOrder = 2)
 begin
 update TBLScreenFields set FieldOrder = 2 where TableName = 'GrpStatus'
 end

IF NOT EXISTS (Select * from TBLScreenFields where TableName = 'ResourceStatus' and FieldOrder = 3)
 begin
 update TBLScreenFields set FieldOrder = 3 where TableName = 'ResourceStatus'
 end

IF NOT EXISTS (Select * from TBLScreenFields where TableName = 'DetailStatus' and FieldOrder = 4)
 begin
	update TBLScreenFields set FieldOrder = 4 where TableName = 'DetailStatus';
 end

 -- Realizar alteração do gráfico de coluna para pareto.
 IF EXISTS (Select * from TBLScreenFields where GroupName = 'STATUSSUMMARYCHARTTAB' and DefaultValue = 'G0009/V1/StatusSummary' and FieldName = 'column')
 begin
	update TBLScreenFields set FieldName = 'paretoduration' where GroupName = 'STATUSSUMMARYCHARTTAB' and DefaultValue = 'G0009/V1/StatusSummary'
 end