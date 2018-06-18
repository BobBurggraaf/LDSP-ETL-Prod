/****************************************************

	Name: Uf_Couples_Name2
	Date: 06/12/2018
	


****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Couples_Name2]()
RETURNS TABLE
AS
RETURN

SELECT MAX(CONCAT(Husbands_First_Name,' & ',Wifes_First_Name,' ',Husbands_Last_Name)) AS Couples_Name
	, Wifes_ContactId
	FROM                                                                                                        
		(SELECT CASE WHEN Primary_Gender = 'Male' THEN Primary_ContactId
				ELSE Secondary_ContactId END AS Husbands_ContactId
			, CASE WHEN Primary_Gender = 'Male' THEN Primary_First_Name
				ELSE Secondary_First_Name END AS Husbands_First_Name
			, CASE WHEN Primary_Gender = 'Male' THEN Primary_Last_Name
				ELSE Secondary_Last_Name END AS Husbands_Last_Name
			, CASE WHEN Primary_Gender = 'Male' THEN Primary_LdspId
				ELSE Secondary_LdspId END AS Husbands_LdspId
			, CASE WHEN Primary_Gender = 'Female' THEN Primary_ContactId
				ELSE Secondary_ContactId END AS Wifes_ContactId
			, CASE WHEN Primary_Gender = 'Female' THEN Primary_First_Name
				ELSE Secondary_First_Name END AS Wifes_First_Name
			, CASE WHEN Primary_Gender = 'Female' THEN Primary_Last_Name
				ELSE Secondary_Last_Name END AS Wifes_Last_Name
			, CASE WHEN Primary_Gender = 'Female' THEN Primary_LdspId
				ELSE Secondary_LdspId END AS Wifes_LdspId
			FROM
				(SELECT A.ContactId AS Primary_ContactId
					, COALESCE(A.Plus_PreferredFirstName,A.FirstName) AS Primary_First_Name
					, COALESCE(A.Plus_PreferredLastName,A.LastName) AS Primary_Last_Name
					, D.Column_Label AS Primary_Gender
					, A.New_LdspId AS Primary_LdspId
					, B.Relationship_Name AS Primary_Spouse_Name
					, B.Relationship_LdspId AS Primary_Spouse_LdspId
					FROM Ext_Contact A
						LEFT JOIN _Connection_Dim B ON A.ContactId = B.ContactId
						LEFT JOIN _Donor_Family_Status_ C ON A.FamilyStatusCode = C.Column_Value
						LEFT JOIN _Donor_Gender_ D ON A.GenderCode = D.Column_Value
					WHERE 1 = 1
						AND UPPER(B.Relationship) = 'SPOUSE'
						AND UPPER(C.Column_Label) NOT LIKE '%WIDOW%'
				) A 
				INNER JOIN
				(SELECT A.ContactId AS Secondary_ContactId
					, COALESCE(A.Plus_PreferredFirstName,A.FirstName) AS Secondary_First_Name
					, COALESCE(A.Plus_PreferredLastName,A.LastName) AS Secondary_Last_Name
					, D.Column_Label AS Secondary_Gender
					, A.New_LdspId AS Secondary_LdspId
					, B.Relationship_Name AS Secondary_Spouse_Name
					, B.Relationship_LdspId AS Secondary_Spouse_LdspId
					FROM Ext_Contact A
						LEFT JOIN _Connection_dim B ON A.ContactId = B.ContactId
						LEFT JOIN _Donor_Family_Status_ C ON A.FamilyStatusCode = C.Column_Value
						LEFT JOIN _Donor_Gender_ D ON A.GenderCode = D.Column_Value
					WHERE 1 = 1
						AND UPPER(B.Relationship) = 'SPOUSE'
						AND UPPER(C.Column_Label) NOT LIKE '%WIDOW%'
				) B ON CONVERT(NVARCHAR(15),A.Primary_LdspId) = CONVERT(NVARCHAR(15),B.Secondary_Spouse_LdspId)
		) B
	GROUP BY Wifes_ContactId