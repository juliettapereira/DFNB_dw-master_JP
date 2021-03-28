USE [DFNB3];
GO

/****** Object:  View [dbo].[v_naics_code]    Script Date: 11/17/2019 10:54:42 AM ******/

DROP VIEW etl.v_naics_code;
GO

/****** Object:  View [dbo].[v_naics_code]    Script Date: 11/17/2019 10:54:42 AM ******/

SET ANSI_NULLS ON;
GO

SET QUOTED_IDENTIFIER ON; 
GO


CREATE VIEW etl.v_naics_code
AS


/*****************************************************************************************************************
NAME:    etl.v_naics_code

PURPOSE: Create the etl.v_naics_code view

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     03/27/2021   Julietta P.   1. Built this view for LDS BC IT240
     
RUNTIME: 
Approx. 1 sec

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
******************************************************************************************************************/

     SELECT LEN(nc.[2017_NAICS_US_code]) AS naics_level
          , CASE
                WHEN LEN(nc.[2017_NAICS_US_code]) = 2
                THEN NULL
                ELSE LEFT(nc.[2017_NAICS_US_code], LEN(nc.[2017_NAICS_US_code]) - 1)
            END AS naics_parent_code
          , nc.[2017_NAICS_US_code] AS naics_code
          , nc.[2017_NAICS_US_title] AS naics_desc
       FROM stg.NAICS_CODES_2017 AS nc;

GO