--- APE SCHEMA --
CREATE TABLE Colours (
  ColourID int not null,
  ColourName varchar(20) not null,
  Comments varchar(100), -- I find this Colour strange etc.
  PRIMARY KEY (ColourID)
);
GO
CREATE TABLE Friends (
  FriendID int not null,
  FirstName varchar(20),
  LastName varchar(20),
  FavColourID int,
  FOREIGN KEY (FavColourID) REFERENCES Colours (ColourID),
  PRIMARY KEY (FriendID)
);
GO
CREATE TABLE BananaTree (
  TreeID int not null,
  Height decimal(5,2),
  YearPlanted int,
  MonthPlanted int,
  Width decimal(5,2),
  PRIMARY KEY (TreeID)
);
GO
CREATE TABLE EatingFrom (
  FriendID int not null,
  TreeID int not null,
  FOREIGN KEY (FriendID) REFERENCES Friends (FriendID),
  FOREIGN KEY (TreeID) REFERENCES BananaTree (TreeID)
);
GO
CREATE TABLE Banana (
  BananaID int not null,
  TasteRank int, -- from 1 to 5
  DatePicked date not null,
  DateEaten date not null,
  Ripe bit,
  TreeID int not null,
  Comments varchar(100),
  FOREIGN KEY (TreeID) REFERENCES BananaTree (TreeID),
  PRIMARY KEY (BananaID)
);
GO

INSERT INTO Colours VALUES
(1 ,'blue'     , 'similar to sky' ),
(2 ,'green'    , 'bad tasting bananas'),
(3 ,'yellow'   , 'my favourite because banana'),
(4 ,'orange'   , 'no connection to orangutan'),
(5 ,'red'      , 'generally a bad sign'),
(6 ,'purple'   , 'never seen this before'),
(7 ,'brown'    , 'many things are brown'),
(8 ,'magenta'  , 'one of the primary subtractive colours'),
(9 ,'pink'     , 'very manly'),
(10,'lime'     , 'almost green'),
(11,'turquoise', 'not to be confused with tortoise');
GO

INSERT INTO Friends VALUES
(1 , 'Caesar'   , 'Serkis', 3 ),
(2 , 'Harambe'  , 'Porter', 1 ),
(3 , 'Aldo'     , 'Atkins', 3 ),
(4 , 'Cornelius', 'Porter', 1 ),
(5 , 'Zira'     , 'Porter', 4 ),
(6 , 'Ishmael'  , 'Serkis', 3 ),
(7 , 'Monsieur' , 'Mallah', 3 ),
(8 , 'Titano'   , 'Atkins', 6 ),
(9 , 'King'     , 'Kong'  , 3 ),
(10, 'Bobo'     , 'Kong'  , 8 ),
(11, 'Myster'   , 'Ious'  , NULL);
GO

INSERT INTO BananaTree VALUES
(1,  5.5, 2018, 08, 31),
(2,  4.3, 2018, 08, 27),
(3,  4.7, 2018, 08, 36),
(4,  3.8, 2018, 08, 20),
(5,  6.2, 2018, 08, 40),
(6,  6.4, 2016, 07, 23),
(7,  5.4, 2016, 07, 32),
(8,  5.2, 2016, 07, 31),
(9,  4.8, 2016, 07, 19),
(10, 4.5, 2015, 09, 28),
(11, 5.8, 2015, 09, 35),
(12, 7.5, 2015, 09, 45),
(13, 6.4, 2015, 09, 30),
(14, 5.0, 2015, 09, 24),
(15, 5.1, 2014, 10, 34),
(16, 4.2, 2014, 10, 23),
(17, 5.4, 2014, 08, 39),
(18, 5.2, 2014, 08, 28);
GO

INSERT INTO EatingFrom VALUES
(3 ,1 ), 
(2 ,1 ),
(1 ,1 ),
(6 ,3 ),
(10,5 ),
(4 ,5 ),
(9 ,5 ),
(8 ,8 ),
(7 ,8 ),
(10,8 ),
(5 ,8 ),
(2 ,8 ),
(3 ,8 ),
(4 ,8 ),
(6 ,2 ),
(6 ,2 ),
(6 ,2 ),
(8 ,2 ),
(9 ,1 ),
(2 ,1 ),
(1 ,1 ),
(6 ,2 ),
(6 ,2 ),
(10,8 ),
(2 ,18),
(6 ,15),
(7 ,11),
(2 ,14),
(2 ,1 );
GO

INSERT INTO Banana VALUES
(1 , 2, '20181003', '20181004', 0, 1 , NULL),
(2 , 4, '20181003', '20181004', 1, 2 , NULL),
(3 , 4, '20181003', '20181004', 1, 2 , NULL),
(4 , 5, '20181003', '20181006', 1, 1 , NULL),
(5 , 5, '20181003', '20181006', 1, 2 , 'best banana ever'),
(6 , 3, '20181003', '20181004', 1, 2 , NULL),
(7 , 2, '20181002', '20181004', 0, 3 , NULL),
(8 , 5, '20181002', '20181005', 1, 3 , 'smooth and delectable'),
(9 , 3, '20181002', '20181003', 1, 4 , NULL),
(10, 3, '20181002', '20181003', 1, 5 , NULL),
(11, 2, '20181002', '20181003', 0, 5 , NULL),
(12, 5, '20181002', '20181005', 1, 4 , NULL),
(13, 1, '20181002', '20181002', 0, 9 , NULL),
(14, 1, '20181001', '20181001', 0, 16, NULL),
(15, 1, '20181001', '20181001', 0, 16, NULL),
(16, 5, '20181001', '20181004', 1, 5 , 'a culinary delight'),
(17, 5, '20181001', '20181004', 1, 6 , NULL),
(18, 5, '20181001', '20181004', 1, 7 , NULL),
(19, 5, '20181001', '20181004', 1, 8 , NULL),
(20, 5, '20181001', '20181004', 1, 9 , 'soft with nutty undertones'),
(21, 4, '20181001', '20181003', 1, 18, NULL),
(22, 4, '20180930', '20181001', 1, 14, NULL),
(23, 4, '20180930', '20181001', 1, 17, NULL),
(24, 4, '20180930', '20181001', 1, 12, NULL),
(25, 2, '20180930', '20181030', 1, 11, NULL),
(26, 3, '20180930', '20181030', 0, 5 , 'good mid-range banana'),
(27, 4, '20180930', '20181003', 1, 2 , NULL),
(28, 5, '20180930', '20181003', 1, 10, NULL),
(29, 5, '20180929', '20181003', 1, 11, NULL),
(30, 1, '20180929', '20181001', 0, 4 , 'tasted like ape-shit'),
(31, 1, '20180929', '20180929', 0, 7 , NULL),
(32, 2, '20180929', '20181002', 0, 8 , NULL),
(33, 5, '20180929', '20181002', 1, 12, NULL),
(34, 4, '20180929', '20180930', 1, 2 , NULL),
(35, 2, '20180929', '20180930', 0, 2 , NULL),
(36, 3, '20180929', '20180930', 0, 18, NULL),
(37, 3, '20180929', '20180930', 0, 13, NULL),
(38, 4, '20180928', '20180929', 1, 15, NULL),
(39, 5, '20180928', '20181001', 1, 13, NULL),
(40, 2, '20180928', '20180930', 1, 12, NULL),
(41, 1, '20180928', '20180928', 0, 15, NULL),
(42, 1, '20180928', '20180928', 1, 12, 'had ants in it'),
(43, 1, '20180928', '20180928', 0, 7 , NULL),
(44, 4, '20180927', '20180929', 0, 7 , NULL),
(45, 5, '20180927', '20180930', 1, 14, NULL),
(46, 5, '20180927', '20180930', 1, 15, NULL),
(47, 5, '20180927', '20180930', 1, 16, NULL),
(48, 5, '20180927', '20180930', 1, 17, NULL),
(49, 5, '20180927', '20180930', 1, 18, NULL),
(50, 3, '20180927', '20180928', 1, 3 , NULL);
GO