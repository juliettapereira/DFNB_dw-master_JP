USE DFNB3
GO

DROP PROCEDURE dbo.usp_DropAddDFNB3Constraints
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE dbo.usp_DropAddDFNB3Constraints
AS

/*****************************************************************************************************************
NAME:    dbo.DropAddDFNB3Constraints
PURPOSE: Drop and Add DFNB3 Constraints

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     04/09/2021   Julietta P.   1. Built this procedure for LDS BC IT243



RUNTIME: 
Approx. 10 sec

NOTES: 


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/



IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK__tblaccount_dim_tblbranch_dim'
           AND parent_object_id = OBJECT_ID('dbo.account_dim')
)

    BEGIN

        ALTER TABLE dbo.account_dim DROP CONSTRAINT FK__tblaccount_dim_tblbranch_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK__tblaccount_dim_tblproduct_dim'
           AND parent_object_id = OBJECT_ID('dbo.account_dim')
)

    BEGIN

        ALTER TABLE dbo.account_dim DROP CONSTRAINT FK__tblaccount_dim_tblproduct_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblaccount_fact_tblaccount_dim'
           AND parent_object_id = OBJECT_ID('dbo.account_fact')
)

    BEGIN

        ALTER TABLE dbo.account_fact DROP CONSTRAINT FK_tblaccount_fact_tblaccount_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblaccount_fact_tblcustomer_dim'
           AND parent_object_id = OBJECT_ID('dbo.account_fact')
)

    BEGIN

        ALTER TABLE dbo.account_fact DROP CONSTRAINT FK_tblaccount_fact_tblcustomer_dim;

END;


IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblbranch_dim_tblbank_dim'
           AND parent_object_id = OBJECT_ID('dbo.branch_dim')
)

    BEGIN

        ALTER TABLE dbo.branch_dim DROP CONSTRAINT FK_tblbranch_dim_tblbank_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblcustomer_relationship_dim_tblcustomer_dim'
           AND parent_object_id = OBJECT_ID('dbo.customer_relationship_dim')
)

    BEGIN

        ALTER TABLE dbo.customer_relationship_dim DROP CONSTRAINT FK_tblcustomer_relationship_dim_tblcustomer_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblcustomer_account_dim_tblcustomer_dim'
           AND parent_object_id = OBJECT_ID('dbo.customer_account_dim')
)

    BEGIN

        ALTER TABLE dbo.customer_account_dim DROP CONSTRAINT FK_tblcustomer_account_dim_tblcustomer_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblcustomer_account_dim_tblaccount_dim'
           AND parent_object_id = OBJECT_ID('dbo.customer_account_dim')
)

    BEGIN

        ALTER TABLE dbo.customer_account_dim DROP CONSTRAINT FK_tblcustomer_account_dim_tblaccount_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblcustomer_address_dim_tblcustomer_dim'
           AND parent_object_id = OBJECT_ID('dbo.customer_address_dim')
)

    BEGIN

        ALTER TABLE dbo.customer_address_dim DROP CONSTRAINT FK_tblcustomer_address_dim_tblcustomer_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK_tblcustomer_address_dim_tblbranch_dim'
           AND parent_object_id = OBJECT_ID('dbo.customer_address_dim')
)

    BEGIN

        ALTER TABLE dbo.customer_address_dim DROP CONSTRAINT FK_tblcustomer_address_dim_tblbranch_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK__tbltransaction_fact_tblbranch_dim'
           AND parent_object_id = OBJECT_ID('dbo.transaction_fact')
)

    BEGIN

        ALTER TABLE dbo.transaction_fact DROP CONSTRAINT FK__tbltransaction_fact_tblbranch_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK__tbltransaction_fact_tbltransaction_type_dim'
           AND parent_object_id = OBJECT_ID('dbo.transaction_fact')
)

    BEGIN

        ALTER TABLE dbo.transaction_fact DROP CONSTRAINT FK__tbltransaction_fact_tbltransaction_type_dim;

END;

IF EXISTS
(
    SELECT pk.*
      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS pk
     WHERE pk.constraint_name = 'PK_tbltransaction_type_dim'
           AND table_name = 'transaction_type_dim'
)

    BEGIN

        ALTER TABLE dbo.transaction_type_dim DROP CONSTRAINT PK_tbltransaction_type_dim;

END;

IF EXISTS
(
    SELECT pk.*
      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS pk
     WHERE pk.constraint_name = 'PK_tbltransaction_fact'
           AND table_name = 'transaction_fact'
)

    BEGIN

        ALTER TABLE dbo.transaction_fact DROP CONSTRAINT PK_tbltransaction_fact;

END;



IF EXISTS
(
    SELECT pk.* from 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
     WHERE pk.constraint_name = 'PK_tblaccount_dim'
           AND table_name = 'account_dim'
)

    BEGIN

        ALTER TABLE dbo.account_dim DROP CONSTRAINT PK_tblaccount_dim;

END;

IF EXISTS
(
    SELECT pk.* from 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
     WHERE pk.constraint_name = 'PK_tblaccount_fact'
           AND table_name = 'account_fact'
)

    BEGIN

        ALTER TABLE dbo.account_fact DROP CONSTRAINT PK_tblaccount_fact;

END;

IF EXISTS
(
    SELECT pk.* from 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
     WHERE pk.constraint_name = 'PK_tblbank_dim'
           AND table_name = 'bank_dim'
)

    BEGIN

        ALTER TABLE dbo.bank_dim DROP CONSTRAINT PK_tblbank_dim;

END;

IF EXISTS
(
    SELECT pk.* from 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
     WHERE pk.constraint_name = 'PK_tblbranch_dim'
           AND table_name = 'branch_dim'
)

    BEGIN

        ALTER TABLE dbo.branch_dim DROP CONSTRAINT PK_tblbranch_dim;

END;

IF EXISTS
(
    SELECT pk.* from 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
     WHERE pk.constraint_name = 'PK_tblcustomer_account_dim'
           AND table_name = 'customer_account_dim'
)

    BEGIN

        ALTER TABLE dbo.customer_account_dim DROP CONSTRAINT PK_tblcustomer_account_dim;

END;

IF EXISTS
(
    SELECT pk.* from 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
     WHERE pk.constraint_name = 'PK_tblcustomer_address_dim'
           AND table_name = 'customer_address_dim'
)

    BEGIN

        ALTER TABLE dbo.customer_address_dim DROP CONSTRAINT PK_tblcustomer_address_dim;

END;

IF EXISTS
(
    SELECT pk.* from 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
     WHERE pk.constraint_name = 'PK_tblcustomer_dim'
           AND table_name = 'customer_dim'
)

    BEGIN

        ALTER TABLE dbo.customer_dim DROP CONSTRAINT PK_tblcustomer_dim;

END;

IF EXISTS
(
    SELECT pk.* from 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
     WHERE pk.constraint_name = 'PK_tblcustomer_relationship_dim'
           AND table_name = 'customer_relationship_dim'
)

    BEGIN

        ALTER TABLE dbo.customer_relationship_dim DROP CONSTRAINT PK_tblcustomer_relationship_dim;

END;

IF EXISTS
(
    SELECT pk.* from 
    INFORMATION_SCHEMA.TABLE_CONSTRAINTS pk
     WHERE pk.constraint_name = 'PK_tblproduct_dim'
           AND table_name = 'product_dim'
)

    BEGIN

        ALTER TABLE dbo.product_dim DROP CONSTRAINT PK_tblproduct_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK__tbltransaction_fact_tblbranch_dim'
           AND parent_object_id = OBJECT_ID('dbo.transaction_fact')
)

    BEGIN

        ALTER TABLE dbo.transaction_fact DROP CONSTRAINT FK__tbltransaction_fact_tblbranch_dim;

END;

IF EXISTS
(
    SELECT fk.*
      FROM sys.foreign_keys AS fk
     WHERE fk.name = 'FK__tbltransaction_fact_tbltransaction_type_dim'
           AND parent_object_id = OBJECT_ID('dbo.transaction_fact')
)

    BEGIN

        ALTER TABLE dbo.transaction_fact DROP CONSTRAINT FK__tbltransaction_fact_tbltransaction_type_dim;

END;

IF EXISTS
(
    SELECT pk.*
      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS pk
     WHERE pk.constraint_name = 'PK_tbltransaction_type_dim'
           AND table_name = 'transaction_type_dim'
)

    BEGIN

        ALTER TABLE dbo.transaction_type_dim DROP CONSTRAINT PK_tbltransaction_type_dim;

END;

IF EXISTS
(
    SELECT pk.*
      FROM INFORMATION_SCHEMA.TABLE_CONSTRAINTS AS pk
     WHERE pk.constraint_name = 'PK_tbltransaction_fact'
           AND table_name = 'transaction_fact'
)

    BEGIN

        ALTER TABLE dbo.transaction_fact DROP CONSTRAINT PK_tbltransaction_fact;

END;

ALTER TABLE dbo.account_dim
ADD CONSTRAINT PK_tblaccount_dim PRIMARY KEY (acct_id);

ALTER TABLE dbo.account_fact
ADD CONSTRAINT PK_tblaccount_fact PRIMARY KEY (acct_id, cust_id, as_of_date);

ALTER TABLE dbo.bank_dim
ADD CONSTRAINT PK_tblbank_dim PRIMARY KEY (bank_id);

ALTER TABLE dbo.branch_dim
ADD CONSTRAINT PK_tblbranch_dim PRIMARY KEY (branch_id);

ALTER TABLE dbo.customer_account_dim
ADD CONSTRAINT PK_tblcustomer_account_dim PRIMARY KEY (cust_id, acct_id);

ALTER TABLE dbo.customer_address_dim
ADD CONSTRAINT PK_tblcustomer_address_dim PRIMARY KEY (cust_add_id);

ALTER TABLE dbo.customer_dim
ADD CONSTRAINT PK_tblcustomer_dim PRIMARY KEY (cust_id);

ALTER TABLE dbo.customer_relationship_dim
ADD CONSTRAINT PK_tblcustomer_relationship_dim PRIMARY KEY (cust_rel_id, cust_id);

ALTER TABLE dbo.product_dim
ADD CONSTRAINT PK_tblproduct_dim PRIMARY KEY (prod_id);

ALTER TABLE dbo.account_dim
ADD CONSTRAINT FK__tblaccount_dim_tblbranch_dim FOREIGN KEY(branch_id) REFERENCES dbo.branch_dim;

ALTER TABLE dbo.account_dim
ADD CONSTRAINT FK__tblaccount_dim_tblproduct_dim FOREIGN KEY(prod_id) REFERENCES dbo.product_dim;

ALTER TABLE dbo.account_fact
ADD CONSTRAINT FK_tblaccount_fact_tblaccount_dim FOREIGN KEY(acct_id) REFERENCES dbo.account_dim;

ALTER TABLE dbo.account_fact
ADD CONSTRAINT FK_tblaccount_fact_tblcustomer_dim FOREIGN KEY(cust_id) REFERENCES dbo.customer_dim;

ALTER TABLE dbo.branch_dim
ADD CONSTRAINT FK_tblbranch_dim_tblbank_dim FOREIGN KEY(bank_id) REFERENCES dbo.bank_dim;

ALTER TABLE dbo.customer_relationship_dim
ADD CONSTRAINT FK_tblcustomer_relationship_dim_tblcustomer_dim FOREIGN KEY(cust_id) REFERENCES dbo.customer_dim;

ALTER TABLE dbo.customer_account_dim
ADD CONSTRAINT FK_tblcustomer_account_dim_tblcustomer_dim FOREIGN KEY(cust_id) REFERENCES dbo.customer_dim;

ALTER TABLE dbo.customer_account_dim
ADD CONSTRAINT FK_tblcustomer_account_dim_tblaccount_dim FOREIGN KEY(acct_id) REFERENCES dbo.account_dim;

ALTER TABLE dbo.customer_address_dim
ADD CONSTRAINT FK_tblcustomer_address_dim_tblcustomer_dim FOREIGN KEY(cust_id) REFERENCES dbo.customer_dim;

ALTER TABLE dbo.customer_address_dim
ADD CONSTRAINT FK_tblcustomer_address_dim_tblbranch_dim FOREIGN KEY(branch_id) REFERENCES dbo.branch_dim;

ALTER TABLE dbo.transaction_type_dim
ADD CONSTRAINT PK_tbltransaction_type_dim PRIMARY KEY(tran_type_id);

ALTER TABLE dbo.transaction_fact
ADD CONSTRAINT PK_tbltransaction_fact PRIMARY KEY(tran_id);

ALTER TABLE dbo.transaction_fact
ADD CONSTRAINT FK__tbltransaction_fact_tblbranch_dim FOREIGN KEY(branch_id) REFERENCES dbo.branch_dim;

ALTER TABLE dbo.transaction_fact
ADD CONSTRAINT FK__tbltransaction_fact_tbltransaction_type_dim FOREIGN KEY(tran_type_id) REFERENCES dbo.transaction_type_dim;

ALTER TABLE dbo.transaction_type_dim
ADD CONSTRAINT PK_tbltransaction_type_dim PRIMARY KEY(tran_type_id);

ALTER TABLE dbo.transaction_fact
ADD CONSTRAINT FK__tbltransaction_fact_tblbranch_dim FOREIGN KEY(branch_id) REFERENCES dbo.branch_dim;

ALTER TABLE dbo.transaction_fact
ADD CONSTRAINT FK__tbltransaction_fact_tbltransaction_type_dim FOREIGN KEY(tran_type_id) REFERENCES dbo.transaction_type_dim;