/****************************************************

	Name: Uf_Donor_Liaison_Connections
	Date: 06/13/2018

****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Donor_Liaison_Connections]()
RETURNS TABLE
AS
RETURN

SELECT CONVERT(NVARCHAR(100),Donor_Id) AS Donor_Key
	, STUFF(( SELECT  '; (' + LdspId + ') ' + DonorWithCL + ', RL: ' + Relationship + ', CL: ' + RelatedCl
					FROM 
						(
						SELECT A.Record1Id AS Donor_Id
							, ISNULL(D.New_LdspId, E.New_LdspId) AS LdspId
							, ISNULL(D.FullName,E.Name) AS DonorWithCL
							, G.Name AS Relationship
							, F.FullName AS RelatedCl
							FROM Ext_Connection A
								LEFT JOIN Ext_Contact B ON A.Record1Id = B.ContactID AND A.Record1IdObjectTypeCode = 2
								LEFT JOIN Ext_Account C ON A.Record1Id = C.AccountID AND A.Record1IdObjectTypeCode = 1
								LEFT JOIN Ext_Contact D ON A.Record2Id = D.ContactID AND A.Record2IdObjectTypeCode = 2
								LEFT JOIN Ext_Account E ON A.Record2Id = E.AccountID AND A.Record2IdObjectTypeCode = 1
								LEFT JOIN Ext_System_User F ON F.SystemUserId = ISNULL(D.plus_CoordinatingLiaison, E.Plus_CoordinatingLiaison)
								INNER JOIN Ext_Connection_Role  G ON A.Record2RoleId = G.ConnectionRoleId 
							WHERE 1 = 1 
								AND (D.plus_CoordinatingLiaison IS NOT NULL OR E.Plus_CoordinatingLiaison IS NOT NULL)
								AND Record1ID IS NOT NULL
								AND REcord1IdObjectTypeCode IN (1,2)
						) A
					WHERE B.Donor_ID = A.Donor_ID FOR XML PATH('')),1 ,2, ''
			)  Donor_Liaison_Connections
	FROM 
		(
		SELECT A.Record1Id AS Donor_Id
			, ISNULL(D.New_LdspId, E.New_LdspId) AS LdspId
			, ISNULL(D.FullName,E.Name) AS DonorWithCL
			, G.Name AS Relationship
			, F.FullName AS RelatedCl
			FROM Ext_Connection A
				LEFT JOIN Ext_Contact B ON A.Record1Id = B.ContactID AND A.Record1IdObjectTypeCode = 2
				LEFT JOIN Ext_Account C ON A.Record1Id = C.AccountID AND A.Record1IdObjectTypeCode = 1
				LEFT JOIN Ext_Contact D ON A.Record2Id = D.ContactID AND A.Record2IdObjectTypeCode = 2
				LEFT JOIN Ext_Account E ON A.Record2Id = E.AccountID AND A.Record2IdObjectTypeCode = 1
				LEFT JOIN Ext_System_User F ON F.SystemUserId = ISNULL(D.plus_CoordinatingLiaison, E.Plus_CoordinatingLiaison)
				INNER JOIN Ext_Connection_Role  G ON A.Record2RoleId = G.ConnectionRoleId 
			WHERE 1 = 1 
				AND (D.plus_CoordinatingLiaison IS NOT NULL OR E.Plus_CoordinatingLiaison IS NOT NULL)
				AND Record1ID IS NOT NULL
				AND REcord1IdObjectTypeCode IN (1,2)									
		) B
	WHERE 1 = 1
		AND Donor_Id IS NOT NULL
	GROUP BY Donor_Id