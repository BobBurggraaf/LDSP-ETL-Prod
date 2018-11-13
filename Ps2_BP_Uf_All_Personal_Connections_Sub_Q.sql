	/****************************************************
	
		Name: Uf_All_Personal_Connections_Sub_Q
		Date: 10/6/2018
	
	****************************************************/
	
	USE [LDSPhilanthropiesDW]
	GO
	
	SET ANSI_NULLS ON
	GO
	SET QUOTED_IDENTIFIER ON
	GO
	
	CREATE OR ALTER FUNCTION [dbo].[Uf_All_Personal_Connections_Sub_Q]()
	RETURNS TABLE
	AS
	RETURN
	
	SELECT DISTINCT ContactId
		, Relationship + ': (' + COALESCE(RTRIM(CONVERT(NVARCHAR(50),Relationship_LdspId)),' ') + ') ' + Relationship_Name AS All_Personal_Connections
        FROM _Connection_Dim