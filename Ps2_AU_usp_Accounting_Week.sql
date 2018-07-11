/*************************************************************
	NAME: usp_Accounting_Week 

	DATE: 7/6/2018

**************************************************************/


USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[usp_Accounting_Week]


AS

BEGIN

	IF OBJECT_ID('_Accounting_Week','U') IS NOT NULL
	DROP TABLE _Accounting_Week;

	CREATE TABLE _Accounting_Week (
		Accounting_Week_Key INT IDENTITY(10000, 1)
		, Accounting_Week_Date DATE
		, Accounting_Week_Number INT
		, Accounting_Week_Day_Of_Week INT
		, Accounting_Week_Number_Date DATE -- Friday
		, Accounting_Week_Last_Week_Yn NVARCHAR(1) -- Number week prior to this week (last week)
		, Accounting_Week_Last_Week_Minus_1_Yn NVARCHAR(1) -- Number week prior to last week (last week - 1)
		, Accounting_Week_Current_Week_Number_Last_Year_Yn NVARCHAR(1)
	)
			
	
	-- --------------------------
	-- Insert Date, Week Number, and Week Day into _Accounting_Week Table
	-- --------------------------
	DECLARE @StartDate DATE = '20000101', @NumberOfYears INT = 30;
	SET DATEFIRST 7;
	SET DATEFORMAT mdy;
	SET LANGUAGE US_ENGLISH;
	DECLARE @CutoffDate DATE = DATEADD(YEAR, @NumberOfYears, @StartDate);

	INSERT INTO _Accounting_Week (
		Accounting_Week_Date
		, Accounting_Week_Number
		, Accounting_Week_Day_Of_Week
	)
	SELECT d AS Accounting_Week_Date
		, DATEPART(WEEK, d) AS Accounting_Week_Number
		, DATEPART(WEEKDAY, d) AS Accounting_Week_Day_Of_Week
	FROM
	(
	  SELECT d = DATEADD(DAY, rn - 1, @StartDate)
	  FROM 
	  (
		SELECT TOP (DATEDIFF(DAY, @StartDate, @CutoffDate)) 
		  rn = ROW_NUMBER() OVER (ORDER BY s1.[object_id])
		FROM sys.all_objects AS s1
		CROSS JOIN sys.all_objects AS s2
		-- on my system this would support > 5 million days
		ORDER BY s1.[object_id]
	  ) AS x
	) AS y;
	-- --------------------------
	-- Insert Accounting_Week_Number_Date
	-- --------------------------
	MERGE INTO _Accounting_Week T
		USING (
			SELECT A.Accounting_Week_Key
				, B.Accounting_Week_Date
				FROM _Accounting_Week A
					LEFT JOIN
						(SELECT Accounting_Week_Number
							, Accounting_Week_Date
							, YEAR(Accounting_Week_Date) AS Accounting_Week_Year
							FROM _Accounting_Week
							WHERE 1 = 1
								AND Accounting_Week_Day_Of_Week = 6
						) B ON A.Accounting_Week_Number = B.Accounting_Week_Number
								AND YEAR(A.Accounting_Week_Date) = B.Accounting_Week_Year
			) S ON T.Accounting_Week_Key = S.Accounting_Week_Key
		WHEN MATCHED THEN 
			UPDATE
				SET T.Accounting_Week_Number_Date = S.Accounting_Week_Date
				;
	-- --------------------------
	-- Insert Accounting_Week_Last_Week_Yn
	-- --------------------------								
	MERGE INTO _Accounting_Week T
		USING (
			SELECT *
				FROM _Accounting_Week
				WHERE 1 = 1
					AND Accounting_Week_Number_Date IN
						(SELECT Accounting_Week_Number_Date
							FROM _Accounting_Week
							WHERE 1 = 1
								AND Accounting_Week_Date = CONVERT(DATE,GETDATE() - 7,101)
						)
			) S ON T.Accounting_Week_Key = S.Accounting_Week_Key
		WHEN MATCHED THEN 
			UPDATE
				SET T.Accounting_Week_Last_Week_Yn = 'Y'
				;	
	-- --------------------------
	-- Insert Accounting_Week_Last_Week_Minus_1_Yn
	-- --------------------------
	MERGE INTO _Accounting_Week T
		USING (
			SELECT *
				FROM _Accounting_Week
				WHERE 1 = 1
					AND Accounting_Week_Number_Date IN
						(SELECT Accounting_Week_Number_Date
							FROM _Accounting_Week
							WHERE 1 = 1
								AND Accounting_Week_Date = CONVERT(DATE,GETDATE() - 14,101)
						)
			) S ON T.Accounting_Week_Key = S.Accounting_Week_Key
		WHEN MATCHED THEN 
			UPDATE
				SET T.Accounting_Week_Last_Week_Minus_1_Yn = 'Y'
				;				
	-- --------------------------
	-- Insert Accounting_Week_Current_Week_Number_Last_Year_Yn
	-- --------------------------								
	MERGE INTO _Accounting_Week T
		USING (
			SELECT *
				FROM _Accounting_Week
				WHERE 1 = 1
					AND Accounting_Week_Number_Date IN
						(SELECT Accounting_Week_Number_Date
							FROM _Accounting_Week
							WHERE 1 = 1
								AND Accounting_Week_Date = CONVERT(DATE,GETDATE() - 365,101)
						)
			) S ON T.Accounting_Week_Key = S.Accounting_Week_Key
		WHEN MATCHED THEN 
			UPDATE
				SET T.Accounting_Week_Current_Week_Number_Last_Year_Yn = 'Y'
				;
	
END