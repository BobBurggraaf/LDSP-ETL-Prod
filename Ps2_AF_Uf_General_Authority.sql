/****************************************************

	Name: Uf_General_Authority
	Date: 06/11/2018
	
	This function is used to convert General_Authority, Emeritus_General_Authority, Mission_President, Temple_President

****************************************************/

USE [LDSPhilanthropiesDW]
GO
/****** Object:  UserDefinedFunction [dbo].[Uf_General_Authority]    Script Date: 6/11/2018 1:11:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION [dbo].[Uf_General_Authority]()
RETURNS TABLE
AS
RETURN

SELECT Donor_Key
	, COALESCE(General_Authority,'N') AS General_Authority
	, COALESCE(Emeritus_General_Authority,'N') AS Emeritus_General_Authority
	, COALESCE(Mission_President,'N') AS Mission_President
	, COALESCE(Temple_President,'N') AS Temple_President
	FROM
		(SELECT CONVERT(NVARCHAR(100),COALESCE(A.ContactId, B.New_InternationalExperiencesAId)) AS Donor_Key
			, MAX(CASE WHEN (A.Psa_Code IN ('1AC03','1AC04') 
							OR (UPPER(B.New_Experience) = 'LDS EXPERIENCE'
								AND UPPER(B.Plus_LdsPosition) IN ('GENERAL AUTHORITY','GENERAL OFFICER','AREA SEVENTY')
								AND(B.New_EndDate IS NULL OR B.New_EndDate > GETDATE())
								AND B.Plus_Emeritus = 'F'
								)
						) THEN 'Y' ELSE 'N' END) AS General_Authority
			, MAX(CASE WHEN (A.Psa_Code = '1AC12' 
							OR (UPPER(B.New_Experience) = 'LDS EXPERIENCE'
									AND UPPER(B.Plus_LdsPosition) IN ('GENERAL AUTHORITY','GENERAL OFFICER','AREA SEVENTY')
									AND(B.New_EndDate IS NULL OR B.New_EndDate > GETDATE())
									AND B.Plus_Emeritus = 'Y'
								)
						) THEN 'Y' ELSE 'N' END) AS Emeritus_General_Authority
			, MAX(CASE WHEN (A.Psa_Code = '1AC06' 
							OR (UPPER(B.New_Experience) = 'LDS EXPERIENCE'
								AND UPPER(B.Plus_LdsPosition) IN ('MISSION PRESIDENT')
								AND(B.New_EndDate IS NULL OR B.New_EndDate > GETDATE())
							)
						) THEN 'Y' ELSE 'N' END) AS Mission_President
			, MAX(CASE WHEN (A.Psa_Code = '1AC16' 
							OR (UPPER(B.New_Experience) = 'LDS EXPERIENCE'
									AND UPPER(B.Plus_LdsPosition) IN ('TEMPLE PRESIDENT')
									AND(B.New_EndDate IS NULL OR B.New_EndDate > GETDATE())
								)
						) THEN 'Y' ELSE 'N' END) AS Temple_President
			FROM Ext_Psa A
			FULL OUTER JOIN Ext_International_Experience B ON A.ContactId = B.New_InternationalExperiencesAId
			GROUP BY CONVERT(NVARCHAR(100),COALESCE(A.ContactId, B.New_InternationalExperiencesAId))
		) A