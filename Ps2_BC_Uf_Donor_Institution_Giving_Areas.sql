/****************************************************

	Name: Uf_Donor_Institution_Giving_Areas
	Date: 07/31/2018

****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Donor_Institution_Giving_Areas]()
RETURNS TABLE
AS
RETURN

SELECT Donor_Key 
	, STUFF(	( SELECT  '; ' + Donor_Institution_Giving_Areas 
					FROM 
						(SELECT DISTINCT A.Donor_Key
							, B.New_Inst AS Donor_Institution_Giving_Areas
							FROM _Donation_Fact A
								INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key						
						) A
					WHERE A.Donor_Key = B.Donor_Key FOR XML PATH('')
				),1 ,2 , ''
			)  Donor_Institution_Giving_Areas
	FROM 
		(SELECT DISTINCT Donor_Key
			FROM _Donation_Fact
		) B
	WHERE 1 = 1
		AND Donor_Key IS NOT NULL
	GROUP BY Donor_Key 