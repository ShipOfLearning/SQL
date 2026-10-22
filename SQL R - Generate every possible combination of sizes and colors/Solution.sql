--========================================================================
--CHANNEL : Ship of Learning :Amazon
--TOPIC   : Generate Every Possible Combination of Sizes and Colors
--========================================================================
 SELECT * FROM dbo.Sizes;
 SELECT * FROM dbo.Colors;

SELECT
	C.ColorName,S.SizeName
FROM Colors C
CROSS JOIN Sizes S
ORDER BY 
	C.ColorName
