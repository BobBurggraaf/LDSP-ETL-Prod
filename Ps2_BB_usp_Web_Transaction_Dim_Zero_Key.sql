/****************************************************

	Name: usp_Web_Transaction_Dim_Zero_Key
	Date: 07/30/2018
	
	This stored procedure is used to add a zero key

****************************************************/

CREATE OR ALTER PROCEDURE [dbo].[usp_Web_Transaction_Dim_Zero_Key] 
AS
BEGIN
	INSERT INTO _Web_Transaction_Dim
		VALUES('0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
END