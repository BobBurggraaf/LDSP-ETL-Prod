/****************************************************

	Name: Uf_Activity_Attendees
	Date: 06/06/2018
	
	This function is used to get a list of attendees

****************************************************/

USE [LDSPhilanthropiesDW]
GO
/****** Object:  UserDefinedFunction [dbo].[Uf_Activity_Attendees]    Script Date: 6/6/2018 1:10:08 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Activity_Attendees]()
RETURNS TABLE
AS
RETURN

SELECT ActivityId
	, STUFF(( SELECT  ' | ' + Attendees 
				FROM 
					(SELECT DISTINCT A.ActivityId
						, COALESCE(C.FullName,D.Name) + ': (' + COALESCE(RTRIM(CONVERT(NVARCHAR(50),COALESCE(C.New_LdspId,D.New_LdspId))),' ') + ') ' AS Attendees
						FROM Ext_Activity A -- People 
							LEFT JOIN Ext_Activity_Pointer B ON A.ActivityId = B.ActivityId  -- Activities 
							LEFT JOIN Ext_Contact C ON A.PartyId = C.ContactId
							LEFT JOIN Ext_Account D ON A.PartyId = D.AccountId
					) A
				WHERE B.ActivityId = A.ActivityId FOR XML PATH('')),1 ,3, ''
	)  Attendees
	FROM 
		(SELECT DISTINCT ActivityId
			FROM Ext_Activity
			WHERE 1 = 1
				AND ParticipationTypeMask IN (5,6))  B
	WHERE 1 = 1
		AND ActivityId IS NOT NULL
	GROUP BY ActivityId

