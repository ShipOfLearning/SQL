--====================================================
--  Channel: Ship of Learning - Meta
--  Topic: Find Facebook Pages With Zero Likes
--====================================================    
SELECT * FROM dbo.page_likes;
SELECT * FROM dbo.pages;

SELECT
	page_id
FROM pages P
WHERE NOT EXISTS
(
	SELECT
		1
	FROM page_likes PL
	WHERE P.page_id = PL.page_id
)