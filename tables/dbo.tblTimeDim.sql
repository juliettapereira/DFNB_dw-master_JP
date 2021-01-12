/*****************************************************************************************************************
NAME:    dbo.tblTimeDim
PURPOSE: Create the Time Dimension table

SUPPORT: Jaussi Consulting LLC
         www.jaussiconsulting.net
         jon@jaussiconsulting.net

MODIFICATION LOG:
Ver       Date         Author       Description
-------   ----------   ----------   -----------------------------------------------------------------------------
1.0       11/17/2019   JJAUSSI      1. Built this script for LDS BC IT 243


RUNTIME: 
1 sec

NOTES: 
The Time Dimension - inspired by the Kimball Group's Calendar Date Dimension

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/

CREATE TABLE dbo.TimeDim
(time_id                          INT NOT NULL
, time_value                       [TIME](0) NOT NULL
, time_of_day_segment              VARCHAR(20) NOT NULL
, during_normal_business_hours_ind BIT NOT NULL
, HHMMSS                           CHAR(6) NOT NULL
, CONSTRAINT PK_TimeDim PRIMARY KEY CLUSTERED(time_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Integer based Primary Key for Time Dimension'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'time_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Time Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'time_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'time_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Time value in HH:MM:SS'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'time_value';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Time Value'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'time_value';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'time_value';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'An arbitrary time of day segmentation based on American custom'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'time_of_day_segment';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Time Of Day Segment'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'time_of_day_segment';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'time_of_day_segment';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'1 when the time is between 9 AM and 5 PM'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'during_normal_business_hours_ind';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'During Normal Business Hours Ind'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'during_normal_business_hours_ind';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'during_normal_business_hours_ind';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'The HHMMSS formatted version of the time value'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'HHMMSS';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'HHMMSS'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'HHMMSS';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'HHMMSS';
GO

EXEC sys.sp_addextendedproperty @name = N'table_description'
                              , @value = N'A time themed dimension table that contains one record for every second during a 24 hour period.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim';
GO

EXEC sys.sp_addextendedproperty @name = N'table_eul_name'
                              , @value = N'Time Dimension'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim';
GO

EXEC sys.sp_addextendedproperty @name = N'table_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'TimeDim';
GO