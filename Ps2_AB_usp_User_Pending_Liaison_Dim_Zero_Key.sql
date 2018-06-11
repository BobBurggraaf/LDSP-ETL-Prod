/****************************************************

	Name: usp_User_Pending_Liaison_Dim_Zero_Key
	Date: 06/08/2018
	
	This stored procedure is used to add a zero key

****************************************************/

CREATE OR ALTER PROCEDURE [dbo].[usp_User_Pending_Liaison_Dim_Zero_Key] 
AS
BEGIN
	INSERT INTO _User_Pending_Liaison_Dim
		VALUES('0',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
END