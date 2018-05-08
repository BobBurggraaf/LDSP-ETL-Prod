USE [LDSPhilanthropiesDW]
GO

/****** Object:  StoredProcedure [dbo].[usp_Ldsp_Etl_Coupler]    Script Date: 4/24/2018 10:19:07 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE OR ALTER  PROCEDURE [dbo].[usp_Extract_Email] 
AS
BEGIN

-- -------------------------------------------
-- EMAIL
-- -------------------------------------------


DECLARE @Email_Step1_Error_Cnt INT
DECLARE @Email_Body VARCHAR(MAX)
 
SELECT @Email_Step1_Error_Cnt = (SELECT COUNT(Alpha_Result) FROM LDSPhilanthropiesDW.Oa_Extract.Alpha_Table_1 WHERE Alpha_Result = '0'); 


SET @Email_Body = '*PROD* LDSP Extract completed with ' + CONVERT(VARCHAR(12),@Email_Step1_Error_Cnt) + ' errors.'


CREATE TABLE #Ext_Summary (
		[Production Table] NVARCHAR(100)
		, Duration INT
		, [Count] INT
		, [Time] NVARCHAR(15)
		, Message NVARCHAR(1000)
		, [Timestamp] DATETIME
	)
	
	INSERT INTO #Ext_Summary
	SELECT [Production Table]
		, Duration
		, [Count]
		, [Time]
		, Message
		, [Timestamp]
		FROM 
			(SELECT CONCAT('Source: ',A.Source_Table) AS [Production Table]
				, B.Alpha_Duration_In_Seconds AS Duration
				, B.Alpha_Count AS [Count]
				, LEFT(RIGHT(CONVERT(VARCHAR,B.Alpha_DateTime,9),14),8) + ' ' + RIGHT(CONVERT(VARCHAR,B.Alpha_DateTime,9),2) AS [Time]
				, CASE WHEN B.ErrorMessage = ' ' THEN A.Coupler_Stage ELSE B.ErrorMessage END AS Message
				, B.Alpha_End_Time AS [Timestamp] 
				FROM Oa_Extract.Extract_Tables A
					INNER JOIN Oa_Extract.Alpha_Table_1 B ON SUBSTRING(A.Source_Table, CHARINDEX('.',A.Source_Table) + 1,100) = SUBSTRING(B.Alpha_Stage, CHARINDEX('.',B.Alpha_Stage) + 1,100) 
				WHERE 1 = 1
					AND A.Source_Table != ' '
					AND (B.Alpha_Step_Name = 'Stats'
							OR B.Alpha_Result = 0)
			UNION 
			SELECT CONCAT('Coupler: ',Source_Table) AS [Production Table]
				, B.Alpha_Duration_In_Seconds AS Duration
				, B.Alpha_Count AS [Count]
				, LEFT(RIGHT(CONVERT(VARCHAR,B.Alpha_DateTime,9),14),8) + ' ' + RIGHT(CONVERT(VARCHAR,B.Alpha_DateTime,9),2) AS [Time]
				, CASE WHEN B.ErrorMessage = ' ' THEN A.Extract_Stage ELSE B.ErrorMessage END AS Message
				, B.Alpha_End_Time AS [Timestamp] 
				FROM Oa_Extract.Extract_Tables A
					INNER JOIN Oa_Extract.Alpha_Table_1 B ON A.Ext_Table = SUBSTRING(B.Alpha_Stage, CHARINDEX('.',B.Alpha_Stage) + 1,100) 
				WHERE 1 = 1
					AND A.Coupler_Stage IS NOT NULL
					AND (B.Alpha_Step_Name = 'Stats'
							OR B.Alpha_Result = 0)
			UNION
			SELECT Ext_Table AS [Production Table]
				, B.Alpha_Duration_In_Seconds AS Duration
				, B.Alpha_Count AS [Count]
				, LEFT(RIGHT(CONVERT(VARCHAR,B.Alpha_DateTime,9),14),8) + ' ' + RIGHT(CONVERT(VARCHAR,B.Alpha_DateTime,9),2) AS [Time]
				, CASE WHEN B.ErrorMessage = ' ' THEN COALESCE(Extract_Stage,Tier_2_Stage,Tier_3_Stage,Tier_4_Stage,Tier_5_Stage,Tier_6_Stage,Tier_7_Stage,Tier_8_Stage,Tier_9_Stage) ELSE B.ErrorMessage END AS Message
				, B.Alpha_End_Time AS [Timestamp]
				FROM Oa_Extract.Extract_Tables A
					INNER JOIN Oa_Extract.Alpha_Table_1 B ON A.Ext_Table = SUBSTRING(B.Alpha_Stage, CHARINDEX('.',B.Alpha_Stage) + 1,100) 
					WHERE 1 = 1
						AND Source_Table = ' '

						AND (B.Alpha_Step_Name = 'Stats'
							OR B.Alpha_Result = 0)
			) A
	
	DECLARE @xml NVARCHAR(MAX)
	DECLARE @body NVARCHAR(MAX)
	
	SET @xml = CAST((SELECT [Production Table] AS 'td','', Duration AS 'td','', [Count] AS 'td','', [Time] AS 'td','', Message AS 'td' FROM #Ext_Summary ORDER BY [Timestamp] DESC
		FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))
	
	SET @body ='<html><body><H3> ' + @Email_Body + '</H3>
		<table border = 1> 
		<tr>
		<th> Production Table </th> <th> Duration </th> <th> Count </th> <th> Time </th> <th> Message </th> </tr>'    
		 
	SET @body = @body + @xml +'</table></body></html>'
	

	EXEC msdb.dbo.sp_send_dbmail
	@recipients = 'fams@LDSChurch.org' 
	, @subject = '*PROD* LDSP Extract Completed'  -->>>>>> EMAIL SUBJECT <<<<<<<--
	, @body = @body
	, @body_format = 'HTML'
	, @query = 'SELECT TOP 2500 * FROM LDSPhilanthropiesDW.Oa_Extract.Alpha_Table_1'  -- MAXES OUT MEMORY AND WON'T SEND EMAIL
	, @query_result_header=1
	, @query_no_truncate=1
	, @attach_query_result_as_file=1
	, @query_attachment_filename = 'Alpha Table 1.csv'
	, @query_result_separator = '^'
	
	DROP TABLE #Ext_Summary


END