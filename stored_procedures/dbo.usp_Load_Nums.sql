USE [DFNB3]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Nums]    Script Date: 11/17/2019 10:54:42 AM ******/
DROP PROCEDURE [dbo].[usp_Load_Nums]
GO

/****** Object:  StoredProcedure [dbo].[usp_Load_Nums]    Script Date: 11/17/2019 10:54:42 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [dbo].[usp_Load_Nums] (@v_num as BIGINT)
AS

/*****************************************************************************************************************
NAME:    dbo.usp_Load_Nums
PURPOSE: Create and Load the dbo.Nums table

MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     06/13/2019   JJAUSSI       1. Built this table for LDS BC IT240
1.1     06/20/2019   JJAUSSI       1. Rebuilt table script as stored procedure



RUNTIME: 
Approx. 5 min for 1MM rows

NOTES: 
dbo.Nums is an auxiliary numbers table

Example use cases...
- Parsing a string
- Finding identity gaps
- Generating date ranges (e.g. populating a calendar table, which can also be invaluable)
- Generating time slices
- Generating IP ranges

These links have more details...
https://dba.stackexchange.com/questions/11506/why-are-numbers-tables-invaluable
http://sqlblog.com/blogs/aaron_bertrand/archive/2009/10/07/bad-habits-to-kick-using-a-loop-to-populate-a-table.aspx


LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 

Example usage...

EXEC dbo.usp_Load_Nums 12345;

SELECT n.*
  FROM dbo.Nums as n;
   
******************************************************************************************************************/

    BEGIN

        -- 1) Recreate the table

        -- 1.1) Drop the table

        IF OBJECT_ID('dbo.Nums', 'U') IS NOT NULL
            BEGIN
                DROP TABLE dbo.Nums;
        END;


        -- 1.2) Build the table

        CREATE TABLE dbo.Nums
        (n INT NOT NULL
       , CONSTRAINT PK_Nums PRIMARY KEY CLUSTERED(n ASC)
        )
        ON [PRIMARY];



        -- 2) Reload the table

        DECLARE @n INT;

        SET @n = 1;

        WHILE @n <= @v_num
            BEGIN
                INSERT INTO dbo.Nums(n)
                VALUES
                      (
                       @n
                      );
                SET @n = @n + 1;
            END;

    END;
GO


