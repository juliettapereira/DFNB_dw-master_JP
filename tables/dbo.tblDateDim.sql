/*****************************************************************************************************************
NAME:    dbo.tblDateDim
PURPOSE: Create the Date Dimension table

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
The Date Dimension - inspired by the Kimball Group's Calendar Date Dimension

LICENSE: 
This code is covered by the GNU General Public License which guarantees end users
the freedom to run, study, share, and modify the code. This license grants the recipients
of the code the rights of the Free Software Definition. All derivative work can only be
distributed under the same license terms.

******************************************************************************************************************/

CREATE TABLE dbo.DateDim
(date_id                    INT NOT NULL
, day_date                   [DATE] NOT NULL
, day_number_in_week         TINYINT NOT NULL
, day_number_in_month        TINYINT NOT NULL
, day_number_in_year         SMALLINT NOT NULL
, day_name                   VARCHAR(10) NOT NULL
, day_abbreviation           CHAR(3) NOT NULL
, process_day_ind            BIT NOT NULL
, week_number_in_year        TINYINT NOT NULL
, week_start_date            [DATE] NOT NULL
, week_start_date_id         INT NOT NULL
, week_end_date              [DATE] NOT NULL
, week_end_date_id           INT NULL
, weekday_flag               BIT NULL
, weekend_flag               BIT NULL
, last_day_in_week_flag      BIT NULL
, month_number               TINYINT NULL
, month_name                 VARCHAR(10) NULL
, month_abbreviation         CHAR(3) NULL
, month_last_day_number      TINYINT NULL
, month_start_date           [DATE] NULL
, month_start_date_id        INT NULL
, month_end_date             [DATE] NULL
, month_end_date_id          INT NULL
, month_end_date_previous    [DATE] NULL
, month_end_date_previous_id INT NULL
, last_day_in_month_flag     BIT NULL
, quarter_number             TINYINT NULL
, quarter_name               CHAR(6) NULL
, quarter_code               CHAR(2) NULL
, quarter_start_date         [DATE] NULL
, quarter_start_date_id      INT NULL
, quarter_end_date           [DATE] NULL
, quarter_end_date_id        INT NULL
, last_day_in_quarter_flag   BIT NULL
, year_number                SMALLINT NULL
, year_start_date            [DATE] NULL
, year_start_date_id         INT NULL
, year_end_date              [DATE] NULL
, year_end_date_id           INT NULL
, yyyymm                     INT NULL
, last_day_in_year_flag      BIT NULL
, holiday_ind                BIT NULL -- Challenge field
, holiday_name               VARCHAR(50) NULL -- Challenge field
, CONSTRAINT PK_DateDim PRIMARY KEY CLUSTERED(date_id ASC)
  WITH(PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)
ON [PRIMARY];
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Integer based Primary Key for Date Dimension'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Date Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Date value for the date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Day Date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Saturday is the 7th and Sunday is the 1st day of the week'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_number_in_week';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Day Number In Week'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_number_in_week';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_number_in_week';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Day number in the month for the date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_number_in_month';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Day Number In Month'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_number_in_month';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_number_in_month';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Values between 1 and 365 (leap year 366)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_number_in_year';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Day Number In Year'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_number_in_year';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_number_in_year';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Unabbreviated version of the week day name'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Day Name'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Three character version of the week day name'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_abbreviation';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Day Abbreviation'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_abbreviation';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'day_abbreviation';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Indicates if processes in ZAE are run on this date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'process_day_ind';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Process Day Ind'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'process_day_ind';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'process_day_ind';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Week number in year'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_number_in_year';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Week Number In Year'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_number_in_year';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_number_in_year';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Indicates the Sunday date that begins the week (date version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Week Start Date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Indicates the Sunday date that begins the week (ID version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Week Start Date Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Indicates the Saturday date that ends the week (date version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Week End Date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Indicates the Saturday date that ends the week (ID version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Week End Date Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'week_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'0 for Saturday and Sunday'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'weekday_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Weekday Flag'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'weekday_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'weekday_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'1 for Saturday and Sunday'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'weekend_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Weekend Flag'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'weekend_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'weekend_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'1 for Saturdays'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_week_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Last Day In Week Flag'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_week_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_week_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Month number portion of the date valued 1 to 12'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Month Number'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Unabbreviated version of the month name for the date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Month Name'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Three character version of the month name for the date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_abbreviation';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Month Abbreviation'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_abbreviation';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_abbreviation';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Numeric last day of the month for the date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_last_day_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Month Last Day Number'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_last_day_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_last_day_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'First day of the month in which the date occurs (date version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Month Start Date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'First day of the month in which the date occurs (ID version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Month Start Date Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Last day of the month in which the date occurs (date version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Month End Date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Last day of the month in which the date occurs (ID version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Month End Date Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Last day of the prior month in which the date occurs (date version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date_previous';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Month End Date Previous'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date_previous';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date_previous';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Last day of the prior month in which the date occurs (ID version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date_previous_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Month End Date Previous Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date_previous_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'month_end_date_previous_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'1 when the date is the last day of the month'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_month_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Last Day In Month Flag'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_month_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_month_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Numeric version of the quarter in which the date occurs (numbered 1 to 4)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Quarter Number'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Full English version of the quarter in which the date occurs (First, Second, Third, Fourth)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Quarter Name'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Abbreviated version of the quarter in which the date occurs (valued Q1, Q2, Q3, Q4)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_code';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Quarter Code'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_code';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_code';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'First day of the quarter in which the day occurs (date version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Quarter Start Date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'First day of the quarter in which the day occurs (ID version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Quarter Start Date Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Last day of the quarter in which the day occurs (date version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Quarter End Date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Last day of the quarter in which the day occurs (ID version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Quarter End Date Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'quarter_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'1 when the date is the last day in the quarter'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_quarter_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Last Day In Quarter Flag'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_quarter_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_quarter_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'The year number for the date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Year Number'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_number';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'First day of the year for the date (date version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Year Start Date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_start_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'First day of the year for the date (ID version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Year Start Date Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_start_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Last day of the year for the date (date version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Year End Date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_end_date';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Last day of the year for the date (ID version)'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Year End Date Id'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'year_end_date_id';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'YYYYMM version of the date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'yyyymm';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'YYYYMM'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'yyyymm';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'yyyymm';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'1 when the date is the last day of the year'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_year_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Last Day In Year Flag'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_year_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'last_day_in_year_flag';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'1 when the date is a holiday'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'holiday_ind';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Holiday Ind'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'holiday_ind';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'holiday_ind';
GO

EXEC sys.sp_addextendedproperty @name = N'column_description'
                              , @value = N'Full English name of the Holiday for the date'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'holiday_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_eul_name'
                              , @value = N'Holiday Name'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'holiday_name';
GO

EXEC sys.sp_addextendedproperty @name = N'column_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim'
                              , @level2type = N'COLUMN'
                              , @level2name = N'holiday_name';
GO

EXEC sys.sp_addextendedproperty @name = N'table_description'
                              , @value = N'A date themed dimension table that spans a period of 250 years and includes a myriad of date related attributes.'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim';
GO

EXEC sys.sp_addextendedproperty @name = N'table_eul_name'
                              , @value = N'Date Dimension'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim';
GO

EXEC sys.sp_addextendedproperty @name = N'table_source'
                              , @value = N'Derived in ETL'
                              , @level0type = N'SCHEMA'
                              , @level0name = N'dbo'
                              , @level1type = N'TABLE'
                              , @level1name = N'DateDim';
GO