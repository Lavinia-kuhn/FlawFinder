---------------------------------------------------------------------------- OK
IF EXISTS(SELECT IDScreenFields from TBLScreenFields where IDScreen = (Select IDScreen from TBLScreen where Code='G0003') 
and FieldName = 'table' and GroupName = 'TABLETAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0003/V1/Synoptic')
BEGIN
	Update TBLScreenFields set DefaultValue = 'G0003/V1/ReportSynoptic' 
	where IDScreen = (Select IDScreen from TBLScreen where Code='G0003') 
	and FieldName = 'table' and GroupName = 'TABLETAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0003/V1/Synoptic'
END
GO

---------------------------------------------------------------------------- OK
IF EXISTS(SELECT IDScreenFields from TBLScreenFields where IDScreen = (Select IDScreen from TBLScreen where Code='G0007') 
and FieldName = 'table' and GroupName = 'TABLETAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0007/V1/Table')
BEGIN
	Update TBLScreenFields set DefaultValue = 'G0007/V1/ReportTable' 
	where IDScreen = (Select IDScreen from TBLScreen where Code='G0007') 
	and FieldName = 'table' and GroupName = 'TABLETAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0007/V1/Table'
END
GO
---------------------------------------------------------------------------- OK
IF EXISTS(SELECT IDScreenFields from TBLScreenFields where IDScreen = (Select IDScreen from TBLScreen where Code='G0129') 
	and FieldName = 'table' and GroupName = 'TABLETAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0129/V1/Table')
BEGIN
	Update TBLScreenFields set DefaultValue = 'G0129/V1/ReportTable' 
	where IDScreen = (Select IDScreen from TBLScreen where Code='G0129') 
	and FieldName = 'table' and GroupName = 'TABLETAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0129/V1/Table'
END
GO
---------------------------------------------------------------------------- OK
IF EXISTS(SELECT IDScreenFields from TBLScreenFields where IDScreen = (Select IDScreen from TBLScreen where Code='G0043') 
	and FieldName = 'pareto' and GroupName = 'JUSTIFICATIVSTAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0043/V1/ParetoJustificativs')
BEGIN
	Update TBLScreenFields set DefaultValue = 'G0043/V1/ReportParetoJustificativs' 
	where IDScreen = (Select IDScreen from TBLScreen where Code='G0043') 
	and FieldName = 'pareto' and GroupName = 'JUSTIFICATIVSTAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0043/V1/ParetoJustificativs'
END
GO
---------------------------------------------------------------------------- OK
IF EXISTS(SELECT IDScreenFields from TBLScreenFields where IDScreen = (Select IDScreen from TBLScreen where Code='G0015') 
	and FieldName = 'paretoDuration' and GroupName = 'DURATIONTAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0015/V1/ParetoDuration')
BEGIN
	Update TBLScreenFields set DefaultValue = 'G0015/v1/ReportParetoDuration' 
	where IDScreen = (Select IDScreen from TBLScreen where Code='G0015') 
	and FieldName = 'paretoDuration' and GroupName = 'DURATIONTAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0015/V1/ParetoDuration'
END
GO
---------------------------------------------------------------------------- OK
IF EXISTS(SELECT IDScreenFields from TBLScreenFields where IDScreen = (Select IDScreen from TBLScreen where Code='G0015') 
	and FieldName = 'pareto' and GroupName = 'PARETOTAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0015/V1/ParetoParadas')
BEGIN
	Update TBLScreenFields set DefaultValue = 'G0015/V1/ReportParetoParadas' 
	where IDScreen = (Select IDScreen from TBLScreen where Code='G0015') 
	and FieldName = 'pareto' and GroupName = 'PARETOTAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0015/V1/ParetoParadas'
END
GO
---------------------------------------------------------------------------- OK
IF EXISTS(SELECT IDScreenFields from TBLScreenFields where IDScreen = (Select IDScreen from TBLScreen where Code='G0019') 
	and FieldName = 'pareto' and GroupName = 'PARETOTAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0019/V1/Scrap/Pareto')
BEGIN
	Update TBLScreenFields set DefaultValue = 'G0019/V1/Scrap/ReportPareto' 
	where IDScreen = (Select IDScreen from TBLScreen where Code='G0019') 
	and FieldName = 'pareto' and GroupName = 'PARETOTAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0019/V1/Scrap/Pareto'
END
GO
---------------------------------------------------------------------------- OK
IF EXISTS(SELECT IDScreenFields from TBLScreenFields where IDScreen = (Select IDScreen from TBLScreen where Code='G0019') 
	and FieldName = 'pareto' and GroupName = 'REWORKPARETOTAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0019/V1/Rework/Pareto')
BEGIN
	Update TBLScreenFields set DefaultValue = 'G0019/V1/Rework/ReportPareto' 
	where IDScreen = (Select IDScreen from TBLScreen where Code='G0019') 
	and FieldName = 'pareto' and GroupName = 'REWORKPARETOTAB' and ComponentType = 'ReportChart' and DefaultValue = 'G0019/V1/Rework/Pareto'
END
GO