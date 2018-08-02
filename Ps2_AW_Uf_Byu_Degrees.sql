/****************************************************

	Name: Uf_Byu_Degrees
	Date: 07/18/2018

****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Byu_Degrees]()
RETURNS TABLE
AS
RETURN

SELECT DISTINCT ContactId AS Donor_Key
	, CONVERT(NVARCHAR(4000),Z.BYU_Degrees) AS BYU_Degrees
	FROM  
		(SELECT ContactId 
			, STUFF(( SELECT  ' \\ ' + BYU_Degrees 
					FROM 
						(SELECT DISTINCT ContactId
							, COALESCE(New_University,' ') + ' ' + COALESCE(Plus_AlumniStatus,' ') + ' | ' + RTRIM(COALESCE(CONVERT(NVARCHAR(50),Plus_ActualGraduationDate,1),' ')) + ' | ' + COALESCE(New_DegreeCode,' ') + ' | ' + COALESCE(Program,' ') AS BYU_Degrees
							FROM _Alumni_Dim
							WHERE 1 = 1
								AND New_University = 'BYU'
						) A
					WHERE B.ContactId = A.ContactId FOR XML PATH('')),1 ,4, ''
					)  BYU_Degrees
			FROM 
				(SELECT DISTINCT ContactId
					FROM _Alumni_Dim)  B
			WHERE 1 = 1
				AND ContactId IS NOT NULL
			GROUP BY ContactId
		) Z 