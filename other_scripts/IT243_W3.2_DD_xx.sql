/*****************************************************************************************************************
NAME:    HowToCreateMS_Description.sql
PURPOSE: How to Create MS_Description
MODIFICATION LOG:
Ver      Date        Author        Description
-----   ----------   -----------   -------------------------------------------------------------------------------
1.0     11/03/2019   JJAUSSI       1. Built this table for LDS BC IT243

RUNTIME: 
Approx. 0 sec

NOTES:

This is an example of how to create a custom propery named MS_Description which is widely used to
document schemas, tables, and fields in SQL Server. Can also be used to document contraints, indexes, 
and defualts. See any table in AdventureWorks for an example.
LICENSE: This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.
 
******************************************************************************************************************/

SELECT t.TABLE_SCHEMA ,t.TABLE_NAME
,'EXEC sys.sp_addextendedproperty @name=N''MS_Description'', 
@value=N''The Position Dimension table.'' , 
@level0type=N''SCHEMA'',@level0name=N''dbo'', 
@level1type=N''TABLE'',@level1name=N''' + t.TABLE_NAME + ''';' 
as sql1
FROM INFORMATION_SCHEMA.TABLES as t
where TABLE_TYPE = 'BASE TABLE'
and TABLE_SCHEMA = 'dbo'
order by TABLE_NAME
;



-- Table
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The Position Dimension table.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPositionDim';

-- Columns
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Primary key for Position records.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPositionDim', @level2type=N'COLUMN',@level2name=N'p_id';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'A one character abbreviation for the Position.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPositionDim', @level2type=N'COLUMN',@level2name=N'p_code';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Full word verbiage of the Position name.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPositionDim', @level2type=N'COLUMN',@level2name=N'p_name';
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'The targeted talent inventory level for this position per team.' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'tblPositionDim', @level2type=N'COLUMN',@level2name=N'p_target';
