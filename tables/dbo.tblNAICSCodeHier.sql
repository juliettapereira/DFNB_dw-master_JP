/*****************************************************************************************************************
NAME:    dbo.tblNAICSCodeHier
PURPOSE: Create the dbo.tblNAICSCodeHier table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/12/2019   JJAUSSI       1. Built this table for LDS BC IT240
1.1     03/27/2021   Julietta P.   1. Added PK and NOT NULL constraints



RUNTIME: 

NOTES:
NAICS Code Hierarchy


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/



USE [DFNB3];
GO
DROP TABLE dbo.tblNAICSCodeHier;
GO
CREATE TABLE dbo.tblNAICSCodeHier
(industry_sector_code     FLOAT NOT NULL
, industry_sector_desc     NVARCHAR(500) NOT NULL
, industry_sub_sector_code FLOAT NOT NULL
, industry_sub_sector_desc NVARCHAR(500) NOT NULL
, industry_group_code      FLOAT NOT NULL
, industry_group_desc      NVARCHAR(500) NOT NULL
, industry_code            FLOAT NOT NULL
, industry_desc            NVARCHAR(500) NOT NULL
, nation_industry_code     FLOAT NOT NULL
, nation_industry_desc     NVARCHAR(500) NOT NULL
, CONSTRAINT PK_tb1NAICSCodeHier PRIMARY KEY CLUSTERED(nation_industry_code ASC)
);