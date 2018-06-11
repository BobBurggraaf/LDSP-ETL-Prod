/****************************************************

	Name: Uf_Activity_Participation_Type
	Date: 06/06/2018
	
	This function is used to convert Participation_Type

****************************************************/

USE [LDSPhilanthropiesDW]
GO
/****** Object:  UserDefinedFunction [dbo].[Uf_Activity_Participation_Type]    Script Date: 6/6/2018 1:10:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION [dbo].[Uf_Activity_Participation_Type]()
RETURNS TABLE
AS
RETURN

SELECT A.ActivityPartyId -- (Unique to all records)
	, CASE WHEN A.ParticipationTypeMask = 1 THEN 'Sender'
		WHEN A.ParticipationTypeMask = 2 THEN 'To Recipient'
		WHEN A.ParticipationTypeMask = 3 THEN 'Cc Recipient'
		WHEN A.ParticipationTypeMask = 4 THEN 'Bcc Recipient'
		WHEN A.ParticipationTypeMask = 5 THEN 'Required Attendee'
		WHEN A.ParticipationTypeMask = 6 THEN 'Optional Attendee'
		WHEN A.ParticipationTypeMask = 7 THEN 'Organizer'
		WHEN A.ParticipationTypeMask = 8 THEN 'Regarding'
		WHEN A.ParticipationTypeMask = 9 THEN 'Owner'
		WHEN A.ParticipationTypeMask = 10 THEN 'Resource'
		WHEN A.ParticipationTypeMask = 11 THEN 'Customer'
		ELSE CONVERT(VARCHAR(100),A.ParticipationTypeMask) END AS Participation_Type
	FROM Ext_Activity A -- People