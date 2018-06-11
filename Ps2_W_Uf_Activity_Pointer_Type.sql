/****************************************************

	Name: Uf_Activity_Pointer_Type
	Date: 06/06/2018
	
	This function is used to convert Activity Pointer Type

****************************************************/

USE [LDSPhilanthropiesDW]
GO
/****** Object:  UserDefinedFunction [dbo].[Uf_Activity_Pointer_Type]    Script Date: 6/6/2018 1:11:01 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION [dbo].[Uf_Activity_Pointer_Type]()
RETURNS TABLE
AS
RETURN

SELECT ActivityId
	, CASE WHEN ActivityTypeCode = '4201' THEN 'Appointment'
		WHEN ActivityTypeCode = '4202' THEN 'Email'
		WHEN ActivityTypeCode = '4204' THEN 'Fax'
		WHEN ActivityTypeCode = '4206' THEN 'Case Resolution'
		WHEN ActivityTypeCode = '4207' THEN 'Letter'
		WHEN ActivityTypeCode = '4208' THEN 'Initiative Close'
		WHEN ActivityTypeCode = '4209' THEN 'Order Close'
		WHEN ActivityTypeCode = '4210' THEN 'Phone Call'
		WHEN ActivityTypeCode = '4211' THEN 'Quote Close'
		WHEN ActivityTypeCode = '4212' THEN 'Task'
		WHEN ActivityTypeCode = '4214' THEN 'Service Activity'
		WHEN ActivityTypeCode = '4251' THEN 'Recurring Appointment'
		WHEN ActivityTypeCode = '4401' THEN 'Campaign Response'
		WHEN ActivityTypeCode = '4402' THEN 'Campaign Activity'
		WHEN ActivityTypeCode = '10145' THEN 'Legacy M11'
		ELSE '-' END AS Type
	FROM Ext_Activity_Pointer