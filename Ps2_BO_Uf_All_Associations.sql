/****************************************************

	Name: Uf_All_Associations
	Date: 09/18/2018

****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_All_Associations]()
RETURNS TABLE
AS
RETURN

SELECT DISTINCT ContactId AS Donor_Key
	, STUFF(( SELECT  ' \\ ' + All_Association_Memberships 
					FROM _All_Association_Memberships_ B
					WHERE B.ContactId = A.ContactId
					ORDER BY Order_Number 
						FOR XML PATH('')),1 ,3, ''
			) All_Association_Memberships
	FROM (SELECT DISTINCT ContactId
					FROM _Association_Dim
					WHERE 1 = 1
						AND ContactId IS NOT NULL
			) A
	WHERE 1 = 1
		AND ContactId IS NOT NULL