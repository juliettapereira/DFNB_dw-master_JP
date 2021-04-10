/*****************************************************************************************************************
NAME:    stg.PRODUCT_PROFILES
PURPOSE: Create the Product Profiles table

SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       04/09/2021   Julietta P.  1. Created script

RUNTIME: 
1 sec

NOTES: 

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/


USE [DFNB3]
GO

DROP TABLE [stg].[PRODUCT_PROFILES];


CREATE TABLE [stg].[PRODUCT_PROFILES](
	[prod_id] [smallint] NOT NULL,
	[prod_code] [varchar](10) NOT NULL,
	[prod_desc] [varchar](50) NOT NULL,
	[revolve_ind] [varchar](1) NOT NULL,
	[loan_amt_lmt] [numeric](20, 4) NOT NULL
);


