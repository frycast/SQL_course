-- This script is not intended to be run in one go.
-- It is a code dump of a number of related examples from the notes.
-- It is here for you to experiment with as you follow the notes.

CREATE DATABASE MyExperiments;
GO -- only use GO in T-SQL, remove GO for MySQL

USE MyExperiments;
GO -- only use GO in T-SQL, remove GO for MySQL

-- create the Friends table
CREATE TABLE Friends (
  FriendID INT not null,
  FirstName VARCHAR(20), 
  LastName VARCHAR(20),
  FavColour VARCHAR(20),
  PRIMARY KEY (FriendID)
);

-- create the Pets table
CREATE TABLE Pets (
  PetID INT not null,
  PetName VARCHAR(20),
  PetDOB DATE,
  FriendID INT not null,
  FOREIGN KEY (FriendID) REFERENCES Friends (FriendID),
  PRIMARY KEY (PetID)
);

ALTER TABLE Friends
ADD StartDate DATE,
ADD StartTime TIME;

ALTER TABLE Friends
DROP COLUMN StartDate;

-- produces an error (foreign key)
ALTER TABLE Pets
DROP COLUMN FriendID;

-- circumvent the error (delete foreign key)
ALTER TABLE table_name
DROP CONSTRAINT pets_ibfk_1;

-- change a data type in MySQL (uses 'modify column')
ALTER TABLE Friends
MODIFY COLUMN FirstName VARCHAR(40);

-- change a data type in T-SQL (uses 'alter column')
ALTER TABLE Friends
ALTER COLUMN FirstName VARCHAR(40);

-- using the MySQL syntax
ALTER TABLE Friends
MODIFY COLUMN FavColour VARCHAR(3);

-- produces an error (foreign key)
DROP TABLE Friends;

-- remove the foreign key from Pets
ALTER TABLE Pets
DROP CONSTRAINT pets_ibfk_1;

-- delete the Friends table
DROP TABLE Friends;

-- -----------------------------------------------

-- create the Friends table
CREATE TABLE Friends (
  FriendID INT not null,
  FirstName VARCHAR(20), 
  LastName VARCHAR(20),
  FavColour VARCHAR(20),
  PRIMARY KEY (FriendID)
);

INSERT INTO Friends 
VALUES
(1, 'X', 'A', 'red'),
(2, 'Y', 'B', 'blue'),
(3, 'Z', 'C', NULL),
(4, 'Kimmy', 'Jenkins', 'yellow'),
(5, 'Jimmy', 'Jenkins', NULL);


INSERT INTO Friends
(FriendID, FirstName)
VALUES
(6, 'Niko'),
(7, 'Sage');

DROP TABLE Friends;

-- -----------------------------------------------

-- first create the structure
CREATE TABLE Friends (
  FriendID INT not null,
  FirstName VARCHAR(20), 
  LastName VARCHAR(20),
  FavColour VARCHAR(20),
  PRIMARY KEY (FriendID)
);

-- then insert our 3 friends
INSERT INTO Friends
VALUES
(1,'X','A','red'),
(2,'Y','B','blue'),
(3,'Z','C', NULL);

-- now alter the table to add StartDate and StartTime
ALTER TABLE Friends
ADD StartDate DATE,
ADD StartTime TIME;

UPDATE Friends
SET StartDate = '1999-12-30', StartTime = '16:30:00';

UPDATE Friends
SET StartDate = '2000-01-03', StartTime = '08:00:00'
WHERE FriendID = 1;

DELETE FROM Friends
WHERE FriendID = 999;

-- delete the database
DROP DATABASE MyExperiments;
GO

-- ------------------------------------------------

CREATE TABLE Membership (
 memberID INT not null,
 memberName VARCHAR(100),
 phone VARCHAR(20),
 joinDate DATE,
 PRIMARY KEY (memberID)
);

INSERT INTO Membership 
VALUES (12231, 'Denali Dune', '+61 03 97229917', '2021-06-21');

DELETE FROM Membership 
WHERE memberId = 12231;

INSERT INTO Membership
VALUES 
(12688, 'Reilly Bierman', '+61 03 9269 1200', '2021-05-01'),
(12233, 'Shiloh Henry', '+61 03 9479 6000', '2021-05-13'),
(12565, 'Tristan Gaumond', '+61 03 9905 4000', '2021-05-04'),
(12223, 'Rene Brassard', '+61 03 9903 2000', '2021-06-30'),
(12668, 'Tanner Hubert', '+61 03 9035 5511', '2021-07-29');

SELECT COUNT(*) AS MemberCount, SYSDATE() AS ExecutionDateTime
FROM Membership;

-- MySQL only: table creation and initial insert
CREATE TABLE MemberCountHistory
SELECT COUNT(*) AS MemberCount, SYSDATE() AS ExecutionDateTime
FROM Membership;

-- MySQL only: subsequent inserts (execute once per month)
INSERT INTO MemberCountHistory
SELECT COUNT(*) AS MemberCount, SYSDATE() AS ExecutionDateTime
FROM Membership;

-- T-SQL only: initial table creation (and execute once per month)
SELECT COUNT(*) AS MemberCount, SYSDATE() AS ExecutionDateTime
INTO MemberCountHistory
FROM Membership;

CREATE VIEW FriendsPets AS
SELECT F.FirstName, P.PetName
FROM Friends F JOIN Pets P ON F.FriendID = P.FriendID;

SELECT *
FROM FriendsPets;