/*****************************************************************************************************************
NAME:    Create_P1.4
PURPOSE: Create Project 1.4

SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/01/2019   JJAUSSI      1. Built this script  for LDS BC IT 240
1.1       11/02/2019   JJAUSSI      1. Added data analysis insights


RUNTIME: 
30 sec

NOTES: 
This script is the final solution for Project 1.4: Create v1 of Prototype Script. It is designed so you can
run the entire script (F5) repeatedly 

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/


-- 1) Drop contraints

-- Q1: How to drop tables with Foreign Keys?

-- A1: Check to see if Foreign Keys Exist, drop the Foreign Keys first, then drop the tables
-- https://stackoverflow.com/questions/1776079/sql-drop-table-foreign-key-constraint


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblBranchDim_region_id_tblRegionDim_region_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
)
    BEGIN

        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_region_id_tblRegionDim_region_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblBranchDim_area_id_tblAreaDim_area_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
)
    BEGIN

        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_area_id_tblAreaDim_area_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblBranchDim_branch_add_id_tblAddressDim_add_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
)
    BEGIN

        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_branch_add_id_tblAddressDim_add_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblCustomerDim')
)
    BEGIN

        ALTER TABLE dbo.tblCustomerDim DROP CONSTRAINT FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountDim_branch_id_tblBranchDim_branch_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountFact_acct_id_tblAccountDim_acct_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountFact')
)
    BEGIN

        ALTER TABLE dbo.tblAccountFact DROP CONSTRAINT FK_tblAccountFact_acct_id_tblAccountDim_acct_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountDim_prod_id_tblProductDim_prod_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_prod_id_tblProductDim_prod_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountDim_branch_id_tblBranchDim_branch_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id;

END;







-- 2) Create the empty table shells

-- Q2: How to check for table to see if it exists before attempting to drop it?
-- A2: Thusly...
-- https://stackoverflow.com/questions/167576/check-if-table-exists-in-sql-server


-- 2.1) Account Customer Dimension

--Q2.1: Account:Customer is a N:N (many to many)...how to resolve?
-- - One Account can relate to multiple Customers
-- - Primary Customer -> acct_cust_role_id = 1
-- - Secondary Customer -> acct_cust_role_id = 2

-- 8,023

SELECT s.acct_id
     , MIN(s.acct_cust_role_id)
     , MAX(s.acct_cust_role_id)
     , COUNT(DISTINCT s.cust_id) AS cust_count
  FROM dbo.stg_p1 AS s
 GROUP BY s.acct_id
 HAVING COUNT(DISTINCT s.cust_id) > 1;

-- - One Customer can have multiple Accounts
-- 861

SELECT s.cust_id
     , COUNT(DISTINCT s.acct_id) AS acct_count
  FROM dbo.stg_p1 AS s
 GROUP BY s.cust_id
 HAVING COUNT(DISTINCT s.acct_id) > 1;

-- A2.1: Create a Bridge table to cope with the N:N relationship
-- https://www.kimballgroup.com/2012/02/design-tip-142-building-bridges/

IF OBJECT_ID('dbo.tblAccountCustomerDim', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblAccountCustomerDim;
END; 

SELECT s.acct_id
     , s.cust_id
     , s.acct_cust_role_id
INTO dbo.tblAccountCustomerDim
  FROM dbo.stg_p1 AS s
 WHERE 1 = 2;



-- 2.2) Account Customer Role Dimension

-- Q2.2: What is an Account Customer Role and which Dimensions relate?
-- A2.2: An Account Customer Role describes how a give Customer relates to a given Account in terms of primary (1) or
--       secondary (2). The Primary Customer is ultimately responsible for repayment of a loan. Below are the dimensions.

IF OBJECT_ID('dbo.tblAccountCustomerRoleDim', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblAccountCustomerRoleDim;
END; 

SELECT s.acct_cust_role_id
     , CAST('Unknown' AS VARCHAR(50)) AS acct_cust_role_desc
INTO dbo.tblAccountCustomerRoleDim
  FROM dbo.stg_p1 AS s
 WHERE 1 = 2;



-- 2.3) Account Dimension

-- Q2.3: What is an Account and which Dimensions relate?
-- A2.3: An Account is a loan or deposit. It is owned by at least one Customer and housed at a Branch. Below are 
--       the dimensions

IF OBJECT_ID('dbo.tblAccountDim', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblAccountDim;
END; 

SELECT s.acct_id2 AS acct_id
     , s.prod_id
     , s.open_date
     , s.close_date
     , s.open_close_code
     , s.branch_id
     , s.pri_cust_id
     , s.loan_amt
INTO dbo.tblAccountDim
  FROM dbo.stg_p1 AS s
 WHERE 1 = 2;



-- 2.4) Branch Dimension

-- Q2.4: What is a Branch and which Dimensions relate?
-- A2.4: A Branch is a "brick and mortar" bank location. A building identified by an Address where Customers transact.
--       Below are the dimensions.

IF OBJECT_ID('dbo.tblBranchDim', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblBranchDim;
END; 

SELECT s.acct_branch_id AS branch_id
     , s.acct_branch_code AS branch_code
     , s.acct_branch_desc AS branch_desc
     , s.acct_branch_add_id AS branch_add_id
     , s.acct_region_id AS region_id
     , s.acct_area_id AS area_id
INTO dbo.tblBranchDim
  FROM dbo.stg_p1 AS s
 WHERE 1 = 2;



-- 2.5) Region Dimension

-- Q2.5: What is a Region and which Dimensions relate?
-- A2.5: A Region is simply a group of Branches. Below are the dimensions.

SELECT DISTINCT 
       sp.acct_region_id
     , sp.branch_id
  FROM dbo.stg_p1 AS sp
 ORDER BY 2
        , 1;

IF OBJECT_ID('dbo.tblRegionDim', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblRegionDim;
END; 

SELECT s.acct_region_id AS region_id
     , CAST('Unknown' AS VARCHAR(50)) AS region_desc
INTO dbo.tblRegionDim
  FROM dbo.stg_p1 AS s
 WHERE 1 = 2;



-- 2.6) Area Dimension

-- Q2.6: What is an Area and which Dimensions relate?
-- A2.6: Well...an Area looks like it should simply a group of Regions...but a couple are multivalued. 
--       There is a potential source data issue here that needs to be cleaned up later. Below are the dimensions.

-- Region 3 found in Areas 1,2
-- Region 4 found in Areas 1,2

SELECT sp.acct_area_id
     , sp.acct_region_id
     , MIN(sp.as_of_date)
     , MAX(sp.as_of_date)
     , COUNT(1)
  FROM dbo.stg_p1 AS sp
 GROUP BY sp.acct_area_id
        , sp.acct_region_id
 ORDER BY 1
        , 2;


IF OBJECT_ID('dbo.tblAreaDim', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblAreaDim;
END; 

SELECT s.acct_area_id AS area_id
     , CAST('Unknown' AS VARCHAR(50)) AS area_desc
INTO dbo.tblAreaDim
  FROM dbo.stg_p1 AS s
 WHERE 1 = 2;



-- 2.7) Product Dimension

-- Q2.7: What is a Product and which Dimensions relate?
-- A2.7: A Product is a type of Account. Does not change over time. Sparse data here for now. Below are the dimensions.

-- 0

SELECT s.acct_id
     , COUNT(DISTINCT s.prod_id) AS prod_id_count
  FROM dbo.stg_p1 AS s
 GROUP BY s.acct_id
 HAVING COUNT(DISTINCT s.prod_id) > 1;

-- 10

SELECT s.prod_id
     , COUNT(DISTINCT s.acct_id) AS acct_id_count
  FROM dbo.stg_p1 AS s
 GROUP BY s.prod_id
 ORDER BY 1;


IF OBJECT_ID('dbo.tblProductDim', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblProductDim;
END; 

SELECT s.prod_id
     , CAST('Unknown' AS VARCHAR(50)) AS prod_desc
INTO dbo.tblProductDim
  FROM dbo.stg_p1 AS s
 WHERE 1 = 2;



-- 2.8) Customer Dimension

-- Q2.8: What is a Customer and which Dimensions relate?
-- A2.8: A Customer is a person or a business that owns an Account. They are sometimes Primary and sometimes Secondary
--       on an Account. Below are the dimensions.


IF OBJECT_ID('dbo.tblCustomerDim', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblCustomerDim;
END; 

SELECT s.cust_id2 AS cust_id
     , s.last_name
     , s.first_name
     , s.gender
     , s.birth_date
     , s.cust_since_date
     , s.pri_branch_id
     , s.cust_pri_branch_dist
     , s.cust_add_id
     , s.cust_lat
     , s.cust_lon
     , s.cust_rel_id
INTO dbo.tblCustomerDim
  FROM dbo.stg_p1 AS s
 WHERE 1 = 2;



-- 2.9) Account Fact

-- Q2.9: What is data qualifies as Fact data for Accounts in this data set?
-- A2.9: Needs to be look like this
-- - Point in time is measure -> as_of_date
-- - Measures change over time
-- - Math can be performed on measure and it has meaning (summable for example)
-- - Limit to the Primary Customer records

-- Rule out loan_amt
-- 0

SELECT s.acct_id
     , COUNT(DISTINCT s.loan_amt) AS rec_count
  FROM dbo.stg_p1 AS s
 GROUP BY s.acct_id
 HAVING COUNT(DISTINCT s.loan_amt) > 1;

-- Rule in cur_bal

SELECT s.as_of_date
     , s.acct_id
     , s.loan_amt
     , s.cur_bal
  FROM dbo.stg_p1 AS s
 WHERE s.acct_id IN
                   (
                    1
                  , 2
                  , 3
                   )
 ORDER BY 2
        , 1;


IF OBJECT_ID('dbo.tblAccountFact', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblAccountFact;
END; 

SELECT s.as_of_date
     , s.acct_id3 AS acct_id
     , s.cur_bal
INTO dbo.tblAccountFact
  FROM dbo.stg_p1 AS s
 WHERE 1 = 2;



-- 2.10) Address Dimension

-- Q2.10: I don't want to have two Address tables...one for Customer and another for Branch...how to model one table?
-- A2.10: The key is as follows...

-- - Rule out Customer and Branch located at the same address
-- 0

SELECT s.cust_lat
     , s.cust_add_lon
  FROM dbo.stg_p1 AS s
INTERSECT
SELECT s.acct_branch_add_lat
     , s.acct_branch_add_lon
  FROM dbo.stg_p1 AS s;

-- - Use Address Type

SELECT DISTINCT 
       s.acct_branch_add_type -- B = Branch
  FROM dbo.stg_p1 AS s;

SELECT DISTINCT 
       s.cust_add_type -- C = Customer
  FROM dbo.stg_p1 AS s;

-- - This allows us to stack Customer and Branch Addresses on top of each other in one table


IF OBJECT_ID('dbo.tblAddressDim', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblAddressDim;
END; 

SELECT s.acct_branch_add_id AS add_id
     , s.acct_branch_add_lat AS add_lat
     , s.acct_branch_add_lon AS add_lon
     , s.acct_branch_add_type AS add_type
INTO dbo.tblAddressDim
  FROM dbo.stg_p1 AS s
 WHERE 1 = 2;







-- 3) Load tables

-- 3.1) Account Customer Dimension

TRUNCATE TABLE dbo.tblAccountCustomerDim;

INSERT INTO dbo.tblAccountCustomerDim
SELECT DISTINCT 
       s.acct_id
     , s.cust_id
     , s.acct_cust_role_id
  FROM dbo.stg_p1 AS s
 ORDER BY 1
        , 2;


		
-- 3.2) Account Customer Role Dimension

TRUNCATE TABLE dbo.tblAccountCustomerRoleDim;

INSERT INTO dbo.tblAccountCustomerRoleDim
SELECT DISTINCT 
       s.acct_cust_role_id
     , CASE
           WHEN s.acct_cust_role_id = 1
           THEN 'Primary'
           WHEN s.acct_cust_role_id = 2
           THEN 'Secondary'
           ELSE 'Unknown'
       END AS acct_cust_role_desc
  FROM dbo.stg_p1 AS s
 ORDER BY 1
        , 2;



-- 3.3) Account Dimension

TRUNCATE TABLE dbo.tblAccountDim;

INSERT INTO dbo.tblAccountDim
SELECT DISTINCT 
       s.acct_id2 AS acct_id
     , s.prod_id
     , s.open_date
     , s.close_date
     , s.open_close_code
     , s.branch_id
     , s.pri_cust_id
     , s.loan_amt
  FROM dbo.stg_p1 AS s
 WHERE s.acct_cust_role_id = 1
 ORDER BY 1;


 
-- 3.4) Branch Dimension

TRUNCATE TABLE dbo.tblBranchDim;

INSERT INTO dbo.tblBranchDim
SELECT DISTINCT 
       s.acct_branch_id AS branch_id
     , s.acct_branch_code AS branch_code
     , s.acct_branch_desc AS branch_desc
     , s.acct_branch_add_id AS branch_add_id
     , s.acct_region_id AS region_id
     , s.acct_area_id AS area_id
  FROM dbo.stg_p1 AS s
 ORDER BY 1;



-- 3.5) Region Dimension

TRUNCATE TABLE dbo.tblRegionDim;

INSERT INTO dbo.tblRegionDim
SELECT DISTINCT 
       s.acct_region_id AS region_id
     , 'Unknown' AS region_desc
  FROM dbo.stg_p1 AS s
 ORDER BY 1;



-- 3.6) Area Dimension

TRUNCATE TABLE dbo.tblAreaDim;

INSERT INTO dbo.tblAreaDim
SELECT DISTINCT 
       s.acct_area_id AS area_id
     , 'Unknown' AS area_desc
  FROM dbo.stg_p1 AS s
 ORDER BY 1;



-- 3.7) Product Dimension

TRUNCATE TABLE dbo.tblProductDim;

INSERT INTO dbo.tblProductDim
SELECT DISTINCT 
       s.prod_id
     , 'Unknown' AS prod_desc
  FROM dbo.stg_p1 AS s
 ORDER BY 1;



-- 3.8) Customer Dimension

TRUNCATE TABLE dbo.tblCustomerDim;

INSERT INTO dbo.tblCustomerDim
SELECT DISTINCT 
       s.cust_id2 AS cust_id
     , s.last_name
     , s.first_name
     , s.gender
     , s.birth_date
     , s.cust_since_date
     , s.pri_branch_id
     , s.cust_pri_branch_dist
     , s.cust_add_id
     , s.cust_lat
     , s.cust_lon
     , s.cust_rel_id
  FROM dbo.stg_p1 AS s
 ORDER BY 1;



-- 3.9) Account Fact

-- Q3.9: How to load Account fact when multiple records found for one Account on one As of Date?

-- A3.9: Data integrity preserved if we filter for the Primary Customer records only
-- - All Accounts have one and only one Primary Customer
-- - Some Accounts have a Secondary Customer

-- Before: 430,054
--  After: 0

SELECT s.as_of_date
     , s.acct_id3
     , MIN(s.acct_cust_role_id)
     , MAX(s.acct_cust_role_id)
     , COUNT(1) AS rec_count
  FROM dbo.stg_p1 AS s
 --WHERE s.acct_cust_role_id = 1
 GROUP BY s.as_of_date
        , s.acct_id3
 HAVING COUNT(1) > 1;


TRUNCATE TABLE dbo.tblAccountFact;

INSERT INTO dbo.tblAccountFact
SELECT DISTINCT 
       s.as_of_date
     , s.acct_id3 AS acct_id
     , s.cur_bal
  FROM dbo.stg_p1 AS s
 WHERE s.acct_cust_role_id = 1;



-- 3.10) Address Dimension

TRUNCATE TABLE dbo.tblAddressDim;

INSERT INTO dbo.tblAddressDim
SELECT s.acct_branch_add_id AS add_id
     , s.acct_branch_add_lat AS add_lat
     , s.acct_branch_add_lon AS add_lon
     , s.acct_branch_add_type AS add_type
  FROM dbo.stg_p1 AS s
UNION
SELECT s.cust_add_id AS add_id
     , s.cust_add_lat AS add_lat
     , s.cust_add_lon AS add_lon
     , s.cust_add_type AS add_type
  FROM dbo.stg_p1 AS s;







-- 4) Referential integrity


-- 4.1) Primary Keys


-- 4.1.1) Account Customer Dimension

-- Q4.1: How to define the PK?
-- A4.1: This has to be a composite PK - unique occurrences of Account and Customer

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblAccountCustomerDim')
)
    BEGIN
        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT PK_tblAccountCustomerDim;
END; 

ALTER TABLE dbo.tblAccountCustomerDim
ADD CONSTRAINT PK_tblAccountCustomerDim PRIMARY KEY(acct_id, cust_id);



-- 4.1.2) Account Customer Role Dimension

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblAccountCustomerRoleDim')
)
    BEGIN
        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT PK_tblAccountCustomerRoleDim;
END; 

ALTER TABLE dbo.tblAccountCustomerRoleDim
ADD CONSTRAINT PK_tblAccountCustomerRoleDim PRIMARY KEY(acct_cust_role_id);



-- 4.1.3) Account Dimension

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblAccountDim')
)
    BEGIN
        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT PK_tblAccountDim;
END; 

ALTER TABLE dbo.tblAccountDim
ADD CONSTRAINT PK_tblAccountDim PRIMARY KEY(acct_id);



-- 4.1.4) Branch Dimension

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblBranchDim')
)
    BEGIN
        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT PK_tblBranchDim;
END; 

ALTER TABLE dbo.tblBranchDim
ADD CONSTRAINT PK_tblBranchDim PRIMARY KEY(branch_id);



-- 4.1.5) Region Dimension

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblRegionDim')
)
    BEGIN
        ALTER TABLE dbo.tblRegionDim DROP CONSTRAINT PK_tblRegionDim;
END; 

ALTER TABLE dbo.tblRegionDim
ADD CONSTRAINT PK_tblRegionDim PRIMARY KEY(region_id);



-- 4.1.6) Area Dimension

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblAreaDim')
)
    BEGIN
        ALTER TABLE dbo.tblAreaDim DROP CONSTRAINT PK_tblAreaDim;
END; 

ALTER TABLE dbo.tblAreaDim
ADD CONSTRAINT PK_tblAreaDim PRIMARY KEY(area_id);



-- 4.1.7) Product Dimension

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblProductDim')
)
    BEGIN
        ALTER TABLE dbo.tblProductDim DROP CONSTRAINT PK_tblProductDim;
END; 

ALTER TABLE dbo.tblProductDim
ADD CONSTRAINT PK_tblProductDim PRIMARY KEY(prod_id);



-- 4.1.8) Customer Dimension

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblCustomerDim')
)
    BEGIN
        ALTER TABLE dbo.tblCustomerDim DROP CONSTRAINT PK_tblCustomerDim;
END; 

ALTER TABLE dbo.tblCustomerDim
ADD CONSTRAINT PK_tblCustomerDim PRIMARY KEY(cust_id);



-- 4.1.9) Account Fact

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblAccountFact')
)
    BEGIN
        ALTER TABLE dbo.tblAccountFact DROP CONSTRAINT PK_tblAccountFact;
END; 

ALTER TABLE dbo.tblAccountFact
ADD CONSTRAINT PK_tblAccountFact PRIMARY KEY(as_of_date, acct_id);



-- 4.1.10) Address Dimension

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblAddressDim')
)
    BEGIN
        ALTER TABLE dbo.tblAddressDim DROP CONSTRAINT PK_tblAddressDim;
END; 

ALTER TABLE dbo.tblAddressDim
ADD CONSTRAINT PK_tblAddressDim PRIMARY KEY(add_id);







-- 4.2) Foreign Keys


-- 4.2.1) Account Customer Dimension

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id;

END;

ALTER TABLE dbo.tblAccountCustomerDim
ADD CONSTRAINT FK_tblAccountCustomerDim_cust_id_tblCustomerDim_cust_id FOREIGN KEY(cust_id) REFERENCES dbo.tblCustomerDim(cust_id);


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id;

END;

ALTER TABLE dbo.tblAccountCustomerDim
ADD CONSTRAINT FK_tblAccountCustomerDim_acct_id_tblAccountDim_acct_id FOREIGN KEY(acct_id) REFERENCES dbo.tblAccountDim(acct_id);


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountCustomerDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountCustomerDim DROP CONSTRAINT FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id;

END;

ALTER TABLE dbo.tblAccountCustomerDim
ADD CONSTRAINT FK_tblAccountCustomerDim_acct_cust_role_id_tblAccountCustomerRoleDim_acct_cust_role_id FOREIGN KEY(acct_cust_role_id) REFERENCES dbo.tblAccountCustomerRoleDim(acct_cust_role_id);



-- 4.2.2) Account Customer Role Dimension



-- 4.2.3) Account Dimension

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountDim_prod_id_tblProductDim_prod_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_prod_id_tblProductDim_prod_id;

END;

ALTER TABLE dbo.tblAccountDim
ADD CONSTRAINT FK_tblAccountDim_prod_id_tblProductDim_prod_id FOREIGN KEY(prod_id) REFERENCES dbo.tblProductDim(prod_id);


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountDim_branch_id_tblBranchDim_branch_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id;

END;

ALTER TABLE dbo.tblAccountDim
ADD CONSTRAINT FK_tblAccountDim_branch_id_tblBranchDim_branch_id FOREIGN KEY(branch_id) REFERENCES dbo.tblBranchDim(branch_id);


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountDim')
)
    BEGIN

        ALTER TABLE dbo.tblAccountDim DROP CONSTRAINT FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id;

END;

ALTER TABLE dbo.tblAccountDim
ADD CONSTRAINT FK_tblAccountDim_pri_cust_id_tblCustomerDim_cust_id FOREIGN KEY(pri_cust_id) REFERENCES dbo.tblCustomerDim(cust_id);



-- 4.2.4) Branch Dimension

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblBranchDim_branch_add_id_tblAddressDim_add_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
)
    BEGIN

        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_branch_add_id_tblAddressDim_add_id;

END;

ALTER TABLE dbo.tblBranchDim
ADD CONSTRAINT FK_tblBranchDim_branch_add_id_tblAddressDim_add_id FOREIGN KEY(branch_add_id) REFERENCES dbo.tblAddressDim(add_id);


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblBranchDim_region_id_tblRegionDim_region_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
)
    BEGIN

        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_region_id_tblRegionDim_region_id;

END;

ALTER TABLE dbo.tblBranchDim
ADD CONSTRAINT FK_tblBranchDim_region_id_tblRegionDim_region_id FOREIGN KEY(region_id) REFERENCES dbo.tblRegionDim(region_id);


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblBranchDim_area_id_tblAreaDim_area_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblBranchDim')
)
    BEGIN

        ALTER TABLE dbo.tblBranchDim DROP CONSTRAINT FK_tblBranchDim_area_id_tblAreaDim_area_id;

END;

ALTER TABLE dbo.tblBranchDim
ADD CONSTRAINT FK_tblBranchDim_area_id_tblAreaDim_area_id FOREIGN KEY(area_id) REFERENCES dbo.tblAreaDim(area_id);





-- 4.2.5) Region Dimension



-- 4.2.6) Area Dimension



-- 4.2.7) Product Dimension



-- 4.2.8) Customer Dimension

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblCustomerDim')
)
    BEGIN

        ALTER TABLE dbo.tblCustomerDim DROP CONSTRAINT FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id;

END;

ALTER TABLE dbo.tblCustomerDim
ADD CONSTRAINT FK_tblCustomerDim_pri_branch_id_tblBranchDim_branch_id FOREIGN KEY(pri_branch_id) REFERENCES dbo.tblBranchDim(branch_id);


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblCustomerDim')
)
    BEGIN

        ALTER TABLE dbo.tblCustomerDim DROP CONSTRAINT FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id;

END;

ALTER TABLE dbo.tblCustomerDim
ADD CONSTRAINT FK_tblCustomerDim_cust_add_id_tblAddressDim_add_id FOREIGN KEY(cust_add_id) REFERENCES dbo.tblAddressDim(add_id);



-- 4.2.9) Account Fact

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblAccountFact_acct_id_tblAccountDim_acct_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblAccountFact')
)
    BEGIN

        ALTER TABLE dbo.tblAccountFact DROP CONSTRAINT FK_tblAccountFact_acct_id_tblAccountDim_acct_id;

END;

ALTER TABLE dbo.tblAccountFact
ADD CONSTRAINT FK_tblAccountFact_acct_id_tblAccountDim_acct_id FOREIGN KEY(acct_id) REFERENCES dbo.tblAccountDim(acct_id);



-- 4.2.10) Address Dimension