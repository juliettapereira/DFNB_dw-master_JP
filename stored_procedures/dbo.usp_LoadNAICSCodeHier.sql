USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadNAICSCodeHier]    Script Date: 11/17/2019 10:54:42 AM ******/
DROP PROCEDURE [dbo].[usp_LoadNAICSCodeHier]
GO

/****** Object:  StoredProcedure [dbo].[usp_LoadNAICSCodeHier]    Script Date: 11/17/2019 10:54:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_LoadNAICSCodeHier] 
AS

/*****************************************************************************************************************
NAME:    dbo.usp_LoadNAICSCodeHier
PURPOSE: Load the NAICS Code Hierarchy
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     03/27/2021   Julietta P.   1. Built this table for LDS BC IT240
     
RUNTIME: 
Approx. 1 sec

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
******************************************************************************************************************/

BEGIN

        -- 1) Truncate existing data

        Truncate TABLE dbo.tblNAICSCodeHier;


        -- 2) Reload the table

        INSERT INTO dbo.tblNAICSCodeHier
        SELECT v.*
        	FROM etl.v_naics_code_hier_load as v 

     END;