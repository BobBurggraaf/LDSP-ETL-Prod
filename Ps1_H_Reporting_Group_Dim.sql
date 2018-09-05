/******************************************************************************
   NAME: _Reporting_Group_Dim 
   DATE: 8/17/2018
   
******************************************************************************/

IF OBJECT_ID('dbo._Reporting_Group_Dim') IS NOT NULL
	DROP TABLE dbo._Reporting_Group_Dim
	
CREATE TABLE dbo._Reporting_Group_Dim (
	Reporting_Group_Key INT PRIMARY KEY
	, Reporting_Group_Name NVARCHAR(100)
	, Reporting_Group_Tab INT
	, Reporting_Group_Inst NVARCHAR(100)
	, Reporting_Group_Primary_Hier_Name NVARCHAR(100)
	, Reporting_Group_Additional_Hier_Names NVARCHAR(4000)
	, Reporting_Group_Cip_Yearly_Goal_Amt MONEY
)

INSERT INTO dbo._Reporting_Group_Dim (
	Reporting_Group_Key
	, Reporting_Group_Name
	, Reporting_Group_Tab
	, Reporting_Group_Inst
	, Reporting_Group_Primary_Hier_Name
	, Reporting_Group_Additional_Hier_Names
	, Reporting_Group_Cip_Yearly_Goal_Amt 
)
VALUES
(100002,'BYU',2,'BYU','BYU','(All with an institution name of BYU)',NULL)
, (100003,'BYUI',3,'BYUI','BYUI','(All with an institution name of BYUI)',11525000)
, (100004,'BYUH',4,'BYUH','BYUH','(All with an institution name of BYUH)',11525000)
, (100005,'LDSBC',5,'LDSBC','LDSBC','(All with an institution name of LDSBC)',1800000)
, (100006,'HUMAN',6,'Church','Church - Humanitarian - General','Church - Humanitarian - Benson Institute',25000000)
, (100007,'PEF',7,'Church','Church - Self-Reliance Services',NULL,5000000)
, (100008,'MISSIONARY',8,'Church','Church - Missionary',NULL,10000000)
, (100009,'FAMILY SEARCH',9,'Church','Church - FamilySearch','Church - Church History',4000000)
, (100010,'CHURCH GENERAL',10,'Church','Church - General',NULL,12300000)
, (100011,'S&I',11,'CES','CES - General',NULL,NULL)
, (100012,'PCC',12,'PCC','PCC - General',NULL,NULL)
, (100013,'TEMPLE PATRON',13,'Church','Church - Temples',NULL,NULL)
, (0,NULL,NULL,NULL,NULL,NULL,NULL)


