-- preparation
DROP TABLE IF EXISTS MySchema.MyFriends;
DROP TABLE IF EXISTS MySchema.MyFriendsNames;
DROP VIEW IF EXISTS MySchema.MyFriendsNames_view
DROP SCHEMA IF EXISTS MySchema;
DELETE FROM Notes.Friends WHERE Notes.Friends.friendID > 995;
GO

-- slide 1 CREATE SCHEMA to store your tables
CREATE SCHEMA MySchema;
GO

-- slide 2 CREATE VIEW to store a query like a table
CREATE OR ALTER VIEW MySchema.MyFriendsNames_view AS
SELECT firstName, lastName
FROM Notes.Friends;
GO

-- see result
SELECT *
FROM MySchema.MyFriendsNames_view;
GO

-- slide 3 SELECT INTO to store result in a table
SELECT friendID, firstName, lastName
INTO MySchema.MyFriends
FROM Notes.Friends;
GO

-- slide 4 ALTER to add columns to a stored table
ALTER TABLE MySchema.MyFriends
ADD initials varchar(4);
GO

-- see result
SELECT *
FROM MySchema.MyFriends;
GO

-- slide 5 UPDATE to change the entries in a table
UPDATE MySchema.MyFriends
SET initials = CONCAT(
          SUBSTRING(firstName, 1, 1),
          SUBSTRING(lastName, 1, 1)
          )
WHERE firstName IS NOT NULL
AND lastName IS NOT NULL;
GO

-- see result
SELECT *
FROM MySchema.MyFriends;
GO

-- slide 6 note we could instead just alter the view
CREATE OR ALTER VIEW MySchema.MyFriendsNames_view AS
SELECT friendID, firstName, lastName, 
  (CONCAT(SUBSTRING(firstName, 1, 1),
           SUBSTRING(lastName, 1, 1))
  ) AS initials
FROM Notes.Friends;
GO

-- see result 
SELECT *
FROM MySchema.MyFriendsNames_view;

-- slide 7 INSERT INTO to create a whole record
INSERT INTO Notes.Friends
(friendID, firstName, lastName, favColour)
VALUES
(997, NULL, NULL, NULL),
(998, '', '', ''),
(999, 'NA', 'NA', 'NA');
GO

-- see result
SELECT *
FROM MySchema.MyFriendsNames_view;

-- slide 8 But our table doesn't change
SELECT *
FROM MySchema.MyFriends;

-- update stored table
INSERT INTO MySchema.MyFriends 
(friendID, firstName, lastName)
SELECT friendID, firstName, lastName
FROM Notes.Friends
WHERE friendID > 995
GO

-- see result
SELECT *
FROM MySchema.MyFriends;

-- slide 9 the CASE clause
UPDATE MySchema.MyFriends
SET initials = (CASE 
    WHEN (firstName IS NULL or lastName IS NULL) THEN 'none'
    WHEN (firstName = '' and lastName = '') THEN 'none'
    WHEN (firstName = 'NA' and lastName = 'NA') THEN 'none'
    ELSE (CONCAT(SUBSTRING(firstName, 1, 1),
                SUBSTRING(lastName, 1, 1)))
    END);
GO

-- see result
SELECT *
FROM MySchema.MyFriends;

-- cleaning up
DROP TABLE IF EXISTS MySchema.MyFriends;
DROP TABLE IF EXISTS MySchema.MyFriendsNames;
DROP VIEW IF EXISTS MySchema.MyFriendsNames_view
DROP SCHEMA IF EXISTS MySchema;
DELETE FROM Notes.Friends WHERE Notes.Friends.friendID = 999;
GO




