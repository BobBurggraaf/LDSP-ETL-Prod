/****************************************************

	Name: Uf_Spouse_Education_Summary
	Date: 07/03/2018

****************************************************/



CREATE OR ALTER FUNCTION [dbo].[Uf_Spouse_Education_Summary]()
RETURNS TABLE
AS
RETURN

SELECT DISTINCT ContactId AS Donor_Key
	, STUFF(( SELECT  ' // ' + Spouse_Education_Summary 
					FROM 
						(SELECT DISTINCT ContactId
							, COALESCE(REPLACE(New_University,'&','and'),' ') + ' | ' + COALESCE(Plus_AlumniStatus,' ') + ' | ' + REPLACE(RTRIM(CONVERT(NVARCHAR(10),COALESCE(Plus_PreferredGraduationDate,'1900-01-01'),101)),'01/01/1900',' ') + ' | ' + RTRIM(COALESCE(New_DegreeCode,' ') + ' | ' + RTRIM(COALESCE(REPLACE(Program,'&','and'),' '))) AS Spouse_Education_Summary
							, Order_Number
							FROM _Education_Summary_
						) A
					WHERE B.ContactId = A.ContactId
					ORDER BY Order_Number 
						FOR XML PATH('')),1 ,3, ''
			) Spouse_Education_Summary
	FROM _Education_Summary_ B
	WHERE 1 = 1
		AND ContactId IS NOT NULL
		
		




