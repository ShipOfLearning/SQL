--=================================================================
--CHANNEL : SHIP OF LEARNING
--TOPIC   : FIND CUSTOMERS WHOSE PHONE NUMBERS CONTAIN
--          SPACES, HYPHENS, OR BRACKETS
--=================================================================
SELECT * FROM Customers



SELECT
	*
FROM Customers
WHERE CHARINDEX(N' ',PhoneNumber) > 0
 OR CHARINDEX(N'-',PhoneNumber) > 0
 OR CHARINDEX(N')',PhoneNumber) > 0
 OR CHARINDEX(N'[',PhoneNumber) > 0
 OR CHARINDEX(N']',PhoneNumber) > 0
 

 -- WITH COREALATED SUBQUERY
 SELECT
	*
FROM Customers C
WHERE EXISTS
(
	SELECT
		1
	FROM (
	 VALUES (N' ')
			,(N'-')
			,(N'(')
			,(N')')
			,(N'[')
			,(N']')
			) AS S(SpecialCharacter)
		WHERE CHARINDEX(S.SpecialCharacter,C.PhoneNumber) > 0
)