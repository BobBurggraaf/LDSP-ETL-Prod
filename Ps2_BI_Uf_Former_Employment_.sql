/****************************************************

	Name: _Former_Employment_
	Date: 08/09/2018
	
	

****************************************************/


USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION [dbo].[_Former_Employment_]()
	RETURNS TABLE
	AS 
	RETURN
	SELECT ContactId AS Donor_Key
		, STUFF(( SELECT  ' ; ' + Former_Employment 
					FROM 
						(SELECT DISTINCT ContactId
							, '(' + COALESCE(StatusCode,' ') + ') ' + COALESCE(Organization_Name,Plus_AlternateOrganizationName,Institutional_Hierarchy,' ') + ' | ' + RTRIM(COALESCE(New_Title,' ')) + ' | ' + RTRIM(COALESCE(New_JobCode,' ')) + ' | ' + COALESCE(CONVERT(NVARCHAR(50),New_DateStarted,1),' ') AS Former_Employment
							FROM 
								(SELECT *
									FROM _All_Employment
									WHERE 1 = 1
										AND StatusCode IN ('F','R')
								) A                                                                                                              
						) A
					WHERE B.ContactId = A.ContactId FOR XML PATH('')),1 ,2, ''
				)  Former_Employment
		FROM 
			(SELECT *
				FROM _All_Employment
				WHERE 1 = 1
					AND StatusCode IN ('F','R')
			)  B
		WHERE 1 = 1
			AND ContactId IS NOT NULL
		GROUP BY ContactId