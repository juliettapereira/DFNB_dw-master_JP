/*****************************************************************************************************************
NAME:    stg.ORG_HIER
PURPOSE: Create the Organization Hierarchy table

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

DROP TABLE [stg].[ORG_HIER];


CREATE TABLE [stg].[ORG_HIER](
	[branch_id] [smallint] NOT NULL,
	[branch_code] [varchar](5) NOT NULL,
	[branch_desc] [varchar](25) NOT NULL,
	[region_id] [smallint] NOT NULL,
	[region_desc] [varchar](25) NOT NULL,
	[area_id] [smallint] NOT NULL,
	[area_desc] [varchar](25) NOT NULL
);




