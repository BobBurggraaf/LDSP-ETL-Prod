/****************************************************

	Name: Uf_Initiative_Team
	Date: 06/19/2018

****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Initiative_Team]()
RETURNS TABLE
AS
RETURN

SELECT DISTINCT OpportunityID
	, STUFF(( SELECT  '; ' + Initiative_Team + ' (' + Name + ')'
					FROM 
						(SELECT C.OpportunityID
							, COALESCE(B.FullName,E.FullName) AS Initiative_Team
							, D.Name
							FROM Ext_Connection A
								INNER JOIN Ext_System_User B ON A.Record1Id = B.SystemUserId
								INNER JOIN Ext_Opportunity C ON A.Record2Id = C.OpportunityId 
								INNER JOIN Ext_Connection_Role D ON A.Record1RoleId = D.ConnectionRoleId 
								INNER JOIN Ext_System_User E ON C.OwnerId = E.SystemUserId
							WHERE 1 = 1
								AND A.Record2ObjectTypeCode = 3
								AND D.Name IN 
									(
										'Coordinating Liaison'
										, 'Gift Planning Specialist'
										, 'Gift Planning Team'
										, 'Initiative Liaison'
										, 'Institution Leadership'
										, 'Research'
										, 'Senior Management'
										, 'Staff Assistant'
										, 'Subject Matter Expert'
										, 'Supporting Liaison'
									)
						) A
					WHERE B.OpportunityID = A.OpportunityID FOR XML PATH('')),1 ,2, ''
			)  Initiative_Team
	FROM 
		(SELECT C.OpportunityID
			, COALESCE(B.FullName,E.FullName) AS Initiative_Team
			, D.Name
			FROM Ext_Connection A
				INNER JOIN Ext_System_User B ON A.Record1Id = B.SystemUserId
				INNER JOIN Ext_Opportunity C ON A.Record2Id = C.OpportunityId 
				INNER JOIN Ext_Connection_Role D ON A.Record1RoleId = D.ConnectionRoleId 
				INNER JOIN Ext_System_User E ON C.OwnerId = E.SystemUserId
			WHERE 1 = 1
				AND A.Record2ObjectTypeCode = 3
				AND D.Name IN 
					(
						'Coordinating Liaison'
						, 'Gift Planning Specialist'
						, 'Gift Planning Team'
						, 'Initiative Liaison'
						, 'Institution Leadership'
						, 'Research'
						, 'Senior Management'
						, 'Staff Assistant'
						, 'Subject Matter Expert'
						, 'Supporting Liaison'
					)
		) B
	WHERE 1 = 1
		AND OpportunityID IS NOT NULL
	GROUP BY OpportunityID