/****************************************************

	Name: Uf_Ldsp_Region
	Date: 08/21/2018

****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Ldsp_Region]()
RETURNS TABLE
AS
RETURN

SELECT Donor_Key
	, Ldsp_Region
	FROM 
		(SELECT ContactId AS Donor_Key
			, ROW_NUMBER() OVER(PARTITION BY ContactId	ORDER BY Address_State_Code) AS Row_Num
			, CASE WHEN Address_State_Code IN ('ME','NH','VT','MA','RI','CT','NJ','DE','MD','WV','VA','NC','SC','GA','FL','AL','MS','LA','AR','TN','KY','IN','OH','PA','NY','MI') THEN 'East'
					WHEN Address_State_Code IN ('ID','MT','WY','CO','ND','SD','NE','KS','OK','MN','IA','MO','WI','IL') THEN 'Central'
					WHEN Address_state_Code IN ('AZ','NM','TX') THEN 'Southwest'
					WHEN Address_state_Code IN ('WA','OR','HI','AK') THEN 'PacificNW'
					WHEN Address_State_Code = 'CA' AND Address_County IN ('San Luis Obispo','Santa Barbara','Kern','Ventura','Los Angeles','Orange','San Diego','Riverside','Imperial','San Bernardino') THEN 'West'
					WHEN Address_State_Code = 'CA' AND Address_County NOT IN ('San Luis Obispo','Santa Barbara','Kern','Ventura','Los Angeles','Orange','San Diego','Riverside','Imperial','San Bernardino') THEN 'PacificNW'
					WHEN Address_State_Code = 'NV' AND Address_County != 'Clark' THEN 'PacificNW'
					WHEN Address_State_Code = 'NV' AND Address_County = 'Clark' THEN 'West'
					WHEN Address_State_Code = 'UT' THEN 'UT'
					ELSE NULL END AS Ldsp_Region
			FROM _Address_Dim
			WHERE 1 = 1
				AND Address_Primary_Yn = 'Y'
				AND ContactId IS NOT NULL
		) A
	WHERE 1 = 1
		AND Row_Num = 1




