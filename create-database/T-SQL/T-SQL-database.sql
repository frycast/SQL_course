-------------------------------------------------------------------

-- Practice data for the Intro to SQL Course by Daniel Fryer.

-------------------------------------------------------------------

-------------------------------------------------------------------
-- CREATE IDI_CLEAN DATABASE  -------------------------------------
-------------------------------------------------------------------
USE master;
GO

DROP DATABASE IF EXISTS IDI_Clean;
GO 

CREATE DATABASE IDI_Clean;
GO -- GO is an T-SQL batch terminator

USE IDI_Clean;
GO

-- DIA (Department of Internal Affairs)
CREATE SCHEMA DIA_clean;
GO 

CREATE TABLE DIA_Clean.births (
  snz_uid                         int            not null UNIQUE, 
  snz_dia_uid                     int            not null UNIQUE,
  parent1_snz_uid                 int            null,
  parent1_snz_dia_uid             int            null,
  dia_bir_parent1_sex_snz_code    varchar(100)   null,
  dia_bir_parent1_occupation_text varchar(60)    null,
  parent2_snz_uid                 int            null,
  parent2_snz_dia_uid             int            null,
  dia_bir_parent2_sex_snz_code    varchar(100)   null,
  dia_bir_parent2_occupation_text varchar(60)    null,
  dia_bir_birth_month_nbr         tinyint        null,
  dia_bir_birth_year_nbr          smallint       null,
  dia_bir_sex_snz_code            varchar(100)   null,
  dia_bir_ethnic_grp1_snz_ind     bit            not null,  -- European
  dia_bir_ethnic_grp2_snz_ind     bit            not null,  -- Maori
  dia_bir_ethnic_grp3_snz_ind     bit            not null,  -- Pacific
  dia_bir_ethnic_grp4_snz_ind     bit            not null,  -- Asian
  dia_bir_ethnic_grp5_snz_ind     bit            not null,  -- MELAA
  dia_bir_ethnic_grp6_snz_ind     bit            not null); -- Other
GO
CREATE TABLE DIA_Clean.deaths (
  snz_uid                      int      not null UNIQUE, 
  snz_dia_uid                  int      not null UNIQUE,
  dia_dth_death_month_nbr      tinyint  null,
  dia_dth_death_year_nbr       smallint null,
  dia_dth_last_seen_month_nbr  tinyint  null,
  dia_dth_last_seen_year_nbr   smallint null,);
GO
CREATE TABLE DIA_Clean.marriages (
  partnr1_snz_uid                 int          not null UNIQUE, 
  partnr1_snz_dia_uid             int          not null UNIQUE,
  partnr2_snz_uid                 int          not null UNIQUE, 
  partnr2_snz_dia_uid             int          not null UNIQUE,
  dia_mar_partnr1_birth_month_nbr tinyint      null,
  dia_mar_partnr1_birth_year_nbr  smallint     null,
  dia_mar_partnr1_sex_snz_code    varchar(100) null,
  dia_mar_partnr1_occupation_text varchar(60)  null,
  dia_mar_partnr2_birth_month_nbr tinyint      null,
  dia_mar_partnr2_birth_year_nbr  smallint     null,
  dia_mar_partnr2_sex_snz_code    varchar(100) null,
  dia_mar_partnr2_occupation_text varchar(60)  null);
GO
CREATE TABLE DIA_Clean.civil_unions (
  partnr1_snz_uid                 int          not null UNIQUE, 
  partnr1_snz_dia_uid             int          not null UNIQUE,
  partnr2_snz_uid                 int          not null UNIQUE, 
  partnr2_snz_dia_uid             int          not null UNIQUE,
  dia_civ_partnr1_birth_month_nbr tinyint      null,
  dia_civ_partnr1_birth_year_nbr  smallint     null,
  dia_civ_partnr1_sex_snz_code    varchar(100) null,
  dia_civ_partnr1_occupation_text varchar(60)  null,
  dia_civ_partnr2_birth_month_nbr tinyint      null,
  dia_civ_partnr2_birth_year_nbr  smallint     null,
  dia_civ_partnr2_sex_snz_code    varchar(100) null,
  dia_civ_partnr2_occupation_text varchar(60)  null);
GO

CREATE SCHEMA [security];
GO
GO 

CREATE TABLE security.concordance (
  snz_uid                 int not null UNIQUE, 
  snz_dia_uid             int,
  snz_ird_uid             int,
  snz_moh_uid             int,
  snz_cen_uid             int,
  snz_acc_uid             int,
  snz_dol_uid             int,
  snz_in_spine            bit not null);
GO

CREATE SCHEMA [data];
GO

-- Researchers may wish to exclude people who
-- were overseas
CREATE TABLE [data].person_overseas_spell (
  snz_uid                 int not null UNIQUE, 
  pos_applied_date        date null,
  pos_ceased_date         date null);
GO

-- The column with 0 or 1 indicates
-- if an individual is in the spine
CREATE TABLE [data].personal_detail (
  snz_uid int not null UNIQUE,
  snz_in_spine int not null
);
GO

-- In this table there should be
-- one row for each unique combination
-- of snz_uid and year
CREATE TABLE [data].snz_res_pop (
  snz_uid int not null UNIQUE,
  year int not null
);
GO

-- I CREATED THESE EMPTY TABLES SO THE TABLE
-- NAMES WOULD MATCH SOME OF THOSE IN THE
-- DATA SCHEMA
CREATE TABLE [data].source_ranked_ethnicity (
  snz_uid                 int not null UNIQUE, 
  dummy1 int,
  dummy2 int,
  dummy3 int);
GO
CREATE TABLE [data].income_tax_yr_summary (
  snz_uid                 int not null UNIQUE, 
  dummy1 int,
  dummy2 int,
  dummy3 int);
GO
CREATE TABLE [data].income_cal_yr_summary (
  snz_uid                 int not null UNIQUE, 
  dummy1 int,
  dummy2 int,
  dummy3 int);
GO
CREATE TABLE [data].address_notification (
  snz_uid int not null UNIQUE, 
  dummy1 int,
  dummy2 int,
  dummy3 int);
GO  

CREATE SCHEMA ACC_Clean;
GO

CREATE TABLE ACC_Clean.Medical_Codes (
  snz_acc_claim_uid int not null,
  acc_med_injury_count_nbr smallint,
  acc_med_read_code varchar(6),
  acc_med_read_code_text varchar(255),
  acc_med_injury_precedence_nbr int not null
);
GO

CREATE TABLE ACC_Clean.Serious_Injury (
  snz_uid int not null,
  snz_acc_uid int not null,
  snz_employee_ird_uid int null,
  snz_employer_ird_uid int null,
  acc_cla_accident_date date null,
  acc_cla_claim_costs_to_date_ex_gst_amt decimal(13,2),
  acc_cla_ethnic_grp1_snz_uid bit not null,
  acc_cla_ethnic_grp2_snz_uid bit not null,
  acc_cla_ethnic_grp3_snz_uid bit not null,
  acc_cla_ethnic_grp4_snz_uid bit not null,
  acc_cla_ethnic_grp5_snz_uid bit not null,
  acc_cla_ethnic_grp6_snz_uid bit not null,
  snz_acc_claim_uid int not null,
  acc_cla_meshblock_code varchar(7) null
);
GO

INSERT INTO ACC_Clean.Medical_Codes
( snz_acc_claim_uid,
  acc_med_injury_count_nbr,
  acc_med_read_code,
  acc_med_read_code_text,
  acc_med_injury_precedence_nbr)
VALUES
(1 ,2, 'a', 'broken leg'        ,1 ),
(2 ,3, 'b', 'popped out eyeball',2 ),
(3 ,1, 'a', 'broken leg'        ,1 ),
(4 ,2, 'a', 'broken leg'        ,1 ),
(5 ,3, 'b', 'popped out eyeball',1 ),
(6 ,4, 'b', 'popped out eyeball',2 ),
(7 ,2, 'a', 'broken leg'        ,2 ),
(8 ,2, 'c', 'exploded lung'     ,3 ),
(9 ,3, 'c', 'exploded lung'     ,3 ),
(10,3, 'c', 'exploded lung'     ,3 );
GO

INSERT INTO ACC_Clean.Serious_Injury
( snz_uid                                           ,
  snz_acc_uid                                       ,
  snz_employee_ird_uid                              ,
  snz_employer_ird_uid                              ,
  acc_cla_accident_date                             ,
  acc_cla_claim_costs_to_date_ex_gst_amt            ,
  acc_cla_ethnic_grp1_snz_uid                       ,
  acc_cla_ethnic_grp2_snz_uid                       ,
  acc_cla_ethnic_grp3_snz_uid                       ,
  acc_cla_ethnic_grp4_snz_uid                       ,
  acc_cla_ethnic_grp5_snz_uid                       ,
  acc_cla_ethnic_grp6_snz_uid                       ,
  snz_acc_claim_uid                                 ,
  acc_cla_meshblock_code                            )
VALUES
(10,  29  ,12 ,42 , '20160901', 15000  ,1 ,0 ,0 ,1 ,0 ,1 ,1  , 'MZ321' ),
(2 ,  23  ,14 ,32 , '20160912', 12000  ,1 ,0 ,0 ,0 ,0 ,0 ,2  , 'KL653' ),
(1 ,  22  ,17 ,32 , '20160913', 130000 ,0 ,1 ,0 ,0 ,0 ,0 ,3  , 'DF24'  ),
(4 ,  21  ,18 ,54 , '20160923', 132000 ,0 ,1 ,0 ,0 ,0 ,0 ,4  , 'EW321' ),
(7 ,  26  ,12 ,65 , '20160902', 23000  ,0 ,1 ,0 ,0 ,0 ,0 ,5  , 'EW321' ),
(9 ,  25  ,19 ,65 , '20160921', 32000  ,0 ,0 ,0 ,1 ,0 ,0 ,6  , 'KL432' ),
(5 ,  24  ,19 ,23 , '20160918', 500    ,1 ,0 ,0 ,0 ,0 ,0 ,7  , 'EW234' ),
(8 ,  28  ,15 ,42 , '20160916', 120    ,0 ,0 ,0 ,0 ,1 ,0 ,8  , 'FD432' ),
(6 ,  27  ,14 ,42 , '20160918', 130    ,0 ,1 ,0 ,0 ,0 ,0 ,9  , 'HFD432'),
(3 ,  20  ,12 ,42 , '20160919', 45000  ,1 ,1 ,0 ,0 ,0 ,0 ,10 , 'FGV432');
GO

INSERT INTO security.concordance (
  snz_uid       , 
  snz_dia_uid   ,          
  snz_ird_uid   ,         
  snz_moh_uid   ,         
  snz_cen_uid   ,         
  snz_acc_uid   ,         
  snz_dol_uid   ,         
  snz_in_spine)
VALUES
(10 ,34    , NULL   , NULL, NULL ,29  ,NULL, 1),  
(2  ,55    , NULL   , NULL, NULL ,23  ,NULL,1),    
(1  ,32    , NULL   , NULL, NULL ,22  ,NULL,1),  
(4  ,1     , NULL   , NULL, NULL ,21  ,NULL,1),   
(7  ,67    , NULL   , NULL, NULL ,26  ,NULL,1),   
(9  ,NULL  , 3      , NULL, NULL ,25  ,NULL,0),  
(5  ,32    , 1      , NULL, NULL ,24  ,NULL,0),  
(8  ,43    , 2      , NULL, NULL ,28  ,NULL,1),   
(6  ,23    , 4      , NULL, NULL ,27  ,NULL,1),   
(3  ,123   , 6      , NULL, NULL ,20  ,NULL,1),   
(11 ,NULL  , 7      , NULL, NULL ,NULL,NULL,1),   
(12 ,65    , 5      , NULL, NULL ,NULL,NULL,0),  
(13 ,NULL  , 10     , NULL, NULL ,6   ,NULL,1),   
(14 ,NULL  , 12     , NULL, NULL ,1   ,NULL,1),   
(15 ,NULL  , 43     , NULL, NULL ,NULL,NULL,1),  
(16 ,765   , 44     , NULL, NULL ,NULL,NULL,0),  
(17 ,NULL  , 34     , NULL, NULL ,7   ,NULL,1),   
(18 ,76    , 100    , NULL, NULL ,NULL,NULL,0),  
(19 ,NULL  , 101    , NULL, 32   ,3   ,NULL,0);
GO

--CREATE TABLE dia_clean.births (
--  snz_uid                         int            not null UNIQUE, 
--  snz_dia_uid                     int            not null UNIQUE,
--  parent1_snz_uid                 int            null,
--  parent1_snz_dia_uid             int            null,
--  dia_bir_parent1_sex_snz_code    varchar(100)   null,
--  dia_bir_parent1_occupation_text varchar(60)    null,
--  parent2_snz_uid                 int            null,
--  parent2_snz_dia_uid             int            null,
--  dia_bir_parent2_sex_snz_code    varchar(100)   null,
--  dia_bir_parent2_occupation_text varchar(60)    null,
--  dia_bir_birth_month_nbr         tinyint        null,
--  dia_bir_birth_year_nbr          smallint       null,
--  dia_bir_sex_snz_code            varchar(100)   null,
--  dia_bir_ethnic_grp1_snz_ind     bit            not null,  -- European
--  dia_bir_ethnic_grp2_snz_ind     bit            not null,  -- Maori
--  dia_bir_ethnic_grp3_snz_ind     bit            not null,  -- Pacific
--  dia_bir_ethnic_grp4_snz_ind     bit            not null,  -- Asian
--  dia_bir_ethnic_grp5_snz_ind     bit            not null,  -- MELAA
--  dia_bir_ethnic_grp6_snz_ind     bit            not null); -- Other
--GO
--CREATE TABLE dia_clean.deaths (
--  snz_uid                      int      not null UNIQUE, 
--  snz_dia_uid                  int      not null UNIQUE,
--  dia_dth_death_month_nbr      tinyint  null,
--  dia_dth_death_year_nbr       smallint null,
--  dia_dth_last_seen_month_nbr  tinyint  null,
--  dia_dth_last_seen_year_nbr   smallint null,);
--GO
--CREATE TABLE dia_clean.marriages (
--  partnr1_snz_uid                 int          not null UNIQUE, 
--  partnr1_snz_dia_uid             int          not null UNIQUE,
--  partnr2_snz_uid                 int          not null UNIQUE, 
--  partnr2_snz_dia_uid             int          not null UNIQUE,
--  dia_mar_partnr1_birth_month_nbr tinyint      null,
--  dia_mar_partnr1_birth_year_nbr  smallint     null,
--  dia_mar_partnr1_sex_snz_code    varchar(100) null,
--  dia_mar_partnr1_occupation_text varchar(60)  null,
--  dia_mar_partnr2_birth_month_nbr tinyint      null,
--  dia_mar_partnr2_birth_year_nbr  smallint     null,
--  dia_mar_partnr2_sex_snz_code    varchar(100) null,
--  dia_mar_partnr2_occupation_text varchar(60)  null);
--GO
--CREATE TABLE dia_clean.civil_unions (
--  partnr1_snz_uid                 int          not null UNIQUE, 
--  partnr1_snz_dia_uid             int          not null UNIQUE,
--  partnr2_snz_uid                 int          not null UNIQUE, 
--  partnr2_snz_dia_uid             int          not null UNIQUE,
--  dia_civ_partnr1_birth_month_nbr tinyint      null,
--  dia_civ_partnr1_birth_year_nbr  smallint     null,
--  dia_civ_partnr1_sex_snz_code    varchar(100) null,
--  dia_civ_partnr1_occupation_text varchar(60)  null,
--  dia_civ_partnr2_birth_month_nbr tinyint      null,
--  dia_civ_partnr2_birth_year_nbr  smallint     null,
--  dia_civ_partnr2_sex_snz_code    varchar(100) null,
--  dia_civ_partnr2_occupation_text varchar(60)  null);
--GO

-- INSERT INTO DIA_Clean.civil_unions VALUES (10, 34,    6 ,   23  , 1, 1975, 1, NULL, 1,  1976, 1, NULL);
-- INSERT INTO DIA_Clean.civil_unions VALUES (2,  55,    3 ,   123 , 2, 1966, 0, NULL, 6,  1969, 1, NULL);
-- INSERT INTO DIA_Clean.civil_unions VALUES (1,  32,    12,   65  , 5, 1977, 0, NULL, 4,  1973, 1, NULL);
-- INSERT INTO DIA_Clean.civil_unions VALUES (4,  1,     16,   765 , 5, 1988, 1, NULL, 4,  1989, 0, NULL);
-- INSERT INTO DIA_Clean.civil_unions VALUES (7,  67,    18,   76  , 9, 1999, 0, NULL, 12, 1995, 0, NULL);
-- GO 

-----------------------------------------------------------------
-- CREATE IDI_Metadata DATABASE ---------------------------------
-----------------------------------------------------------------
USE master;
GO

DROP DATABASE IF EXISTS IDI_Metadata;
GO

CREATE DATABASE IDI_Metadata;
GO

USE IDI_Metadata;
GO

CREATE SCHEMA clean_read_CLASSIFICATIONS;
GO

-- I'm not sure what the table names or
-- variable names are in here so these
-- are just made up to simulate the functionality
CREATE TABLE clean_read_CLASSIFICATIONS.ethnicity (
  ethnic_grp int not null, --a number from 1 to 6
  description varchar(100) not null
);
GO

CREATE TABLE clean_read_CLASSIFICATIONS.post_codes (
  post_code int not null,
  description varchar(100)
);
GO

INSERT INTO clean_read_CLASSIFICATIONS.ethnicity
(ethnic_grp, description)
VALUES
(1, 'European'),
(2, 'Maori'),
(3, 'Pacific Peoples'),
(4, 'Asian'),
(5, 'Middle Eastern/Latin American/African'),
(6, 'Other ethnicity');

-----------------------------------------------------------------
-- CREATE OLDER IDI_Clean REFRESH DATABASE ----------------------
-----------------------------------------------------------------

--INSERT INTO security.concordance (
--  snz_uid       , 
--  snz_dia_uid   ,          
--  snz_ird_uid   ,         
--  snz_moh_uid   ,         
--  snz_cen_uid   ,         
--  snz_acc_uid   ,         
--  snz_dol_uid   ,         
--  snz_in_spine)
--VALUES
--(13, 34   , NULL   , NULL, NULL ,NULL,NULL, 1),  
--(21 ,55    , NULL   , NULL, NULL ,2   ,NULL,1),    
--(34 ,32    , NULL   , NULL, NULL ,NULL,NULL,1),  
--(24 ,1     , NULL   , NULL, NULL ,4   ,NULL,1),   
--(55 ,67    , NULL   , NULL, NULL ,5   ,NULL,1),   
--(7 ,NULL  , 3      , NULL, NULL ,NULL,NULL,0),  
--(17 ,32    , 1      , NULL, NULL ,NULL,NULL,0),  
--(28 ,43    , 2      , NULL, NULL ,8   ,NULL,1),   
--(59 ,23    , 4      , NULL, NULL ,9   ,NULL,1),   
--(1237,123   , 6      , NULL, NULL ,10  ,NULL,1),   
--(121,NULL  , 7      , NULL, NULL ,NULL,NULL,1),   
--(345,65    , 5      , NULL, NULL ,NULL,NULL,0),  
--(765, NULL , 10     , NULL, NULL ,6   ,NULL,1),   
--(1432, NULL , 12     , NULL, NULL ,1   ,NULL,1),   
--(873, NULL , 43     , NULL, NULL ,NULL,NULL,1),  
--(3,765   , 44     , NULL, NULL ,NULL,NULL,0),  
--(5,NULL  , 34     , NULL, NULL ,7   ,NULL,1),   
--(78,76    , 100    , NULL, NULL ,NULL,NULL,0),  
--(1,NULL  , 101    , NULL, 32   ,3   ,NULL,0);
--GO

-----------------------------------------------------------------
-- CREATE Sandpit DATABASE --------------------------------------
-------------------------------------------------------------- ---
USE master;
GO

DROP DATABASE IF EXISTS Sandpit;
GO

CREATE DATABASE Sandpit;
GO

USE Sandpit;
GO

--- APE SCHEMA --
CREATE SCHEMA Ape;
GO
CREATE TABLE Ape.Colours (
  ColourID int not null,
  ColourName varchar(20) not null,
  Comments varchar(100), -- I find this Colour strange etc.
  PRIMARY KEY (ColourID)
);
GO
CREATE TABLE Ape.Friends (
  FriendID int not null,
  FirstName varchar(20),
  LastName varchar(20),
  FavColourID int,
  FOREIGN KEY (FavColourID) REFERENCES Ape.Colours (ColourID),
  PRIMARY KEY (FriendID)
);
GO
CREATE TABLE Ape.BananaTree (
  TreeID int not null,
  Height float,
  YearPlanted int,
  MonthPlanted int,
  Width float,
  PRIMARY KEY (TreeID)
);
GO
CREATE TABLE Ape.EatingFrom (
  FriendID int not null,
  TreeID int not null,
  FOREIGN KEY (FriendID) REFERENCES Ape.Friends (FriendID),
  FOREIGN KEY (TreeID) REFERENCES Ape.BananaTree (TreeID)
);
GO
CREATE TABLE Ape.Banana (
  BananaID int not null,
  TasteRank int, -- from 1 to 5
  DatePicked date not null,
  DateEaten date not null,
  Ripe bit,
  TreeID int not null,
  Comments varchar(100),
  FOREIGN KEY (TreeID) REFERENCES Ape.BananaTree (TreeID),
  PRIMARY KEY (BananaID)
);
GO

INSERT INTO Ape.Colours VALUES
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

INSERT INTO Ape.Friends VALUES
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

INSERT INTO Ape.BananaTree VALUES
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

INSERT INTO Ape.EatingFrom VALUES
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

INSERT INTO Ape.Banana VALUES
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

--- NOTES SCHEMA --
CREATE SCHEMA Notes;
GO
CREATE TABLE Notes.Friends (
  FriendID int not null,
  FirstName varchar(20),
  LastName varchar(20),
  FavColour varchar(20),
  PRIMARY KEY (FriendID)
);
GO
CREATE TABLE Notes.Pets (
  PetID int not null,
  PetName varchar(20),
  PetDOB date,
  FriendID int not null,
  FOREIGN KEY (FriendID) REFERENCES Notes.Friends (FriendID),
  PRIMARY KEY (PetID)
);
GO
CREATE TABLE Notes.Scratched (
  ScratcherID int not null,
  ScratchDate date, 
  ScratchTime time,
  ScratcheeID int not null,
  FOREIGN KEY (ScratcherID) REFERENCES Notes.Friends (FriendID),
  FOREIGN KEY (ScratcheeID) REFERENCES Notes.Friends (FriendID),
  PRIMARY KEY (ScratcherID, ScratcheeID, ScratchDate, ScratchTime)
);
GO
CREATE TABLE Notes.PlayCount (
 PetID int not null,
 PlayCounter int,
 FriendID int not null,
 FOREIGN KEY (PetID) REFERENCES Notes.Pets (PetID),
 FOREIGN KEY (FriendID) REFERENCES Notes.Friends (FriendID),
 PRIMARY KEY (PetID, FriendID)
);
GO
CREATE TABLE Notes.Passports (
  PptNo varchar(5) not null,
  PptCountry varchar(20),
  PptExpiry date,
  FriendID int,
  FOREIGN KEY (FriendID) REFERENCES Notes.Friends (FriendID),
  PRIMARY KEY (PptNo)
);
GO
CREATE TABLE Notes.Table1 (
  A int not null,
  B varchar(20),
  C varchar(20),
  PRIMARY KEY (A)
);
GO
CREATE TABLE Notes.Table2 (
  D varchar(20),
  E int not null,
  A int not null,
  FOREIGN KEY (A) REFERENCES Notes.Table1 (A),
  PRIMARY KEY (E)
);
GO
CREATE TABLE Notes.Letters (
  A char,
  B char,
  Num int not null,
  PRIMARY KEY (Num)
);
GO
CREATE TABLE Notes.RandomPeople (
  PersonName varchar(20),
  Gender char(2),
  Age int
);
GO
CREATE TABLE Notes.Houses (
  house_ID      varchar(5) not null,
  house_owner   varchar(50),
  house_address varchar(200),
  post_code     varchar(4),
  house_price   Float,
  PRIMARY KEY (house_ID)
);
GO
CREATE TABLE Notes.Suburbs (
  post_code varchar(5) not null,
  suburb_name varchar(100) not null,
  vaccination_rate Float,
  PRIMARY KEY (post_code, suburb_name)
);
GO

CREATE TABLE Notes.Numbers (
  Num int,
  NumString varchar(10)
);
GO

CREATE TABLE Notes.EduStudy (
  Id varchar(6) not null,
  Income varchar(8),
  Education int,
  PRIMARY KEY (Id)
);
GO

INSERT INTO Notes.EduStudy VALUES 
('EI13', 'low', 5),
('EI122', 'low', 1),
('EI281', 'low-mid', 4),
('EI3332', 'middle', 3),
('EI4751', 'high-mid', 3),
('EI12', 'high', 2);
GO

INSERT INTO Notes.Numbers VALUES 
(111, '111'),
(31, '31'),
(32, '32'),
(211, '211');
GO


INSERT INTO Notes.Houses VALUES 
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

INSERT INTO Notes.Suburbs VALUES
('3128' , 'Erebor'   , 0.8),
('33128', 'Erberor'  , 0.8),
('3128' , 'Fangorn'  , 0.2),
('3779' , 'Durin'    , 0.4),
('3556' , 'Gondor'   , 0.65),
('3083' , 'Isengaard', 0.35);
GO

INSERT INTO Notes.Friends VALUES
(1, 'X', 'A', 'red'),
(2, 'Y', 'B', 'blue'),
(3, 'Z', 'C', NULL);
GO
INSERT INTO Notes.Pets VALUES
(1, 'Chikin', '20160924', 2),
(2, 'Cauchy', '20120301', 3),
(3, 'Gauss', '20120301', 3);
GO
INSERT INTO Notes.Scratched VALUES
(1, '20180905', '12:00', 2),
(1, '20180905', '12:30', 3),
(2, '20180906', '11:00', 1),
(3, '20180907', '10:00', 1),
(2, '20180801', '16:15', 1),
(2, '20180801', '13:00', 3),
(1, '20170214', '04:30', 2),
(3, '20200128', '18:00', 1);
GO
INSERT INTO Notes.PlayCount VALUES
(1, 3, 1),
(1, 5, 2),
(3, 4, 2);
GO
INSERT INTO Notes.Passports VALUES
('E1321', 'Australia', '20210312', NULL),
('LA123', 'New Zealand', '20320901', 2),
('S9876', 'Monaco', '20280619', 3);

GO
INSERT INTO Notes.Table1 (
 A, B, C
) VALUES
 (1, 'Ignorance', 'is'),
 (2, 'War', 'is'),
 (3, 'Freedom', 'is'),
 (4, 'Friendship', 'is');
GO

INSERT INTO Notes.Table2 (
 D, E, A
) VALUES
 ('slavery.', 3, 1),
 ('weakness.', 4, 2),
 ('strength.', 1, 3),
 ('peace.', 2, 4);
GO

INSERT INTO Notes.Letters VALUES
('a', 'b', 1),
('a', 'c', 2),
('a', 'b', 3),
('a', 'c', 4);
GO

INSERT INTO Notes.RandomPeople VALUES
('Beyonce', 'F', 37),
('Laura Marling', 'F', 28),
('Darren Hayes', 'M', 46),
('Bret McKenzie', 'M', 42),
('Jack Monroe', 'NB', 30);


-- ---------------------------------------------------------------
-- CREATE Analytics DATABASE -------------------------------------
-- ---------------------------------------------------------------

USE master;
GO

DROP DATABASE IF EXISTS Analytics;
GO

CREATE DATABASE Analytics;
GO

USE Analytics;
GO

CREATE TABLE Membership (
 memberID INT not null,
 memberName VARCHAR(100),
 phone VARCHAR(20),
 joinDate DATE,
 PRIMARY KEY (memberID)
);
GO

INSERT INTO Membership 
VALUES 
(12231, 'Denali Dune', '+61 03 97229917', '2021-06-21'),
(12688, 'Reilly Bierman', '+61 03 9269 1200', '2021-05-01'),
(12233, 'Shiloh Henry', '+61 03 9479 6000', '2021-05-13'),
(12565, 'Tristan Gaumond', '+61 03 9905 4000', '2021-05-04'),
(12223, 'Rene Brassard', '+61 03 9903 2000', '2021-06-30'),
(12668, 'Tanner Hubert', '+61 03 9035 5511', '2021-07-29');
GO 

CREATE TABLE SausageSizzle (
saleId INT NOT NULL,
saleDate DATE,
product VARCHAR(20),
quantity INT,
friendId INT,
PRIMARY KEY (saleId)
);
GO 

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
GO 

CREATE VIEW SausageSizzleSummary AS
SELECT Product, SaleDate, SUM(Quantity) AS Sales
FROM SausageSizzle
GROUP BY Product, SaleDate;
GO 