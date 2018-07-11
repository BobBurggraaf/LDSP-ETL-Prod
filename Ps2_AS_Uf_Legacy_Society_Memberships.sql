/****************************************************

	Name: Uf_Legacy_Society_Memberships
	Date: 07/02/2018

****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Legacy_Society_Memberships]()
RETURNS TABLE
AS
RETURN

SELECT DISTINCT ContactId AS Donor_Key
	, STUFF(( SELECT  '; ' + Legacy_Society_Memberships 
					FROM 
						(SELECT DISTINCT ContactId
							, COALESCE(Association_Name,' ') AS Legacy_Society_Memberships
							FROM _Association_Dim
							WHERE 1 = 1
								AND Association_Name IN ('BYU Knight Society','LDSBC Fox Society','BYUH Cowley Society','BYU-Idaho Legacy Society')
								AND StatusCode = 'Current'
						) A
					WHERE B.ContactId = A.ContactId FOR XML PATH('')),1 ,2, ''
			)  Legacy_Society_Memberships
	FROM _Association_Dim  B
	WHERE 1 = 1
		AND Association_Name IN ('BYU Knight Society','LDSBC Fox Society','BYUH Cowley Society','BYU-Idaho Legacy Society')
		AND StatusCode = 'Current'




