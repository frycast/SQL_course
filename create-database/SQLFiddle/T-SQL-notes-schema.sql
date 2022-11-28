CREATE TABLE Friends (
  FriendID int not null,
  FirstName varchar(20),
  LastName varchar(20),
  FavColour varchar(20),
  PRIMARY KEY (FriendID)
);
GO
CREATE TABLE Pets (
  PetID int not null,
  PetName varchar(20),
  PetDOB date,
  FriendID int not null,
  FOREIGN KEY (FriendID) REFERENCES Friends (FriendID),
  PRIMARY KEY (PetID)
);
GO
CREATE TABLE Scratched (
  ScratcherID int not null,
  ScratchDate date, 
  ScratchTime time,
  ScratcheeID int not null,
  FOREIGN KEY (ScratcherID) REFERENCES Friends (FriendID),
  FOREIGN KEY (ScratcheeID) REFERENCES Friends (FriendID),
  PRIMARY KEY (ScratcherID, ScratcheeID, ScratchDate, ScratchTime)
);
GO
CREATE TABLE PlayCount (
 PetID int not null,
 PlayCounter int,
 FriendID int not null,
 FOREIGN KEY (PetID) REFERENCES Pets (PetID),
 FOREIGN KEY (FriendID) REFERENCES Friends (FriendID),
 PRIMARY KEY (PetID, FriendID)
);
GO
CREATE TABLE Passports (
  PptNo varchar(5) not null,
  PptCountry varchar(20),
  PptExpiry date,
  FriendID int,
  FOREIGN KEY (FriendID) REFERENCES Friends (FriendID),
  PRIMARY KEY (PptNo)
);
GO
CREATE TABLE Table1 (
  A int not null,
  B varchar(20),
  C varchar(20),
  PRIMARY KEY (A)
);
GO
CREATE TABLE Table2 (
  D varchar(20),
  E int not null,
  A int not null,
  FOREIGN KEY (A) REFERENCES Table1 (A),
  PRIMARY KEY (E)
);
GO
CREATE TABLE Letters (
  A char,
  B char,
  Num int not null,
  PRIMARY KEY (Num)
);
GO
CREATE TABLE RandomPeople (
  PersonName varchar(20),
  Gender char(2),
  Age int
);
GO
CREATE TABLE Houses (
  house_ID      varchar(5) not null,
  house_owner   varchar(50),
  house_address varchar(200),
  post_code     varchar(4),
  house_price   decimal(10,2),
  PRIMARY KEY (house_ID)
);
GO
CREATE TABLE Suburbs (
  post_code varchar(5) not null,
  suburb_name varchar(100) not null,
  vaccination_rate decimal(3,2),
  PRIMARY KEY (post_code, suburb_name)
);
GO

CREATE TABLE Numbers (
  Num int,
  NumString varchar(10)
);
GO

CREATE TABLE EduStudy (
  Id varchar(6) not null,
  Income varchar(8),
  Education int,
  PRIMARY KEY (Id)
);
GO

CREATE TABLE Orders (
OrderID int not null,
Item varchar(30),
Price decimal(5,2),
OrderDT datetime,
PRIMARY KEY (OrderID)
);
GO

INSERT INTO Orders VALUES
(1, 'Boiled leaves'   , 2.99 , '2021-12-31 15:13:00'), 
(2, 'Bow wow'         , 15   , '2021-12-31 15:34:00'), 
(3, 'Cackleberry stew', 32.55, '2022-01-01 09:32:00'), 
(4, 'Mug of murk'     , 4.40 , '2022-01-01 10:16:00'); 
GO

INSERT INTO EduStudy VALUES 
('EI13', 'low', 5),
('EI122', 'low', 1),
('EI281', 'low-mid', 4),
('EI3332', 'middle', 3),
('EI4751', 'high-mid', 3),
('EI12', 'high', 2);
GO

INSERT INTO Numbers VALUES 
(111, '111'),
(31, '31'),
(32, '32'),
(211, '211');
GO


INSERT INTO Houses VALUES 
('H0001', 'Millard Claassen'    , '7235 East Van Dyke St'   ,  '3128', 300000),
('H0002', 'Jamie Pew'           , '8914 South Sunnyslope Dr',  '3128', 150000),
('H0003', 'Bethel Viviano'      , '87 South West Halifax St',  '3142', 400000),
('H0004', 'Brandi Hovis'        , '676 Ocean St'            ,  '3142', 360000),
('H0005', 'Mei Colby'           , '62 West Park Ave'        ,  '3556', 220000),
('H0006', 'Marilu Munz'         , '62 Elm Road'             ,  '3083', 120000),
('H0007', 'Rhiannon Carwile'    , '7005 Anderson Ave'       ,  '3779', 500000),
('H0008', 'Joycelyn Hamburger'  , '7410 Park Drive'         ,  '3778', 550000),
('H0009', 'Leopoldo Flaherty'   , '3 Dogwood Dr'            ,  '3083', 1200000),
('H0010', 'Xavier Farrer'       , '767 Rockville Street'    ,  '3083', 100000),
('H0011', 'Waldo Wingboard'     , '8712 Thorne Street'      ,  NULL,   640000),
('H0012', 'Jimmy Jenkins'       , '32 Rosey Cres'           ,  NULL,   70000);
GO

-- There is no primary / foreign key pair for Houses and Suburbs.
-- The primary key of suburbs is not as may be expected (not post_code).
-- 3218 connects to 2 suburbs
-- some houses have NULL suburb
-- 3142 has no corresponding suburb
-- the data type for post_code in suburb is varchar(6), one suburb has postcode '33128'

INSERT INTO Suburbs VALUES
('3128' , 'Erebor'   , 0.8),
('33128', 'Erberor'  , 0.8),
('3128' , 'Fangorn'  , 0.2),
('3779' , 'Durin'    , 0.4),
('3556' , 'Gondor'   , 0.65),
('3083' , 'Isengaard', 0.35);
GO

INSERT INTO Friends VALUES
(1, 'X', 'A', 'red'),
(2, 'Y', 'B', 'blue'),
(3, 'Z', 'C', NULL);
GO
INSERT INTO Pets VALUES
(1, 'Chikin', '20160924', 2),
(2, 'Cauchy', '20120301', 3),
(3, 'Gauss', '20120301', 3);
GO
INSERT INTO Scratched VALUES
(1, '20180905', '12:00', 2),
(1, '20180905', '12:30', 3),
(2, '20180906', '11:00', 1),
(3, '20180907', '10:00', 1),
(2, '20180801', '16:15', 1),
(2, '20180801', '13:00', 3),
(1, '20170214', '04:30', 2),
(3, '20200128', '18:00', 1);
GO
INSERT INTO PlayCount VALUES
(1, 3, 1),
(1, 5, 2),
(3, 4, 2);
GO
INSERT INTO Passports VALUES
('E1321', 'Australia', '20210312', NULL),
('LA123', 'New Zealand', '20320901', 2),
('S9876', 'Monaco', '20280619', 3);

GO
INSERT INTO Table1 (
 A, B, C
) VALUES
 (1, 'Ignorance', 'is'),
 (2, 'War', 'is'),
 (3, 'Freedom', 'is'),
 (4, 'Friendship', 'is');
GO

INSERT INTO Table2 (
 D, E, A
) VALUES
 ('slavery.', 3, 1),
 ('weakness.', 4, 2),
 ('strength.', 1, 3),
 ('peace.', 2, 4);
GO

INSERT INTO Letters VALUES
('a', 'b', 1),
('a', 'c', 2),
('a', 'b', 3),
('a', 'c', 4);
GO

INSERT INTO RandomPeople VALUES
('Beyonce', 'F', 37),
('Laura Marling', 'F', 28),
('Darren Hayes', 'M', 46),
('Bret McKenzie', 'M', 42),
('Jack Monroe', 'NB', 30);