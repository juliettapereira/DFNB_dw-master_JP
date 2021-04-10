CREATE PROCEDURE dbo.usp_CREATE_DFNB3

/*****************************************************************************************************************
NAME:    dbo.usp_CREATE_DFNB3
PURPOSE: Create the DFNB3 schema

SUPPORT: Julietta Pereira
         juliettapereirao@gmail.com

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       04/09/2021   Julietta P. 	1. Built the DFNB3 schema


RUNTIME: 
2 min

NOTES: 
This is the entire structure of the DFNB3 database

SSMS > DFNB3 > Tasks > Generate Scripts > Script entire database and all objects

******************************************************************************************************************/

USE [DFNB3]
GO
ALTER TABLE [dbo].[transaction_fact] DROP CONSTRAINT [FK__tbltransaction_fact_tbltransaction_type_dim]
GO
ALTER TABLE [dbo].[transaction_fact] DROP CONSTRAINT [FK__tbltransaction_fact_tblbranch_dim]
GO
ALTER TABLE [dbo].[customer_relationship_dim] DROP CONSTRAINT [FK_tblcustomer_relationship_dim_tblcustomer_dim]
GO
ALTER TABLE [dbo].[customer_address_dim] DROP CONSTRAINT [FK_tblcustomer_address_dim_tblcustomer_dim]
GO
ALTER TABLE [dbo].[customer_address_dim] DROP CONSTRAINT [FK_tblcustomer_address_dim_tblbranch_dim]
GO
ALTER TABLE [dbo].[customer_account_dim] DROP CONSTRAINT [FK_tblcustomer_account_dim_tblcustomer_dim]
GO
ALTER TABLE [dbo].[customer_account_dim] DROP CONSTRAINT [FK_tblcustomer_account_dim_tblaccount_dim]
GO
ALTER TABLE [dbo].[branch_dim] DROP CONSTRAINT [FK_tblbranch_dim_tblbank_dim]
GO
ALTER TABLE [dbo].[account_fact] DROP CONSTRAINT [FK_tblaccount_fact_tblcustomer_dim]
GO
ALTER TABLE [dbo].[account_fact] DROP CONSTRAINT [FK_tblaccount_fact_tblaccount_dim]
GO
ALTER TABLE [dbo].[account_dim] DROP CONSTRAINT [FK__tblaccount_dim_tblproduct_dim]
GO
ALTER TABLE [dbo].[account_dim] DROP CONSTRAINT [FK__tblaccount_dim_tblbranch_dim]
GO
/****** Object:  Table [dbo].[product_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[product_dim]') AND type in (N'U'))
DROP TABLE [dbo].[product_dim]
GO
/****** Object:  Table [dbo].[customer_relationship_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customer_relationship_dim]') AND type in (N'U'))
DROP TABLE [dbo].[customer_relationship_dim]
GO
/****** Object:  Table [dbo].[customer_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customer_dim]') AND type in (N'U'))
DROP TABLE [dbo].[customer_dim]
GO
/****** Object:  Table [dbo].[customer_address_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customer_address_dim]') AND type in (N'U'))
DROP TABLE [dbo].[customer_address_dim]
GO
/****** Object:  Table [dbo].[customer_account_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[customer_account_dim]') AND type in (N'U'))
DROP TABLE [dbo].[customer_account_dim]
GO
/****** Object:  Table [dbo].[bank_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[bank_dim]') AND type in (N'U'))
DROP TABLE [dbo].[bank_dim]
GO
/****** Object:  View [dbo].[prod_date]    Script Date: 7/18/2020 5:22:56 PM ******/
DROP VIEW [dbo].[prod_date]
GO
/****** Object:  View [dbo].[cust_rel_add]    Script Date: 7/18/2020 5:22:56 PM ******/
DROP VIEW [dbo].[cust_rel_add]
GO
/****** Object:  View [dbo].[transaction_fact_transaction_type]    Script Date: 7/18/2020 5:22:56 PM ******/
DROP VIEW [dbo].[transaction_fact_transaction_type]
GO
/****** Object:  Table [dbo].[transaction_type_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[transaction_type_dim]') AND type in (N'U'))
DROP TABLE [dbo].[transaction_type_dim]
GO
/****** Object:  View [dbo].[transaction_fact_branch]    Script Date: 7/18/2020 5:22:56 PM ******/
DROP VIEW [dbo].[transaction_fact_branch]
GO
/****** Object:  Table [dbo].[transaction_fact]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[transaction_fact]') AND type in (N'U'))
DROP TABLE [dbo].[transaction_fact]
GO
/****** Object:  View [dbo].[account_dim_branch]    Script Date: 7/18/2020 5:22:56 PM ******/
DROP VIEW [dbo].[account_dim_branch]
GO
/****** Object:  Table [dbo].[branch_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[branch_dim]') AND type in (N'U'))
DROP TABLE [dbo].[branch_dim]
GO
/****** Object:  View [dbo].[account_fact_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
DROP VIEW [dbo].[account_fact_dim]
GO
/****** Object:  Table [dbo].[account_fact]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[account_fact]') AND type in (N'U'))
DROP TABLE [dbo].[account_fact]
GO
/****** Object:  View [dbo].[loan_revenue_forecast_goal]    Script Date: 7/18/2020 5:22:56 PM ******/
DROP VIEW [dbo].[loan_revenue_forecast_goal]
GO
/****** Object:  Table [dbo].[account_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[account_dim]') AND type in (N'U'))
DROP TABLE [dbo].[account_dim]
GO
/****** Object:  Table [dbo].[loan_revenue_forecast]    Script Date: 7/18/2020 5:22:56 PM ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[loan_revenue_forecast]') AND type in (N'U'))
DROP TABLE [dbo].[loan_revenue_forecast]
GO
/****** Object:  Table [dbo].[loan_revenue_forecast]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[loan_revenue_forecast](
	[year] [int] NOT NULL,
	[total_loan_amt] [decimal](15, 4) NOT NULL,
	[calculation_indicator] [varchar](8) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[year] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[account_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_dim](
	[acct_id] [int] NOT NULL,
	[open_date] [date] NOT NULL,
	[close_date] [date] NOT NULL,
	[open_close_code] [varchar](1) NOT NULL,
	[loan_amt] [decimal](20, 4) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[prod_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblaccount_dim] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[loan_revenue_forecast_goal]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[loan_revenue_forecast_goal]
AS
     SELECT l.year
          , l.total_loan_amt AS total_loan_amt_estimate
          , l.total_loan_amt + l.total_loan_amt * 0.02 AS total_loan_amt_goal
          , SUM(a.loan_amt) AS current_loan_amt_revenue
          , l.total_loan_amt + l.total_loan_amt * 0.02 - SUM(a.[loan_amt]) AS difference
       FROM loan_revenue_forecast AS l
            FULL JOIN
            account_dim AS a ON l.year = YEAR(a.open_date)
      WHERE YEAR(a.open_date) = '2019'
      GROUP BY l.total_loan_amt
             , l.total_loan_amt + l.total_loan_amt * 0.02
             , l.year;
GO
/****** Object:  Table [dbo].[account_fact]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[account_fact](
	[acct_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[as_of_date] [date] NOT NULL,
	[cur_bal] [decimal](20, 4) NOT NULL,
 CONSTRAINT [PK_tblaccount_fact] PRIMARY KEY CLUSTERED 
(
	[acct_id] ASC,
	[cust_id] ASC,
	[as_of_date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[account_fact_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[account_fact_dim] AS
SELECT DISTINCT d.acct_id, as_of_date, cur_bal, open_date, close_date, open_close_code, loan_amt, branch_id, prod_id
FROM     account_dim d
LEFT JOIN account_fact AS af ON d.acct_id = af.acct_id
GO
/****** Object:  Table [dbo].[branch_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[branch_dim](
	[branch_id] [smallint] NOT NULL,
	[branch_code] [varchar](5) NOT NULL,
	[branch_desc] [varchar](100) NOT NULL,
	[region_id] [int] NOT NULL,
	[area_id] [int] NOT NULL,
	[branch_lat] [decimal](16, 12) NOT NULL,
	[branch_lon] [decimal](16, 12) NOT NULL,
	[bank_id] [varchar](2) NULL,
 CONSTRAINT [PK_tblbranch_dim] PRIMARY KEY CLUSTERED 
(
	[branch_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[account_dim_branch]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[account_dim_branch]
AS
     SELECT DISTINCT 
            d.acct_id
          , open_date
          , close_date
          , open_close_code
          , loan_amt
          , prod_id
          , d.branch_id
          , branch_code
          , branch_desc
          , region_id
          , area_id
          , branch_lat
          , branch_lon
       FROM account_dim AS d
            LEFT JOIN
            branch_dim AS bd ON d.branch_id = bd.branch_id;
GO
/****** Object:  Table [dbo].[transaction_fact]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_fact](
	[acct_id] [int] NOT NULL,
	[tran_date] [date] NOT NULL,
	[tran_time] [time](7) NOT NULL,
	[tran_type_id] [smallint] NOT NULL,
	[tran_amt] [int] NOT NULL,
	[tran_fee_amt] [decimal](15, 3) NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[tran_id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_tbltransaction_fact] PRIMARY KEY CLUSTERED 
(
	[tran_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[transaction_fact_branch]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[transaction_fact_branch]
AS
     SELECT t.acct_id
          , t.tran_date
          , t.tran_time
          , t.tran_type_id
          , t.tran_amt
          , t.tran_fee_amt
          , t.tran_id
          , bd.branch_code
          , bd.branch_desc
          , bd.region_id
          , bd.area_id
          , bd.branch_lat
          , bd.branch_lon
          , bd.bank_id
          , bd.branch_id
       FROM transaction_fact AS t
            LEFT OUTER JOIN
            branch_dim AS bd ON t.branch_id = bd.branch_id;
GO
/****** Object:  Table [dbo].[transaction_type_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[transaction_type_dim](
	[tran_type_id] [smallint] NOT NULL,
	[tran_type_code] [varchar](5) NOT NULL,
	[tran_type_desc] [varchar](100) NOT NULL,
	[tran_fee_prct] [decimal](4, 3) NOT NULL,
	[cur_cust_req_ind] [varchar](1) NOT NULL,
 CONSTRAINT [PK_tbltransaction_type_dim] PRIMARY KEY CLUSTERED 
(
	[tran_type_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[transaction_fact_transaction_type]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[transaction_fact_transaction_type]
AS
     SELECT tf.acct_id
          , tf.tran_date
          , tf.tran_time
          , tf.tran_amt
          , tf.tran_fee_amt
          , tf.tran_amt + tf.tran_fee_amt AS total_amt
          , tf.branch_id
          , tf.tran_id
          , ttd.tran_type_id
          , ttd.tran_type_code
          , ttd.tran_type_desc
          , ttd.tran_fee_prct
          , ttd.cur_cust_req_ind
       FROM transaction_fact AS tf
            LEFT OUTER JOIN
            transaction_type_dim AS ttd ON tf.tran_type_id = ttd.tran_type_id;
GO
/****** Object:  View [dbo].[cust_rel_add]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[cust_rel_add]
AS
     SELECT DISTINCT 
            dbo.stg_p1.cust_id
          , dbo.stg_p1.cust_rel_id
          , dbo.stg_p1.cust_add_lat
          , dbo.stg_p1.cust_add_lon
       FROM dbo.stg_p1;
GO
/****** Object:  View [dbo].[prod_date]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[prod_date]
AS
     SELECT prod_id
          , open_date
       FROM dbo.stg_p1 AS sp
      WHERE YEAR(sp.open_date) = 2016
            OR YEAR(sp.open_date) = 2017
            OR YEAR(sp.open_date) = 2018;
GO
/****** Object:  Table [dbo].[bank_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[bank_dim](
	[bank_id] [varchar](2) NOT NULL,
	[bank_name] [varchar](50) NULL,
 CONSTRAINT [PK_tblbank_dim] PRIMARY KEY CLUSTERED 
(
	[bank_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_account_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_account_dim](
	[cust_id] [smallint] NOT NULL,
	[acct_id] [int] NOT NULL,
	[acct_cust_role_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblcustomer_account_dim] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC,
	[acct_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_address_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_address_dim](
	[cust_add_id] [int] NOT NULL,
	[cust_id] [smallint] NOT NULL,
	[branch_id] [smallint] NOT NULL,
	[cust_branch_dist] [decimal](7, 2) NOT NULL,
	[cust_lat] [decimal](16, 12) NOT NULL,
	[cust_lon] [decimal](16, 12) NOT NULL,
	[cust_add_type] [varchar](1) NOT NULL,
 CONSTRAINT [PK_tblcustomer_address_dim] PRIMARY KEY CLUSTERED 
(
	[cust_add_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_dim](
	[cust_id] [smallint] NOT NULL,
	[last_name] [varchar](100) NOT NULL,
	[first_name] [varchar](100) NOT NULL,
	[gender] [varchar](1) NOT NULL,
	[birth_date] [date] NOT NULL,
	[cust_since_date] [date] NOT NULL,
 CONSTRAINT [PK_tblcustomer_dim] PRIMARY KEY CLUSTERED 
(
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customer_relationship_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer_relationship_dim](
	[cust_rel_id] [smallint] NOT NULL,
	[cust_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblcustomer_relationship_dim] PRIMARY KEY CLUSTERED 
(
	[cust_rel_id] ASC,
	[cust_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_dim]    Script Date: 7/18/2020 5:22:56 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_dim](
	[prod_id] [smallint] NOT NULL,
 CONSTRAINT [PK_tblproduct_dim] PRIMARY KEY CLUSTERED 
(
	[prod_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[account_dim]  WITH CHECK ADD  CONSTRAINT [FK__tblaccount_dim_tblbranch_dim] FOREIGN KEY([branch_id])
REFERENCES [dbo].[branch_dim] ([branch_id])
GO
ALTER TABLE [dbo].[account_dim] CHECK CONSTRAINT [FK__tblaccount_dim_tblbranch_dim]
GO
ALTER TABLE [dbo].[account_dim]  WITH CHECK ADD  CONSTRAINT [FK__tblaccount_dim_tblproduct_dim] FOREIGN KEY([prod_id])
REFERENCES [dbo].[product_dim] ([prod_id])
GO
ALTER TABLE [dbo].[account_dim] CHECK CONSTRAINT [FK__tblaccount_dim_tblproduct_dim]
GO
ALTER TABLE [dbo].[account_fact]  WITH CHECK ADD  CONSTRAINT [FK_tblaccount_fact_tblaccount_dim] FOREIGN KEY([acct_id])
REFERENCES [dbo].[account_dim] ([acct_id])
GO
ALTER TABLE [dbo].[account_fact] CHECK CONSTRAINT [FK_tblaccount_fact_tblaccount_dim]
GO
ALTER TABLE [dbo].[account_fact]  WITH CHECK ADD  CONSTRAINT [FK_tblaccount_fact_tblcustomer_dim] FOREIGN KEY([cust_id])
REFERENCES [dbo].[customer_dim] ([cust_id])
GO
ALTER TABLE [dbo].[account_fact] CHECK CONSTRAINT [FK_tblaccount_fact_tblcustomer_dim]
GO
ALTER TABLE [dbo].[branch_dim]  WITH CHECK ADD  CONSTRAINT [FK_tblbranch_dim_tblbank_dim] FOREIGN KEY([bank_id])
REFERENCES [dbo].[bank_dim] ([bank_id])
GO
ALTER TABLE [dbo].[branch_dim] CHECK CONSTRAINT [FK_tblbranch_dim_tblbank_dim]
GO
ALTER TABLE [dbo].[customer_account_dim]  WITH CHECK ADD  CONSTRAINT [FK_tblcustomer_account_dim_tblaccount_dim] FOREIGN KEY([acct_id])
REFERENCES [dbo].[account_dim] ([acct_id])
GO
ALTER TABLE [dbo].[customer_account_dim] CHECK CONSTRAINT [FK_tblcustomer_account_dim_tblaccount_dim]
GO
ALTER TABLE [dbo].[customer_account_dim]  WITH CHECK ADD  CONSTRAINT [FK_tblcustomer_account_dim_tblcustomer_dim] FOREIGN KEY([cust_id])
REFERENCES [dbo].[customer_dim] ([cust_id])
GO
ALTER TABLE [dbo].[customer_account_dim] CHECK CONSTRAINT [FK_tblcustomer_account_dim_tblcustomer_dim]
GO
ALTER TABLE [dbo].[customer_address_dim]  WITH CHECK ADD  CONSTRAINT [FK_tblcustomer_address_dim_tblbranch_dim] FOREIGN KEY([branch_id])
REFERENCES [dbo].[branch_dim] ([branch_id])
GO
ALTER TABLE [dbo].[customer_address_dim] CHECK CONSTRAINT [FK_tblcustomer_address_dim_tblbranch_dim]
GO
ALTER TABLE [dbo].[customer_address_dim]  WITH CHECK ADD  CONSTRAINT [FK_tblcustomer_address_dim_tblcustomer_dim] FOREIGN KEY([cust_id])
REFERENCES [dbo].[customer_dim] ([cust_id])
GO
ALTER TABLE [dbo].[customer_address_dim] CHECK CONSTRAINT [FK_tblcustomer_address_dim_tblcustomer_dim]
GO
ALTER TABLE [dbo].[customer_relationship_dim]  WITH CHECK ADD  CONSTRAINT [FK_tblcustomer_relationship_dim_tblcustomer_dim] FOREIGN KEY([cust_id])
REFERENCES [dbo].[customer_dim] ([cust_id])
GO
ALTER TABLE [dbo].[customer_relationship_dim] CHECK CONSTRAINT [FK_tblcustomer_relationship_dim_tblcustomer_dim]
GO
ALTER TABLE [dbo].[transaction_fact]  WITH CHECK ADD  CONSTRAINT [FK__tbltransaction_fact_tblbranch_dim] FOREIGN KEY([branch_id])
REFERENCES [dbo].[branch_dim] ([branch_id])
GO
ALTER TABLE [dbo].[transaction_fact] CHECK CONSTRAINT [FK__tbltransaction_fact_tblbranch_dim]
GO
ALTER TABLE [dbo].[transaction_fact]  WITH CHECK ADD  CONSTRAINT [FK__tbltransaction_fact_tbltransaction_type_dim] FOREIGN KEY([tran_type_id])
REFERENCES [dbo].[transaction_type_dim] ([tran_type_id])
GO
ALTER TABLE [dbo].[transaction_fact] CHECK CONSTRAINT [FK__tbltransaction_fact_tbltransaction_type_dim]
GO
