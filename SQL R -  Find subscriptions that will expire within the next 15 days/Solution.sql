/* ===============================================================
CHANNEL : SHIP OF LEARNING
TOPIC   : FIND SUBSCRIPTIONS EXPIRING WITHIN NEXT 15 DAYS
===============================================================*/
SELECT * FROM Subscriptions
DECLARE @TODAY AS DATE = CAST(GETDATE() AS DATE);

SELECT
	SubscriptionID,CustomerName,ExpiryDate,
	DATEDIFF(DAY,@TODAY,ExpiryDate) DTE
FROM Subscriptions
WHERE
	ExpiryDate >= @TODAY AND
	ExpiryDate < DATEADD(DAY,16,@TODAY)