/*==========================================================
  SHIP OF LEARNING : Amazon
  TOPIC:  Find the First Purchase of a Customer 
	After Becoming a Prime Member
==========================================================*/
SELECT * FROM CustomerPrimeMembership
SELECT * FROM CustomerPurchases

;WITH CTE AS 
(
	SELECT
		CPM.customer_id,CPM.customer_name,CPM.prime_start_date,
		CP.purchase_id,CP.purchase_date,CP.product_name,
		CP.amount,
		ROW_NUMBER() OVER
		(
			PARTITION BY  CPM.customer_id
			ORDER BY CP.purchase_date
		) AS RN
	FROM CustomerPrimeMembership CPM
	JOIN CustomerPurchases CP
	ON CPM.customer_id = CP.customer_id AND
		CP.purchase_date >= CPM.prime_start_date
)
SELECT * FROM CTE WHERE RN = 1
