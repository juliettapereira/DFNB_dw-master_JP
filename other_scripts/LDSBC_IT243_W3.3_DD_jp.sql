/*****************************************************************************************************************
NAME:    CreateMS_Description.sql
PURPOSE: Create MS_Description
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     02/06/2021   J. Pereira    1. Extended properties for all dbo tables and columns of the DFNB3 database.

RUNTIME: 
Approx. 0 sec
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

--EXEC query generators for DFNB3 tables: dbo.stg_p1 and dbo.stg_p2 

USE DFNB3;

SELECT t.TABLE_SCHEMA
     , t.TABLE_NAME
     , 'EXEC sys.sp_addextendedproperty @name=N''MS_Description'', 
@value=N''The Stage Project ' + RIGHT(t.TABLE_NAME, 1) + ' table.'' , 
@level0type=N''SCHEMA'',@level0name=N''dbo'', 
@level1type=N''TABLE'',@level1name=N''' + t.TABLE_NAME + ''';' AS sql1
  FROM INFORMATION_SCHEMA.TABLES AS t
 WHERE t.TABLE_TYPE = 'BASE TABLE'
       AND t.TABLE_SCHEMA = 'dbo'
 ORDER BY 1
        , 2;

--EXEC query generators for dbo.stg_p1 and dbo.stg_p2 columns

USE DFNB3;

SELECT c.TABLE_NAME
     , c.COLUMN_NAME
     , 'EXEC sys.sp_addextendedproperty @name=N''MS_Description'', 
@value=N''description.'' , 
@level0type=N''SCHEMA'',@level0name=N''dbo'', 
@level1type=N''TABLE'',@level1name=N''' + c.TABLE_NAME + ''', @level2type=N''COLUMN'',@level2name=N''' + c.COLUMN_NAME + ''';' AS sql1
  FROM INFORMATION_SCHEMA.COLUMNS AS c
 WHERE c.TABLE_SCHEMA = 'dbo'
 ORDER BY 1
        , 2;


-- Table EXEC statements

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch Geography ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_area_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch address ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_branch_add_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch address latitude.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_branch_add_lat';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch address longitude.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_branch_add_lon';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch address type.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_branch_add_type';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch code.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_branch_code';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch description.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_branch_desc';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_branch_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch address latitude.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_branch_lat';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch address longitude.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_branch_lon';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Account Customer role ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_cust_role_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Account ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Account ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_id2';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Account ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_id3';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Region ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_region_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer account relationship ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_rel_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Date context.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'as_of_date';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer birth date.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'birth_date';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'branch_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Account close date.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'close_date';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Account current balance.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cur_bal';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer address ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_add_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer address latitude.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_add_lat';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer address longitude.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_add_lon';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer address type.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_add_type';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_id2';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer address latitude.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_lat';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer address longitude.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_lon';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Distance from customer address to respective primary branch.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_pri_branch_dist';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer account relationship ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_rel_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer since date.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cust_since_date';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer first name.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'first_name';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer gender.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'gender';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer last name.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_name';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Loan amount.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'loan_amt';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Specifies whether an account is open or closed.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'open_close_code';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Account open date.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'open_date';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Customer primary branch ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'pri_branch_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Account primary customer ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'pri_cust_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Product ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p1'
                              , @level2type = N'COLUMN'
                              , @level2name = N'prod_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Account ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'acct_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Branch ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'branch_id';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Current customer required indicator.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'cur_cust_req_ind';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Transaction amount.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'tran_amt';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Transaction date.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'tran_date';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Transaction fee amount.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'tran_fee_amt';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Transaction fee percentage.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'tran_fee_prct';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Transaction time.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'tran_time';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Transaction type code.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'tran_type_code';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Transaction type description.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'tran_type_desc';

EXEC sys.sp_addextendedproperty @name = N'MS_Description'
                              , @value = N'Transaction type ID.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'stg_p2'
                              , @level2type = N'COLUMN'
                              , @level2name = N'tran_type_id';