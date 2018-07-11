/****************************************************

	Name: Uf_Reporting_Group_Key
	Date: 07/06/2018

****************************************************/

USE [LDSPhilanthropiesDW]
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER FUNCTION [dbo].[Uf_Reporting_Group_Key]()
RETURNS TABLE
AS
RETURN

SELECT A.Donation_Key
	, COALESCE(A.Accounting_Key,'0') AS Accounting_Key
	, CASE WHEN I.New_Inst = 'BYU' THEN 100002
		WHEN I.New_Inst = 'BYUI' THEN 100003
		WHEN I.New_Inst = 'BYUH' THEN 100004
		WHEN I.New_Inst = 'LDSBC' THEN 100005
		WHEN I.New_Inst = 'Church' AND I.Hier_Name IN ('Church - Humanitarian - General','Church - Humanitarian - Benson Institute') THEN 100006
		WHEN I.New_Inst = 'Church' AND I.Hier_Name IN ('Church - Self-Reliance Services') THEN 100007
		WHEN I.New_Inst = 'Church' AND I.Hier_Name IN ('Church - Missionary') THEN 100008
		WHEN I.New_Inst = 'Church' AND I.Hier_Name IN ('Church - FamilySearch','Church - Church History') THEN 100009
		WHEN I.New_Inst = 'Church' AND I.Hier_Name IN ('Church - General') THEN 100010
		WHEN I.New_Inst = 'CES' AND I.Hier_Name IN ('CES - General') THEN 100011
		WHEN I.New_Inst = 'PCC' AND I.Hier_Name IN ('PCC - General') THEN 100012
		WHEN I.New_Inst = 'Church' AND I.Hier_Name IN ('Church - Temples') THEN 100013
		ELSE 0 END AS Reporting_Group_Key
	FROM _Accounting_Fact_Prep_ A
		LEFT JOIN
			(SELECT DISTINCT CONVERT(NVARCHAR(100),A.New_GiftHistoryId) AS Accounting_Key
				, CONVERT(NVARCHAR(100),C.Hier_Key) AS Hier_Key
				FROM dbo._Gift_Hist_ A
					INNER JOIN _Fund_Dim B ON CONVERT(NVARCHAR(100),A.Plus_FundAccount) = B.Fund_Key
					INNER JOIN _Hier_Dim C ON B.New_InstitutionalHierarchy = C.Hier_Key
			) B ON A.Accounting_Key = B.Accounting_Key
		LEFT JOIN
			(SELECT DISTINCT CONVERT(NVARCHAR(100),A.Donation_Key) AS Donation_Key
				, CONVERT(NVARCHAR(100),B.New_InstitutionalHierarchyId) AS Hier_Key
				FROM _Accounting_Fact_Prep_ A
					INNER JOIN dbo._Gift_ B ON A.Donation_Key = B.New_GiftId
				WHERE 1 = 1
					AND B.StatusCode != 1
			) C ON A.Donation_Key = C.Donation_Key
		LEFT JOIN _Hier_Dim I ON COALESCE(B.Hier_Key,C.Hier_Key) = I.Hier_Key 

