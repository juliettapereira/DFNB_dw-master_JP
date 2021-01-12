/*****************************************************************************************************************
NAME:    Create_P2.4
PURPOSE: Create Project 2.4

SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/18/2019   JJAUSSI      1. Built this script  for LDS BC IT 240


RUNTIME: 
30 sec

NOTES: 
This script is the final solution for Project 2.4: Create v1 of Prototype Script. It is designed so you can
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
     WHERE fk.name = 'FK_tblTransactionFact_branch_id_tblBranchDim_branch_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
)
    BEGIN

        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_branch_id_tblBranchDim_branch_id;

END;


--IF EXISTS
--(
--    SELECT fk.*
--      FROM sys.foreign_keys AS fk
--     WHERE fk.name = 'FK_tblTransactionFact_acct_id_tblAccountDim_acct_id'
--           AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
--)
--    BEGIN

--        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_acct_id_tblAccountDim_acct_id;

--END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
)
    BEGIN

        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id;

END;







-- 2) Create the empty table shells

-- Q2: How to check for table to see if it exists before attempting to drop it?
-- A2: Thusly...
-- https://stackoverflow.com/questions/167576/check-if-table-exists-in-sql-server


-- 2.1) Transaction Type Dim Dimension

-- Q2.1: How to define uniqueness in this dimension?
-- A2.1: Here it is...

-- 11
WITH s1
     AS (SELECT DISTINCT 
                s.tran_type_id
              , s.tran_type_code
              , s.tran_type_desc
              , s.tran_fee_prct
              , s.cur_cust_req_ind
           FROM dbo.stg_p2 AS s)
     SELECT s.tran_type_id
          , s.tran_type_code
          , s.tran_type_desc
          , s.tran_fee_prct
          , s.cur_cust_req_ind
       FROM s1 AS s
      GROUP BY s.tran_type_id
             , s.tran_type_code
             , s.tran_type_desc
             , s.tran_fee_prct
             , s.cur_cust_req_ind
      --HAVING COUNT(1) > 1
	   ORDER BY 1, 2;


IF OBJECT_ID('dbo.tblTransactionTypeDim', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblTransactionTypeDim;
END; 

SELECT s.tran_type_id
     , s.tran_type_code
     , s.tran_type_desc
     , s.tran_fee_prct
     , s.cur_cust_req_ind
INTO dbo.tblTransactionTypeDim
  FROM dbo.stg_p2 AS s
 WHERE 1 = 2;



-- 2.2) Transaction Fact

-- Q2.2: What is the primary key for this fact table?
-- A2.2: Composite Key = tran_date | tran_time | branch_id | tran_type_id | acct_id

-- 0
SELECT s.tran_date
     , s.tran_time
     , s.branch_id
     , s.tran_type_id
     , s.acct_id
  FROM dbo.stg_p2 AS s
 GROUP BY s.tran_date
        , s.tran_time
        , s.branch_id
		, s.tran_type_id
        , s.acct_id
 HAVING COUNT(1) > 1;

IF OBJECT_ID('dbo.tblTransactionFact', 'U') IS NOT NULL
    BEGIN
        DROP TABLE dbo.tblTransactionFact;
END; 

SELECT s.tran_date
     , s.tran_time
     , s.branch_id
     , s.acct_id
	 , s.tran_type_id
     , s.tran_amt
     , s.tran_fee_amt
INTO dbo.tblTransactionFact
  FROM dbo.stg_p2 AS s
 WHERE 1 = 2;

ALTER TABLE dbo.tblTransactionFact ADD tran_id INT IDENTITY;







-- 3) Load tables

-- 3.1) Transaction Type Dimension

TRUNCATE TABLE dbo.tblTransactionTypeDim;

INSERT INTO dbo.tblTransactionTypeDim
SELECT DISTINCT 
       s.tran_type_id
     , s.tran_type_code
     , s.tran_type_desc
     , s.tran_fee_prct
     , s.cur_cust_req_ind
  FROM dbo.stg_p2 AS s
 ORDER BY 1
        , 2;


		
-- 3.2) Transaction Fact

TRUNCATE TABLE dbo.tblTransactionFact;

INSERT INTO dbo.tblTransactionFact
SELECT s.tran_date
     , s.tran_time
     , s.branch_id
     , s.acct_id
	 , s.tran_type_id
     , s.tran_amt
     , s.tran_fee_amt
  FROM dbo.stg_p2 AS s
 ORDER BY 1
        , 2
		, 3
		, 4;







-- 4) Referential integrity


-- 4.1) Primary Keys


-- 4.1.1) Transaction Type Dimension

-- Q4.1: How to define the PK?
-- A4.1: Simple - Transaction Type ID

IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblTransactionTypeDim')
)
    BEGIN
        ALTER TABLE dbo.tblTransactionTypeDim DROP CONSTRAINT PK_tblTransactionTypeDim;
END; 

ALTER TABLE dbo.tblTransactionTypeDim
ADD CONSTRAINT PK_tblTransactionTypeDim PRIMARY KEY(tran_type_id);


-- 4.1.2) Transaction Fact

-- Q4.1: How to define the PK?
-- A4.1: Thusly...
-- PK = Transaction ID


IF EXISTS
(
    SELECT 1
      FROM sys.key_constraints
     WHERE type = 'PK'
           AND parent_object_id = OBJECT_ID('dbo.tblTransactionFact')
)
    BEGIN
        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT PK_tblTransactionFact;
END; 

ALTER TABLE dbo.tblTransactionFact
ADD CONSTRAINT PK_tblTransactionFact PRIMARY KEY(tran_id);


-- Alternate PK (APK) = tran_date | tran_time | branch_id | tran_type_id | acct_id

IF EXISTS
(
    SELECT *
      FROM sys.indexes
     WHERE name = 'APK_tblTransactionFact'
)
    BEGIN
        DROP INDEX APK_tblTransactionFact ON dbo.tblTransactionFact;
END; 

CREATE UNIQUE NONCLUSTERED INDEX APK_tblTransactionFact ON dbo.tblTransactionFact
(
	tran_date ASC,
	tran_time ASC,
	branch_id ASC,
	acct_id ASC,
	tran_type_id ASC
);





-- 4.2) Foreign Keys


-- 4.2.1) Transaction Type Dimension


-- 4.2.2) Transaction Fact

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblTransactionFact_branch_id_tblBranchDim_branch_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
)
    BEGIN

        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_branch_id_tblBranchDim_branch_id;

END;

ALTER TABLE dbo.tblTransactionFact
ADD CONSTRAINT FK_tblTransactionFact_branch_id_tblBranchDim_branch_id FOREIGN KEY(branch_id) REFERENCES dbo.tblBranchDim(branch_id);


--IF EXISTS
--(
--    SELECT fk.*
--      FROM sys.foreign_keys AS fk
--     WHERE fk.name = 'FK_tblTransactionFact_acct_id_tblAccountDim_acct_id'
--           AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
--)
--    BEGIN

--        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_acct_id_tblAccountDim_acct_id;

--END;

--ALTER TABLE dbo.tblTransactionFact
--ADD CONSTRAINT FK_tblTransactionFact_acct_id_tblAccountDim_acct_id FOREIGN KEY(acct_id) REFERENCES dbo.tblAccountDim(acct_id);


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id'
           AND parent_object_id = OBJECT_ID(N'dbo.tblTransactionFact')
)
    BEGIN

        ALTER TABLE dbo.tblTransactionFact DROP CONSTRAINT FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id;

END;

ALTER TABLE dbo.tblTransactionFact
ADD CONSTRAINT FK_tblTransactionFact_tran_type_id_tblTransactionTypeDim_tran_type_id FOREIGN KEY(tran_type_id) REFERENCES dbo.tblTransactionTypeDim(tran_type_id);
