/****************************************************

	Name: Uf_Byuh_Degrees
	Date: 07/18/2018

****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Byuh_Degrees]()
RETURNS TABLE
AS
RETURN

SELECT DISTINCT ContactId AS Donor_Key
	, CONVERT(NVARCHAR(4000),Z.BYUH_Degrees) AS BYUH_Degrees
	FROM  
		(SELECT ContactId 
			, STUFF(( SELECT  ' \\ ' + BYUH_Degrees 
					FROM 
						(SELECT DISTINCT ContactId
							, COALESCE(New_University,' ') + ' ' + COALESCE(Plus_AlumniStatus,' ') + ' | ' + RTRIM(COALESCE(CONVERT(NVARCHAR(50),Plus_ActualGraduationDate,1),' ')) + ' | ' + COALESCE(New_DegreeCode,' ') + ' | ' + COALESCE(Program,' ') AS BYUH_Degrees
							FROM _Alumni_Dim
							WHERE 1 = 1
								AND New_University = 'BYUH'
						) A
					WHERE B.ContactId = A.ContactId FOR XML PATH('')),1 ,4, ''
					)  BYUH_Degrees
			FROM 
				(SELECT DISTINCT ContactId
					FROM _Alumni_Dim)  B
			WHERE 1 = 1
				AND ContactId IS NOT NULL
			GROUP BY ContactId
		) Z