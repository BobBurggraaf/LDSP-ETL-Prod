/****************************************************

	Name: Uf_Recognition_Credit_Recipients
	Date: 06/13/2018
	
****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Recognition_Credit_Recipients]()
RETURNS TABLE
AS
RETURN

SELECT New_RelatedGift 
	, STUFF(( SELECT  ' ; ' + Recognition_Credit_Recipients 
					FROM 
						(SELECT DISTINCT New_RelatedGift
							, '(' + COALESCE(New_LdspId,' ') + ') ' + COALESCE(FullName,' ') + ' ' + RTRIM(COALESCE(Plus_SharedCreditType,' ')) + ' ' + RTRIM(COALESCE(New_CreditAmount,' ')) AS Recognition_Credit_Recipients
							FROM _Soft_Credit
						) A
					WHERE B.New_RelatedGift = A.New_RelatedGift FOR XML PATH('')),1 ,2, ''
			)  Recognition_Credit_Recipients
	FROM _Soft_Credit  B
	WHERE 1 = 1
		AND New_RelatedGift IS NOT NULL
	GROUP BY New_RelatedGift, New_LdspId, FullName, Plus_SharedCreditType, New_CreditAmount