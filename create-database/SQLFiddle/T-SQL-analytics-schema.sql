CREATE TABLE Membership (
 memberID INT not null,
 memberName VARCHAR(100),
 phone VARCHAR(20),
 joinDate DATE,
 PRIMARY KEY (memberID)
);


INSERT INTO Membership 
VALUES 
(12231, 'Denali Dune', '+61 03 97229917', '2021-06-21'),
(12688, 'Reilly Bierman', '+61 03 9269 1200', '2021-05-01'),
(12233, 'Shiloh Henry', '+61 03 9479 6000', '2021-05-13'),
(12565, 'Tristan Gaumond', '+61 03 9905 4000', '2021-05-04'),
(12223, 'Rene Brassard', '+61 03 9903 2000', '2021-06-30'),
(12668, 'Tanner Hubert', '+61 03 9035 5511', '2021-07-29');


CREATE TABLE SausageSizzle (
saleId INT NOT NULL,
saleDate DATE,
product VARCHAR(20),
quantity INT,
friendId INT,
PRIMARY KEY (saleId)
);


INSERT INTO SausageSizzle VALUES 
(1 , '1999-12-31', 'pork'  , 1, NULL),
(2 , '1999-12-31', 'veggie', 3, NULL),
(3 , '1999-12-31', 'pork'  , 2, 1   ),
(4 , '2000-01-01', 'veggie', 4, NULL),
(5 , '2000-01-01', 'veggie', 2, 2   ),
(6 , '2000-01-01', 'pork'  , 1, NULL),
(7 , '2000-01-01', 'veggie', 1, NULL),
(8 , '2000-01-01', 'pork'  , 1, NULL),
(9 , '2000-01-02', 'veggie', 1, 2   ),
(10, '2000-01-02', 'pork'  , 2, NULL),
(11, '2000-01-02', 'veggie', 3, NULL),
(12, '2000-01-02', 'pork'  , 4, NULL),
(13, '2000-01-02', 'veggie', 2, 3   ),
(14, '2000-01-03', 'veggie', 1, NULL),
(15, '2000-01-03', 'pork'  , 6, NULL),
(16, '2000-01-03', 'veggie', 1, 1   ),
(17, '2000-01-04', 'pork',   1, 1   ),
(18, '2000-01-05', 'veggie', 5, 1   );


CREATE VIEW SausageSizzleSummary AS
SELECT Product, SaleDate, SUM(Quantity) AS Sales
FROM SausageSizzle
GROUP BY Product, SaleDate;
