/****************************************************

	Name: usp_Fund_Dim_Zero_Key
	Date: 06/08/2018
	
	This stored procedure is used to add a zero key

****************************************************/

CREATE OR ALTER PROCEDURE [dbo].[usp_Fund_Dim_Zero_Key] 
AS
BEGIN
	INSERT INTO _Fund_Dim
		VALUES('0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
END