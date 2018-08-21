/****************************************************

	Name: _Donor_Pledge_Reminder_Email_Content_Ldsbc_
	Date: 08/16/2018
	
	

****************************************************/


USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION [dbo].[_Donor_Pledge_Reminder_Email_Content_Ldsbc_]()
	RETURNS TABLE
	AS 
	RETURN
	SELECT Donor_Key
		, CONCAT('<table width="100%"> <tr> <th align="left">Date</th> <th align="left">Amount</th> <th align="left">Fund Account</th> </tr> '
					, REPLACE(
						REPLACE(Pledge_Reminder_Html_Text,'&LT;','<') 
								, '&gt;','>')
					, ' </table>'
				)
				AS Donor_Pledge_Reminder_Email_Content_Ldsbc
		FROM
			(SELECT Donor_Key
				, STUFF((SELECT ' <tr> <td>' + New_BeginDate + '</td> <td>' +  New_TotalPledged + '</td> <td>' + New_Name + '</td> </tr> '
							FROM 
								(SELECT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key
									, ROW_NUMBER() OVER (PARTITION BY A.New_ConstituentDonor ORDER BY A.New_BeginDate DESC) AS RowNum
									, CONVERT(NVARCHAR(10),A.New_BeginDate,101) AS New_BeginDate
									, CONVERT(NVARCHAR(20),A.New_TotalPledged) AS New_TotalPledged
									, REPLACE(B.New_Name,'&','and') AS New_Name 
									FROM Ext_Pledge A
										INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId 
										INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
									WHERE 1 = 1 
										AND A.Lds_ExpectancyType = 100000003 --Telefund pledge
										AND A.StatusCode = 1 --Outstanding
										AND DATEADD(DAY,30,A.New_BeginDate) <= GETDATE() --Over 30 days old
										AND DATEADD(DAY,60,A.New_BeginDate) >= GETDATE() --Not 60 days and older
										AND A.New_ConstituentDonor is not null --Get constituent only expectancies
										AND C.New_Inst = 'LDSBC' --Replace with respective institution
								) D
							WHERE D.Donor_Key = E.Donor_Key FOR XML PATH('')),1 ,1, ''
						) Pledge_Reminder_Html_Text
						FROM 
							(SELECT DISTINCT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key 
								FROM Ext_Pledge A
									INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId 
									INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
								WHERE 1 = 1 
									AND A.Lds_ExpectancyType = 100000003 --Telefund pledge
									AND A.StatusCode = 1 --Outstanding
									AND DATEADD(DAY,30,A.New_BeginDate) <= GETDATE() --Over 30 days old
									AND DATEADD(DAY,60,A.New_BeginDate) >= GETDATE() --Not 60 days and older
									AND A.New_ConstituentDonor is not null --Get constituent only expectancies
									AND C.New_Inst = 'LDSBC' --Replace with respective institution
							) E
						WHERE 1 = 1
							AND Donor_Key IS NOT NULL
						GROUP BY Donor_Key
			) A




