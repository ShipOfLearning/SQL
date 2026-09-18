/*	@ShipOfLearning
	Series : Beginner to Expert SQL Interview Questions - Part 2
	6. A login system should store only unique usernames. 
		How would you enforce this? */
SELECT * FROM Users

ALTER TABLE USERS
ADD CONSTRAINT UQ_USERNAME UNIQUE (USERNAME)

INSERT INTO Users (UserID,Username,Password) VALUES
(3,'rahul_s','PASS@567')

INSERT INTO Users (UserID,Username,Password) VALUES
(3,'rahul_r','PASS@567')