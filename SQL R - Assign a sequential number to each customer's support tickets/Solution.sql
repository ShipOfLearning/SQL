/*============================================================
CHANNEL : SHIP OF LEARNING
TOPIC   : CUSTOMER-WISE SEQUENTIAL TICKET NUMBERING
============================================================*/
SELECT * FROM SupportTickets

SELECT 
	TicketID,CustomerID,Subject,
	ROW_NUMBER() OVER
	(
		PARTITION BY CustomerID
		ORDER BY TicketID
	) SN
FROM SupportTickets
