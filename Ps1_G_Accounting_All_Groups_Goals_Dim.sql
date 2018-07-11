/******************************************************************************
   NAME: _Accounting_All_Groups_Goals_Dim 
   PURPOSE: DML for the _Accounting_All_Groups_Goals_Dim
   PLATFORM: Sql Server Management Studio

   REVISIONS:
   Ver        Date        Author           Description
   ---------  ----------  ---------------  ------------------------------------
   1.0        7/6/2018      Fams           1. Development of the initial script

   
******************************************************************************/


IF OBJECT_ID('dbo._Accounting_All_Groups_Goals_Dim') IS NOT NULL
	DROP TABLE dbo._Accounting_All_Groups_Goals_Dim
	
CREATE TABLE dbo._Accounting_All_Groups_Goals_Dim (
	Accounting_All_Groups_Goals_Key INT
	, Reporting_All_Group_Key INT
	, Accounting_All_Groups_Month_Key INT
	, Month_Order INT
	, Accounting_All_Groups_Goal MONEY
)

INSERT INTO dbo._Accounting_All_Groups_Goals_Dim (
	Accounting_All_Groups_Goals_Key 
	, Reporting_All_Group_Key 
	, Accounting_All_Groups_Month_Key 
	, Month_Order 
	, Accounting_All_Groups_Goal 
)
VALUES
(10001,100000,201701,1,6618824),
(10002,100000,201702,2,9534162),
(10003,100000,201703,3,11339393),
(10004,100000,201704,4,8808934),
(10005,100000,201705,5,10556458),
(10006,100000,201706,6,9881854),
(10007,100000,201707,7,8903051),
(10008,100000,201708,8,11500352),
(10009,100000,201709,9,15574414),
(10010,100000,201710,10,13343325),
(10011,100000,201711,11,13878746),
(10012,100000,201712,12,44160486)

