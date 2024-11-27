---------- Campos Reabilitados -------------

IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProduct' AND GroupName = 'SCRAPTAB' AND Enabled = 1)
BEGIN

				UPDATE TBLScreenFields SET Enabled = 1
				WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (
					SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) AND ComponentType = 'MainFilterProduct'
					AND GroupName = 'SCRAPTAB';
END
GO


IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProductType' AND GroupName = 'SCRAPTAB' AND Enabled = 1)
BEGIN
				UPDATE TBLScreenFields SET Enabled = 1
				WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (
					SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) AND ComponentType = 'MainFilterProductType'
					AND GroupName = 'SCRAPTAB';
END
GO


IF NOT EXISTS (SELECT * FROM TBLScreenFields WHERE IDScreen =
(SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View'))
AND ComponentType = 'MainFilterProductFamily' AND GroupName = 'SCRAPTAB' AND Enabled = 1)
BEGIN
				UPDATE TBLScreenFields SET Enabled = 1
				WHERE IDScreen = (SELECT IDScreen FROM TBLScreen WHERE Code = 'G0001' AND IDAplication = (
					SELECT IDAplication FROM TBLAplication WHERE Code = 'PCF4View')) AND ComponentType = 'MainFilterProductFamily'
					AND GroupName = 'SCRAPTAB';
END
GO