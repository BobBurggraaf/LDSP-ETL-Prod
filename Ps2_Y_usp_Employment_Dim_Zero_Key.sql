/****************************************************

	Name: usp_Employment_Dim_Zero_Key
	Date: 06/08/2018
	
	This stored procedure is used to add a zero key

****************************************************/

CREATE OR ALTER PROCEDURE [dbo].[usp_Employment_Dim_Zero_Key] 
AS
BEGIN
	INSERT INTO _Employment_Dim
		VALUES(NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Y','N','BYU','Current');
END