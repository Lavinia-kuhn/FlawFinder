Update TBLScreenFields set GroupName = 'PERFORMANCE' 
where IDScreen = (Select IDScreen from TBLScreen where code = 'G0022' and IDAplication = (select IDAplication from TBLAplication where code = 'PCF4View'))
AND TableName = 'FALSEPERF'