/******************************************************************************
   NAME: Ps3_A_Stage_To_Prod.sql 
   DATE: 5/1/2018
   DESCRIPTION: This is a DDL that creates a table with all of the variables needed
				to run the migration of the Stage DW tables to Prod (It runs in Prod). 
				Source Database: w16358\S01
				Destination Database: w16359\S01
 
******************************************************************************/

IF OBJECT_ID('dbo.Stage_To_Prod','U') IS NOT NULL
DROP TABLE dbo.Stage_To_Prod;
GO

CREATE TABLE dbo.Stage_To_Prod
	(
	Stage_To_Prod_Key  INT IDENTITY(1,1) PRIMARY KEY
	, Tier INT
	, Source_Table NVARCHAR(100)
	, Destination_Table NVARCHAR(100)
	, Dest_Create_Fields NVARCHAR(4000)
	, Dest_Insert_Fields NVARCHAR(4000)
	, Dest_Where_Statement NVARCHAR(4000)
	, Tier_1_Stage NVARCHAR(100) DEFAULT NULL
	, Tier_1_Stage_DateTime DATETIME DEFAULT NULL
	, Insert_Date DATETIME
	, Update_Date DATETIME
	);
	
INSERT INTO dbo.Stage_To_Prod
	(
	Tier
	, Source_Table
	, Destination_Table
	, Dest_Create_Fields
	, Dest_Insert_Fields
	, Dest_Where_Statement
	, Insert_Date
	, Update_Date
	)
	VALUES
-- --------------------------
-- _Accounting_All_Groups_Goals_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_All_Groups_Goals_Dim' -- Source_Table
		, 'dbo._Accounting_All_Groups_Goals_Dim' -- Destination_Table
		,'Accounting_All_Groups_Goals_Key INT
			, Reporting_All_Group_Key INT
			, Accounting_All_Groups_Month_Key INT
			, Month_Order INT
			, Accounting_All_Groups_Goal MONEY
			' -- Dest_Create_Fields
		, 'Accounting_All_Groups_Goals_Key 
			, Reporting_All_Group_Key 
			, Accounting_All_Groups_Month_Key 
			, Month_Order 
			, Accounting_All_Groups_Goal
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,	
-- --------------------------
-- _Accounting_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_Dim' -- Source_Table
		, 'dbo._Accounting_Dim' -- Destination_Table
		,'Accounting_Dim_Key INT
			, Donation_Key NVARCHAR(100)
			, Accounting_Key NVARCHAR(100)
			, Accounting_Date DATE
			, Accounting_Receipt_Date DATE
			, Accounting_Post_Date DATE
			, Accounting_Gift_Number NVARCHAR(50)
			, Accounting_Related_Gift_Number NVARCHAR(50)
			, Accounting_Fact_Key BIGINT
			, Accounting_Gift_Source NVARCHAR(400)
			, Accounting_Adjustment_Yn NVARCHAR(1)
			, Accounting_Same_Month_Adj_Yn NVARCHAR(1)
			, Accounting_Current_Year_Adj_Yn NVARCHAR(1)
			, Accounting_Recognition_Credit_Recipients NVARCHAR(4000)
			' -- Dest_Create_Fields
		, 'Accounting_Dim_Key
			, Donation_Key
			, Accounting_Key
			, Accounting_Date
			, Accounting_Receipt_Date
			, Accounting_Post_Date
			, Accounting_Gift_Number
			, Accounting_Related_Gift_Number
			, Accounting_Fact_Key
			, Accounting_Gift_Source
			, Accounting_Adjustment_Yn
			, Accounting_Same_Month_Adj_Yn
			, Accounting_Current_Year_Adj_Yn
			, Accounting_Recognition_Credit_Recipients
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Accounting_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_Fact' -- Source_Table
		, 'dbo._Accounting_Fact' -- Destination_Table
		,'Donor_Key  NVARCHAR(100) 
			, Acitivity_Group_Key  INT 
			, Address_Group_Key  INT 
			, Alumni_Group_Key  INT 
			, Association_Group_Key  INT 
			, Award_Group_Key  INT 
			, Drop_Include_Group_Key  INT 
			, Email_Group_Key  INT 
			, Employment_Group_Key  INT 
			, Language_Group_Key  INT 
			, Phone_Group_Key  INT 
			, Psa_Group_Key  INT 
			, Connection_Group_Key INT
			, Id_Group_Key INT
			, Interest_Group_Key INT
			, Student_Group_Key INT
			, Fund_Key  NVARCHAR(100) 
			, User_Key  NVARCHAR(100) 
			, Donation_Key NVARCHAR(100)
			, Accounting_Amt  MONEY 	
			, New_AccountingDate DATE
			, Accounting_Date_Key NUMERIC(10,0)
			, Table_Source NVARCHAR(100)
			, Record_Status NVARCHAR(100)
			, Accounting_Through_Previous_Month_Current_Year_Amt MONEY
			, Accounting_Through_Previous_Month_Previous_Year_Amt MONEY
			, Accounting_Previous_Year_Amt MONEY
			, Accounting_Through_Previous_Month_Two_Years_Ago_Amt MONEY
			, Accounting_Two_Years_Ago_Amt MONEY
			, Accounting_Fact_Key BIGINT
			, Accounting_Key NVARCHAR(100)
			, Hier_Key NVARCHAR(100)
			, Accounting_Dim_Key INT
			, Accounting_Tender_Type_Key INT
			, Accounting_Kind_Key INT
			, Accounting_Transmitted_Key INT
			, Accounting_Text_Key INT
			, Net_Recorded MONEY
			, Net_Not_Recorded MONEY
			, Net_Recorded_Monthly MONEY
			, Net_Not_Recorded_Monthly MONEY
			, Net_Recorded_Ytd MONEY
			, Net_Not_Recorded_Ytd MONEY
			, Net_Recorded_Prior_Years MONEY
			, Net_Not_Recorded_Prior_Years MONEY
			, Accounting_Month_Key INT
			, Reporting_Group_Key INT
			, Reporting_All_Group_Key INT
			, Accounting_Month_Date DATE
			, Accounting_Month_All_Goal MONEY
			, Accounting_Month_Goal MONEY
			, Accounting_Week_Key INT
			, Accounting_Last_Week_Ytd_Amt MONEY
			, Accounting_Last_Week_Minus_1_Ytd_Amt MONEY
			, Accounting_Last_Week_Last_Year_Ytd_Amt MONEY	
			, Appeal_Key NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Donor_Key 
			, Acitivity_Group_Key 
			, Address_Group_Key 
			, Alumni_Group_Key 
			, Association_Group_Key 
			, Award_Group_Key 
			, Drop_Include_Group_Key 
			, Email_Group_Key 
			, Employment_Group_Key 
			, Language_Group_Key 
			, Phone_Group_Key 
			, Psa_Group_Key 
			, Connection_Group_Key
			, Id_Group_Key
			, Interest_Group_Key
			, Student_Group_Key
			, Fund_Key 
			, User_Key
			, Donation_Key
			, Accounting_Amt 	
			, New_AccountingDate
			, Accounting_Date_Key
			, Table_Source
			, Record_Status
			, Accounting_Through_Previous_Month_Current_Year_Amt
			, Accounting_Through_Previous_Month_Previous_Year_Amt
			, Accounting_Previous_Year_Amt
			, Accounting_Through_Previous_Month_Two_Years_Ago_Amt
			, Accounting_Two_Years_Ago_Amt
			, Accounting_Key
			, Hier_Key
			, Accounting_Dim_Key
			, Accounting_Tender_Type_Key
			, Accounting_Kind_Key
			, Accounting_Transmitted_Key
			, Accounting_Text_Key
			, Net_Recorded
			, Net_Not_Recorded
			, Net_Recorded_Monthly
			, Net_Not_Recorded_Monthly
			, Net_Recorded_Ytd
			, Net_Not_Recorded_Ytd
			, Net_Recorded_Prior_Years
			, Net_Not_Recorded_Prior_Years
			, Accounting_Month_Key
			, Reporting_Group_Key
			, Reporting_All_Group_Key
			, Accounting_Month_Date
			, Accounting_Month_All_Goal
			, Accounting_Month_Goal
			, Accounting_Week_Key
			, Accounting_Last_Week_Ytd_Amt
			, Accounting_Last_Week_Minus_1_Ytd_Amt
			, Accounting_Last_Week_Last_Year_Ytd_Amt
			, Appeal_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Accounting_Goals_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_Goals_Dim' -- Source_Table
		, 'dbo._Accounting_Goals_Dim' -- Destination_Table
		,'Accounting_Goals_Key INT
			 , Accounting_Group_Key INT
			 , Accounting_Month_Key INT
			 , Month_Order INT
			 , Accounting_Goal MONEY
			' -- Dest_Create_Fields
		, 'Accounting_Goals_Key
			 , Accounting_Group_Key
			 , Accounting_Month_Key
			 , Month_Order
			 , Accounting_Goal
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Accounting_Kind_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_Kind_Dim' -- Source_Table
		, 'dbo._Accounting_Kind_Dim' -- Destination_Table
		,'Accounting_Kind_Key INT
			, Accounting_Kind_Id INT
			, Accounting_Kind_Desc NVARCHAR(400)
			' -- Dest_Create_Fields
		, 'Accounting_Kind_Key
			, Accounting_Kind_Id
			, Accounting_Kind_Desc
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Accounting_Key_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_Key_Fact' -- Source_Table
		, 'dbo._Accounting_Key_Fact' -- Destination_Table
		,'Accounting_Fact_Key BIGINT 
			, Accounting_Key NVARCHAR(100)
			, Donor_Key  NVARCHAR(100) 
			, Fund_Key  NVARCHAR(100) 
			, User_Key  NVARCHAR(100) 
			, Donation_Key NVARCHAR(100)
			, Hier_Key NVARCHAR(100)
			, Accounting_Dim_Key INT
			, Accounting_Tender_Type_Key INT
			, Accounting_Kind_Key INT
			, Accounting_Transmitted_Key INT
			, Accounting_Text_Key INT
			, Accounting_Month_Key INT
			, Reporting_Group_Key INT
			, Reporting_All_Group_Key INT
			, Accounting_Week_Key INT
			, Appeal_Key NVARCHAR(100)
			, Accounting_Amt  MONEY 	
			, New_AccountingDate DATE
			, Table_Source NVARCHAR(100)
			, Record_Status NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Accounting_Fact_Key
			, Accounting_Key
			, Donor_Key 
			, Fund_Key 
			, User_Key
			, Donation_Key
			, Hier_Key
			, Accounting_Dim_Key
			, Accounting_Tender_Type_Key
			, Accounting_Kind_Key
			, Accounting_Transmitted_Key
			, Accounting_Text_Key
			, Accounting_Month_Key
			, Reporting_Group_Key
			, Reporting_All_Group_Key
			, Accounting_Week_Key
			, Appeal_Key
			, Accounting_Amt	
			, New_AccountingDate
			, Table_Source
			, Record_Status
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Accounting_Reporting_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_Reporting_Dim' -- Source_Table
		, 'dbo._Accounting_Reporting_Dim' -- Destination_Table
		,'Accounting_Fact_Key BIGINT
			, Accounting_Through_Previous_Month_Current_Year_Amt MONEY
			, Accounting_Through_Previous_Month_Previous_Year_Amt MONEY
			, Accounting_Previous_Year_Amt MONEY
			, Accounting_Through_Previous_Month_Two_Years_Ago_Amt MONEY
			, Accounting_Two_Years_Ago_Amt MONEY
			, Net_Recorded MONEY
			, Net_Not_Recorded MONEY
			, Net_Recorded_Monthly MONEY
			, Net_Not_Recorded_Monthly MONEY
			, Net_Recorded_Ytd MONEY
			, Net_Not_Recorded_Ytd MONEY
			, Net_Recorded_Prior_Years MONEY
			, Net_Not_Recorded_Prior_Years MONEY
			, Accounting_Month_Date DATE
			, Accounting_Month_All_Goal MONEY
			, Accounting_Month_Goal MONEY
			, Accounting_Last_Week_Ytd_Amt MONEY
			, Accounting_Last_Week_Minus_1_Ytd_Amt MONEY
			, Accounting_Last_Week_Last_Year_Ytd_Amt MONEY
			' -- Dest_Create_Fields
		, 'Accounting_Fact_Key
			, Accounting_Through_Previous_Month_Current_Year_Amt
			, Accounting_Through_Previous_Month_Previous_Year_Amt
			, Accounting_Previous_Year_Amt
			, Accounting_Through_Previous_Month_Two_Years_Ago_Amt
			, Accounting_Two_Years_Ago_Amt
			, Net_Recorded
			, Net_Not_Recorded
			, Net_Recorded_Monthly
			, Net_Not_Recorded_Monthly
			, Net_Recorded_Ytd
			, Net_Not_Recorded_Ytd
			, Net_Recorded_Prior_Years
			, Net_Not_Recorded_Prior_Years
			, Accounting_Month_Date
			, Accounting_Month_All_Goal
			, Accounting_Month_Goal
			, Accounting_Last_Week_Ytd_Amt
			, Accounting_Last_Week_Minus_1_Ytd_Amt
			, Accounting_Last_Week_Last_Year_Ytd_Amt
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Accounting_Tender_Type_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_Tender_Type_Dim' -- Source_Table
		, 'dbo._Accounting_Tender_Type_Dim' -- Destination_Table
		,'Accounting_Tender_Type_Key INT
			, Accounting_Tender_Type_Id INT
			, Accounting_Tender_Type_Desc NVARCHAR(400)
			' -- Dest_Create_Fields
		, 'Accounting_Tender_Type_Key
			, Accounting_Tender_Type_Id
			, Accounting_Tender_Type_Desc
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Accounting_Text_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_Text_Dim' -- Source_Table
		, 'dbo._Accounting_Text_Dim' -- Destination_Table
		,'Accounting_Text_Key INT
			, Accounting_Text_Description_Text NVARCHAR(4000)
			, Accounting_Text_Receipt_Text NVARCHAR(4000)
			, Accounting_Text_Gift_Adjustment_Text NVARCHAR(4000)
			' -- Dest_Create_Fields
		, 'Accounting_Text_Key
			, Accounting_Text_Description_Text
			, Accounting_Text_Receipt_Text
			, Accounting_Text_Gift_Adjustment_Text
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Accounting_Transmitted_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_Transmitted_Dim' -- Source_Table
		, 'dbo._Accounting_Transmitted_Dim' -- Destination_Table
		,'Accounting_Transmitted_Key INT
			, Accounting_Transmitted_Id INT
			, Accounting_Transmitted_Desc NVARCHAR(400)
			' -- Dest_Create_Fields
		, 'Accounting_Transmitted_Key
			, Accounting_Transmitted_Id
			, Accounting_Transmitted_Desc
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Accounting_Week
-- --------------------------
	( 1 -- Tier
		, 'dbo._Accounting_Week' -- Source_Table
		, 'dbo._Accounting_Week' -- Destination_Table
		,'Accounting_Week_Key INT 
			, Accounting_Week_Date DATE
			, Accounting_Week_Number INT
			, Accounting_Week_Day_Of_Week INT
			, Accounting_Week_Number_Date DATE
			, Accounting_Week_Last_Week_Yn NVARCHAR(1)
			, Accounting_Week_Last_Week_Minus_1_Yn NVARCHAR(1)
			, Accounting_Week_Current_Week_Number_Last_Year_Yn NVARCHAR(1)
			' -- Dest_Create_Fields
		, 'Accounting_Week_Key
			, Accounting_Week_Date
			, Accounting_Week_Number
			, Accounting_Week_Day_Of_Week
			, Accounting_Week_Number_Date
			, Accounting_Week_Last_Week_Yn
			, Accounting_Week_Last_Week_Minus_1_Yn
			, Accounting_Week_Current_Week_Number_Last_Year_Yn
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Activity_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Activity_Dim' -- Source_Table
		, 'dbo._Activity_Dim' -- Destination_Table
		,'Activity_Key INT
			, Activity_Group_Key INT
			, Activity_Id NVARCHAR(100)
			, ContactId NVARCHAR(100)
			, ContactName NVARCHAR(4000)
			, Party_Object_Type NVARCHAR(100)
			, Participation_Type NVARCHAR(100)
			, Type NVARCHAR(100)
			, Subject NVARCHAR(200)
			, Regarding NVARCHAR(4000)
			, Face_To_Face NVARCHAR(1)
			, Scheduled_Start DATE
			, Scheduled_Start_Date_Key NUMERIC(10,0)
			, Scheduled_End DATE
			, Scheduled_End_Date_Key NUMERIC(10,0)
			, Completed DATE
			, Completed_Date_Key NUMERIC(10,0)
			, Description NVARCHAR(4000)
			, Attendees NVARCHAR(4000)
			, Owner NVARCHAR(200)
			, Owner_Id NVARCHAR(100)
			, Source NVARCHAR(100)
			, Plus_M11ActivityType NVARCHAR(400)
			, Plus_MllMessageType NVARCHAR(400)
			, StateCode NVARCHAR(400)
			, StatusCode NVARCHAR(400)
			, CreatedOn DATE
			, ModifiedOn DATE
			, DomainName NVARCHAR(1024)
			, Regarding_Type NVARCHAR(15)
			' -- Dest_Create_Fields
		, 'Activity_Key
			, Activity_Group_Key
			, Activity_Id
			, ContactId
			, ContactName
			, Party_Object_Type
			, Participation_Type
			, Type
			, Subject
			, Regarding
			, Face_To_Face
			, Scheduled_Start
			, Scheduled_Start_Date_Key
			, Scheduled_End
			, Scheduled_End_Date_Key
			, Completed
			, Completed_Date_Key
			, Description
			, Attendees
			, Owner
			, Owner_Id
			, Source
			, Plus_M11ActivityType
			, Plus_MllMessageType
			, StateCode
			, StatusCode
			, CreatedOn
			, ModifiedOn
			, DomainName
			, Regarding_Type
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Address_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Address_Dim' -- Source_Table
		, 'dbo._Address_Dim' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Address_Key INT
			, Address_Group_Key INT
			, Address_Primary_Yn NVARCHAR(1)
			, Address_Street_1 NVARCHAR(100)
			, Address_Street_2 NVARCHAR(100)
			, Address_Street_3 NVARCHAR(100)
			, Address_City NVARCHAR(100)
			, Address_County NVARCHAR(100)
			, Address_County_Code NVARCHAR(10)
			, Address_County_Id NVARCHAR(100)
			, Address_State_Province NVARCHAR(50)
			, Address_State_Code NVARCHAR(100)
			, Address_Country NVARCHAR(100)
			, Address_Post_Code_Full NVARCHAR(100)
			, Address_Post_Code_Last_4 NVARCHAR(15)
			, Address_Printing_Line_1 NVARCHAR(606)
			, Address_Printing_Line_2 NVARCHAR(406)
			, Address_Display NVARCHAR(300)
			, Address_Quality_Status NVARCHAR(400)
			, Address_Quality_Status_Value INT
			, Address_Longitude FLOAT
			, Address_Latitude FLOAT
			, Address_Active_Yn NVARCHAR(1)
			, Address_Confirmed_Yn NVARCHAR(1)
			, Address_Confidential_Yn NVARCHAR(1)
			, Address_Type NVARCHAR(400)
			, Address_Type_Value INT
			, Address_Printing_Line_3 NVARCHAR(100)
			, Address_Printing_Line_4 NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'ContactId
			, Address_Key
			, Address_Group_Key
			, Address_Primary_Yn
			, Address_Street_1
			, Address_Street_2
			, Address_Street_3
			, Address_City
			, Address_County
			, Address_County_Code
			, Address_County_Id
			, Address_State_Province
			, Address_State_Code
			, Address_Country
			, Address_Post_Code_Full
			, Address_Post_Code_Last_4
			, Address_Printing_Line_1
			, Address_Printing_Line_2
			, Address_Display
			, Address_Quality_Status
			, Address_Quality_Status_Value
			, Address_Longitude
			, Address_Latitude
			, Address_Active_Yn
			, Address_Confirmed_Yn
			, Address_Confidential_Yn
			, Address_Type
			, Address_Type_Value
			, Address_Printing_Line_3
			, Address_Printing_Line_4
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Affiliated_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Affiliated_Dim' -- Source_Table
		, 'dbo._Affiliated_Dim' -- Destination_Table
		,'ContactId  NVARCHAR(100) 
			, Affiliated_Key  INT
			, Byu_Affiliated_Date DATE
			, Byu_Donor_Affiliated_Date DATE
			, Byu_Education_Affiliated_Date DATE
			, Byu_Interest_Affiliated_Date DATE
			, Byu_Employee_Affiliated_Date DATE
			, Byui_Affiliated_Date DATE
			, Byui_Donor_Affiliated_Date DATE
			, Byui_Education_Affiliated_Date DATE
			, Byui_Interest_Affiliated_Date DATE
			, Byui_Employee_Affiliated_Date DATE
			, Byuh_Affiliated_Date DATE
			, Byuh_Donor_Affiliated_Date DATE
			, Byuh_Education_Affiliated_Date DATE
			, Byuh_Interest_Affiliated_Date DATE
			, Byuh_Employee_Affiliated_Date DATE
			, Ldsbc_Affiliated_Date DATE
			, Ldsbc_Donor_Affiliated_Date DATE
			, Ldsbc_Education_Affiliated_Date DATE
			, Ldsbc_Interest_Affiliated_Date DATE
			, Ldsbc_Employee_Affiliated_Date DATE
			' -- Dest_Create_Fields
		, 'ContactId 
			, Affiliated_Key
			, Byu_Affiliated_Date
			, Byu_Donor_Affiliated_Date
			, Byu_Education_Affiliated_Date
			, Byu_Interest_Affiliated_Date
			, Byu_Employee_Affiliated_Date
			, Byui_Affiliated_Date
			, Byui_Donor_Affiliated_Date
			, Byui_Education_Affiliated_Date
			, Byui_Interest_Affiliated_Date
			, Byui_Employee_Affiliated_Date
			, Byuh_Affiliated_Date
			, Byuh_Donor_Affiliated_Date
			, Byuh_Education_Affiliated_Date
			, Byuh_Interest_Affiliated_Date
			, Byuh_Employee_Affiliated_Date
			, Ldsbc_Affiliated_Date
			, Ldsbc_Donor_Affiliated_Date
			, Ldsbc_Education_Affiliated_Date
			, Ldsbc_Interest_Affiliated_Date
			, Ldsbc_Employee_Affiliated_Date
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Alumni_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Alumni_Dim' -- Source_Table
		, 'dbo._Alumni_Dim' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Alumni_Key INT
			, Alumni_Group_Key INT
			, New_StudentAttendanceId NVARCHAR(100)
			, New_Term NVARCHAR(100)
			, New_Year NVARCHAR(100)
			, New_HoursCompleted INT
			, New_ExpectedGraduationDate DATE
			, Plus_Year NVARCHAR(10)
			, Plus_AlumniId NVARCHAR(100)
			, Plus_Name NVARCHAR(100)
			, Plus_ActualGraduationDate DATE
			, Actual_Graduation_Date_Key NUMERIC(10,0)
			, Plus_AlumniStatus NVARCHAR(400)
			, Plus_DgId INT
			, Plus_HoursCredits DECIMAL(20,2)
			, Plus_PreferredGraduationDate DATE
			, Preferred_Graduation_Date_Key NUMERIC(10,0)
			, College_Name NVARCHAR(100)
			, New_CollegeCode NVARCHAR(10)
			, Department NVARCHAR(100)
			, New_Degree NVARCHAR(100)
			, New_DegreeCode NVARCHAR(100)
			, Plus_DegreeLevel NVARCHAR(400)
			, New_University NVARCHAR(100)
			, New_UniversityCode NVARCHAR(10)
			, Plus_UniversityAcronym NVARCHAR(100)
			, New_Major NVARCHAR(100)
			, New_MajorName NVARCHAR(100)
			, New_MajorCode NVARCHAR(10)
			, Program_Code NVARCHAR(10)
			, New_Source NVARCHAR(100)
			, New_LongDescription NVARCHAR(100)
			, Program NVARCHAR(100)
			, Emphasis NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'ContactId
			, Alumni_Key
			, Alumni_Group_Key
			, New_StudentAttendanceId
			, New_Term
			, New_Year
			, New_HoursCompleted
			, New_ExpectedGraduationDate
			, Plus_Year
			, Plus_AlumniId
			, Plus_Name
			, Plus_ActualGraduationDate
			, Actual_Graduation_Date_Key
			, Plus_AlumniStatus
			, Plus_DgId
			, Plus_HoursCredits
			, Plus_PreferredGraduationDate
			, Preferred_Graduation_Date_Key
			, College_Name
			, New_CollegeCode
			, Department
			, New_Degree
			, New_DegreeCode
			, Plus_DegreeLevel
			, New_University
			, New_UniversityCode
			, Plus_UniversityAcronym
			, New_Major
			, New_MajorName
			, New_MajorCode
			, Program_Code
			, New_Source
			, New_LongDescription
			, Program
			, Emphasis
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Appeal_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Appeal_Dim' -- Source_Table
		, 'dbo._Appeal_Dim' -- Destination_Table
		,'Appeal_Key NVARCHAR(100)
			, Appeal_Name NVARCHAR(100)
			, Appeal_Code NVARCHAR(20)
			, Campaign_Institutional_Hierarchy NVARCHAR(100)
			, Campaign_Name NVARCHAR(128)
			, Delivery_Type NVARCHAR(400)
			, Communication_Type NVARCHAR(400)
			, Scheduled_Start DATE
			, Scheduled_End DATE
			, Actual_Start DATE
			, Actual_End DATE
			, Appeal_Format INT
			, Campaign_Type NVARCHAR(400)
			, Campaign_Status INT
			, Scope NVARCHAR(400)
			, Requester NVARCHAR(100)
			, Representing NVARCHAR(100)
			, Department_Owner NVARCHAR(400)   
			, Cause INT        
			, Campaign_Notes NVARCHAR(4000)
			, Budget_Allocated NVARCHAR(50)
			, Estimated_Revenue NVARCHAR(50)
			, Miscellaneous_Cost NVARCHAR(50)
			, Total_Cost_Of_Campaign_Activity NVARCHAR(50)
			, Total_Cost_Of_Campaign NVARCHAR(50)
			, Cost_To_Raise_1_Dollar NVARCHAR(50)
			, Total_Gift_Revenue_From_Campaign NVARCHAR(50)
			, Campaign_Profit NVARCHAR(50)
			, Appeal_Delivery_Type_Sort_Value INT
			, Appeal_Long_Name NVARCHAR(200)
			, Appeal_Reporting_Status NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Appeal_Key
			, Appeal_Name
			, Appeal_Code
			, Campaign_Institutional_Hierarchy
			, Campaign_Name
			, Delivery_Type
			, Communication_Type
			, Scheduled_Start
			, Scheduled_End
			, Actual_Start
			, Actual_End
			, Appeal_Format
			, Campaign_Type
			, Campaign_Status
			, Scope
			, Requester
			, Representing
			, Department_Owner    
			, Cause 
			, Campaign_Notes
			, Budget_Allocated
			, Estimated_Revenue
			, Miscellaneous_Cost
			, Total_Cost_Of_Campaign_Activity
			, Total_Cost_Of_Campaign
			, Cost_To_Raise_1_Dollar
			, Total_Gift_Revenue_From_Campaign
			, Campaign_Profit
			, Appeal_Delivery_Type_Sort_Value
			, Appeal_Long_Name
			, Appeal_Reporting_Status
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Association_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Association_Dim' -- Source_Table
		, 'dbo._Association_Dim' -- Destination_Table
		,'ContactId  NVARCHAR(100) 
			, Association_Key  INT
			, Association_Group_Key  INT 
			, Association_Name  NVARCHAR(100) 
			, Association_Acronym  NVARCHAR(100) 
			, Association_Region  NVARCHAR(100) 
			, Association_Chapter_Level  NVARCHAR(100) 
			, Association_Type  NVARCHAR(400) 
			, Association_Type_Value  INT 
			, Association_Sponsor  NVARCHAR(400) 
			, Association_Sponsor_Value  INT 
			, Association_Active_Yn  NVARCHAR(1)
			, New_StartDate DATE
			, New_EndDate DATE
			, StatusCode NVARCHAR(400)
			' -- Dest_Create_Fields
		, 'ContactId 
			, Association_Key 
			, Association_Group_Key 
			, Association_Name 
			, Association_Acronym 
			, Association_Region
			, Association_Chapter_Level 
			, Association_Type
			, Association_Type_Value 
			, Association_Sponsor
			, Association_Sponsor_Value 
			, Association_Active_Yn
			, New_StartDate
			, New_EndDate
			, StatusCode
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Award_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Award_Dim' -- Source_Table
		, 'dbo._Award_Dim' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Award_Key INT
			, Award_Group_Key INT
			, Award_Type NVARCHAR(400)
			, Award_Affiliate_Type NVARCHAR(400)
			, Award_Start_Dt DATE
			, Award_End_Dt DATE
			, Award_Scholarship_Granting_Office NVARCHAR(25)
			, Award_Scholarship_Term NVARCHAR(15)
			, Award_Scholarship_Code NVARCHAR(100)
			, Award_Scholarship_Amount MONEY
			, Award_Scholarship_Dt DATE
			, Award_Name NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'ContactId
			, Award_Key
			, Award_Group_Key
			, Award_Type
			, Award_Affiliate_Type
			, Award_Start_Dt
			, Award_End_Dt
			, Award_Scholarship_Granting_Office
			, Award_Scholarship_Term
			, Award_Scholarship_Code
			, Award_Scholarship_Amount
			, Award_Scholarship_Dt
			, Award_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Connection_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Connection_Dim' -- Source_Table
		, 'dbo._Connection_Dim' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Connection_Key INT
			, Connection_Group_Key INT
			, Contact_Name NVARCHAR(160)
			, Relationship NVARCHAR(100)
			, Relationship_ContactId NVARCHAR(100)
			, Relationship_LdspId NVARCHAR(100)
			, Relationship_Name NVARCHAR(160)
			, Relationship_Phone_Number NVARCHAR(100)
			, Relationship_Email NVARCHAR(150) 
			, Relationship_First_Name NVARCHAR(50)
			, Relationship_Last_Name NVARCHAR(50)
			, Relationship_Birth_Date DATE
			, Relationship_Age INT
			, Relationship_Middle_Name NVARCHAR(50)
			, Relationship_Birth_Name NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'ContactId
			, Connection_Key
			, Connection_Group_Key
			, Contact_Name
			, Relationship
			, Relationship_ContactId
			, Relationship_LdspId
			, Relationship_Name
			, Relationship_Phone_Number
			, Relationship_Email
			, Relationship_First_Name
			, Relationship_Last_Name
			, Relationship_Birth_Date
			, Relationship_Age
			, Relationship_Middle_Name
			, Relationship_Birth_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donation_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donation_Dim' -- Source_Table
		, 'dbo._Donation_Dim' -- Destination_Table
		,'Donation_Key NVARCHAR(100)
			, New_ConstituentDonor NVARCHAR(100)
			, New_OrganizationDonor NVARCHAR(100)
			, New_BatchNumber NVARCHAR(100)
			, New_GiftNumber NVARCHAR(50)
			, StatusCode NVARCHAR(400)
			, Plus_ReceiptText NVARCHAR(4000)
			, Plus_SpecialGiftInstructions NVARCHAR(4000)
			, Plus_CheckNumber NVARCHAR(50)
			, Plus_GiftSource NVARCHAR(400)
			, Plus_Kind NVARCHAR(400)
			, New_TenderType NVARCHAR(400)
			, New_AccountingDate DATE
			, Accounting_Date_Key NUMERIC(10,0)
			, New_ReceiptDate DATE
			, Receipt_Date_Key NUMERIC(10,0)
			, New_PostDate DATE
			, Post_Date_Key NUMERIC(10,0)
			, Plus_PlannedGift NVARCHAR(1)
			, New_Transmitted NVARCHAR(1)
			, Plus_AnonymousGift NVARCHAR(1)
			, Plus_ReceiptDeliveryMethod NVARCHAR(400)
			, Plus_GiftInstructions NVARCHAR(4000)
			, Plus_AcknowledgementInstructions NVARCHAR(4000)
			, Plus_ExcludeFromReport NVARCHAR(1)
			, Plus_IncludeOnYearEndReceipt NVARCHAR(1)
			, Plus_GoodsServicesProvided NVARCHAR(1)
			, Plus_AcknowledgeContact NVARCHAR(100)
			, Plus_ContactRole NVARCHAR(400)
			, Plus_Salutation NVARCHAR(400)
			, Plus_Signer NVARCHAR(100)
			, Plus_NoAcknowledgement NVARCHAR(1)
			, Match_Gift_Number NVARCHAR(50)
			, Plus_MatchExpected NVARCHAR(1)
			, Recurring_Gift NVARCHAR(1)
			, Recurring_Gift_Expectancy NVARCHAR(1)
			, Recognition_Credit_Recipients NVARCHAR(4000)
			, Donation_Receipt_Ytd_Last_Week NVARCHAR(1)
			, Donation_Receipt_Ytd_Last_Week_Last_Year NVARCHAR(1)
			, Donation_Receipt_Ytd_Two_Weeks_Ago NVARCHAR(1)
			, Donation_Description NVARCHAR(4000)
			, Lds_BatchType NVARCHAR(400)
			, Plus_Donor_Type NVARCHAR(400)
			, Lds_TelefundGift NVARCHAR(1)
			, Plus_Cid NVARCHAR(200)
			, Plus_Cde2 NVARCHAR(200)
			, CreatedOn DATE
			, ModifiedOn DATE
			, StateCode NVARCHAR(400)
			' -- Dest_Create_Fields
		, 'Donation_Key 
			, New_ConstituentDonor
			, New_OrganizationDonor
			, New_BatchNumber
			, New_GiftNumber
			, StatusCode
			, Plus_ReceiptText
			, Plus_SpecialGiftInstructions
			, Plus_CheckNumber
			, Plus_GiftSource 
			, Plus_Kind 
			, New_TenderType 
			, New_AccountingDate
			, Accounting_Date_Key
			, New_ReceiptDate
			, Receipt_Date_Key
			, New_PostDate
			, Post_Date_Key
			, Plus_PlannedGift 
			, New_Transmitted 
			, Plus_AnonymousGift 
			, Plus_ReceiptDeliveryMethod
			, Plus_GiftInstructions
			, Plus_AcknowledgementInstructions
			, Plus_ExcludeFromReport
			, Plus_IncludeOnYearEndReceipt
			, Plus_GoodsServicesProvided
			, Plus_AcknowledgeContact
			, Plus_ContactRole
			, Plus_Salutation
			, Plus_Signer
			, Plus_NoAcknowledgement
			, Match_Gift_Number
			, Plus_MatchExpected
			, Recurring_Gift
			, Recurring_Gift_Expectancy
			, Recognition_Credit_Recipients
			, Donation_Receipt_Ytd_Last_Week
			, Donation_Receipt_Ytd_Last_Week_Last_Year
			, Donation_Receipt_Ytd_Two_Weeks_Ago
			, Donation_Description
			, Lds_BatchType
			, Plus_Donor_Type
			, Lds_TelefundGift
			, Plus_Cid
			, Plus_Cde2
			, CreatedOn
			, ModifiedOn
			, StateCode
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donation_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donation_Fact' -- Source_Table
		, 'dbo._Donation_Fact' -- Destination_Table
		,'Donor_Key  NVARCHAR(100) 
			, Acitivity_Group_Key  INT 
			, Address_Group_Key  INT 
			, Alumni_Group_Key  INT 
			, Association_Group_Key  INT 
			, Award_Group_Key  INT 
			, Drop_Include_Group_Key  INT 
			, Email_Group_Key  INT 
			, Employment_Group_Key  INT 
			, Language_Group_Key  INT 
			, Phone_Group_Key  INT 
			, Psa_Group_Key  INT 
			, Connection_Group_Key INT
			, Id_Group_Key INT
			, Interest_Group_Key INT
			, Student_Group_Key INT
			, Hier_Key  NVARCHAR(100) 
			, Fund_Key  NVARCHAR(100) 
			, User_Key  NVARCHAR(100) 
			, Donor_Primary_Yn  NVARCHAR(1)                                      
			, Donation_Credit_Amt  MONEY 
			, Donation_Primary_Amt  MONEY 
			, Plus_EntitledBenefitValue MONEY
			, Donation_Key NVARCHAR(100)
			, Plus_Type NVARCHAR(500)
			, Plus_SharedCreditType NVARCHAR(500)
			, Appeal_Key NVARCHAR(100)
			, Donation_Receipt_Ytd_Last_Week_Amt MONEY
			, Donation_Receipt_Ytd_Last_Week_Last_Year_Amt MONEY
			, Donation_Receipt_Ytd_Two_Weeks_Ago_Amt MONEY
			, Inspired_Learning_Yearly_Goal MONEY
			, Inspired_Learning_Yearly_Goal_by_Account MONEY
			, Inspired_Learning_Total_Initiative_Goal MONEY
			, Inspired_Learning_Total_Initiative_Goal_by_Account MONEY
			, Initiative_Key NVARCHAR(100)
			, Expectancy_Key NVARCHAR(100)
			, User_Coordinating_Liaison_Key NVARCHAR(100)
			, User_Pending_Liaison_Key NVARCHAR(100)
			, User_Connected_Liaison_Key NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Acitivity_Group_Key 
			, Address_Group_Key 
			, Alumni_Group_Key 
			, Association_Group_Key 
			, Award_Group_Key 
			, Drop_Include_Group_Key 
			, Email_Group_Key 
			, Employment_Group_Key 
			, Language_Group_Key 
			, Phone_Group_Key 
			, Psa_Group_Key 
			, Connection_Group_Key
			, Id_Group_Key
			, Interest_Group_Key
			, Student_Group_Key
			, Hier_Key
			, Fund_Key
			, User_Key 
			, Donor_Primary_Yn 
			, Donation_Credit_Amt 
			, Donation_Primary_Amt 
			, Plus_EntitledBenefitValue
			, Donation_Key
			, Plus_Type
			, Plus_SharedCreditType
			, Appeal_Key
			, Donation_Receipt_Ytd_Last_Week_Amt
			, Donation_Receipt_Ytd_Last_Week_Last_Year_Amt
			, Donation_Receipt_Ytd_Two_Weeks_Ago_Amt
			, Inspired_Learning_Yearly_Goal
			, Inspired_Learning_Yearly_Goal_by_Account
			, Inspired_Learning_Total_Initiative_Goal
			, Inspired_Learning_Total_Initiative_Goal_by_Account
			, Initiative_Key
			, Expectancy_Key
			, User_Coordinating_Liaison_Key
			, User_Pending_Liaison_Key
			, User_Connected_Liaison_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Dim_1 (Beginning to Byu_Student_Id)
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Dim' -- Source_Table
		, 'dbo._Donor_Dim_1' -- Destination_Table
		,'Donor_Key  NVARCHAR(100)
			, Activity_Group_Key  INT 
			, Address_Group_Key  INT 
			, Alumni_Group_Key  INT 
			, Association_Group_Key  INT 
			, Award_Group_Key  INT 
			, Drop_Include_Group_Key  INT 
			, Email_Group_Key  INT 
			, Employment_Group_Key  INT 
			, Language_Group_Key  INT 
			, Phone_Group_Key  INT 
			, Psa_Group_Key  INT 
			, Connection_Group_Key INT
			, Id_Group_Key INT
			, Interest_Group_Key INT
			, Affiliated_Key INT
			, Student_Group_Key INT
			, Donor_Ldsp_Id  NVARCHAR(100) 
			, Donor_Contact_Type  NVARCHAR(100) 
			, Donor_Organization_Id  NVARCHAR(100) 
			, Donor_Name  NVARCHAR(160) 
			, Donor_First_Name  NVARCHAR(50) 
			, Donor_Middle_Name  NVARCHAR(50) 
			, Donor_Last_Name  NVARCHAR(50) 
			, Donor_Nick_Name  NVARCHAR(50) 
			, Donor_Middle_Name2  NVARCHAR(100) 
			, Donor_Last_Name2  NVARCHAR(100) 
			, Donor_Preferred_Name  NVARCHAR(100) 
			, Donor_Display_Name  NVARCHAR(100) 
			, Donor_Maiden_Name  NVARCHAR(100) 
			, Donor_Title  NVARCHAR(100) 
			, Donor_Professional_Suffix  NVARCHAR(100) 
			, Donor_Personal_Suffix  NVARCHAR(400) 
			, Donor_Marriage_Status  NVARCHAR(400) 
			, Donor_Spouses_Name  NVARCHAR(100) 
			, Donor_Gender  NVARCHAR(400) 
			, Donor_Lds_Member  NVARCHAR(400) 
			, Donor_Current_Student_Yn  VARCHAR(1) 
			, Donor_Birth_Dt  DATE 
			, Donor_Birth_Dt_Day  NVARCHAR(100) 
			, Donor_Birth_Dt_Month  NVARCHAR(100) 
			, Donor_Birth_Dt_Year  NVARCHAR(100) 
			, Donor_Deceased_Dt  DATE 
			, Donor_Deceased_Dt_Day  NVARCHAR(100) 
			, Donor_Deceased_Dt_Month  NVARCHAR(100) 
			, Donor_Deceased_Dt_Year  NVARCHAR(100)  
			, Donor_Wealth_Dt  DATE 
			, Donor_Major_Gift_Propen  NVARCHAR(400) 
			, Donor_Annual_Gift  NVARCHAR(400) 
			, Donor_Planned_Gift  NVARCHAR(400) 
			, Donor_Gift_Capacity_Enp  NVARCHAR(400) 
			, Donor_Gift_Capacity_En  NVARCHAR(400) 
			, Donor_Philan_Cap_Rating  NVARCHAR(400) 
			, Donor_Est_Household_Income  NVARCHAR(400) 
			, Donor_Est_Home_Market_Val  NVARCHAR(400) 
			, Donor_Block_Clusters  NVARCHAR(400) 
			, Donor_Individual_Infor_Envel  NVARCHAR(300) 
			, Donor_Couple_Infor_Envel  NVARCHAR(300) 
			, Donor_Individual_Form_Envel  NVARCHAR(300) 
			, Donor_Couple_Form_Envel  NVARCHAR(300) 
			, Donor_Country  NVARCHAR(100) 
			, Donor_Org_Matches_Gifts_Yn  NVARCHAR(1) 
			, Donor_Deceased_Yn  NVARCHAR(1) 
			, Donor_Org_Allow_Mail_Yn  NVARCHAR(1) 
			, Donor_Org_Allow_Bulk_Mail_Yn  NVARCHAR(1) 
			, Donor_Org_Allow_Email_Yn  NVARCHAR(1) 
			, Donor_Org_Allow_Bulk_Email_Yn  NVARCHAR(1) 
			, Donor_Org_Allow_Phone_Yn  NVARCHAR(1) 
			, Donor_Org_Allow_Fax_Yn  NVARCHAR(1) 
			, Donor_Org_Class_Code  NVARCHAR(400) 
			, Donor_Org_Retiree_Ratio  NVARCHAR(400) 
			, Donor_Org_Split_Ratio  NVARCHAR(400) 
			, Donor_Org_Matching_Ratio  NVARCHAR(400) 
			, Donor_Org_Pref_Cont_Meth  NVARCHAR(400) 
			, Donor_Org_Description  NVARCHAR(4000) 
			, All_Personal_Connections NVARCHAR(4000)
			' -- Dest_Create_Fields
		, 'Donor_Key      
			, Activity_Group_Key 
			, Address_Group_Key 
			, Alumni_Group_Key 
			, Association_Group_Key 
			, Award_Group_Key 
			, Drop_Include_Group_Key 
			, Email_Group_Key 
			, Employment_Group_Key 
			, Language_Group_Key 
			, Phone_Group_Key 
			, Psa_Group_Key 
			, Connection_Group_Key
			, Id_Group_Key
			, Interest_Group_Key
			, Affiliated_Key
			, Student_Group_Key
			, Donor_Ldsp_Id 
			, Donor_Contact_Type 
			, Donor_Organization_Id 
			, Donor_Name 
			, Donor_First_Name
			, Donor_Middle_Name
			, Donor_Last_Name 
			, Donor_Nick_Name 
			, Donor_Middle_Name2 
			, Donor_Last_Name2
			, Donor_Preferred_Name
			, Donor_Display_Name
			, Donor_Maiden_Name
			, Donor_Title
			, Donor_Professional_Suffix 
			, Donor_Personal_Suffix 
			, Donor_Marriage_Status 
			, Donor_Spouses_Name 
			, Donor_Gender 
			, Donor_Lds_Member 
			, Donor_Current_Student_Yn 
			, Donor_Birth_Dt 
			, Donor_Birth_Dt_Day 
			, Donor_Birth_Dt_Month 
			, Donor_Birth_Dt_Year 
			, Donor_Deceased_Dt
			, Donor_Deceased_Dt_Day 
			, Donor_Deceased_Dt_Month
			, Donor_Deceased_Dt_Year 
			, Donor_Wealth_Dt
			, Donor_Major_Gift_Propen 
			, Donor_Annual_Gift 
			, Donor_Planned_Gift
			, Donor_Gift_Capacity_Enp 
			, Donor_Gift_Capacity_En 
			, Donor_Philan_Cap_Rating 
			, Donor_Est_Household_Income 
			, Donor_Est_Home_Market_Val 
			, Donor_Block_Clusters
			, Donor_Individual_Infor_Envel
			, Donor_Couple_Infor_Envel 
			, Donor_Individual_Form_Envel 
			, Donor_Couple_Form_Envel 
			, Donor_Country
			, Donor_Org_Matches_Gifts_Yn 
			, Donor_Deceased_Yn
			, Donor_Org_Allow_Mail_Yn
			, Donor_Org_Allow_Bulk_Mail_Yn
			, Donor_Org_Allow_Email_Yn
			, Donor_Org_Allow_Bulk_Email_Yn 
			, Donor_Org_Allow_Phone_Yn
			, Donor_Org_Allow_Fax_Yn
			, Donor_Org_Class_Code
			, Donor_Org_Retiree_Ratio 
			, Donor_Org_Split_Ratio
			, Donor_Org_Matching_Ratio
			, Donor_Org_Pref_Cont_Meth
			, Donor_Org_Description 
			, All_Personal_Connections
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Dim_2  (Byu_Student_Id to Donor_Total_Giving_To_Byui_Current_Year_Amt)
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Dim' -- Source_Table
		, 'dbo._Donor_Dim_2' -- Destination_Table
		,'Donor_Key  NVARCHAR(100)
			, Byu_Student_Id NVARCHAR(100)
			, ByuI_Student_Id NVARCHAR(100)
			, ByuH_Student_Id NVARCHAR(100)
			, Ldsbc_Student_Id NVARCHAR(100)
			, Byu_Employee_Id NVARCHAR(100)
			, ByuI_Employee_Id NVARCHAR(100)
			, ByuH_Employee_Id NVARCHAR(100)
			, Ldsbc_Employee_Id NVARCHAR(100)
			, Spouse_Name NVARCHAR(100)
			, Spouse_LdspId INT
			, Ces_Id NVARCHAR(100)
			, Church_Payroll_Id NVARCHAR(100)
			, Donor_Total_Name  NVARCHAR(200)
			, Donor_Total_Donation NVARCHAR(50)
			, Plus_PreferredFirstName NVARCHAR(100)
			, Plus_PreferredMiddleName NVARCHAR(100)
			, Plus_PreferredLastName NVARCHAR(100)
			, Plus_PreferredFullName NVARCHAR(100)
			, Plus_SpousePreferredFirstName NVARCHAR(100)
			, Plus_SpousePreferredMiddleName NVARCHAR(100)
			, Plus_SpousePreferredLastName NVARCHAR(100)
			, Plus_SpousePreferredFullName NVARCHAR(100)
			, Plus_CoordinatingLiaison NVARCHAR(200)
			, Plus_ConnectedLiaison NVARCHAR(200)
			, Plus_PendingLiaison NVARCHAR(200)
			, Byu_Degrees NVARCHAR(4000)
			, ByuI_Degrees NVARCHAR(4000)
			, ByuH_Degrees NVARCHAR(4000)
			, Ldsbc_Degrees NVARCHAR(4000)
			, Donor_Age INT
			, General_Authority NVARCHAR(1)
			, Emeritus_General_Authority NVARCHAR(1)
			, Mission_President NVARCHAR(1)
			, Temple_President NVARCHAR(1)
			, All_Employment NVARCHAR(4000) 
			, Current_Employment NVARCHAR(4000)
			, Former_Employment NVARCHAR(4000)
			, Spouse_Phone_Number NVARCHAR(100)
			, Spouse_Email NVARCHAR(100) 
			, Spouse_First_Name NVARCHAR(100)
			, Spouse_Last_Name NVARCHAR(100)
			, Spouse_Birth_Date DATE
			, Spouse_Age INT
			, Byu_Donor NVARCHAR(1)
			, ByuI_Donor NVARCHAR(1)
			, ByuH_Donor NVARCHAR(1)
			, Ldsbc_Donor NVARCHAR(1)
			, Cell_Phone NVARCHAR(100)
			, Current_Employer_Name NVARCHAR(160)
			, Current_Job_Title NVARCHAR(100)
			, Current_Job_Code NVARCHAR(100)
			, Current_Job_Date_Started DATE
			, Current_Job_Work_Phone NVARCHAR(100)
			, Current_Job_Work_Address NVARCHAR(300)
			, Donor_Total_Giving_Current_Year MONEY
			, Donor_Total_Giving_Current_Year_Minus_1 MONEY
			, Donor_Total_Giving_Current_Year_Minus_2 MONEY
			, Donor_Total_Giving_Current_Year_Minus_3 MONEY
			, Donor_Any_School_Current_Student NVARCHAR(1)
			, Donor_BYU_Current_Student NVARCHAR(1)
			, Donor_BYUI_Current_Student NVARCHAR(1)
			, Donor_BYUH_Current_Student NVARCHAR(1)
			, Donor_LDSBC_Current_Student NVARCHAR(1)
			, Donor_Given_This_Year_To_Byu NVARCHAR(1)
			, Donor_Given_This_Year_To_ByuI NVARCHAR(1)
			, Donor_Given_This_Year_To_ByuH NVARCHAR(1)
			, Donor_Given_This_Year_To_LDSBC NVARCHAR(1)
			, Donor_Byu_Plc NVARCHAR(1)
			, Donor_Byuh_Plc NVARCHAR(1)
			, Donor_Nac NVARCHAR(1)
			, Donor_Byu_Law_Grads NVARCHAR(1)
			, Donor_Byu_Msm_Grads NVARCHAR(1)
			, Donor_Open_Byu_Telefund_Pledge NVARCHAR(1)
			, Donor_Open_Byui_Telefund_Pledge NVARCHAR(1)
			, Donor_Open_Byuh_Telefund_Pledge NVARCHAR(1)
			, Donor_Open_Ldsbc_Telefund_Pledge NVARCHAR(1)
			, Donor_Byu_Recurring_Donor NVARCHAR(1)
			, Donor_Byui_Recurring_Donor NVARCHAR(1)
			, Donor_Byuh_Recurring_Donor NVARCHAR(1)
			, Donor_Ldsbc_Recurring_Donor NVARCHAR(1)
			, Donor_Ldsp_Text_Lines NVARCHAR(4000)
			, Donor_Largest_Gift_Amt_Byu MONEY
			, Donor_Largest_Gift_Amt_Byui MONEY
			, Donor_Largest_Gift_Amt_Byuh MONEY
			, Donor_Largest_Gift_Amt_Ldsbc MONEY
			, Donor_Retention_Type_Code_Byu NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc NVARCHAR(2)
			, Donor_Total_Giving_To_Byu_Current_Year_Amt MONEY
			, Donor_Total_Giving_To_Byu_Current_Year_Minus_1_Amt  MONEY
			, Donor_Total_Giving_To_Byu_Current_Year_Minus_2_Amt  MONEY
			, Donor_Total_Giving_To_Byu_Current_Year_Minus_3_Amt  MONEY
			' -- Dest_Create_Fields
		, 'Donor_Key      
			, Byu_Student_Id
			, ByuI_Student_Id
			, ByuH_Student_Id
			, Ldsbc_Student_Id
			, Byu_Employee_Id
			, ByuI_Employee_Id
			, ByuH_Employee_Id
			, Ldsbc_Employee_Id
			, Spouse_Name
			, Spouse_LdspId
			, Ces_Id
			, Church_Payroll_Id
			, Donor_Total_Name
			, Donor_Total_Donation
			, Plus_PreferredFirstName
			, Plus_PreferredMiddleName
			, Plus_PreferredLastName
			, Plus_PreferredFullName
			, Plus_SpousePreferredFirstName
			, Plus_SpousePreferredMiddleName
			, Plus_SpousePreferredLastName
			, Plus_SpousePreferredFullName
			, Plus_CoordinatingLiaison
			, Plus_ConnectedLiaison
			, Plus_PendingLiaison
			, Byu_Degrees
			, ByuI_Degrees
			, ByuH_Degrees
			, Ldsbc_Degrees
			, Donor_Age
			, General_Authority
			, Emeritus_General_Authority
			, Mission_President
			, Temple_President
			, All_Employment 
			, Current_Employment
			, Former_Employment
			, Spouse_Phone_Number
			, Spouse_Email 
			, Spouse_First_Name
			, Spouse_Last_Name
			, Spouse_Birth_Date
			, Spouse_Age
			, Byu_Donor
			, ByuI_Donor
			, ByuH_Donor
			, Ldsbc_Donor
			, Cell_Phone
			, Current_Employer_Name
			, Current_Job_Title
			, Current_Job_Code
			, Current_Job_Date_Started
			, Current_Job_Work_Phone
			, Current_Job_Work_Address
			, Donor_Total_Giving_Current_Year
			, Donor_Total_Giving_Current_Year_Minus_1
			, Donor_Total_Giving_Current_Year_Minus_2
			, Donor_Total_Giving_Current_Year_Minus_3
			, Donor_Any_School_Current_Student
			, Donor_BYU_Current_Student
			, Donor_BYUI_Current_Student
			, Donor_BYUH_Current_Student
			, Donor_LDSBC_Current_Student
			, Donor_Given_This_Year_To_Byu
			, Donor_Given_This_Year_To_ByuI
			, Donor_Given_This_Year_To_ByuH
			, Donor_Given_This_Year_To_LDSBC
			, Donor_Byu_Plc
			, Donor_Byuh_Plc
			, Donor_Nac
			, Donor_Byu_Law_Grads
			, Donor_Byu_Msm_Grads
			, Donor_Open_Byu_Telefund_Pledge
			, Donor_Open_Byui_Telefund_Pledge
			, Donor_Open_Byuh_Telefund_Pledge
			, Donor_Open_Ldsbc_Telefund_Pledge
			, Donor_Byu_Recurring_Donor
			, Donor_Byui_Recurring_Donor
			, Donor_Byuh_Recurring_Donor
			, Donor_Ldsbc_Recurring_Donor
			, Donor_Ldsp_Text_Lines
			, Donor_Largest_Gift_Amt_Byu
			, Donor_Largest_Gift_Amt_Byui
			, Donor_Largest_Gift_Amt_Byuh
			, Donor_Largest_Gift_Amt_Ldsbc
			, Donor_Retention_Type_Code_Byu
			, Donor_Retention_Type_Code_Byui
			, Donor_Retention_Type_Code_Byuh
			, Donor_Retention_Type_Code_Ldsbc
			, Donor_Total_Giving_To_Byu_Current_Year_Amt
			, Donor_Total_Giving_To_Byu_Current_Year_Minus_1_Amt
			, Donor_Total_Giving_To_Byu_Current_Year_Minus_2_Amt
			, Donor_Total_Giving_To_Byu_Current_Year_Minus_3_Amt
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Dim_3  (Donor_Total_Giving_To_Byui_Current_Year_Amt to Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years)
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Dim' -- Source_Table
		, 'dbo._Donor_Dim_3' -- Destination_Table
		,'Donor_Key  NVARCHAR(100)
			, Donor_Total_Giving_To_Byui_Current_Year_Amt  MONEY
			, Donor_Total_Giving_To_Byui_Current_Year_Minus_1_Amt  MONEY
			, Donor_Total_Giving_To_Byui_Current_Year_Minus_2_Amt  MONEY
			, Donor_Total_Giving_To_Byui_Current_Year_Minus_3_Amt  MONEY
			, Donor_Total_Giving_To_Byuh_Current_Year_Amt  MONEY
			, Donor_Total_Giving_To_Byuh_Current_Year_Minus_1_Amt MONEY
			, Donor_Total_Giving_To_Byuh_Current_Year_Minus_2_Amt MONEY
			, Donor_Total_Giving_To_Byuh_Current_Year_Minus_3_Amt  MONEY
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Amt  MONEY
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_1_Amt  MONEY
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_2_Amt  MONEY
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_3_Amt  MONEY
			, Donor_Total_Giving_To_Byu_Current_Year_Minus_4_Amt  MONEY
			, Donor_Total_Giving_To_Byu_Current_Year_Minus_5_Amt  MONEY
			, Donor_Total_Giving_To_Byui_Current_Year_Minus_4_Amt  MONEY
			, Donor_Total_Giving_To_Byui_Current_Year_Minus_5_Amt  MONEY
			, Donor_Total_Giving_To_Byuh_Current_Year_Minus_4_Amt MONEY
			, Donor_Total_Giving_To_Byuh_Current_Year_Minus_5_Amt MONEY
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_4_Amt  MONEY
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_5_Amt  MONEY
			, Donor_Total_Giving_Current_Year_Minus_4_Amt  MONEY
			, Donor_Total_Giving_Current_Year_Minus_5_Amt  MONEY
			, Donor_Total_Giving_Byu_High_Flag NVARCHAR(1)
			, Donor_Total_Giving_Byui_High_Flag NVARCHAR(1)
			, Donor_Total_Giving_Byuh_High_Flag NVARCHAR(1)
			, Donor_Total_Giving_Ldsbc_High_Flag NVARCHAR(1)
			, Current_Byu_Employment_Yn NVARCHAR(1)
			, Current_Byui_Employment_Yn NVARCHAR(1)
			, Current_Byuh_Employment_Yn NVARCHAR(1)
			, Current_Ldsbc_Employment_Yn NVARCHAR(1)
			, Informal_Mailing_Name NVARCHAR(300)
			, Informal_Salutation NVARCHAR(200)
			, Byu_Night_Society_Member NVARCHAR(1)
			, Byui_Legacy_Society_Member NVARCHAR(1)
			, Byuh_Cowley_Society_Member NVARCHAR(1)
			, Ldsbc_Fox_Society_Member NVARCHAR(1)
			, Donor_Spouse_Coordinating_Liaison NVARCHAR(400)
			, Donor_Previously_Contacted_Byu_Yn NVARCHAR(1)
			, Donor_Previously_Contacted_Byui_Yn NVARCHAR(1)
			, Donor_Previously_Contacted_Byuh_Yn NVARCHAR(1)
			, Donor_Previously_Contacted_Ldsbc_Yn NVARCHAR(1)
			, Donor_Given_Last_3_Months_To_Byu NVARCHAR(1)
			, Donor_Given_Last_3_Months_To_Byui NVARCHAR(1)
			, Donor_Given_Last_3_Months_To_Byuh NVARCHAR(1)
			, Donor_Given_Last_3_Months_To_Ldsbc NVARCHAR(1)
			, Donor_Given_Last_3_Months_To_Church NVARCHAR(1)
			, Donor_Liaison_Connections NVARCHAR(4000)
			, Donor_Total_Lifetime_Giving MONEY
			, Donor_Total_Lifetime_Giving_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_Byu MONEY
			, Donor_Total_Lifetime_Giving_Byui MONEY
			, Donor_Total_Lifetime_Giving_Byuh MONEY
			, Donor_Total_Lifetime_Giving_Ldsbc MONEY
			, Donor_Total_Lifetime_Giving_Church MONEY
			, Donor_Total_Lifetime_Giving_Pcc MONEY
			, Donor_Total_Lifetime_Giving_Ces MONEY
			, Donor_Most_Recent_Gift_Date_Ldsp DATE
			, Donor_Most_Recent_Gift_Date_Byu DATE
			, Donor_Most_Recent_Gift_Date_Byui DATE
			, Donor_Most_Recent_Gift_Date_Byuh DATE
			, Donor_Most_Recent_Gift_Date_Ldsbc DATE
			, Donor_Most_Recent_Gift_Date_Church DATE
			, Donor_Ldsp_Largest_Gift MONEY
			, Donor_First_Gift_Post_Date_Byu DATE
			, Donor_First_Gift_Post_Date_Byui DATE
			, Donor_First_Gift_Post_Date_Byuh DATE
			, Donor_First_Gift_Post_Date_Ldsbc DATE
			, Donor_Furthest_Initiative_Stage NVARCHAR(400)
			, Donor_Number_Of_Open_Initiatives INT
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Donor_Total_Giving_To_Byui_Current_Year_Amt
			, Donor_Total_Giving_To_Byui_Current_Year_Minus_1_Amt
			, Donor_Total_Giving_To_Byui_Current_Year_Minus_2_Amt
			, Donor_Total_Giving_To_Byui_Current_Year_Minus_3_Amt
			, Donor_Total_Giving_To_Byuh_Current_Year_Amt
			, Donor_Total_Giving_To_Byuh_Current_Year_Minus_1_Amt
			, Donor_Total_Giving_To_Byuh_Current_Year_Minus_2_Amt
			, Donor_Total_Giving_To_Byuh_Current_Year_Minus_3_Amt
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Amt
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_1_Amt
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_2_Amt
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_3_Amt
			, Donor_Total_Giving_To_Byu_Current_Year_Minus_4_Amt
			, Donor_Total_Giving_To_Byu_Current_Year_Minus_5_Amt
			, Donor_Total_Giving_To_Byui_Current_Year_Minus_4_Amt
			, Donor_Total_Giving_To_Byui_Current_Year_Minus_5_Amt
			, Donor_Total_Giving_To_Byuh_Current_Year_Minus_4_Amt
			, Donor_Total_Giving_To_Byuh_Current_Year_Minus_5_Amt
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_4_Amt
			, Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_5_Amt
			, Donor_Total_Giving_Current_Year_Minus_4_Amt
			, Donor_Total_Giving_Current_Year_Minus_5_Amt
			, Donor_Total_Giving_Byu_High_Flag
			, Donor_Total_Giving_Byui_High_Flag
			, Donor_Total_Giving_Byuh_High_Flag
			, Donor_Total_Giving_Ldsbc_High_Flag
			, Current_Byu_Employment_Yn
			, Current_Byui_Employment_Yn
			, Current_Byuh_Employment_Yn
			, Current_Ldsbc_Employment_Yn
			, Informal_Mailing_Name
			, Informal_Salutation
			, Byu_Night_Society_Member
			, Byui_Legacy_Society_Member
			, Byuh_Cowley_Society_Member
			, Ldsbc_Fox_Society_Member
			, Donor_Spouse_Coordinating_Liaison
			, Donor_Previously_Contacted_Byu_Yn
			, Donor_Previously_Contacted_Byui_Yn
			, Donor_Previously_Contacted_Byuh_Yn
			, Donor_Previously_Contacted_Ldsbc_Yn
			, Donor_Given_Last_3_Months_To_Byu
			, Donor_Given_Last_3_Months_To_Byui
			, Donor_Given_Last_3_Months_To_Byuh
			, Donor_Given_Last_3_Months_To_Ldsbc
			, Donor_Given_Last_3_Months_To_Church
			, Donor_Liaison_Connections
			, Donor_Total_Lifetime_Giving
			, Donor_Total_Lifetime_Giving_Last_5_Years
			, Donor_Total_Lifetime_Giving_Byu
			, Donor_Total_Lifetime_Giving_Byui
			, Donor_Total_Lifetime_Giving_Byuh
			, Donor_Total_Lifetime_Giving_Ldsbc
			, Donor_Total_Lifetime_Giving_Church
			, Donor_Total_Lifetime_Giving_Pcc
			, Donor_Total_Lifetime_Giving_Ces
			, Donor_Most_Recent_Gift_Date_Ldsp
			, Donor_Most_Recent_Gift_Date_Byu
			, Donor_Most_Recent_Gift_Date_Byui
			, Donor_Most_Recent_Gift_Date_Byuh
			, Donor_Most_Recent_Gift_Date_Ldsbc
			, Donor_Most_Recent_Gift_Date_Church
			, Donor_Ldsp_Largest_Gift
			, Donor_First_Gift_Post_Date_Byu
			, Donor_First_Gift_Post_Date_Byui
			, Donor_First_Gift_Post_Date_Byuh
			, Donor_First_Gift_Post_Date_Ldsbc
			, Donor_Furthest_Initiative_Stage
			, Donor_Number_Of_Open_Initiatives
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Dim_4  (Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years to Donor_Retention_Type_Code_Ldsbc_Minus_1)
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Dim' -- Source_Table
		, 'dbo._Donor_Dim_4' -- Destination_Table
		,'Donor_Key  NVARCHAR(100)
			, Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Byui_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Byuh_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Ldsbc_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Church_Last_5_Years MONEY
			, Donor_Most_Recent_Gift_To_Ldsp_Amt MONEY
			, Donor_Most_Recent_Gift_To_Byu_Amt MONEY
			, Donor_Most_Recent_Gift_To_Byui_Amt MONEY
			, Donor_Most_Recent_Gift_To_Byuh_Amt MONEY
			, Donor_Most_Recent_Gift_To_Ldsbc_Amt MONEY
			, Donor_Most_Recent_Gift_To_Church_Amt MONEY
			, Donor_Last_F2F_Visit_Date DATE
			, Donor_Type_Code_Ldsp NVARCHAR(2)
			, Donor_Largest_Gift_Amt_Church MONEY
			, Donor_Largest_Gift_Date_Ldsp DATE
			, Donor_Largest_Gift_Date_Byu DATE
			, Donor_Largest_Gift_Date_Byui DATE
			, Donor_Largest_Gift_Date_Byuh DATE
			, Donor_Largest_Gift_Date_Ldsbc DATE
			, Donor_Largest_Gift_Date_Church DATE
			, Donor_Institution_Giving_Areas NVARCHAR(1000)
			, Donor_Byu_Giving_Areas NVARCHAR(2000)
			, Donor_Church_Giving_Areas NVARCHAR(2000)
			, Donor_Pledge_Reminder_Email_Content_Byu NVARCHAR(2000)
			, Donor_Pledge_Reminder_Email_Content_Byui NVARCHAR(2000)
			, Donor_Pledge_Reminder_Email_Content_Byuh NVARCHAR(2000)
			, Donor_Pledge_Reminder_Email_Content_Ldsbc NVARCHAR(2000)
			, Donor_Total_Name_Display NVARCHAR(200)
			, Plus_CoordinatingLiaison_DomainName NVARCHAR(1024)
			, Plus_PendingLiaison_DomainName NVARCHAR(1024)
			, Plus_ConnectedLiaison_DomainName NVARCHAR(1024)
			, Donor_Gift_Count_Previous_5_Years INT
			, Donor_Average_Single_Gift_Previous_5_Years MONEY
			, Donor_Is_Qualified NVARCHAR(1)
			, Donor_Qualified_On DATE 
			, Donor_Qualified_By NVARCHAR(200)
			, Donor_First_Recurring_Rule_Date_Byu DATE
			, Donor_First_Recurring_Rule_Date_Byui DATE
			, Donor_First_Recurring_Rule_Date_Byuh DATE
			, Donor_First_Recurring_Rule_Date_Ldsbc DATE
			, Donor_Recurring_Total_Last_Month_Byu MONEY
			, Donor_Recurring_Total_Last_Month_Byui MONEY
			, Donor_Recurring_Total_Last_Month_Byuh MONEY
			, Donor_Recurring_Total_Last_Month_Ldsbc MONEY
			, Donor_Recurring_Total_Month_Before_Last_Byu MONEY
			, Donor_Recurring_Total_Month_Before_Last_Byui MONEY
			, Donor_Recurring_Total_Month_Before_Last_Byuh MONEY
			, Donor_Recurring_Total_Month_Before_Last_Ldsbc MONEY
			, Donor_Recurring_Gift_Upgrade_Byu NVARCHAR(1)
			, Donor_Recurring_Gift_Upgrade_Byui NVARCHAR(1)
			, Donor_Recurring_Gift_Upgrade_Byuh NVARCHAR(1)
			, Donor_Recurring_Gift_Upgrade_Ldsbc NVARCHAR(1)
			, Donor_Total_Giving_To_Church_Current_Year_Amt MONEY
			, Donor_Total_Giving_To_Church_Current_Year_Minus_1_Amt MONEY
			, Donor_Total_Giving_To_Church_Current_Year_Minus_2_Amt MONEY
			, Donor_Total_Giving_To_Church_Current_Year_Minus_3_Amt MONEY
			, Donor_Total_Giving_To_Church_Current_Year_Minus_4_Amt MONEY
			, Donor_Total_Giving_To_Church_Current_Year_Minus_5_Amt MONEY
			, Donor_Retention_Type_Code_Byu_Minus_1 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byu_Minus_2 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byu_Minus_3 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byu_Minus_4 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byu_Minus_5 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui_Minus_1 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui_Minus_2 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui_Minus_3 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui_Minus_4 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui_Minus_5 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh_Minus_1 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh_Minus_2 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh_Minus_3 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh_Minus_4 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh_Minus_5 NVARCHAR(2)
			' -- Dest_Create_Fields
		, 'Donor_Key      
			, Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Byui_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Byuh_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Ldsbc_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Church_Last_5_Years
			, Donor_Most_Recent_Gift_To_Ldsp_Amt
			, Donor_Most_Recent_Gift_To_Byu_Amt
			, Donor_Most_Recent_Gift_To_Byui_Amt
			, Donor_Most_Recent_Gift_To_Byuh_Amt
			, Donor_Most_Recent_Gift_To_Ldsbc_Amt
			, Donor_Most_Recent_Gift_To_Church_Amt
			, Donor_Last_F2F_Visit_Date
			, Donor_Type_Code_Ldsp
			, Donor_Largest_Gift_Amt_Church
			, Donor_Largest_Gift_Date_Ldsp
			, Donor_Largest_Gift_Date_Byu
			, Donor_Largest_Gift_Date_Byui
			, Donor_Largest_Gift_Date_Byuh
			, Donor_Largest_Gift_Date_Ldsbc
			, Donor_Largest_Gift_Date_Church
			, Donor_Institution_Giving_Areas
			, Donor_Byu_Giving_Areas
			, Donor_Church_Giving_Areas
			, Donor_Pledge_Reminder_Email_Content_Byu
			, Donor_Pledge_Reminder_Email_Content_Byui
			, Donor_Pledge_Reminder_Email_Content_Byuh
			, Donor_Pledge_Reminder_Email_Content_Ldsbc
			, Donor_Total_Name_Display
			, Plus_CoordinatingLiaison_DomainName
			, Plus_PendingLiaison_DomainName
			, Plus_ConnectedLiaison_DomainName
			, Donor_Gift_Count_Previous_5_Years
			, Donor_Average_Single_Gift_Previous_5_Years
			, Donor_Is_Qualified
			, Donor_Qualified_On 
			, Donor_Qualified_By
			, Donor_First_Recurring_Rule_Date_Byu
			, Donor_First_Recurring_Rule_Date_Byui
			, Donor_First_Recurring_Rule_Date_Byuh
			, Donor_First_Recurring_Rule_Date_Ldsbc
			, Donor_Recurring_Total_Last_Month_Byu
			, Donor_Recurring_Total_Last_Month_Byui
			, Donor_Recurring_Total_Last_Month_Byuh
			, Donor_Recurring_Total_Last_Month_Ldsbc
			, Donor_Recurring_Total_Month_Before_Last_Byu
			, Donor_Recurring_Total_Month_Before_Last_Byui
			, Donor_Recurring_Total_Month_Before_Last_Byuh
			, Donor_Recurring_Total_Month_Before_Last_Ldsbc
			, Donor_Recurring_Gift_Upgrade_Byu
			, Donor_Recurring_Gift_Upgrade_Byui
			, Donor_Recurring_Gift_Upgrade_Byuh
			, Donor_Recurring_Gift_Upgrade_Ldsbc
			, Donor_Total_Giving_To_Church_Current_Year_Amt
			, Donor_Total_Giving_To_Church_Current_Year_Minus_1_Amt
			, Donor_Total_Giving_To_Church_Current_Year_Minus_2_Amt
			, Donor_Total_Giving_To_Church_Current_Year_Minus_3_Amt
			, Donor_Total_Giving_To_Church_Current_Year_Minus_4_Amt
			, Donor_Total_Giving_To_Church_Current_Year_Minus_5_Amt
			, Donor_Retention_Type_Code_Byu_Minus_1
			, Donor_Retention_Type_Code_Byu_Minus_2
			, Donor_Retention_Type_Code_Byu_Minus_3
			, Donor_Retention_Type_Code_Byu_Minus_4
			, Donor_Retention_Type_Code_Byu_Minus_5
			, Donor_Retention_Type_Code_Byui_Minus_1
			, Donor_Retention_Type_Code_Byui_Minus_2
			, Donor_Retention_Type_Code_Byui_Minus_3
			, Donor_Retention_Type_Code_Byui_Minus_4
			, Donor_Retention_Type_Code_Byui_Minus_5
			, Donor_Retention_Type_Code_Byuh_Minus_1
			, Donor_Retention_Type_Code_Byuh_Minus_2
			, Donor_Retention_Type_Code_Byuh_Minus_3
			, Donor_Retention_Type_Code_Byuh_Minus_4
			, Donor_Retention_Type_Code_Byuh_Minus_5
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Dim_5  (Donor_Retention_Type_Code_Ldsbc_Minus_1 To End)
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Dim' -- Source_Table
		, 'dbo._Donor_Dim_5' -- Destination_Table
		,'Donor_Key  NVARCHAR(100)
			, Donor_Retention_Type_Code_Ldsbc_Minus_1 NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc_Minus_2 NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc_Minus_3 NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc_Minus_4 NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc_Minus_5 NVARCHAR(2)
			, Donor_First_Gift_To_Byu_Amt MONEY
			, Donor_First_Gift_To_Byui_Amt MONEY
			, Donor_First_Gift_To_Byuh_Amt MONEY
			, Donor_First_Gift_To_Ldsbc_Amt MONEY
			, Donor_First_Gift_To_Church_Amt MONEY
			, Donor_First_Gift_To_Ldsp_Amt MONEY
			, Donor_First_Gift_Date_Byu DATE
			, Donor_First_Gift_Date_Byui DATE
			, Donor_First_Gift_Date_Byuh DATE
			, Donor_First_Gift_Date_Ldsbc DATE
			, Donor_First_Gift_Date_Church DATE
			, Donor_First_Gift_Date_Ldsp DATE
			, Donor_Spouse_Middle_Name NVARCHAR(50)
			, Donor_Spouse_Birth_Name NVARCHAR(100)
			, Donor_Total_Giving_Current_Year_With_Matching MONEY
			, Donor_Total_Giving_Current_Year_Minus_1_With_Matching MONEY
			, Donor_Total_Giving_Current_Year_Minus_2_With_Matching MONEY
			, Donor_Total_Giving_Current_Year_Minus_3_With_Matching MONEY
			, Donor_Total_Giving_Current_Year_Minus_4_With_Matching MONEY
			, Donor_Total_Giving_Current_Year_Minus_5_With_Matching MONEY
			, Donor_Lds_TelefundNotes NVARCHAR(4000)
			' -- Dest_Create_Fields
		, 'Donor_Key      
			, Donor_Retention_Type_Code_Ldsbc_Minus_1
			, Donor_Retention_Type_Code_Ldsbc_Minus_2
			, Donor_Retention_Type_Code_Ldsbc_Minus_3
			, Donor_Retention_Type_Code_Ldsbc_Minus_4
			, Donor_Retention_Type_Code_Ldsbc_Minus_5
			, Donor_First_Gift_To_Byu_Amt
			, Donor_First_Gift_To_Byui_Amt
			, Donor_First_Gift_To_Byuh_Amt
			, Donor_First_Gift_To_Ldsbc_Amt
			, Donor_First_Gift_To_Church_Amt
			, Donor_First_Gift_To_Ldsp_Amt
			, Donor_First_Gift_Date_Byu
			, Donor_First_Gift_Date_Byui
			, Donor_First_Gift_Date_Byuh
			, Donor_First_Gift_Date_Ldsbc
			, Donor_First_Gift_Date_Church
			, Donor_First_Gift_Date_Ldsp
			, Donor_Spouse_Middle_Name
			, Donor_Spouse_Birth_Name
			, Donor_Total_Giving_Current_Year_With_Matching
			, Donor_Total_Giving_Current_Year_Minus_1_With_Matching
			, Donor_Total_Giving_Current_Year_Minus_2_With_Matching
			, Donor_Total_Giving_Current_Year_Minus_3_With_Matching
			, Donor_Total_Giving_Current_Year_Minus_4_With_Matching
			, Donor_Total_Giving_Current_Year_Minus_5_With_Matching
			, Donor_Lds_TelefundNotes
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Retention_Type_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Retention_Type_Dim' -- Source_Table
		, 'dbo._Donor_Retention_Type_Dim' -- Destination_Table
		,'Donor_Retention_Type_Key INT
			, Donor_Retention_Type_Code NVARCHAR(2)
			, Donor_Retention_Type_Description NVARCHAR(100)
			, Donor_Retention_Type_National_Average NUMERIC(10,4)
			, Donor_Retention_Type_Ldsp_Description NVARCHAR(200)
			, Donor_Retention_Type_Other_Description NVARCHAR(200)
			' -- Dest_Create_Fields
		, 'Donor_Retention_Type_Key
			, Donor_Retention_Type_Code
			, Donor_Retention_Type_Description
			, Donor_Retention_Type_National_Average
			, Donor_Retention_Type_Ldsp_Description
			, Donor_Retention_Type_Other_Description
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Drop_Include_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Drop_Include_Dim' -- Source_Table
		, 'dbo._Drop_Include_Dim' -- Destination_Table
		,'Drop_Include_Key INT
			, Drop_Include_Instit_Hierarchy  NVARCHAR(100)  
			, Drop_Include_Type  NVARCHAR(400) 
			, Drop_Include_Visit_Yn  NVARCHAR(1) 
			, Drop_Include_Web_Yn  NVARCHAR(1) 
			, Drop_Include_Phone_Yn  NVARCHAR(1)  
			, Drop_Include_Email_Yn  NVARCHAR(1) 
			, Drop_Include_Scope  NVARCHAR(400) 
			, Drop_Include_Comm_Type  NVARCHAR(400) 
			, Drop_Include_Type_Value  INT 
			, Drop_Include_Scope_Value  INT 
			, Drop_Include_Comm_Type_Value  INT 
			, Drop_Include_Reason_Value  INT 
			, Drop_Include_Group_Key  INT
			, Drop_Include_Mail_Yn NVARCHAR(1)
			, Drop_Include_Text_Yn NVARCHAR(1)
			, New_StartDate DATE
			, New_EndDate DATE
			, Association NVARCHAR(100)
			, Campaign NVARCHAR(128)
			, New_Inst NVARCHAR(100)
			, Hier_Name NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Drop_Include_Key
			, Drop_Include_Instit_Hierarchy 
			, Drop_Include_Type 
			, Drop_Include_Visit_Yn
			, Drop_Include_Web_Yn 
			, Drop_Include_Phone_Yn 
			, Drop_Include_Email_Yn
			, Drop_Include_Scope 
			, Drop_Include_Comm_Type 
			, Drop_Include_Type_Value
			, Drop_Include_Scope_Value
			, Drop_Include_Comm_Type_Value 
			, Drop_Include_Reason_Value 
			, Drop_Include_Group_Key
			, Drop_Include_Mail_Yn
			, Drop_Include_Text_Yn
			, New_StartDate
			, New_EndDate
			, Association
			, Campaign
			, New_Inst
			, Hier_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Drop_Logic_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Drop_Logic_Dim' -- Source_Table
		, 'dbo._Drop_Logic_Dim' -- Destination_Table
		,'Donor_Key NVARCHAR(100)
			, Drop_Byu_Mail_Ag NVARCHAR(1)
			, Drop_Byu_Email_Ag NVARCHAR(1)
			, Drop_Byu_Phone_Ag NVARCHAR(1)
			, Drop_Byui_Mail_Ag NVARCHAR(1)
			, Drop_Byui_Email_Ag NVARCHAR(1)
			, Drop_Byui_Phone_Ag NVARCHAR(1)
			, Drop_Byuh_Mail_Ag NVARCHAR(1)
			, Drop_Byuh_Email_Ag NVARCHAR(1)
			, Drop_Byuh_Phone_Ag NVARCHAR(1)
			, Drop_Ldsbc_Mail_Ag NVARCHAR(1)
			, Drop_Ldsbc_Email_Ag NVARCHAR(1)
			, Drop_Ldsbc_Phone_Ag NVARCHAR(1)
			, Drop_Byu_Mail_Acknowledgement NVARCHAR(1)
			, Drop_Byu_Email_Acknowledgement NVARCHAR(1)
			, Drop_Byu_Phone_Acknowledgement NVARCHAR(1)
			, Drop_Byui_Mail_Acknowledgement NVARCHAR(1)
			, Drop_Byui_Email_Acknowledgement NVARCHAR(1)
			, Drop_Byui_Phone_Acknowledgement NVARCHAR(1)
			, Drop_Byuh_Mail_Acknowledgement NVARCHAR(1)
			, Drop_Byuh_Email_Acknowledgement NVARCHAR(1)
			, Drop_Byuh_Phone_Acknowledgement NVARCHAR(1)
			, Drop_Ldsbc_Mail_Acknowledgement NVARCHAR(1)
			, Drop_Ldsbc_Email_Acknowledgement NVARCHAR(1)
			, Drop_Ldsbc_Phone_Acknowledgement NVARCHAR(1)
			, Drop_Church_Mail_Acknowledgement NVARCHAR(1)
			, Drop_Church_Email_Acknowledgement NVARCHAR(1)
			, Drop_Church_Phone_Acknowledgement NVARCHAR(1)
			, Drop_Pcc_Mail_Acknowledgement NVARCHAR(1)
			, Drop_Pcc_Email_Acknowledgement NVARCHAR(1)
			, Drop_Pcc_Phone_Acknowledgement NVARCHAR(1)
			, Drop_Byu_Mail_All NVARCHAR(1)
			, Drop_Byui_Mail_All NVARCHAR(1)
			, Drop_Byuh_Mail_All NVARCHAR(1)
			, Drop_Ldsbc_Mail_All NVARCHAR(1)
			, Drop_Church_Mail_All NVARCHAR(1)
			, Drop_Byu_Email_All NVARCHAR(1)
			, Drop_Byui_Email_All NVARCHAR(1)
			, Drop_Byuh_Email_All NVARCHAR(1)
			, Drop_Ldsbc_Email_All NVARCHAR(1)
			, Drop_Church_Email_All NVARCHAR(1)
			, Drop_Byu_Phone_All NVARCHAR(1)
			, Drop_Byui_Phone_All NVARCHAR(1)
			, Drop_Byuh_Phone_All NVARCHAR(1)
			, Drop_Ldsbc_Phone_All NVARCHAR(1)
			, Drop_Church_Phone_All NVARCHAR(1)
			, Drop_Byu_Overall NVARCHAR(1)
			, Drop_Byui_Overall NVARCHAR(1)
			, Drop_Byuh_Overall NVARCHAR(1)
			, Drop_Ldsbc_Overall NVARCHAR(1)
			, Drop_Church_Overall NVARCHAR(1)
			' -- Dest_Create_Fields
		, 'Donor_Key 
			, Drop_Byu_Mail_Ag 
			, Drop_Byu_Email_Ag
			, Drop_Byu_Phone_Ag
			, Drop_Byui_Mail_Ag 
			, Drop_Byui_Email_Ag
			, Drop_Byui_Phone_Ag
			, Drop_Byuh_Mail_Ag 
			, Drop_Byuh_Email_Ag
			, Drop_Byuh_Phone_Ag
			, Drop_Ldsbc_Mail_Ag 
			, Drop_Ldsbc_Email_Ag
			, Drop_Ldsbc_Phone_Ag
			, Drop_Byu_Mail_Acknowledgement
			, Drop_Byu_Email_Acknowledgement
			, Drop_Byu_Phone_Acknowledgement
			, Drop_Byui_Mail_Acknowledgement
			, Drop_Byui_Email_Acknowledgement
			, Drop_Byui_Phone_Acknowledgement
			, Drop_Byuh_Mail_Acknowledgement
			, Drop_Byuh_Email_Acknowledgement
			, Drop_Byuh_Phone_Acknowledgement
			, Drop_Ldsbc_Mail_Acknowledgement
			, Drop_Ldsbc_Email_Acknowledgement
			, Drop_Ldsbc_Phone_Acknowledgement
			, Drop_Church_Mail_Acknowledgement
			, Drop_Church_Email_Acknowledgement
			, Drop_Church_Phone_Acknowledgement
			, Drop_Pcc_Mail_Acknowledgement
			, Drop_Pcc_Email_Acknowledgement
			, Drop_Pcc_Phone_Acknowledgement
			, Drop_Byu_Mail_All
			, Drop_Byui_Mail_All
			, Drop_Byuh_Mail_All
			, Drop_Ldsbc_Mail_All
			, Drop_Church_Mail_All
			, Drop_Byu_Email_All
			, Drop_Byui_Email_All
			, Drop_Byuh_Email_All
			, Drop_Ldsbc_Email_All
			, Drop_Church_Email_All
			, Drop_Byu_Phone_All
			, Drop_Byui_Phone_All
			, Drop_Byuh_Phone_All
			, Drop_Ldsbc_Phone_All
			, Drop_Church_Phone_All
			, Drop_Byu_Overall
			, Drop_Byui_Overall
			, Drop_Byuh_Overall
			, Drop_Ldsbc_Overall
			, Drop_Church_Overall
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Email_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Email_Dim' -- Source_Table
		, 'dbo._Email_Dim' -- Destination_Table
		,'ContactId NVARCHAR(100) 
			, Email_Key  INT
			, Email_Group_Key  INT 
			, Email_Address  NVARCHAR(150) 
			, Email_Primary_Yn  NVARCHAR(1) 
			, Email_Type  NVARCHAR(400) 
			, Email_Type_Value  INT 
			, Email_Active_Yn  NVARCHAR(1) 
			, Email_Confirmed_Yn  NVARCHAR(1)
			, Email_Confidential_Yn  NVARCHAR(1)
			' -- Dest_Create_Fields
		, 'ContactId  
			, Email_Key 
			, Email_Group_Key 
			, Email_Address
			, Email_Primary_Yn 
			, Email_Type
			, Email_Type_Value 
			, Email_Active_Yn
			, Email_Confirmed_Yn
			, Email_Confidential_Yn
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Employment_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Employment_Dim' -- Source_Table
		, 'dbo._Employment_Dim' -- Destination_Table
		,'ContactId  NVARCHAR(100) 
			, Employment_Key  INT
			, Employment_Group_Key  INT 
			, Employment_Donor_Yn  NVARCHAR(1) 
			, Employment_Active_Yn  NVARCHAR(1) 
			, Employment_Church_Affil_Dept  NVARCHAR(100)
			, Employer NVARCHAR(100)
			, Job_Title NVARCHAR(100)
			, Job_Code NVARCHAR(100)
			, Industry NVARCHAR(100)
			, Source NVARCHAR(100)
			, Church_Affiliated NVARCHAR(1)
			, Start_Date DATE
			, End_Date         DATE
			, Internship NVARCHAR(1)
			, Church_Employment_Status NVARCHAR(400)
			, Employment_Institutional_Hierarchy NVARCHAR(100)
			, New_InstitutionalHierarchyId NVARCHAR(100)
			, Employer_Ldsp_Id NVARCHAR(100)
			, StatusCode NVARCHAR(400)
			, Employment_Modified_On_Date DATE
			, Employment_Lds_CampusAddress NVARCHAR(100)
			, Alternate_Organization_Name NVARCHAR(100)
			, Employment_Organization NVARCHAR(160)
			' -- Dest_Create_Fields
		, 'ContactId 
			, Employment_Key 
			, Employment_Group_Key 
			, Employment_Donor_Yn 
			, Employment_Active_Yn 
			, Employment_Church_Affil_Dept
			, Employer
			, Job_Title
			, Job_Code
			, Industry
			, Source
			, Church_Affiliated
			, Start_Date
			, End_Date         
			, Internship
			, Church_Employment_Status 
			, Employment_Institutional_Hierarchy
			, New_InstitutionalHierarchyId
			, Employer_Ldsp_Id
			, StatusCode
			, Employment_Modified_On_Date
			, Employment_Lds_CampusAddress
			, Alternate_Organization_Name
			, Employment_Organization
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Expectancy_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Expectancy_Dim' -- Source_Table
		, 'dbo._Expectancy_Dim' -- Destination_Table
		,'Expectancy_Key NVARCHAR(100)
			, Plus_Kind NVARCHAR(400)
			, Plus_TenderType NVARCHAR(400)
			, Plus_GiftSource NVARCHAR(400)
			, Plus_PlannedGift NVARCHAR(400)
			, Plus_CheckNumber NVARCHAR(50)
			, New_Confidential NVARCHAR(400)
			, Plus_AcknowledgementInstructions NVARCHAR(4000)
			, Plus_NewAccountInstructions NVARCHAR(4000)
			, Plus_SpecialGiftInstructions NVARCHAR(4000)
			, Plus_TelefundRep NVARCHAR(100)
			, Plus_PlannedGivingPaymentFrequency NVARCHAR(400)
			, New_Bookable NVARCHAR(400)
			, Plus_MatchExpected NVARCHAR(400)
			, Plus_GiftRevocability NVARCHAR(400)
			, Plus_RemainderBeneficiary NVARCHAR(400)
			, New_Documentation NVARCHAR(400)
			, Plus_Designation NVARCHAR(4000)
			, Plus_NameOfTrust  NVARCHAR(200)
			, plus_PlannedGivingType NVARCHAR(400)
			, Plus_VehicleType NVARCHAR(400)
			, Plus_VehicleSubType NVARCHAR(400)
			, Plus_PayoutRate DECIMAL
			, Plus_Duration NVARCHAR(400)
			, Plus_LivesType NVARCHAR(400)
			, Plus_Years INT
			, Plus_Lives DECIMAL
			, Plus_TermBeneficiaryLives DECIMAL
			, Plus_TermBeneficiaryYears INT
			, Plus_Cri DECIMAL
			, Plus_GpsNotes NVARCHAR(4000)
			, New_PledgeNumber NVARCHAR(100)
			, Status INT
			, Status_Reason NVARCHAR(400)
			, New_TotalPledged MONEY
			, New_BalanceDue_Base MONEY
			, New_TotalPaid_Base MONEY
			, New_PaymentsToMake INT
			, New_PaymentsReceived INT
			, New_InstallmentAmount_Base MONEY
			, Plus_FairMarketValue_Base MONEY
			, Plus_PresentValue_Base MONEY
			, Plus_PaymentAmount_Base MONEY
			, Plus_AnnualAmount_Base MONEY
			, New_BeginDate DATE
			, New_EndDate DATE
			, Plus_InstallmentDate DATE
			, New_SignatureDate DATE
			, New_NotificationDate DATE
			, Plus_FundingDate DATE
			, Plus_EstimatedMaturityDate DATE
			, Plus_PaymentStartDate DATE
			, Lds_ExpectancyType NVARCHAR(400)
			' -- Dest_Create_Fields
		, 'Expectancy_Key
			, Plus_Kind
			, Plus_TenderType
			, Plus_GiftSource
			, Plus_PlannedGift
			, Plus_CheckNumber
			, New_Confidential
			, Plus_AcknowledgementInstructions
			, Plus_NewAccountInstructions
			, Plus_SpecialGiftInstructions
			, Plus_TelefundRep
			, Plus_PlannedGivingPaymentFrequency
			, New_Bookable
			, Plus_MatchExpected
			, Plus_GiftRevocability
			, Plus_RemainderBeneficiary
			, New_Documentation
			, Plus_Designation
			, Plus_NameOfTrust
			, plus_PlannedGivingType
			, Plus_VehicleType
			, Plus_VehicleSubType
			, Plus_PayoutRate
			, Plus_Duration
			, Plus_LivesType
			, Plus_Years
			, Plus_Lives
			, Plus_TermBeneficiaryLives
			, Plus_TermBeneficiaryYears
			, Plus_Cri
			, Plus_GpsNotes
			, New_PledgeNumber
			, Status
			, Status_Reason
			, New_TotalPledged
			, New_BalanceDue_Base
			, New_TotalPaid_Base
			, New_PaymentsToMake
			, New_PaymentsReceived
			, New_InstallmentAmount_Base
			, Plus_FairMarketValue_Base
			, Plus_PresentValue_Base
			, Plus_PaymentAmount_Base
			, Plus_AnnualAmount_Base
			, New_BeginDate
			, New_EndDate
			, Plus_InstallmentDate
			, New_SignatureDate
			, New_NotificationDate
			, Plus_FundingDate
			, Plus_EstimatedMaturityDate
			, Plus_PaymentStartDate
			, Lds_ExpectancyType
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Expectancy_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Expectancy_Fact' -- Source_Table
		, 'dbo._Expectancy_Fact' -- Destination_Table
		,'Expectancy_Key NVARCHAR(100)
			, New_TotalPledged MONEY
			, New_BeginDate DATE
			, Begin_Date_Key NUMERIC(10,0)
			, New_EndDate DATE
			, End_Date_Key NUMERIC(10,0)
			, New_BalanceDue_Base MONEY
			, New_TotalPaid_Base MONEY
			, New_PaymentsToMake INT
			, New_PaymentsReceived INT
			, New_InstallmentAmount_Base MONEY
			, Plus_InstallmentDate DATE
			, Installment_Date_Key NUMERIC(10,0)
			, Donation_Key NVARCHAR(100)
			, User_Key NVARCHAR(100)
			, Plus_FairMarketValue_Base MONEY
			, Plus_PresentValue_Base MONEY
			, New_SignatureDate DATE
			, Signature_Date_Key NUMERIC(10,0)
			, New_NotificationDate DATE
			, Notification_Date_Key NUMERIC(10,0)
			, Plus_FundingDate DATE
			, Funding_Date_Key NUMERIC(10,0)
			, Plus_EstimatedMaturityDate DATE
			, Estimated_Maturity_Date_Key NUMERIC(10,0)
			, Plus_PaymentAmount_Base MONEY
			, Plus_AnnualAmount_Base MONEY
			, Plus_PaymentStartDate DATE
			, Payment_Start_Date_Key NUMERIC(10,0)
			, Appeal_Key NVARCHAR(100)
			, Fund_Key NVARCHAR(100)
			, Hier_Key NVARCHAR(100)
			, Donor_Key NVARCHAR(100)
			, Initiative_Key NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Expectancy_Key
			, New_TotalPledged
			, New_BeginDate
			, Begin_Date_Key
			, New_EndDate
			, End_Date_Key
			, New_BalanceDue_Base
			, New_TotalPaid_Base
			, New_PaymentsToMake
			, New_PaymentsReceived
			, New_InstallmentAmount_Base
			, Plus_InstallmentDate
			, Installment_Date_Key
			, Donation_Key
			, User_Key
			, Plus_FairMarketValue_Base
			, Plus_PresentValue_Base
			, New_SignatureDate
			, Signature_Date_Key
			, New_NotificationDate
			, Notification_Date_Key
			, Plus_FundingDate
			, Funding_Date_Key
			, Plus_EstimatedMaturityDate
			, Estimated_Maturity_Date_Key
			, Plus_PaymentAmount_Base
			, Plus_AnnualAmount_Base
			, Plus_PaymentStartDate
			, Payment_Start_Date_Key
			, Appeal_Key
			, Fund_Key
			, Hier_Key
			, Donor_Key
			, Initiative_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Fund_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Fund_Dim' -- Source_Table
		, 'dbo._Fund_Dim' -- Destination_Table
		,'Fund_Key  NVARCHAR(100)
			, Fund_Name  NVARCHAR(100) 
			, Fund_Institution_Name  NVARCHAR(100) 
			, Fund_Account_Number  NVARCHAR(100)
			, Plus_GiftPurposeSubtype NVARCHAR(400)
			, Plus_GiftPurposeType NVARCHAR(400)
			, Plus_LdspAccountNumberInt INT
			, New_FormalAccountName NVARCHAR(100)
			, New_InstitutionalHierarchy NVARCHAR(100)
			, New_InstitutionAccountNumber NVARCHAR(100)
			, Plus_Unrestricted NVARCHAR(1)
			, Plus_Scholarship NVARCHAR(1)
			, New_Endowment NVARCHAR(1)
			, Plus_EffectiveFrom DATE
			, Plus_EffectiveTo DATE
			, New_CaePurpose NVARCHAR(400)
			, Plus_SubClassAccountNumber NVARCHAR(100)
			, New_Description NVARCHAR(300)
			, Plus_Notes NVARCHAR(200)
			, Plus_AwardRestrictionGender NVARCHAR(400)
			, Plus_AwardRestrictionClassYear NVARCHAR(400)
			, Plus_AwardRestrictionCollege NVARCHAR(100)
			, Plus_AwardRestrictionEthnicity NVARCHAR(400)
			, Plus_AwardRestrictionGPA DECIMAL
			, Plus_AwardRestrictionMajor NVARCHAR(100)
			, Plus_GeographicArea NVARCHAR(100)
			, Plus_AwardRestrictionSeminaryGraduate NVARCHAR(1)
			, Plus_NeedBased NVARCHAR(1)
			, Plus_AwardRestrictionSingleParent NVARCHAR(1)
			, Plus_AwardRestrictionReturnedMissionary NVARCHAR(1)
			, Plus_PayItForward NVARCHAR(1)
			, Plus_AwardRestrictionNotes NVARCHAR(4000)
			, Plus_Athletics NVARCHAR(1)
			, Plus_FourYear NVARCHAR(1)
			, Plus_GraduateProfessional NVARCHAR(1)
			, Plus_TvRadio NVARCHAR(1)
			, Plus_TechnologySpec NVARCHAR(1)
			, Plus_AlumniAssociation NVARCHAR(1)
			, Plus_MatchingGiftText NVARCHAR(4000)
			, Plus_PrincipalAccountNumber NVARCHAR(100)
			, Plus_Spendable NVARCHAR(25)
			, Plus_ProposedEndowment NVARCHAR(400)
			, Plus_ReportFrequency NVARCHAR(400)
			, StatusCode NVARCHAR(400)
			, Hier_New_Inst NVARCHAR(100)
			, New_AllowGifts NVARCHAR(1)
			, Plus_OnlineApproved NVARCHAR(1)
			, Plus_OnlinePublicName NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Fund_Key
			, Fund_Name 
			, Fund_Institution_Name
			, Fund_Account_Number
			, Plus_GiftPurposeSubtype
			, Plus_GiftPurposeType
			, Plus_LdspAccountNumberInt
			, New_FormalAccountName
			, New_InstitutionalHierarchy
			, New_InstitutionAccountNumber
			, Plus_Unrestricted
			, Plus_Scholarship
			, New_Endowment
			, Plus_EffectiveFrom
			, Plus_EffectiveTo
			, New_CaePurpose
			, Plus_SubClassAccountNumber
			, New_Description
			, Plus_Notes
			, Plus_AwardRestrictionGender
			, Plus_AwardRestrictionClassYear
			, Plus_AwardRestrictionCollege
			, Plus_AwardRestrictionEthnicity
			, Plus_AwardRestrictionGPA
			, Plus_AwardRestrictionMajor
			, Plus_GeographicArea
			, Plus_AwardRestrictionSeminaryGraduate
			, Plus_NeedBased
			, Plus_AwardRestrictionSingleParent
			, Plus_AwardRestrictionReturnedMissionary
			, Plus_PayItForward
			, Plus_AwardRestrictionNotes
			, Plus_Athletics
			, Plus_FourYear
			, Plus_GraduateProfessional
			, Plus_TvRadio
			, Plus_TechnologySpec
			, Plus_AlumniAssociation
			, Plus_MatchingGiftText
			, Plus_PrincipalAccountNumber
			, Plus_Spendable
			, Plus_ProposedEndowment
			, Plus_ReportFrequency
			, StatusCode
			, Hier_New_Inst
			, New_AllowGifts
			, Plus_OnlineApproved
			, Plus_OnlinePublicName
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Hier_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Hier_Dim' -- Source_Table
		, 'dbo._Hier_Dim' -- Destination_Table
		,'Hier_Key  NVARCHAR(100)
			, Hier_Name  NVARCHAR(100) 
			, Hier_Parent  NVARCHAR(100) 
			, Hier_Level_1  NVARCHAR(100) 
			, Hier_Level_2  NVARCHAR(100) 
			, Hier_Level_3  NVARCHAR(100) 
			, Hier_Avail_To_Alumni_Yn  NVARCHAR(1) 
			, Hier_Avail_To_Student_Yn  NVARCHAR(1) 
			, Hier_End_Node_Yn  NVARCHAR(1) 
			, Hier_Education_Usage_Yn  NVARCHAR(1) 
			, Hier_Association_Usage_Yn  NVARCHAR(1) 
			, Hier_Donation_Usage_Yn  NVARCHAR(1)
			, New_Inst NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Hier_Key 
			, Hier_Name
			, Hier_Parent 
			, Hier_Level_1
			, Hier_Level_2 
			, Hier_Level_3
			, Hier_Avail_To_Alumni_Yn 
			, Hier_Avail_To_Student_Yn 
			, Hier_End_Node_Yn 
			, Hier_Education_Usage_Yn 
			, Hier_Association_Usage_Yn 
			, Hier_Donation_Usage_Yn
			, New_Inst
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Id_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Id_Dim' -- Source_Table
		, 'dbo._Id_Dim' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Id_Key INT
			, Id_Group_Key INT
			, New_Type NVARCHAR(400)
			, Plus_Id NVARCHAR(100)
			, ConstituentId NVARCHAR(100)
			, AccountId NVARCHAR(100)
			, New_Id NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'ContactId 
			, Id_Key 
			, Id_Group_Key 
			, New_Type
			, Plus_Id
			, ConstituentId
			, AccountId
			, New_Id
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Initiative_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Initiative_Dim' -- Source_Table
		, 'dbo._Initiative_Dim' -- Destination_Table
		,'Initiative_Key NVARCHAR(100)
			, Initiative_Name NVARCHAR(600)
			, Initiative_Step_Name NVARCHAR(400)
			, Initiative_State_Code NVARCHAR(400)
			, Initiative_Status_Code NVARCHAR(400)
			, Initiative_Proposal_Status NVARCHAR(400)
			, Initiative_New_Account NVARCHAR(400)
			, Initiative_Liaison NVARCHAR(200)
			, Initiative_Supporting_Liaisons NVARCHAR(1000)
			, Initiative_Gift_Planning_Serv_Team NVARCHAR(1000)
			, Initiative_Team NVARCHAR(1000)
			, Initiative_Coordinating_Liaison NVARCHAR(200)
			, Initiative_Name_Donor_Name NVARCHAR(1000)
			, Initiative_Proposal_Date DATE
			, Initiative_Targeted_Commitment_Date DATE
			, Initiative_Committed_Date DATE
			, Initiative_Cultivation_Proc_Stg_1_Date DATE
			, Initiative_Cultivation_Proc_Stg_2_Date DATE
			, Initiative_Cultivation_Proc_Stg_3_Date DATE
			, Initiative_Cultivation_Proc_Stg_4_Date DATE
			, Initiative_Gift_Notice_Created_Date DATE
			, Initiative_Proposal_Status_Change_Date DATE
			, Initiative_Primary_Initiative NVARCHAR(1)
			, Initiative_Parent_Initiative NVARCHAR(600)
			, Initiative_Has_Expectancy NVARCHAR(1)
			' -- Dest_Create_Fields
		, 'Initiative_Key
			, Initiative_Name
			, Initiative_Step_Name
			, Initiative_State_Code
			, Initiative_Status_Code
			, Initiative_Proposal_Status
			, Initiative_New_Account
			, Initiative_Liaison
			, Initiative_Supporting_Liaisons
			, Initiative_Gift_Planning_Serv_Team
			, Initiative_Team 
			, Initiative_Coordinating_Liaison
			, Initiative_Name_Donor_Name
			, Initiative_Proposal_Date
			, Initiative_Targeted_Commitment_Date
			, Initiative_Committed_Date
			, Initiative_Cultivation_Proc_Stg_1_Date
			, Initiative_Cultivation_Proc_Stg_2_Date
			, Initiative_Cultivation_Proc_Stg_3_Date
			, Initiative_Cultivation_Proc_Stg_4_Date
			, Initiative_Gift_Notice_Created_Date
			, Initiative_Proposal_Status_Change_Date
			, Initiative_Primary_Initiative
			, Initiative_Parent_Initiative
			, Initiative_Has_Expectancy
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Initiative_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Initiative_Fact' -- Source_Table
		, 'dbo._Initiative_Fact' -- Destination_Table
		,'Initiative_Fact_Key INT
			, Initiative_Key NVARCHAR(100)
			, Donor_Key NVARCHAR(100)
			, Fund_Account_Key NVARCHAR(100)
			, Expectancy_Key NVARCHAR(100) 
			, Donation_Key NVARCHAR(100)
			, Initiative_Proposal_Amt MONEY
			, Initiative_Total_Given_Amt MONEY
			, Initiative_Proposal_Date DATE
			, Initiative_Targeted_Commitment_Date DATE
			, Initiative_Committed_Date DATE
			, Initiative_Cultivation_Proc_Stg_1_Date DATE
			, Initiative_Cultivation_Proc_Stg_2_Date DATE
			, Initiative_Cultivation_Proc_Stg_3_Date DATE
			, Initiative_Cultivation_Proc_Stg_4_Date DATE
			, Initiative_Gift_Notice_Created_Date DATE
			, Initiative_Proposal_Status_Change_Date DATE
			, Expectancy_Total_Pledged_Amt MONEY
			, Expectancy_Balance_Due_Amt MONEY
			, Expectancy_Total_Paid_Amt MONEY
			, Expectancy_Installment_Amt MONEY
			, Expectancy_Payment_Amt MONEY
			, Expectancy_Annual_Amt MONEY
			, Expectancy_PaymentsToMake INT
			, Expectancy_PaymentsReceived INT
			, Expectancy_BeginDate DATE
			, Expectancy_EndDate DATE
			, Expectancy_InstallmentDate DATE
			, Expectancy_SignatureDate DATE
			, Expectancy_NotificationDate DATE
			, Expectancy_FundingDate DATE
			, Expectancy_EstimatedMaturityDate DATE
			, Expectancy_PaymentStartDate DATE
			, Donation_Donor_Primary NVARCHAR(1)
			, Donation_Primary_Amt MONEY
			, Donation_Credit_Amt MONEY	
			, Donation_Receipt_Date DATE
			, Initiative_Total_Committed_Amt MONEY
			, Hier_Key NVARCHAR(100)
			, User_Initiative_Liaison_Key NVARCHAR(100)
			, User_Coordinating_Liaison_Key NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Initiative_Fact_Key
			, Initiative_Key
			, Donor_Key
			, Fund_Account_Key
			, Expectancy_Key
			, Donation_Key
			, Initiative_Proposal_Amt
			, Initiative_Total_Given_Amt
			, Initiative_Proposal_Date
			, Initiative_Targeted_Commitment_Date
			, Initiative_Committed_Date
			, Initiative_Cultivation_Proc_Stg_1_Date
			, Initiative_Cultivation_Proc_Stg_2_Date
			, Initiative_Cultivation_Proc_Stg_3_Date
			, Initiative_Cultivation_Proc_Stg_4_Date
			, Initiative_Gift_Notice_Created_Date
			, Initiative_Proposal_Status_Change_Date
			, Expectancy_Total_Pledged_Amt
			, Expectancy_Balance_Due_Amt
			, Expectancy_Total_Paid_Amt
			, Expectancy_Installment_Amt
			, Expectancy_Payment_Amt
			, Expectancy_Annual_Amt
			, Expectancy_PaymentsToMake
			, Expectancy_PaymentsReceived
			, Expectancy_BeginDate
			, Expectancy_EndDate
			, Expectancy_InstallmentDate
			, Expectancy_SignatureDate
			, Expectancy_NotificationDate
			, Expectancy_FundingDate
			, Expectancy_EstimatedMaturityDate
			, Expectancy_PaymentStartDate
			, Donation_Donor_Primary
			, Donation_Primary_Amt
			, Donation_Credit_Amt
			, Donation_Receipt_Date
			, Initiative_Total_Committed_Amt
			, Hier_Key
			, User_Initiative_Liaison_Key
			, User_Coordinating_Liaison_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Interest_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Interest_Dim' -- Source_Table
		, 'dbo._Interest_Dim' -- Destination_Table
		,'Interest_Key INT
			, Interest_Group_Key INT
			, ContactId NVARCHAR(100)
			, Experience NVARCHAR(400)
			, Emeritus NVARCHAR(1)
			, Study_Abroad NVARCHAR(1)
			, Source  NVARCHAR(100)
			, New_StartDate DATE
			, New_EndDate DATE
			, Interest  NVARCHAR(100)
			, Lds_Position  NVARCHAR(400)
			, Institutional_Hierarchy  NVARCHAR(100)
			, Country  NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Interest_Key
			, Interest_Group_Key
			, ContactId
			, Experience
			, Emeritus
			, Study_Abroad
			, Source
			, New_StartDate
			, New_EndDate
			, Interest
			, Lds_Position
			, Institutional_Hierarchy
			, Country
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Language_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Language_Dim' -- Source_Table
		, 'dbo._Language_Dim' -- Destination_Table
		,'ContactId  NVARCHAR(100) 
			, Language_Key  INT
			, Language_Group_Key  INT 
			, Language_Name  NVARCHAR(400) 
			, Language_Speech_Level  NVARCHAR(400) 
			, Language_Read_Level  NVARCHAR(400) 
			, Language_Write_Level  NVARCHAR(400) 
			, Language_Name_Value  INT 
			, Language_Speech_Level_Value  INT 
			, Language_Read_Level_Value  INT 
			, Language_Write_Level_Value  INT 
			, Language_Teacher_Yn  NVARCHAR(1) 
			, Language_Mission_Yn  NVARCHAR(1) 
			, Language_Business_Yn  NVARCHAR(1) 
			, Language_Translator_Yn  NVARCHAR(1)
			, Source NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'ContactId 
			, Language_Key 
			, Language_Group_Key 
			, Language_Name 
			, Language_Speech_Level 
			, Language_Read_Level 
			, Language_Write_Level 
			, Language_Name_Value 
			, Language_Speech_Level_Value 
			, Language_Read_Level_Value 
			, Language_Write_Level_Value 
			, Language_Teacher_Yn 
			, Language_Mission_Yn 
			, Language_Business_Yn 
			, Language_Translator_Yn
			, Source
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Phone_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Phone_Dim' -- Source_Table
		, 'dbo._Phone_Dim' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Phone_Key INT
			, Phone_Group_Key INT
			, Phone_Number NVARCHAR(100)
			, Phone_Country_Code NVARCHAR(100)
			, Phone_Extension NVARCHAR(100)
			, Phone_Active_Yn NVARCHAR(1)
			, Phone_Confirmed_Yn NVARCHAR(1)
			, Phone_Primary_Yn NVARCHAR(1)
			, Phone_Recieve_Text_Yn NVARCHAR(1)
			, Phone_Confidential_Yn NVARCHAR(1)
			, Phone_Type NVARCHAR(400)
			, Phone_Line_Type NVARCHAR(400)
			, Phone_Preferred_Time NVARCHAR(400)
			, Phone_Type_Value INT
			, Phone_Line_Type_Value INT
			, Phone_Preferred_Time_Value INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Phone_Key
			, Phone_Group_Key
			, Phone_Number
			, Phone_Country_Code
			, Phone_Extension
			, Phone_Active_Yn
			, Phone_Confirmed_Yn
			, Phone_Primary_Yn
			, Phone_Recieve_Text_Yn
			, Phone_Confidential_Yn
			, Phone_Type
			, Phone_Line_Type
			, Phone_Preferred_Time
			, Phone_Type_Value
			, Phone_Line_Type_Value
			, Phone_Preferred_Time_Value
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Primary_Contact_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Primary_Contact_Dim' -- Source_Table
		, 'dbo._Primary_Contact_Dim' -- Destination_Table
		,'Donor_Key NVARCHAR(100)
			, Address_Primary_Yn NVARCHAR(1)
			, Address_Street_1 NVARCHAR(100)
			, Address_Street_2 NVARCHAR(100)
			, Address_Street_3 NVARCHAR(100)
			, Address_City NVARCHAR(100)
			, Address_County NVARCHAR(100)
			, Address_County_Code NVARCHAR(10)
			, Address_County_Id NVARCHAR(100)
			, Address_State_Province NVARCHAR(50)
			, Address_State_Code NVARCHAR(100)
			, Address_Country NVARCHAR(100)
			, Address_Post_Code_Full NVARCHAR(100)
			, Address_Post_Code_Last_4 NVARCHAR(15)
			, Address_Printing_Line_1 NVARCHAR(606)
			, Address_Printing_Line_2 NVARCHAR(406)
			, Address_Display NVARCHAR(300)
			, Address_Quality_Status NVARCHAR(400)
			, Address_Quality_Status_Value INT
			, Address_Longitude FLOAT
			, Address_Latitude FLOAT
			, Address_Active_Yn NVARCHAR(1)
			, Address_Confirmed_Yn NVARCHAR(1)
			, Address_Confidential_Yn NVARCHAR(1)
			, Address_Type NVARCHAR(400)
			, Address_Type_Value INT
			, Address_Printing_Line_3 NVARCHAR(100)
			, Address_Printing_Line_4 NVARCHAR(100)
			, Phone_Number NVARCHAR(100)
			, Phone_Country_Code NVARCHAR(100)
			, Phone_Extension NVARCHAR(100)
			, Phone_Active_Yn NVARCHAR(1)
			, Phone_Confirmed_Yn NVARCHAR(1)
			, Phone_Primary_Yn NVARCHAR(1)
			, Phone_Recieve_Text_Yn NVARCHAR(1)
			, Phone_Confidential_Yn NVARCHAR(1)
			, Phone_Type NVARCHAR(400)
			, Phone_Line_Type NVARCHAR(400)
			, Phone_Preferred_Time NVARCHAR(400)
			, Phone_Type_Value INT
			, Phone_Line_Type_Value INT
			, Phone_Preferred_Time_Value INT
			, Email_Address NVARCHAR(150)
			, Email_Primary_Yn NVARCHAR(1)
			, Email_Type NVARCHAR(400)
			, Email_Type_Value INT
			, Email_Active_Yn NVARCHAR(1)
			, Email_Confirmed_Yn NVARCHAR(1)
			, Email_Confidential_Yn NVARCHAR(1)
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Address_Primary_Yn
			, Address_Street_1
			, Address_Street_2
			, Address_Street_3
			, Address_City
			, Address_County
			, Address_County_Code
			, Address_County_Id
			, Address_State_Province
			, Address_State_Code
			, Address_Country
			, Address_Post_Code_Full
			, Address_Post_Code_Last_4
			, Address_Printing_Line_1
			, Address_Printing_Line_2
			, Address_Display
			, Address_Quality_Status
			, Address_Quality_Status_Value
			, Address_Longitude
			, Address_Latitude
			, Address_Active_Yn
			, Address_Confirmed_Yn
			, Address_Confidential_Yn
			, Address_Type
			, Address_Type_Value
			, Address_Printing_Line_3
			, Address_Printing_Line_4
			, Phone_Number
			, Phone_Country_Code
			, Phone_Extension
			, Phone_Active_Yn
			, Phone_Confirmed_Yn
			, Phone_Primary_Yn
			, Phone_Recieve_Text_Yn
			, Phone_Confidential_Yn
			, Phone_Type
			, Phone_Line_Type
			, Phone_Preferred_Time
			, Phone_Type_Value
			, Phone_Line_Type_Value
			, Phone_Preferred_Time_Value
			, Email_Address
			, Email_Primary_Yn
			, Email_Type
			, Email_Type_Value
			, Email_Active_Yn
			, Email_Confirmed_Yn
			, Email_Confidential_Yn
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Psa_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Psa_Dim' -- Source_Table
		, 'dbo._Psa_Dim' -- Destination_Table
		,'ContactId  NVARCHAR(100) 
			, Psa_Key  INT
			, Psa_Group_Key  INT 
			, Psa_Code  NVARCHAR(50) 
			, Psa_Eff_From  DATE 
			, Psa_Eff_Thru  DATE 
			, Psa_Act_Src  NVARCHAR(100) 
			, Psa_Entered_Dt  DATE 
			, Psa_Change_Dt  DATE 
			, Psa_Type  VARCHAR(100) 
			, Psa_Text_Line  NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'ContactId 
			, Psa_Key 
			, Psa_Group_Key 
			, Psa_Code 
			, Psa_Eff_From 
			, Psa_Eff_Thru 
			, Psa_Act_Src 
			, Psa_Entered_Dt 
			, Psa_Change_Dt 
			, Psa_Type 
			, Psa_Text_Line
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Recurring_Gift_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Recurring_Gift_Dim' -- Source_Table
		, 'dbo._Recurring_Gift_Dim' -- Destination_Table
		,'Recurring_Gift_Key NVARCHAR(100)
			, Recurring_Gift_Status_Code NVARCHAR(400)
			, Recurring_Gift_State_Code NVARCHAR(400)
			, Recurring_Gift_Type NVARCHAR(400)
			, Recurring_Gift_Amt MONEY
			, Recurring_Gift_Frequency NVARCHAR(400)
			, Recurring_Gift_Payment_Start_Date DATE
			, Recurring_Gift_Payment_Stop_Date DATE
			, Recurring_Gift_Group NVARCHAR(100)
			, Recurring_Gift_Rule_Name NVARCHAR(100)
			, Donor_Type NVARCHAR(400)
			' -- Dest_Create_Fields
		, 'Recurring_Gift_Key
			, Recurring_Gift_Status_Code
			, Recurring_Gift_State_Code
			, Recurring_Gift_Type
			, Recurring_Gift_Amt
			, Recurring_Gift_Frequency
			, Recurring_Gift_Payment_Start_Date
			, Recurring_Gift_Payment_Stop_Date
			, Recurring_Gift_Group
			, Recurring_Gift_Rule_Name
			, Donor_Type
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Recurring_Gift_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Recurring_Gift_Fact' -- Source_Table
		, 'dbo._Recurring_Gift_Fact' -- Destination_Table
		,'Recurring_Gift_Key NVARCHAR(100)
			, Donor_Key NVARCHAR(100)
			, Fund_Key NVARCHAR(100)
			, Hier_Key NVARCHAR(100)
			, Appeal_Key NVARCHAR(100)
			, Recurring_Gift_Amt MONEY
			' -- Dest_Create_Fields
		, 'Recurring_Gift_Key
			, Donor_Key
			, Fund_Key
			, Hier_Key
			, Appeal_Key
			, Recurring_Gift_Amt
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Reporting_Group_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Reporting_Group_Dim' -- Source_Table
		, 'dbo._Reporting_Group_Dim' -- Destination_Table
		,'Reporting_Group_Key INT
			, Reporting_Group_Name NVARCHAR(100)
			, Reporting_Group_Tab INT
			, Reporting_Group_Inst NVARCHAR(100)
			, Reporting_Group_Primary_Hier_Name NVARCHAR(100)
			, Reporting_Group_Additional_Hier_Names NVARCHAR(4000)
			, Reporting_Group_Cip_Yearly_Goal_Amt MONEY
			' -- Dest_Create_Fields
		, 'Reporting_Group_Key
			, Reporting_Group_Name
			, Reporting_Group_Tab
			, Reporting_Group_Inst
			, Reporting_Group_Primary_Hier_Name
			, Reporting_Group_Additional_Hier_Names
			, Reporting_Group_Cip_Yearly_Goal_Amt
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Retention_Byu_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Retention_Byu_Fact' -- Source_Table
		, 'dbo._Retention_Byu_Fact' -- Destination_Table
		,'Donor_Key UNIQUEIDENTIFIER
			, Donor_Retention_Type_Key INT
			, Retention_Year INT
			, Retention_Donated_In_Year INT
			, Retention_Donated_This_Year INT
			, Retention_Donated_Last_Year INT
			, Retention_Donated_Cnt_Last_Year_Ytd INT
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Donor_Retention_Type_Key
			, Retention_Year
			, Retention_Donated_In_Year
			, Retention_Donated_This_Year
			, Retention_Donated_Last_Year
			, Retention_Donated_Cnt_Last_Year_Ytd
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Retention_Byuh_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Retention_Byuh_Fact' -- Source_Table
		, 'dbo._Retention_Byuh_Fact' -- Destination_Table
		,'Donor_Key UNIQUEIDENTIFIER
			, Donor_Retention_Type_Key INT
			, Retention_Year INT
			, Retention_Donated_In_Year INT
			, Retention_Donated_This_Year INT
			, Retention_Donated_Last_Year INT
			, Retention_Donated_Cnt_Last_Year_Ytd INT
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Donor_Retention_Type_Key
			, Retention_Year
			, Retention_Donated_In_Year
			, Retention_Donated_This_Year
			, Retention_Donated_Last_Year
			, Retention_Donated_Cnt_Last_Year_Ytd
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Retention_Byui_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Retention_Byui_Fact' -- Source_Table
		, 'dbo._Retention_Byui_Fact' -- Destination_Table
		,'Donor_Key UNIQUEIDENTIFIER
			, Donor_Retention_Type_Key INT
			, Retention_Year INT
			, Retention_Donated_In_Year INT
			, Retention_Donated_This_Year INT
			, Retention_Donated_Last_Year INT
			, Retention_Donated_Cnt_Last_Year_Ytd INT
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Donor_Retention_Type_Key
			, Retention_Year
			, Retention_Donated_In_Year
			, Retention_Donated_This_Year
			, Retention_Donated_Last_Year
			, Retention_Donated_Cnt_Last_Year_Ytd
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Retention_Ldsbc_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Retention_Ldsbc_Fact' -- Source_Table
		, 'dbo._Retention_Ldsbc_Fact' -- Destination_Table
		,'Donor_Key UNIQUEIDENTIFIER
			, Donor_Retention_Type_Key INT
			, Retention_Year INT
			, Retention_Donated_In_Year INT
			, Retention_Donated_This_Year INT
			, Retention_Donated_Last_Year INT
			, Retention_Donated_Cnt_Last_Year_Ytd INT
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Donor_Retention_Type_Key
			, Retention_Year
			, Retention_Donated_In_Year
			, Retention_Donated_This_Year
			, Retention_Donated_Last_Year
			, Retention_Donated_Cnt_Last_Year_Ytd
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Student_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Student_Dim' -- Source_Table
		, 'dbo._Student_Dim' -- Destination_Table
		,'Student_Key INT
			, Student_Group_Key INT
			, ContactId NVARCHAR(100)
			, New_University NVARCHAR(100)
			, Plus_Year NVARCHAR(10)
			, New_Term NVARCHAR(100)
			, New_HoursCompleted INT
			, New_ExpectedGraduationDate DATE
			, New_Major NVARCHAR(100)
			, Plus_Emphasis NVARCHAR(100)
			, New_College NVARCHAR(100)
			, Plus_Department NVARCHAR(100)
			, Academic_Term_Date DATE
			, Academic_Year INT
			, Current_Academic_Year NVARCHAR(1)
			, Graduated_In_Current_Academic_Year NVARCHAR(1)
			, Current_Year_Plus_4_Student NVARCHAR(1)
			, Current_Year_Plus_4_Graduate NVARCHAR(1)
			' -- Dest_Create_Fields
		, 'Student_Key
			, Student_Group_Key
			, ContactId
			, New_University
			, Plus_Year
			, New_Term
			, New_HoursCompleted
			, New_ExpectedGraduationDate
			, New_Major
			, Plus_Emphasis
			, New_College
			, Plus_Department
			, Academic_Term_Date
			, Academic_Year
			, Current_Academic_Year
			, Graduated_In_Current_Academic_Year
			, Current_Year_Plus_4_Student
			, Current_Year_Plus_4_Graduate
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _User_Connected_Liaison_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._User_Connected_Liaison_Dim' -- Source_Table
		, 'dbo._User_Connected_Liaison_Dim' -- Destination_Table
		,'User_Connected_Liaison_Key NVARCHAR(100)
			, User_Full_Name NVARCHAR(200)
			, User_First_Name NVARCHAR(64)
			, User_Last_Name NVARCHAR(64)
			, User_Personal_Email NVARCHAR(100)
			, User_Title NVARCHAR(128)
			, User_Internal_Email NVARCHAR(100)
			, User_Mobile_Phone NVARCHAR(64)
			, User_Domain_Name NVARCHAR(1024)
			' -- Dest_Create_Fields
		, 'User_Connected_Liaison_Key
			, User_Full_Name
			, User_First_Name
			, User_Last_Name
			, User_Personal_Email
			, User_Title
			, User_Internal_Email
			, User_Mobile_Phone
			, User_Domain_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _User_Coordinating_Liaison_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._User_Coordinating_Liaison_Dim' -- Source_Table
		, 'dbo._User_Coordinating_Liaison_Dim' -- Destination_Table
		,'User_Coordinating_Liaison_Key NVARCHAR(100)
			, User_Full_Name NVARCHAR(200)
			, User_First_Name NVARCHAR(64)
			, User_Last_Name NVARCHAR(64)
			, User_Personal_Email NVARCHAR(100)
			, User_Title NVARCHAR(128)
			, User_Internal_Email NVARCHAR(100)
			, User_Mobile_Phone NVARCHAR(64)
			, User_Domain_Name NVARCHAR(1024)
			' -- Dest_Create_Fields
		, 'User_Coordinating_Liaison_Key
			, User_Full_Name
			, User_First_Name
			, User_Last_Name
			, User_Personal_Email
			, User_Title
			, User_Internal_Email
			, User_Mobile_Phone
			, User_Domain_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _User_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._User_Dim' -- Source_Table
		, 'dbo._User_Dim' -- Destination_Table
		,'User_Key NVARCHAR(100)
			, User_Full_Name NVARCHAR(200)
			, User_First_Name NVARCHAR(64)
			, User_Last_Name NVARCHAR(64)
			, User_Personal_Email NVARCHAR(100)
			, User_Title NVARCHAR(128)
			, User_Internal_Email NVARCHAR(100)
			, User_Mobile_Phone NVARCHAR(64)
			, User_Domain_Name NVARCHAR(1024)
			' -- Dest_Create_Fields
		, 'User_Key
			, User_Full_Name
			, User_First_Name
			, User_Last_Name
			, User_Personal_Email
			, User_Title
			, User_Internal_Email
			, User_Mobile_Phone
			, User_Domain_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _User_Initiative_Liaison_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._User_Initiative_Liaison_Dim' -- Source_Table
		, 'dbo._User_Initiative_Liaison_Dim' -- Destination_Table
		,'User_Initiative_Liaison_Key NVARCHAR(100)
			, User_Full_Name NVARCHAR(200)
			, User_First_Name NVARCHAR(64)
			, User_Last_Name NVARCHAR(64)
			, User_Personal_Email NVARCHAR(100)
			, User_Title NVARCHAR(128)
			, User_Internal_Email NVARCHAR(100)
			, User_Mobile_Phone NVARCHAR(64)
			, User_Domain_Name NVARCHAR(1024)
			' -- Dest_Create_Fields
		, 'User_Initiative_Liaison_Key
			, User_Full_Name
			, User_First_Name
			, User_Last_Name
			, User_Personal_Email
			, User_Title
			, User_Internal_Email
			, User_Mobile_Phone
			, User_Domain_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _User_Pending_Liaison_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._User_Pending_Liaison_Dim' -- Source_Table
		, 'dbo._User_Pending_Liaison_Dim' -- Destination_Table
		,'User_Pending_Liaison_Key NVARCHAR(100)
			, User_Full_Name NVARCHAR(200)
			, User_First_Name NVARCHAR(64)
			, User_Last_Name NVARCHAR(64)
			, User_Personal_Email NVARCHAR(100)
			, User_Title NVARCHAR(128)
			, User_Internal_Email NVARCHAR(100)
			, User_Mobile_Phone NVARCHAR(64)
			, User_Domain_Name NVARCHAR(1024)
			' -- Dest_Create_Fields
		, 'User_Pending_Liaison_Key
			, User_Full_Name
			, User_First_Name
			, User_Last_Name
			, User_Personal_Email
			, User_Title
			, User_Internal_Email
			, User_Mobile_Phone
			, User_Domain_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Liaison_Initiative
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Liaison_Initiative' -- Source_Table
		, 'dbo.View_Liaison_Initiative' -- Destination_Table
		,'Liaison_Initiative_Id INT
			, Liaison NVARCHAR(200) 
			, Liaison_Role NVARCHAR(100) 
			, Initiative_Id NVARCHAR(100)
			, Initiative_Name NVARCHAR(600) 
			, Initiative_Name_Donor_Name NVARCHAR(1000) 
			, Ldsp_Id NVARCHAR(100)
			, Donor_Name NVARCHAR(160) 
			, Initiative_Stage NVARCHAR(400)
			, Fund_Account_Name NVARCHAR(100)
			, Proposal_Status NVARCHAR(400) 
			, Proposal_Amt MONEY
			, Total_Committed_Amt MONEY
			, Total_Given_Amt MONEY
			, Supporting_Liaison_Credit_Amt MONEY
			' -- Dest_Create_Fields
		, 'Liaison_Initiative_Id
			, Liaison
			, Liaison_Role 
			, Initiative_Id
			, Initiative_Name
			, Initiative_Name_Donor_Name
			, Ldsp_Id 
			, Donor_Name
			, Initiative_Stage
			, Fund_Account_Name
			, Proposal_Status
			, Proposal_Amt
			, Total_Committed_Amt
			, Total_Given_Amt
			, Supporting_Liaison_Credit_Amt
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Portfolio_Management
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Portfolio_Management' -- Source_Table
		, 'dbo.View_Portfolio_Management' -- Destination_Table
		,'Ldsp_Id NVARCHAR(100)
			, Donor_Full_Name NVARCHAR(160)
			, Donor_Display_Name NVARCHAR(100)
			, Couple_Name NVARCHAR(200)
			, Couple_Display_Name NVARCHAR(200)
			, Coordinating_Liaison NVARCHAR(200)
			, Pending_Liaison NVARCHAR(200)
			, Connected_Liaison NVARCHAR(200)
			, Coordinating_Liaison_Domain_Name NVARCHAR(1024)
			, Pending_Liaison_Domain_Name NVARCHAR(1024)
			, Connected_Liaison_Domain_Name NVARCHAR(1024)
			, Contact_Type NVARCHAR(100)
			, Ldsp_Donor_Type NVARCHAR(2)
			, Age INT
			, Birthdate DATE
			, Birth_Year NVARCHAR(100)
			, Address_Type NVARCHAR(400)
			, Street_Line_1 NVARCHAR(100)
			, Street_Line_2 NVARCHAR(100)
			, City NVARCHAR(100)
			, County NVARCHAR(100)
			, State_Abbreviation NVARCHAR(100)
			, Zip_Code NVARCHAR(100)
			, Country NVARCHAR(100)
			, Phone_Number NVARCHAR(100)
			, Email_Address NVARCHAR(150)
			, Spouse_Email NVARCHAR(100)
			, Total_Lifetime_Giving MONEY
			, Total_Lifetime_Giving_Last_5_Years MONEY
			, Total_Giving_Current_Year MONEY
			, Total_Giving_1_Years_Ago MONEY
			, Total_Giving_2_Years_Ago MONEY
			, Total_Giving_3_Years_Ago MONEY
			, Total_Giving_4_Years_Ago MONEY
			, Total_Giving_5_Years_Ago MONEY
			, Gift_Capacity_2016_To_2020 NVARCHAR(400)
			, Gift_Count_Previous_5_Years INT
			, Average_Single_Gift_Previous_5_Years MONEY
			, Ldsp_Largest_Gift MONEY
			, Ldsp_Largest_Gift_Date DATE
			, Ldsp_Most_Recent_Gift MONEY
			, Ldsp_Most_Recent_Gift_Date DATE
			, Institution_Giving_Areas NVARCHAR(1000)
			, Byu_Giving_Areas NVARCHAR(2000)
			, Church_Giving_Areas NVARCHAR(2000)
			, Is_Qualified NVARCHAR(1)
			, Qualified_On DATE 
			, Qualified_By NVARCHAR(200)
			, DonorId NVARCHAR(100)
			, First_Gift_To_Byu_Amt MONEY
			, First_Gift_To_Byui_Amt MONEY
			, First_Gift_To_Byuh_Amt MONEY
			, First_Gift_To_Ldsbc_Amt MONEY
			, First_Gift_To_Church_Amt MONEY
			, First_Gift_To_Ldsp_Amt MONEY
			, First_Gift_Date_Byu DATE
			, First_Gift_Date_Byui DATE
			, First_Gift_Date_Byuh DATE
			, First_Gift_Date_Ldsbc DATE
			, First_Gift_Date_Church DATE
			, First_Gift_Date_Ldsp DATE
			, Total_Giving_Current_Year_With_Matching MONEY
			, Total_Giving_1_Years_Ago_With_Matching MONEY
			, Total_Giving_2_Years_Ago_With_Matching MONEY
			, Total_Giving_3_Years_Ago_With_Matching MONEY
			, Total_Giving_4_Years_Ago_With_Matching MONEY
			, Total_Giving_5_Years_Ago_With_Matching MONEY
			' -- Dest_Create_Fields
		, 'Ldsp_Id
			, Donor_Full_Name
			, Donor_Display_Name
			, Couple_Name
			, Couple_Display_Name
			, Coordinating_Liaison
			, Pending_Liaison
			, Connected_Liaison
			, Coordinating_Liaison_Domain_Name 
			, Pending_Liaison_Domain_Name
			, Connected_Liaison_Domain_Name
			, Contact_Type
			, Ldsp_Donor_Type
			, Age
			, Birthdate
			, Birth_Year
			, Address_Type
			, Street_Line_1
			, Street_Line_2
			, City
			, County
			, State_Abbreviation
			, Zip_Code
			, Country
			, Phone_Number
			, Email_Address
			, Spouse_Email
			, Total_Lifetime_Giving
			, Total_Lifetime_Giving_Last_5_Years
			, Total_Giving_Current_Year
			, Total_Giving_1_Years_Ago
			, Total_Giving_2_Years_Ago
			, Total_Giving_3_Years_Ago
			, Total_Giving_4_Years_Ago
			, Total_Giving_5_Years_Ago
			, Gift_Capacity_2016_To_2020
			, Gift_Count_Previous_5_Years
			, Average_Single_Gift_Previous_5_Years
			, Ldsp_Largest_Gift
			, Ldsp_Largest_Gift_Date
			, Ldsp_Most_Recent_Gift
			, Ldsp_Most_Recent_Gift_Date
			, Institution_Giving_Areas
			, Byu_Giving_Areas
			, Church_Giving_Areas
			, Is_Qualified
			, Qualified_On 
			, Qualified_By
			, DonorId
			, First_Gift_To_Byu_Amt
			, First_Gift_To_Byui_Amt
			, First_Gift_To_Byuh_Amt
			, First_Gift_To_Ldsbc_Amt
			, First_Gift_To_Church_Amt
			, First_Gift_To_Ldsp_Amt
			, First_Gift_Date_Byu
			, First_Gift_Date_Byui
			, First_Gift_Date_Byuh
			, First_Gift_Date_Ldsbc
			, First_Gift_Date_Church
			, First_Gift_Date_Ldsp
			, Total_Giving_Current_Year_With_Matching
			, Total_Giving_1_Years_Ago_With_Matching
			, Total_Giving_2_Years_Ago_With_Matching
			, Total_Giving_3_Years_Ago_With_Matching
			, Total_Giving_4_Years_Ago_With_Matching
			, Total_Giving_5_Years_Ago_With_Matching
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Activity_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Activity_Bridge' -- Source_Table
		, 'dbo._Activity_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Activity_Key INT
			, Activity_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Activity_Key
			, Activity_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Address_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Address_Bridge' -- Source_Table
		, 'dbo._Address_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Address_Key INT
			, Address_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Address_Key
			, Address_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Alumni_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Alumni_Bridge' -- Source_Table
		, 'dbo._Alumni_Bridge' -- Destination_Table
		,'ContactId UNIQUEIDENTIFIER
			, Alumni_Key INT
			, Alumni_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Alumni_Key
			, Alumni_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Association_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Association_Bridge' -- Source_Table
		, 'dbo._Association_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Association_Key INT
			, Association_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Association_Key
			, Association_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Award_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Award_Bridge' -- Source_Table
		, 'dbo._Award_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Award_Key INT 
			, Award_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Award_Key 
			, Award_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Connection_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Connection_Bridge' -- Source_Table
		, 'dbo._Connection_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Connection_Key INT
			, Connection_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Connection_Key
			, Connection_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Drop_Include_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Drop_Include_Bridge' -- Source_Table
		, 'dbo._Drop_Include_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Drop_Include_Key INT
			, Drop_Include_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Drop_Include_Key
			, Drop_Include_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Email_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Email_Bridge' -- Source_Table
		, 'dbo._Email_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Email_Key INT
			, Email_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Email_Key
			, Email_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Employment_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Employment_Bridge' -- Source_Table
		, 'dbo._Employment_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Employment_Key INT
			, Employment_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Employment_Key
			, Employment_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Language_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Language_Bridge' -- Source_Table
		, 'dbo._Language_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Language_Key INT
			, Language_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Language_Key
			, Language_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Phone_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Phone_Bridge' -- Source_Table
		, 'dbo._Phone_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Phone_Key INT
			, Phone_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Phone_Key
			, Phone_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Psa_Bridge
-- --------------------------
	( 1 -- Tier
		, 'dbo._Psa_Bridge' -- Source_Table
		, 'dbo._Psa_Bridge' -- Destination_Table
		,'ContactId NVARCHAR(100)
			, Psa_Key INT
			, Psa_Group_Key INT
			' -- Dest_Create_Fields
		, 'ContactId
			, Psa_Key
			, Psa_Group_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Bio_Strat_Plan_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Bio_Strat_Plan_Fact' -- Source_Table
		, 'dbo._Bio_Strat_Plan_Fact' -- Destination_Table
		,'Bio_Strat_Plan_Key INT 
			, Donor_Key NVARCHAR(100) 
			, Plus_ConstituentNoteId NVARCHAR(100)
			, CreatedOn DATE
			, CreatedBy NVARCHAR(100)
			, ModifiedOn DATE
			, ModifiedBy NVARCHAR(100)
			, OwnerId NVARCHAR(100)
			, Plus_RelatedOpportunity NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Bio_Strat_Plan_Key 
			, Donor_Key 
			, Plus_ConstituentNoteId
			, CreatedOn
			, CreatedBy
			, ModifiedOn
			, ModifiedBy
			, OwnerId
			, Plus_RelatedOpportunity
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
,
-- --------------------------
-- _Bio_Strat_Plan_CreatedBy_Dim
-- --------------------------
( 1 -- Tier
	, 'dbo._Bio_Strat_Plan_CreatedBy_Dim' -- Source_Table
	, 'dbo._Bio_Strat_Plan_CreatedBy_Dim' -- Destination_Table
	,' Bio_Strat_Plan_CreatedBy_Key NVARCHAR(100) 
		, Bio_Strat_Plan_CreatedBy_Full_Name NVARCHAR(200)
		, Bio_Strat_Plan_CreatedBy_First_Name NVARCHAR(64)
		, Bio_Strat_Plan_CreatedBy_Last_Name NVARCHAR(64)
		, Bio_Strat_Plan_CreatedBy_Domain_Name NVARCHAR(1024)
	' -- Dest_Create_Fields
	, ' Bio_Strat_Plan_CreatedBy_Key
		, Bio_Strat_Plan_CreatedBy_Full_Name
		, Bio_Strat_Plan_CreatedBy_First_Name
		, Bio_Strat_Plan_CreatedBy_Last_Name
		, Bio_Strat_Plan_CreatedBy_Domain_Name
	' -- Dest_Insert_Fields
	, ' ' -- Dest_Where_Statement
	, GETDATE()
	, NULL
)
,
-- --------------------------
-- _Bio_Strat_Plan_ModifiedBy_Dim
-- --------------------------
( 1 -- Tier
	, 'dbo._Bio_Strat_Plan_ModifiedBy_Dim' -- Source_Table
	, 'dbo._Bio_Strat_Plan_ModifiedBy_Dim' -- Destination_Table
	,' Bio_Strat_Plan_ModifiedBy_Key NVARCHAR(100) 
		, Bio_Strat_Plan_ModifiedBy_Full_Name NVARCHAR(200)
		, Bio_Strat_Plan_ModifiedBy_First_Name NVARCHAR(64)
		, Bio_Strat_Plan_ModifiedBy_Last_Name NVARCHAR(64)
		, Bio_Strat_Plan_ModifiedBy_Domain_Name NVARCHAR(1024)
	' -- Dest_Create_Fields
	, ' Bio_Strat_Plan_ModifiedBy_Key
		, Bio_Strat_Plan_ModifiedBy_Full_Name
		, Bio_Strat_Plan_ModifiedBy_First_Name
		, Bio_Strat_Plan_ModifiedBy_Last_Name
		, Bio_Strat_Plan_ModifiedBy_Domain_Name
	' -- Dest_Insert_Fields
	, ' ' -- Dest_Where_Statement
	, GETDATE()
	, NULL
)
,
-- --------------------------
-- _Bio_Strat_Plan_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Bio_Strat_Plan_Dim' -- Source_Table
		, 'dbo._Bio_Strat_Plan_Dim' -- Destination_Table
		,'Bio_Strat_Plan_Key INT 
			, Donor_Key NVARCHAR(100) 
			, Plus_ConstituentNoteId NVARCHAR(100)
			, Plus_Type NVARCHAR(400)
			, Plus_ReasonForDrop NVARCHAR(400)
			, Plus_CoordinatingLiaisonNeeded NVARCHAR(400)
			, Plus_Subject NVARCHAR(200)
			, Plus_Date DATE
			, Plus_Note NVARCHAR(4000)
			' -- Dest_Create_Fields
		, 'Bio_Strat_Plan_Key 
			, Donor_Key 
			, Plus_ConstituentNoteId
			, Plus_Type
			, Plus_ReasonForDrop
			, Plus_CoordinatingLiaisonNeeded
			, Plus_Subject
			, Plus_Date
			, Plus_Note
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
,
-- --------------------------
-- _Byu_Employee_Giving_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Byu_Employee_Giving_Dim' -- Source_Table
		, 'dbo._Byu_Employee_Giving_Dim' -- Destination_Table
		,'Donor_Key NVARCHAR(100)
			, Month_Before_Last_Month_Gift_Total MONEY
			, Last_Month_Gift_Total MONEY
			, Byu_Employee_Giving_Upgrade NVARCHAR(1)
			, Byu_Employee_Giving_New NVARCHAR(1)
			, Byu_Employee_Giving_Campus_Address NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Month_Before_Last_Month_Gift_Total
			, Last_Month_Gift_Total
			, Byu_Employee_Giving_Upgrade
			, Byu_Employee_Giving_New
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Dl_Activities
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Dl_Activities' -- Source_Table
		, 'dbo.View_Dl_Activities' -- Destination_Table
		,'Owner NVARCHAR(200)
			, Donor_Ldsp_Id NVARCHAR(100)
			, Donor_Display_Name NVARCHAR(100)
			, Type NVARCHAR(100)
			, Subject NVARCHAR(200)
			, Regarding NVARCHAR(4000)
			, Face_To_Face NVARCHAR(1)
			, Scheduled_Start DATE
			, Scheduled_End DATE
			, Completed DATE
			, CreatedOn DATE
			, ModifiedOn DATE
			, Description  NVARCHAR(4000)
			, Attendees  NVARCHAR(4000)
			, Source NVARCHAR(100)
			, StateCode  NVARCHAR(400)
			, StatusCode NVARCHAR(400)
			, Donor_Key NVARCHAR(100)
			, Activity_Id NVARCHAR(100)
			, Regarding_Type NVARCHAR(15)
			' -- Dest_Create_Fields
		, 'Owner
			, Donor_Ldsp_Id
			, Donor_Display_Name
			, Type
			, Subject
			, Regarding
			, Face_To_Face
			, Scheduled_Start
			, Scheduled_End
			, Completed
			, CreatedOn
			, ModifiedOn
			, Description
			, Attendees
			, Source
			, StateCode
			, StatusCode
			, Donor_Key
			, Activity_Id
			, Regarding_Type
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Dl_Initiatives
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Dl_Initiatives' -- Source_Table
		, 'dbo.View_Dl_Initiatives' -- Destination_Table
		,'Donor_Ldsp_Id NVARCHAR(100)
			, Initiative_Key NVARCHAR(100)
			, Initiative_Name_Donor_Name NVARCHAR(1000)
			, Initiative_Step_Name NVARCHAR(400)
			, Initiative_State_Code NVARCHAR(400)
			, Initiative_Status_Code NVARCHAR(400)
			, Initiative_Proposal_Status NVARCHAR(400)	
			, Initiative_Liaison NVARCHAR(200)
			, Initiative_New_Account NVARCHAR(400)
			, Initiative_Proposal_Date DATE
			, Initiative_Targeted_Commitment_Date DATE
			, Initiative_Committed_Date DATE
			, Initiative_Cultivation_Proc_Stg_1_Date DATE
			, Initiative_Cultivation_Proc_Stg_2_Date DATE
			, Initiative_Cultivation_Proc_Stg_3_Date DATE
			, Initiative_Cultivation_Proc_Stg_4_Date DATE
			, Initiative_Gift_Notice_Created_Date DATE
			, Initiative_Proposal_Status_Change_Date DATE
			, Initiative_Coordinating_Liaison NVARCHAR(200)
			, Initiative_Supporting_Liaisons NVARCHAR(1000)
			, Initiative_Primary_Initiative NVARCHAR(1)
			, Initiative_Parent_Initiative NVARCHAR(600)
			, Initiative_Proposal_Amt MONEY
			, Initiative_Total_Committed_Amt MONEY
			, Initiative_Total_Given_Amt MONEY
			, Initiative_Has_Expectancy NVARCHAR(1)
			' -- Dest_Create_Fields
		, 'Donor_Ldsp_Id
			, Initiative_Key
			, Initiative_Name_Donor_Name
			, Initiative_Step_Name
			, Initiative_State_Code
			, Initiative_Status_Code
			, Initiative_Proposal_Status	
			, Initiative_Liaison
			, Initiative_New_Account
			, Initiative_Proposal_Date
			, Initiative_Targeted_Commitment_Date
			, Initiative_Committed_Date
			, Initiative_Cultivation_Proc_Stg_1_Date
			, Initiative_Cultivation_Proc_Stg_2_Date
			, Initiative_Cultivation_Proc_Stg_3_Date
			, Initiative_Cultivation_Proc_Stg_4_Date
			, Initiative_Gift_Notice_Created_Date
			, Initiative_Proposal_Status_Change_Date
			, Initiative_Coordinating_Liaison
			, Initiative_Supporting_Liaisons
			, Initiative_Primary_Initiative
			, Initiative_Parent_Initiative
			, Initiative_Proposal_Amt
			, Initiative_Total_Committed_Amt
			, Initiative_Total_Given_Amt
			, Initiative_Has_Expectancy
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Employment_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Employment_Dim' -- Source_Table
		, 'dbo._Donor_Employment_Dim' -- Destination_Table
		,'Donor_Key NVARCHAR(100) PRIMARY KEY
			, Byu_Employee_Giving_Campus_Address NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Byu_Employee_Giving_Campus_Address
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Total_Giving_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Total_Giving_Dim' -- Source_Table
		, 'dbo._Total_Giving_Dim' -- Destination_Table
		,'Donor_Key NVARCHAR(100) PRIMARY KEY
			, Total_Giving_Current_Year MONEY
			, Total_Giving_Current_Year_Minus_1 MONEY
			, Total_Giving_Current_Year_Minus_2 MONEY
			, Total_Giving_Current_Year_Minus_3 MONEY
			, Total_Giving_Current_Year_Minus_4 MONEY
			, Total_Giving_Current_Year_Minus_5 MONEY
			, Total_Giving_Current_Year_Byu MONEY
			, Total_Giving_Current_Year_Minus_1_Byu MONEY
			, Total_Giving_Current_Year_Minus_2_Byu MONEY
			, Total_Giving_Current_Year_Minus_3_Byu MONEY
			, Total_Giving_Current_Year_Minus_4_Byu MONEY
			, Total_Giving_Current_Year_Minus_5_Byu MONEY
			, Total_Giving_Current_Year_Byui MONEY
			, Total_Giving_Current_Year_Minus_1_Byui MONEY
			, Total_Giving_Current_Year_Minus_2_Byui MONEY
			, Total_Giving_Current_Year_Minus_3_Byui MONEY
			, Total_Giving_Current_Year_Minus_4_Byui MONEY
			, Total_Giving_Current_Year_Minus_5_Byui MONEY
			, Total_Giving_Current_Year_Byuh MONEY
			, Total_Giving_Current_Year_Minus_1_Byuh MONEY
			, Total_Giving_Current_Year_Minus_2_Byuh MONEY
			, Total_Giving_Current_Year_Minus_3_Byuh MONEY
			, Total_Giving_Current_Year_Minus_4_Byuh MONEY
			, Total_Giving_Current_Year_Minus_5_Byuh MONEY
			, Total_Giving_Current_Year_Ldsbc MONEY
			, Total_Giving_Current_Year_Minus_1_Ldsbc MONEY
			, Total_Giving_Current_Year_Minus_2_Ldsbc MONEY
			, Total_Giving_Current_Year_Minus_3_Ldsbc MONEY
			, Total_Giving_Current_Year_Minus_4_Ldsbc MONEY
			, Total_Giving_Current_Year_Minus_5_Ldsbc MONEY
			, Total_Giving_Current_Year_Church MONEY
			, Total_Giving_Current_Year_Minus_1_Church MONEY
			, Total_Giving_Current_Year_Minus_2_Church MONEY
			, Total_Giving_Current_Year_Minus_3_Church MONEY
			, Total_Giving_Current_Year_Minus_4_Church MONEY
			, Total_Giving_Current_Year_Minus_5_Church MONEY
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Total_Giving_Current_Year
			, Total_Giving_Current_Year_Minus_1
			, Total_Giving_Current_Year_Minus_2
			, Total_Giving_Current_Year_Minus_3
			, Total_Giving_Current_Year_Minus_4
			, Total_Giving_Current_Year_Minus_5
			, Total_Giving_Current_Year_Byu
			, Total_Giving_Current_Year_Minus_1_Byu
			, Total_Giving_Current_Year_Minus_2_Byu
			, Total_Giving_Current_Year_Minus_3_Byu
			, Total_Giving_Current_Year_Minus_4_Byu
			, Total_Giving_Current_Year_Minus_5_Byu
			, Total_Giving_Current_Year_Byui
			, Total_Giving_Current_Year_Minus_1_Byui
			, Total_Giving_Current_Year_Minus_2_Byui
			, Total_Giving_Current_Year_Minus_3_Byui
			, Total_Giving_Current_Year_Minus_4_Byui
			, Total_Giving_Current_Year_Minus_5_Byui
			, Total_Giving_Current_Year_Byuh
			, Total_Giving_Current_Year_Minus_1_Byuh
			, Total_Giving_Current_Year_Minus_2_Byuh
			, Total_Giving_Current_Year_Minus_3_Byuh
			, Total_Giving_Current_Year_Minus_4_Byuh
			, Total_Giving_Current_Year_Minus_5_Byuh
			, Total_Giving_Current_Year_Ldsbc
			, Total_Giving_Current_Year_Minus_1_Ldsbc
			, Total_Giving_Current_Year_Minus_2_Ldsbc
			, Total_Giving_Current_Year_Minus_3_Ldsbc
			, Total_Giving_Current_Year_Minus_4_Ldsbc
			, Total_Giving_Current_Year_Minus_5_Ldsbc
			, Total_Giving_Current_Year_Church
			, Total_Giving_Current_Year_Minus_1_Church
			, Total_Giving_Current_Year_Minus_2_Church
			, Total_Giving_Current_Year_Minus_3_Church
			, Total_Giving_Current_Year_Minus_4_Church
			, Total_Giving_Current_Year_Minus_5_Church
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)	
	,
-- --------------------------
-- _Total_Giving_With_Matching_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Total_Giving_With_Matching_Dim' -- Source_Table
		, 'dbo._Total_Giving_With_Matching_Dim' -- Destination_Table
		,'Donor_Key NVARCHAR(100) PRIMARY KEY
			, Total_Giving_With_Matching_Current_Year MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_1 MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_2 MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_3 MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_4 MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_5 MONEY
			, Total_Giving_With_Matching_Current_Year_Byu MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_1_Byu MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_2_Byu MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_3_Byu MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_4_Byu MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_5_Byu MONEY
			, Total_Giving_With_Matching_Current_Year_Byui MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_1_Byui MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_2_Byui MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_3_Byui MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_4_Byui MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_5_Byui MONEY
			, Total_Giving_With_Matching_Current_Year_Byuh MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_1_Byuh MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_2_Byuh MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_3_Byuh MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_4_Byuh MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_5_Byuh MONEY
			, Total_Giving_With_Matching_Current_Year_Ldsbc MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_1_Ldsbc MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_2_Ldsbc MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_3_Ldsbc MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_4_Ldsbc MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_5_Ldsbc MONEY
			, Total_Giving_With_Matching_Current_Year_Church MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_1_Church MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_2_Church MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_3_Church MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_4_Church MONEY
			, Total_Giving_With_Matching_Current_Year_Minus_5_Church MONEY
			' -- Dest_Create_Fields
		, 'Donor_Key
			, Total_Giving_With_Matching_Current_Year
			, Total_Giving_With_Matching_Current_Year_Minus_1
			, Total_Giving_With_Matching_Current_Year_Minus_2
			, Total_Giving_With_Matching_Current_Year_Minus_3
			, Total_Giving_With_Matching_Current_Year_Minus_4
			, Total_Giving_With_Matching_Current_Year_Minus_5
			, Total_Giving_With_Matching_Current_Year_Byu
			, Total_Giving_With_Matching_Current_Year_Minus_1_Byu
			, Total_Giving_With_Matching_Current_Year_Minus_2_Byu
			, Total_Giving_With_Matching_Current_Year_Minus_3_Byu
			, Total_Giving_With_Matching_Current_Year_Minus_4_Byu
			, Total_Giving_With_Matching_Current_Year_Minus_5_Byu
			, Total_Giving_With_Matching_Current_Year_Byui
			, Total_Giving_With_Matching_Current_Year_Minus_1_Byui
			, Total_Giving_With_Matching_Current_Year_Minus_2_Byui
			, Total_Giving_With_Matching_Current_Year_Minus_3_Byui
			, Total_Giving_With_Matching_Current_Year_Minus_4_Byui
			, Total_Giving_With_Matching_Current_Year_Minus_5_Byui
			, Total_Giving_With_Matching_Current_Year_Byuh
			, Total_Giving_With_Matching_Current_Year_Minus_1_Byuh
			, Total_Giving_With_Matching_Current_Year_Minus_2_Byuh
			, Total_Giving_With_Matching_Current_Year_Minus_3_Byuh
			, Total_Giving_With_Matching_Current_Year_Minus_4_Byuh
			, Total_Giving_With_Matching_Current_Year_Minus_5_Byuh
			, Total_Giving_With_Matching_Current_Year_Ldsbc
			, Total_Giving_With_Matching_Current_Year_Minus_1_Ldsbc
			, Total_Giving_With_Matching_Current_Year_Minus_2_Ldsbc
			, Total_Giving_With_Matching_Current_Year_Minus_3_Ldsbc
			, Total_Giving_With_Matching_Current_Year_Minus_4_Ldsbc
			, Total_Giving_With_Matching_Current_Year_Minus_5_Ldsbc
			, Total_Giving_With_Matching_Current_Year_Church
			, Total_Giving_With_Matching_Current_Year_Minus_1_Church
			, Total_Giving_With_Matching_Current_Year_Minus_2_Church
			, Total_Giving_With_Matching_Current_Year_Minus_3_Church
			, Total_Giving_With_Matching_Current_Year_Minus_4_Church
			, Total_Giving_With_Matching_Current_Year_Minus_5_Church
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Detail_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Detail_Dim' -- Source_Table
		, 'dbo._Donor_Detail_Dim' -- Destination_Table
		,'	Donor_Key  NVARCHAR(100)  PRIMARY KEY      
			, Donor_Marriage_Status NVARCHAR(400) 
			, Donor_Gender NVARCHAR(400) 
			, Donor_Lds_Member NVARCHAR(400) 
			, Donor_Birth_Dt DATE
			, Donor_Birth_Dt_Day NVARCHAR(100) 
			, Donor_Birth_Dt_Month NVARCHAR(100) 
			, Donor_Birth_Dt_Year NVARCHAR(100) 
			, Donor_Deceased_Dt DATE
			, Donor_Deceased_Dt_Day NVARCHAR(100)
			, Donor_Deceased_Dt_Month NVARCHAR(100)
			, Donor_Deceased_Dt_Year NVARCHAR(100) 
			, Donor_Country NVARCHAR(100)
			, Donor_Deceased_Yn NVARCHAR(1)
			, Donor_Age INT
			, General_Authority NVARCHAR(1)
			, Emeritus_General_Authority NVARCHAR(1)
			, Mission_President NVARCHAR(1)
			, Temple_President NVARCHAR(1)
			, Cell_Phone NVARCHAR(100)
			, Donor_Ldsp_Text_Lines NVARCHAR(4000)
			, Donor_Qualified NVARCHAR(1)
			, Donor_Qualified_By NVARCHAR(200)
			, Donor_Qualified_On DATE
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_Marriage_Status 
			, Donor_Gender 
			, Donor_Lds_Member 
			, Donor_Birth_Dt
			, Donor_Birth_Dt_Day 
			, Donor_Birth_Dt_Month 
			, Donor_Birth_Dt_Year
			, Donor_Deceased_Dt
			, Donor_Deceased_Dt_Day
			, Donor_Deceased_Dt_Month
			, Donor_Deceased_Dt_Year 
			, Donor_Country
			, Donor_Deceased_Yn
			, Donor_Age
			, General_Authority
			, Emeritus_General_Authority
			, Mission_President
			, Temple_President
			, Cell_Phone
			, Donor_Ldsp_Text_Lines
			, Donor_Qualified
			, Donor_Qualified_By
			, Donor_Qualified_On
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Connection_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Connection_Dim' -- Source_Table
		, 'dbo._Donor_Connection_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100)   
			, All_Personal_Connections NVARCHAR(4000)
			, Spouse_Name NVARCHAR(100)
			, Spouse_LdspId INT
			, Plus_SpousePreferredFirstName NVARCHAR(100)
			, Plus_SpousePreferredMiddleName NVARCHAR(100)
			, Plus_SpousePreferredLastName NVARCHAR(100)
			, Plus_SpousePreferredFullName NVARCHAR(100)
			, Spouse_Phone_Number NVARCHAR(100)
			, Spouse_Email NVARCHAR(100) 
			, Spouse_First_Name NVARCHAR(100)
			, Spouse_Last_Name NVARCHAR(100)
			, Spouse_Birth_Date DATE
			, Spouse_Age INT
			, Donor_Spouse_Middle_Name NVARCHAR(50)
			, Donor_Spouse_Birth_Name NVARCHAR(100)
			, Donor_Spouse_Coordinating_Liaison NVARCHAR(400)
			, Donor_Spouse_Coordinating_Liaison_Domain_Name NVARCHAR(1024) 
			, Donor_Liaison_Connections NVARCHAR(4000)
			, Donor_Couple_Infor_Envel NVARCHAR(300)
			, Donor_Couple_Form_Envel NVARCHAR(300)
			, Donor_Spouses_Name NVARCHAR(100) 
			, Donor_Total_Name_Display NVARCHAR(200)
			, Spouse_Education_Summary NVARCHAR(2000)
			' -- Dest_Create_Fields
		, '	Donor_Key   
			, All_Personal_Connections
			, Spouse_Name
			, Spouse_LdspId
			, Plus_SpousePreferredFirstName
			, Plus_SpousePreferredMiddleName
			, Plus_SpousePreferredLastName
			, Plus_SpousePreferredFullName
			, Spouse_Phone_Number
			, Spouse_Email
			, Spouse_First_Name
			, Spouse_Last_Name
			, Spouse_Birth_Date
			, Spouse_Age
			, Donor_Spouse_Middle_Name
			, Donor_Spouse_Birth_Name
			, Donor_Spouse_Coordinating_Liaison
			, Donor_Spouse_Coordinating_Liaison_Domain_Name 
			, Donor_Liaison_Connections
			, Donor_Couple_Infor_Envel
			, Donor_Couple_Form_Envel
			, Donor_Spouses_Name 
			, Donor_Total_Name_Display
			, Spouse_Education_Summary
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Qualifieds
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Qualifieds' -- Source_Table
		, 'dbo.View_Qualifieds' -- Destination_Table
		,'	Ldsp_Id NVARCHAR(100)
			, Donor_Full_Name NVARCHAR(160)
			, Is_Qualified  NVARCHAR(1)
			, Qualified_By NVARCHAR(200)
			, Qualified_On DATE
			, Coordinating_Liaison NVARCHAR(200)
			, Pending_Liaison NVARCHAR(200)
			' -- Dest_Create_Fields
		, '	Ldsp_Id
			, Donor_Full_Name
			, Is_Qualified
			, Qualified_By
			, Qualified_On
			, Coordinating_Liaison
			, Pending_Liaison
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Bio_Strat_Plan_OwnerId_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Bio_Strat_Plan_OwnerId_Dim' -- Source_Table
		, 'dbo._Bio_Strat_Plan_OwnerId_Dim' -- Destination_Table
		,'	Bio_Strat_Plan_OwnerId_Key NVARCHAR(100) PRIMARY KEY
			, Bio_Strat_Plan_OwnerId_Full_Name NVARCHAR(200)
			, Bio_Strat_Plan_OwnerId_First_Name NVARCHAR(64)
			, Bio_Strat_Plan_OwnerId_Last_Name NVARCHAR(64)
			, Bio_Strat_Plan_OwnerId_Domain_Name NVARCHAR(1024)
			' -- Dest_Create_Fields
		, '	Bio_Strat_Plan_OwnerId_Key
			, Bio_Strat_Plan_OwnerId_Full_Name
			, Bio_Strat_Plan_OwnerId_First_Name
			, Bio_Strat_Plan_OwnerId_Last_Name
			, Bio_Strat_Plan_OwnerId_Domain_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Accounting_Data
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Accounting_Data' -- Source_Table
		, 'dbo.View_Accounting_Data' -- Destination_Table
		,'	Accounting_Fact_Key BIGINT
			, Donor_Ldsp_Id NVARCHAR(100)
			, Donor_Contact_Type NVARCHAR(100)
			, Donor_Name NVARCHAR(160)
			, Donor_First_Name NVARCHAR(50)
			, Donor_Last_Name NVARCHAR(50)
			, Address_Street_1 NVARCHAR(100)
			, Address_Street_2 NVARCHAR(100)
			, Address_City NVARCHAR(100)
			, Address_State_Code NVARCHAR(100)
			, Address_Post_Code_Full NVARCHAR(100)
			, Address_Post_Code_Last_4 NVARCHAR(15)
			, Address_Country NVARCHAR(100)
			, Address_State_Province  NVARCHAR(50)
			, Address_County NVARCHAR(100)
			, Record_Status NVARCHAR(100)
			, New_AccountingDate DATE
			, Accounting_Amt MONEY
			, Hier_Name NVARCHAR(100)
			, New_Inst NVARCHAR(100)
			, Hier_Level_1 NVARCHAR(100)
			, Hier_Level_2 NVARCHAR(100)
			, Hier_Level_3 NVARCHAR(100)
			, Fund_Account_Number NVARCHAR(100)
			, Fund_Name NVARCHAR(100)
			, New_InstitutionAccountNumber NVARCHAR(100)
			, Plus_Unrestricted NVARCHAR(1)
			, New_BatchNumber NVARCHAR(100)
			, Lds_BatchType NVARCHAR(400)
			, Appeal_Code NVARCHAR(20)
			, Appeal_Name NVARCHAR(100)
			, Accounting_Kind_Desc NVARCHAR(400)
			, Accounting_Tender_Type_Desc NVARCHAR(400)
			, Accounting_Transmitted_Desc  NVARCHAR(400)
			, Accounting_Text_Description_Text  NVARCHAR(4000)
			, Accounting_Text_Gift_Adjustment_Text  NVARCHAR(4000)
			, Accounting_Text_Receipt_Text  NVARCHAR(4000)
			, Accounting_Receipt_Date DATE
			, Accounting_Post_Date DATE
			, Accounting_Related_Gift_Number NVARCHAR(50)
			, Accounting_Gift_Source NVARCHAR(400)
			, Accounting_Adjustment_Yn NVARCHAR(1)
			, Accounting_Same_Month_Adj_Yn NVARCHAR(1)
			, Accounting_Current_Year_Adj_Yn NVARCHAR(1)
			, Accounting_Recognition_Credit_Recipients NVARCHAR(4000)
			' -- Dest_Create_Fields
		, '	Accounting_Fact_Key
			, Donor_Ldsp_Id
			, Donor_Contact_Type
			, Donor_Name
			, Donor_First_Name
			, Donor_Last_Name
			, Address_Street_1
			, Address_Street_2
			, Address_City
			, Address_State_Code
			, Address_Post_Code_Full
			, Address_Post_Code_Last_4
			, Address_Country
			, Address_State_Province
			, Address_County
			, Record_Status
			, New_AccountingDate
			, Accounting_Amt
			, Hier_Name
			, New_Inst
			, Hier_Level_1
			, Hier_Level_2
			, Hier_Level_3
			, Fund_Account_Number
			, Fund_Name
			, New_InstitutionAccountNumber
			, Plus_Unrestricted
			, New_BatchNumber
			, Lds_BatchType
			, Appeal_Code
			, Appeal_Name
			, Accounting_Kind_Desc
			, Accounting_Tender_Type_Desc
			, Accounting_Transmitted_Desc
			, Accounting_Text_Description_Text
			, Accounting_Text_Gift_Adjustment_Text
			, Accounting_Text_Receipt_Text
			, Accounting_Receipt_Date
			, Accounting_Post_Date
			, Accounting_Related_Gift_Number
			, Accounting_Gift_Source
			, Accounting_Adjustment_Yn
			, Accounting_Same_Month_Adj_Yn
			, Accounting_Current_Year_Adj_Yn
			, Accounting_Recognition_Credit_Recipients
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Organization_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Organization_Dim' -- Source_Table
		, 'dbo._Donor_Organization_Dim' -- Destination_Table
		,'	Donor_Key  NVARCHAR(100)  PRIMARY KEY
			, Donor_Org_Matches_Gifts_Yn  NVARCHAR(1)
			, Donor_Org_Allow_Mail_Yn NVARCHAR(1)
			, Donor_Org_Allow_Bulk_Mail_Yn NVARCHAR(1)
			, Donor_Org_Allow_Email_Yn NVARCHAR(1)
			, Donor_Org_Allow_Bulk_Email_Yn NVARCHAR(1)
			, Donor_Org_Allow_Phone_Yn NVARCHAR(1)
			, Donor_Org_Allow_Fax_Yn NVARCHAR(1)
			, Donor_Org_Class_Code NVARCHAR(400)
			, Donor_Org_Retiree_Ratio NVARCHAR(400) 
			, Donor_Org_Split_Ratio NVARCHAR(400)
			, Donor_Org_Matching_Ratio NVARCHAR(400)
			, Donor_Org_Pref_Cont_Meth NVARCHAR(400)
			, Donor_Org_Description NVARCHAR(4000)
			' -- Dest_Create_Fields
		, '	Donor_Key
			, Donor_Org_Matches_Gifts_Yn
			, Donor_Org_Allow_Mail_Yn 
			, Donor_Org_Allow_Bulk_Mail_Yn 
			, Donor_Org_Allow_Email_Yn
			, Donor_Org_Allow_Bulk_Email_Yn
			, Donor_Org_Allow_Phone_Yn
			, Donor_Org_Allow_Fax_Yn
			, Donor_Org_Class_Code
			, Donor_Org_Retiree_Ratio
			, Donor_Org_Split_Ratio
			, Donor_Org_Matching_Ratio
			, Donor_Org_Pref_Cont_Meth
			, Donor_Org_Description
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Financial_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Financial_Dim' -- Source_Table
		, 'dbo._Donor_Financial_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100)
			, Donor_Wealth_Dt DATE
			, Donor_Major_Gift_Propen  NVARCHAR(400)
			, Donor_Annual_Gift NVARCHAR(400) 
			, Donor_Planned_Gift NVARCHAR(400)
			, Donor_Gift_Capacity_Enp NVARCHAR(400)
			, Donor_Gift_Capacity_En NVARCHAR(400) 
			, Donor_Philan_Cap_Rating NVARCHAR(400) 
			, Donor_Est_Household_Income NVARCHAR(400) 
			, Donor_Est_Home_Market_Val NVARCHAR(400) 
			, Donor_Block_Clusters NVARCHAR(400)
			, Donor_Total_Donation NVARCHAR(50)
			, Byu_Donor NVARCHAR(1)
			, ByuI_Donor NVARCHAR(1)
			, ByuH_Donor NVARCHAR(1)
			, Ldsbc_Donor NVARCHAR(1)
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_Wealth_Dt
			, Donor_Major_Gift_Propen 
			, Donor_Annual_Gift 
			, Donor_Planned_Gift
			, Donor_Gift_Capacity_Enp 
			, Donor_Gift_Capacity_En 
			, Donor_Philan_Cap_Rating 
			, Donor_Est_Household_Income 
			, Donor_Est_Home_Market_Val 
			, Donor_Block_Clusters
			, Donor_Total_Donation
			, Byu_Donor
			, ByuI_Donor
			, ByuH_Donor
			, Ldsbc_Donor
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Education_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Education_Dim' -- Source_Table
		, 'dbo._Donor_Education_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100) PRIMARY KEY
			, Byu_Student_Id NVARCHAR(100)
			, ByuI_Student_Id NVARCHAR(100)
			, ByuH_Student_Id NVARCHAR(100)
			, Ldsbc_Student_Id NVARCHAR(100)
			, Byu_Employee_Id NVARCHAR(100)
			, ByuI_Employee_Id NVARCHAR(100)
			, ByuH_Employee_Id NVARCHAR(100)
			, Ldsbc_Employee_Id NVARCHAR(100)
			, Ces_Id NVARCHAR(100)
			, Byu_Degrees NVARCHAR(4000)
			, ByuI_Degrees NVARCHAR(4000)
			, ByuH_Degrees NVARCHAR(4000)
			, Ldsbc_Degrees NVARCHAR(4000)
			, Donor_Any_School_Current_Student NVARCHAR(1)
			, Donor_BYU_Current_Student NVARCHAR(1)
			, Donor_BYUI_Current_Student NVARCHAR(1)
			, Donor_BYUH_Current_Student NVARCHAR(1)
			, Donor_LDSBC_Current_Student NVARCHAR(1)
			, Donor_Current_Student_Yn NVARCHAR(1) 
			, Byu_Mba_Class_Year NVARCHAR(20)
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Byu_Student_Id
			, ByuI_Student_Id
			, ByuH_Student_Id
			, Ldsbc_Student_Id
			, Byu_Employee_Id
			, ByuI_Employee_Id
			, ByuH_Employee_Id
			, Ldsbc_Employee_Id
			, Ces_Id
			, Byu_Degrees
			, ByuI_Degrees
			, ByuH_Degrees
			, Ldsbc_Degrees
			, Donor_Any_School_Current_Student
			, Donor_BYU_Current_Student
			, Donor_BYUI_Current_Student
			, Donor_BYUH_Current_Student
			, Donor_LDSBC_Current_Student
			, Donor_Current_Student_Yn 
			, Byu_Mba_Class_Year
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Ldsp_Org_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Ldsp_Org_Dim' -- Source_Table
		, 'dbo._Donor_Ldsp_Org_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100) PRIMARY KEY
			, Donor_Linked_Lds_Account NVARCHAR(1)
			, Ldsp_Org_Donor NVARCHAR(1)
			, Ldsp_Org_Current_Recurring_Donor_Type NVARCHAR(50)
			, Ldsp_Org_Recurring_Donor NVARCHAR(1)
			, Ldsp_Org_Current_Recurring_Donor NVARCHAR(1)
			' -- Dest_Create_Fields
		, '	Donor_Key
			, Donor_Linked_Lds_Account
			, Ldsp_Org_Donor
			, Ldsp_Org_Current_Recurring_Donor_Type
			, Ldsp_Org_Recurring_Donor
			, Ldsp_Org_Current_Recurring_Donor
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Web_Subscription_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Web_Subscription_Dim' -- Source_Table
		, 'dbo._Web_Subscription_Dim' -- Destination_Table
		,'	WebSubscription_Dim_Key NVARCHAR(100) PRIMARY KEY
			, Web_Subscription_Name NVARCHAR(100) 
			, Transaction_ID NVARCHAR(100)
			, Recurring_Donation_Start_Date DATE
			, Recurring_Donation_Stop_Date DATE
			, Next_Payment_Date DATE
			, Payment_Type NVARCHAR(400)
			, Tender_Name NVARCHAR(400) 
			, Opt_Into_Email_Communication NVARCHAR(400) 
			, CID NVARCHAR(200)
			, CDE2 NVARCHAR(200)
			, Type_of_Donation NVARCHAR(400)
			, Appeal_Code NVARCHAR(10)
			, Donor_First_Name_From_Web NVARCHAR(100)
			, Donor_Middle_Name_From_Web NVARCHAR(100)
			, Donor_Last_Name_From_Web NVARCHAR(100)
			, Web_Subscription_Linked_LDS_Account NVARCHAR(1)
			, Donor_Email_From_Web NVARCHAR(100)
			, Donor_Phone_Number_From_Web NVARCHAR(100)
			, Donor_Address_Line_1_From_Web NVARCHAR(100)
			, Donor_Address_Line_2_From_Web NVARCHAR(100)
			, Donor_Address_City_From_Web NVARCHAR(100)
			, Donor_Address_State_From_Web NVARCHAR(100)
			, Donor_Address_Zip_Code_From_Web NVARCHAR(100)
			, Donor_Address_Country_From_Web NVARCHAR(100)
			, Comments NVARCHAR(1000)
			, Telefund_Comments NVARCHAR(4000)	
			, Donor_Type NVARCHAR(400)	
			, Donor_Match_Status NVARCHAR(400)	
			, Web_Subscription_Status NVARCHAR(400)
			, Web_Subscription_Status_Reason NVARCHAR(400)	
			, Web_Subscription_Created_On DATE
			, Web_Subscription_Modified_On DATE
			, Address_Match NVARCHAR(400)	
			, Data_Entry_Status NVARCHAR(400)
			, Receipt_Date DATETIME
			, Matched_by_User NVARCHAR(200)
			' -- Dest_Create_Fields
		, '	WebSubscription_Dim_Key
			, Web_Subscription_Name
			, Transaction_ID
			, Recurring_Donation_Start_Date
			, Recurring_Donation_Stop_Date
			, Next_Payment_Date
			, Payment_Type
			, Tender_Name
			, Opt_Into_Email_Communication
			, CID
			, CDE2
			, Type_of_Donation
			, Appeal_Code
			, Donor_First_Name_From_Web
			, Donor_Middle_Name_From_Web
			, Donor_Last_Name_From_Web
			, Web_Subscription_Linked_LDS_Account
			, Donor_Email_From_Web
			, Donor_Phone_Number_From_Web
			, Donor_Address_Line_1_From_Web
			, Donor_Address_Line_2_From_Web
			, Donor_Address_City_From_Web
			, Donor_Address_State_From_Web
			, Donor_Address_Zip_Code_From_Web
			, Donor_Address_Country_From_Web
			, Comments
			, Telefund_Comments	
			, Donor_Type	
			, Donor_Match_Status	
			, Web_Subscription_Status
			, Web_Subscription_Status_Reason	
			, Web_Subscription_Created_On
			, Web_Subscription_Modified_On	
			, Address_Match	
			, Data_Entry_Status
			, Receipt_Date
			, Matched_by_User
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Web_Subscription_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Web_Subscription_Fact' -- Source_Table
		, 'dbo._Web_Subscription_Fact' -- Destination_Table
		,'	WebSubscription_Key NVARCHAR(100) PRIMARY KEY
			, WebSubscription_Dim_Key NVARCHAR(100)
			, Transaction_Total MONEY
			, Donor_Key NVARCHAR(100)
			, Appeal_Key NVARCHAR(100)
			' -- Dest_Create_Fields
		, '	WebSubscription_Key
			, WebSubscription_Dim_Key
			, Transaction_Total
			, Donor_Key
			, Appeal_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Web_Subscription
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Web_Subscription' -- Source_Table
		, 'dbo.View_Web_Subscription' -- Destination_Table
		,'	Web_Subscription_OA_ID NVARCHAR(100)
			, Web_Subscription_Name NVARCHAR(100) 
			, Transaction_Total MONEY
			, Transaction_ID NVARCHAR(100)
			, Recurring_Donation_Start_Date DATE
			, Recurring_Donation_Stop_Date DATE
			, Next_Payment_Date DATE
			, Payment_Type NVARCHAR(400)
			, Tender_Name NVARCHAR(400)
			, Opt_Into_Email_Communication NVARCHAR(400)
			, CID NVARCHAR(200)
			, CDE2 NVARCHAR(200)
			, Type_of_Donation NVARCHAR(400)
			, Appeal_Code NVARCHAR(10)
			, Appeal_Name NVARCHAR(100)
			, Appeal_Delivery_Type NVARCHAR(400)
			, Donor_First_Name_From_Web NVARCHAR(100)
			, Donor_Middle_Name_From_Web NVARCHAR(100)
			, Donor_Last_Name_From_Web NVARCHAR(100)
			, Web_Subscription_Linked_LDS_Account NVARCHAR(1)
			, Donor_Email_From_Web NVARCHAR(100)
			, Donor_Phone_Number_From_Web NVARCHAR(100)
			, Donor_Address_Line_1_From_Web NVARCHAR(100)
			, Donor_Address_Line_2_From_Web NVARCHAR(100)
			, Donor_Address_City_From_Web NVARCHAR(100)
			, Donor_Address_State_From_Web NVARCHAR(100)
			, Donor_Address_Zip_Code_From_Web NVARCHAR(100)
			, Donor_Address_Country_From_Web NVARCHAR(100)
			, Comments NVARCHAR(1000)
			, Telefund_Comments NVARCHAR(4000)
			, Donor_Type NVARCHAR(400)	
			, Donor_Match_Status NVARCHAR(400)
			, Web_Subscription_Status NVARCHAR(400)
			, Web_Subscription_Status_Reason NVARCHAR(400)	
			, Web_Subscription_Created_On DATE
			, Web_Subscription_Modified_On DATE
			, Address_Match NVARCHAR(400)	
			, Data_Entry_Status NVARCHAR(400)
			, Receipt_Date DATETIME
			, Donor_Key NVARCHAR(100)
			, Donor_Gender NVARCHAR(400)
			, Birthdate DATE
			, Donor_Preferred_Name NVARCHAR(100)
			, Donor_Name NVARCHAR(160)
			, Donor_Primary_Email NVARCHAR(150)
			, Donor_Marriage_Status NVARCHAR(400)
			, Donor_Deceased NVARCHAR(1)
			, Donor_Linked_Lds_Account NVARCHAR(1)
			, Donor_LDSPID	NVARCHAR(100)
			, Donor_CreatedOn DATE
			, Donor_ModifiedOn DATE
			, Donor_Status NVARCHAR(400)
			, Donor_Status_Reason	NVARCHAR(400)
			, Matched_by_User NVARCHAR(200)
			' -- Dest_Create_Fields
		, '	Web_Subscription_OA_ID
			, Web_Subscription_Name
			, Transaction_Total
			, Transaction_ID
			, Recurring_Donation_Start_Date
			, Recurring_Donation_Stop_Date
			, Next_Payment_Date
			, Payment_Type
			, Tender_Name
			, Opt_Into_Email_Communication
			, CID
			, CDE2
			, Type_of_Donation
			, Appeal_Code
			, Appeal_Name
			, Appeal_Delivery_Type
			, Donor_First_Name_From_Web
			, Donor_Middle_Name_From_Web
			, Donor_Last_Name_From_Web
			, Web_Subscription_Linked_LDS_Account
			, Donor_Email_From_Web
			, Donor_Phone_Number_From_Web
			, Donor_Address_Line_1_From_Web
			, Donor_Address_Line_2_From_Web
			, Donor_Address_City_From_Web
			, Donor_Address_State_From_Web
			, Donor_Address_Zip_Code_From_Web
			, Donor_Address_Country_From_Web
			, Comments
			, Telefund_Comments	
			, Donor_Type	
			, Donor_Match_Status	
			, Web_Subscription_Status
			, Web_Subscription_Status_Reason	
			, Web_Subscription_Created_On
			, Web_Subscription_Modified_On	
			, Address_Match	
			, Data_Entry_Status
			, Receipt_Date
			, Donor_Key
			, Donor_Gender
			, Birthdate
			, Donor_Preferred_Name
			, Donor_Name
			, Donor_Primary_Email
			, Donor_Marriage_Status 
			, Donor_Deceased
			, Donor_Linked_Lds_Account
			, Donor_LDSPID	
			, Donor_CreatedOn
			, Donor_ModifiedOn
			, Donor_Status
			, Donor_Status_Reason	
			, Matched_by_User
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Web_Transaction_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Web_Transaction_Dim' -- Source_Table
		, 'dbo._Web_Transaction_Dim' -- Destination_Table
		,'	WebTransaction_Dim_Key NVARCHAR(100) PRIMARY KEY
			, Transaction_Id NVARCHAR(100)
			, Receipt_Date DATETIME
			, Payment_Type NVARCHAR(400) 
			, Tender_Name NVARCHAR(400)
			, Type_Of_Donation NVARCHAR(400)
			, Recurred_Donation_Status NVARCHAR(400)
			, Appeal_Code NVARCHAR(10)
			, Cid NVARCHAR(200)
			, Cde2 NVARCHAR(200)
			, Score NVARCHAR(100)
			, Opt_Into_Email_Communication NVARCHAR(400)
			, Donor_First_Name_From_Web NVARCHAR(100)
			, Donor_Middle_Name_From_Web NVARCHAR(100)
			, Donor_Last_Name_From_Web NVARCHAR(100)
			, Web_Transaction_Linked_Lds_Account NVARCHAR(1)
			, Donor_Email_From_Web NVARCHAR(255)
			, Donor_Phone_Number_From_Web NVARCHAR(100)
			, Donor_Address_Line_1_From_Web NVARCHAR(100)
			, Donor_Address_Line_2_From_Web NVARCHAR(100)
			, Donor_Address_City_From_Web NVARCHAR(100)
			, Donor_Address_State_From_Web NVARCHAR(100)
			, Donor_Address_Zip_Code_From_Web NVARCHAR(100)
			, Donor_Address_Country_From_Web NVARCHAR(100)
			, Comments NVARCHAR(1000)
			, Telefund_Comments NVARCHAR(4000)
			, Address_Match NVARCHAR(400) 
			, Data_Entry_Status NVARCHAR(400)
			, In_Memoriam_Flag NVARCHAR(400)
			, In_Memory_Of_Type NVARCHAR(400)
			, Notify_Fmaily_Friends NVARCHAR(400)
			, Notify_This_Person NVARCHAR(400)
			, Honoree_Name NVARCHAR(100)
			, Notify_By_Card NVARCHAR(400)
			, Notify_By_Email NVARCHAR(400)
			, Web_Transaction_Status NVARCHAR(400)
			, Web_Transaction_Status_Reason NVARCHAR(400)
			, Web_Transaction_Created_On DATE
			, Web_Transaction_Modified_On DATE
			, Web_Transaction_Modified_By NVARCHAR(200)
			' -- Dest_Create_Fields
		, '	WebTransaction_Dim_Key
			, Transaction_Id
			, Receipt_Date
			, Payment_Type 
			, Tender_Name
			, Type_Of_Donation
			, Recurred_Donation_Status
			, Appeal_Code
			, Cid
			, Cde2
			, Score
			, Opt_Into_Email_Communication
			, Donor_First_Name_From_Web
			, Donor_Middle_Name_From_Web
			, Donor_Last_Name_From_Web
			, Web_Transaction_Linked_Lds_Account
			, Donor_Email_From_Web
			, Donor_Phone_Number_From_Web
			, Donor_Address_Line_1_From_Web
			, Donor_Address_Line_2_From_Web
			, Donor_Address_City_From_Web
			, Donor_Address_State_From_Web
			, Donor_Address_Zip_Code_From_Web
			, Donor_Address_Country_From_Web
			, Comments
			, Telefund_Comments
			, Address_Match 
			, Data_Entry_Status
			, In_Memoriam_Flag
			, In_Memory_Of_Type
			, Notify_Fmaily_Friends
			, Notify_This_Person
			, Honoree_Name
			, Notify_By_Card
			, Notify_By_Email
			, Web_Transaction_Status
			, Web_Transaction_Status_Reason
			, Web_Transaction_Created_On
			, Web_Transaction_Modified_On
			, Web_Transaction_Modified_By
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Web_Transaction_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Web_Transaction_Fact' -- Source_Table
		, 'dbo._Web_Transaction_Fact' -- Destination_Table
		,'	WebTransaction_Key NVARCHAR(100) PRIMARY KEY
			, WebTransaction_Dim_Key NVARCHAR(100)
			, Transaction_Total MONEY
			, Donor_Key NVARCHAR(100)
			, Appeal_Key NVARCHAR(100)
			' -- Dest_Create_Fields
		, '	WebTransaction_Key
			, WebTransaction_Dim_Key
			, Transaction_Total
			, Donor_Key
			, Appeal_Key
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Web_Transaction
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Web_Transaction' -- Source_Table
		, 'dbo.View_Web_Transaction' -- Destination_Table
		,'	Web_Transaction_OA_ID NVARCHAR(100)
			, Transaction_Id NVARCHAR(100) 
			, Transaction_Total MONEY
			, Receipt_Date DATETIME
			, Payment_Type NVARCHAR(400)
			, Tender_Name NVARCHAR(400)
			, Type_of_Donation NVARCHAR(400)
			, Recurred_Donation_Status NVARCHAR(400)
			, Appeal_Code NVARCHAR(10)
			, Appeal_Name NVARCHAR(100)
			, Appeal_Delivery_Type NVARCHAR(400)			
			, CID NVARCHAR(200)
			, CDE2 NVARCHAR(200)
			, Score NVARCHAR(100)			
			, Opt_Into_Email_Communication NVARCHAR(400)
			, Donor_First_Name_From_Web NVARCHAR(100)
			, Donor_Middle_Name_From_Web NVARCHAR(100)
			, Donor_Last_Name_From_Web NVARCHAR(100)
			, Web_Transaction_Linked_LDS_Account NVARCHAR(1)			
			, Donor_Email_From_Web NVARCHAR(100)
			, Donor_Phone_Number_From_Web NVARCHAR(100)
			, Donor_Address_Line_1_From_Web NVARCHAR(100)
			, Donor_Address_Line_2_From_Web NVARCHAR(100)
			, Donor_Address_City_From_Web NVARCHAR(100)
			, Donor_Address_State_From_Web NVARCHAR(100)
			, Donor_Address_Zip_Code_From_Web NVARCHAR(100)
			, Donor_Address_Country_From_Web NVARCHAR(100)						
			, Comments NVARCHAR(1000)
			, Telefund_Comments NVARCHAR(4000)
			, Address_Match NVARCHAR(400)
			, Data_Entry_Status NVARCHAR(400)
			, In_Memoriam_Flag NVARCHAR(400)
			, In_Memory_Of_Type NVARCHAR(400)
			, Notify_Fmaily_Friends NVARCHAR(400)
			, Notify_This_Person NVARCHAR(400)
			, Honoree_Name NVARCHAR(100)
			, Notify_By_Card NVARCHAR(400)
			, Notify_By_Email NVARCHAR(400)
			, Web_Transaction_Status NVARCHAR(400)
			, Web_Transaction_Status_Reason NVARCHAR(400)
			, Web_Transaction_Created_On DATE
			, Web_Transaction_Modified_On DATE
			, Web_Transaction_Modified_By NVARCHAR(200)
			, DonorId NVARCHAR(100)
			, Donor_Gender NVARCHAR(400)
			, Birthdate DATE
			, Donor_Preferred_Name NVARCHAR(100)
			, Donor_Name NVARCHAR(160)
			, Donor_Primary_Email NVARCHAR(150)
			, Donor_Marriage_Status NVARCHAR(400)
			, Donor_Deceased NVARCHAR(1)
			, Donor_Linked_Lds_Account NVARCHAR(1)
			, Donor_LDSPID NVARCHAR(100)
			, Donor_CreatedOn DATE
			, Donor_ModifiedOn DATE
			, Donor_Status NVARCHAR(400)
			, Donor_Status_Reason NVARCHAR(400)
			' -- Dest_Create_Fields
		, '	Web_Transaction_OA_ID
			, Transaction_Id 
			, Transaction_Total
			, Receipt_Date
			, Payment_Type
			, Tender_Name
			, Type_of_Donation
			, Recurred_Donation_Status
			, Appeal_Code
			, Appeal_Name
			, Appeal_Delivery_Type			
			, CID
			, CDE2
			, Score			
			, Opt_Into_Email_Communication
			, Donor_First_Name_From_Web
			, Donor_Middle_Name_From_Web
			, Donor_Last_Name_From_Web
			, Web_Transaction_Linked_LDS_Account			
			, Donor_Email_From_Web
			, Donor_Phone_Number_From_Web
			, Donor_Address_Line_1_From_Web
			, Donor_Address_Line_2_From_Web
			, Donor_Address_City_From_Web
			, Donor_Address_State_From_Web
			, Donor_Address_Zip_Code_From_Web
			, Donor_Address_Country_From_Web						
			, Comments
			, Telefund_Comments
			, Address_Match
			, Data_Entry_Status
			, In_Memoriam_Flag
			, In_Memory_Of_Type
			, Notify_Fmaily_Friends
			, Notify_This_Person
			, Honoree_Name
			, Notify_By_Card
			, Notify_By_Email
			, Web_Transaction_Status
			, Web_Transaction_Status_Reason
			, Web_Transaction_Created_On
			, Web_Transaction_Modified_On
			, Web_Transaction_Modified_By
			, DonorId
			, Donor_Gender
			, Birthdate
			, Donor_Preferred_Name
			, Donor_Name
			, Donor_Primary_Email
			, Donor_Marriage_Status
			, Donor_Deceased
			, Donor_Linked_Lds_Account
			, Donor_LDSPID
			, Donor_CreatedOn
			, Donor_ModifiedOn
			, Donor_Status
			, Donor_Status_Reason
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Giving_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Giving_Dim' -- Source_Table
		, 'dbo._Donor_Giving_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100)      
			, Donor_Given_This_Year_To_Byu NVARCHAR(1)
			, Donor_Given_This_Year_To_ByuI NVARCHAR(1)
			, Donor_Given_This_Year_To_ByuH NVARCHAR(1)
			, Donor_Given_This_Year_To_LDSBC NVARCHAR(1)
			, Donor_Given_Last_3_Months_To_Byu NVARCHAR(1)
			, Donor_Given_Last_3_Months_To_Byui NVARCHAR(1)
			, Donor_Given_Last_3_Months_To_Byuh NVARCHAR(1)
			, Donor_Given_Last_3_Months_To_Ldsbc NVARCHAR(1)
			, Donor_Given_Last_3_Months_To_Church NVARCHAR(1)
			, Donor_Institution_Giving_Areas NVARCHAR(1000)
			, Donor_Byu_Giving_Areas NVARCHAR(2000)
			, Donor_Church_Giving_Areas NVARCHAR(2000)
			, Donor_Total_Giving_Byu_High_Flag NVARCHAR(1)
			, Donor_Total_Giving_Byui_High_Flag NVARCHAR(1)
			, Donor_Total_Giving_Byuh_High_Flag NVARCHAR(1)
			, Donor_Total_Giving_Ldsbc_High_Flag NVARCHAR(1)
			, Donor_Gift_Count_Previous_5_Years INT
			, Donor_Average_Single_Gift_Previous_5_Years MONEY
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_Given_This_Year_To_Byu
			, Donor_Given_This_Year_To_ByuI
			, Donor_Given_This_Year_To_ByuH
			, Donor_Given_This_Year_To_LDSBC
			, Donor_Given_Last_3_Months_To_Byu
			, Donor_Given_Last_3_Months_To_Byui
			, Donor_Given_Last_3_Months_To_Byuh
			, Donor_Given_Last_3_Months_To_Ldsbc
			, Donor_Given_Last_3_Months_To_Church
			, Donor_Institution_Giving_Areas
			, Donor_Byu_Giving_Areas
			, Donor_Church_Giving_Areas
			, Donor_Total_Giving_Byu_High_Flag
			, Donor_Total_Giving_Byui_High_Flag
			, Donor_Total_Giving_Byuh_High_Flag
			, Donor_Total_Giving_Ldsbc_High_Flag
			, Donor_Gift_Count_Previous_5_Years
			, Donor_Average_Single_Gift_Previous_5_Years
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Lifetime_Giving_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Lifetime_Giving_Dim' -- Source_Table
		, 'dbo._Donor_Lifetime_Giving_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100)  
			, Donor_Total_Lifetime_Giving MONEY
			, Donor_Total_Lifetime_Giving_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_Byu MONEY
			, Donor_Total_Lifetime_Giving_Byui MONEY
			, Donor_Total_Lifetime_Giving_Byuh MONEY
			, Donor_Total_Lifetime_Giving_Ldsbc MONEY
			, Donor_Total_Lifetime_Giving_Church MONEY
			, Donor_Total_Lifetime_Giving_Pcc MONEY
			, Donor_Total_Lifetime_Giving_Ces MONEY
			, Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Byui_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Byuh_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Ldsbc_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Church_Last_5_Years MONEY
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_Total_Lifetime_Giving
			, Donor_Total_Lifetime_Giving_Last_5_Years
			, Donor_Total_Lifetime_Giving_Byu
			, Donor_Total_Lifetime_Giving_Byui
			, Donor_Total_Lifetime_Giving_Byuh
			, Donor_Total_Lifetime_Giving_Ldsbc
			, Donor_Total_Lifetime_Giving_Church
			, Donor_Total_Lifetime_Giving_Pcc
			, Donor_Total_Lifetime_Giving_Ces
			, Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Byui_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Byuh_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Ldsbc_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Church_Last_5_Years
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_First_Gift_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_First_Gift_Dim' -- Source_Table
		, 'dbo._Donor_First_Gift_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100)  
			, Donor_First_Gift_Post_Date_Byu DATE
			, Donor_First_Gift_Post_Date_Byui DATE
			, Donor_First_Gift_Post_Date_Byuh DATE
			, Donor_First_Gift_Post_Date_Ldsbc DATE
			, Donor_First_Gift_To_Byu_Amt MONEY
			, Donor_First_Gift_To_Byui_Amt MONEY
			, Donor_First_Gift_To_Byuh_Amt MONEY
			, Donor_First_Gift_To_Ldsbc_Amt MONEY
			, Donor_First_Gift_To_Church_Amt MONEY
			, Donor_First_Gift_To_Ldsp_Amt MONEY
			, Donor_First_Gift_Date_Byu DATE
			, Donor_First_Gift_Date_Byui DATE
			, Donor_First_Gift_Date_Byuh DATE
			, Donor_First_Gift_Date_Ldsbc DATE
			, Donor_First_Gift_Date_Church DATE
			, Donor_First_Gift_Date_Ldsp DATE
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_First_Gift_Post_Date_Byu
			, Donor_First_Gift_Post_Date_Byui
			, Donor_First_Gift_Post_Date_Byuh
			, Donor_First_Gift_Post_Date_Ldsbc
			, Donor_First_Gift_To_Byu_Amt
			, Donor_First_Gift_To_Byui_Amt
			, Donor_First_Gift_To_Byuh_Amt
			, Donor_First_Gift_To_Ldsbc_Amt
			, Donor_First_Gift_To_Church_Amt
			, Donor_First_Gift_To_Ldsp_Amt
			, Donor_First_Gift_Date_Byu
			, Donor_First_Gift_Date_Byui
			, Donor_First_Gift_Date_Byuh
			, Donor_First_Gift_Date_Ldsbc
			, Donor_First_Gift_Date_Church
			, Donor_First_Gift_Date_Ldsp
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Most_Recent_Gift_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Most_Recent_Gift_Dim' -- Source_Table
		, 'dbo._Donor_Most_Recent_Gift_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100) 
			, Donor_Most_Recent_Gift_Date_Ldsp DATE
			, Donor_Most_Recent_Gift_Date_Byu DATE
			, Donor_Most_Recent_Gift_Date_Byui DATE
			, Donor_Most_Recent_Gift_Date_Byuh DATE
			, Donor_Most_Recent_Gift_Date_Ldsbc DATE
			, Donor_Most_Recent_Gift_Date_Church DATE
			, Donor_Most_Recent_Gift_To_Ldsp_Amt MONEY
			, Donor_Most_Recent_Gift_To_Byu_Amt MONEY
			, Donor_Most_Recent_Gift_To_Byui_Amt MONEY
			, Donor_Most_Recent_Gift_To_Byuh_Amt MONEY
			, Donor_Most_Recent_Gift_To_Ldsbc_Amt MONEY
			, Donor_Most_Recent_Gift_To_Church_Amt MONEY
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_Most_Recent_Gift_Date_Ldsp
			, Donor_Most_Recent_Gift_Date_Byu
			, Donor_Most_Recent_Gift_Date_Byui
			, Donor_Most_Recent_Gift_Date_Byuh
			, Donor_Most_Recent_Gift_Date_Ldsbc
			, Donor_Most_Recent_Gift_Date_Church
			, Donor_Most_Recent_Gift_To_Ldsp_Amt
			, Donor_Most_Recent_Gift_To_Byu_Amt
			, Donor_Most_Recent_Gift_To_Byui_Amt
			, Donor_Most_Recent_Gift_To_Byuh_Amt
			, Donor_Most_Recent_Gift_To_Ldsbc_Amt
			, Donor_Most_Recent_Gift_To_Church_Amt
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Largest_Gift_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Largest_Gift_Dim' -- Source_Table
		, 'dbo._Donor_Largest_Gift_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100) 
			, Donor_Largest_Gift_Amt_Byu MONEY
			, Donor_Largest_Gift_Amt_Byui MONEY
			, Donor_Largest_Gift_Amt_Byuh MONEY
			, Donor_Largest_Gift_Amt_Ldsbc MONEY
			, Donor_Ldsp_Largest_Gift MONEY
			, Donor_Largest_Gift_Amt_Church MONEY
			, Donor_Largest_Gift_Date_Ldsp DATE
			, Donor_Largest_Gift_Date_Byu DATE
			, Donor_Largest_Gift_Date_Byui DATE
			, Donor_Largest_Gift_Date_Byuh DATE
			, Donor_Largest_Gift_Date_Ldsbc DATE
			, Donor_Largest_Gift_Date_Church DATE
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_Largest_Gift_Amt_Byu
			, Donor_Largest_Gift_Amt_Byui
			, Donor_Largest_Gift_Amt_Byuh
			, Donor_Largest_Gift_Amt_Ldsbc
			, Donor_Ldsp_Largest_Gift
			, Donor_Largest_Gift_Amt_Church
			, Donor_Largest_Gift_Date_Ldsp
			, Donor_Largest_Gift_Date_Byu
			, Donor_Largest_Gift_Date_Byui
			, Donor_Largest_Gift_Date_Byuh
			, Donor_Largest_Gift_Date_Ldsbc
			, Donor_Largest_Gift_Date_Church
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Employment_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Employment_Dim' -- Source_Table
		, 'dbo._Donor_Employment_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100) 
			, Byu_Employee_Giving_Campus_Address NVARCHAR(100) 
			, Church_Payroll_Id NVARCHAR(100)   
			, All_Employment NVARCHAR(4000) 
			, Current_Employment NVARCHAR(4000)
			, Former_Employment NVARCHAR(4000)
			, Current_Employer_Name NVARCHAR(160)
			, Current_Job_Title NVARCHAR(100)
			, Current_Job_Code NVARCHAR(100)
			, Current_Job_Date_Started DATE
			, Current_Job_Work_Phone NVARCHAR(100)
			, Current_Job_Work_Address NVARCHAR(300)
			, Current_Byu_Employment_Yn  NVARCHAR(1)
			, Current_Byui_Employment_Yn NVARCHAR(1)
			, Current_Byuh_Employment_Yn NVARCHAR(1)
			, Current_Ldsbc_Employment_Yn NVARCHAR(1)
			' -- Dest_Create_Fields
		, '	Donor_Key 
			, Byu_Employee_Giving_Campus_Address
			, Church_Payroll_Id
			, All_Employment 
			, Current_Employment
			, Former_Employment
			, Current_Employer_Name
			, Current_Job_Title
			, Current_Job_Code
			, Current_Job_Date_Started
			, Current_Job_Work_Phone
			, Current_Job_Work_Address 
			, Current_Byu_Employment_Yn
			, Current_Byui_Employment_Yn
			, Current_Byuh_Employment_Yn
			, Current_Ldsbc_Employment_Yn
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Ldsp_Org_Recurring_Gift_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Ldsp_Org_Recurring_Gift_Fact' -- Source_Table
		, 'dbo._Ldsp_Org_Recurring_Gift_Fact' -- Destination_Table
		,'	Recurring_Gift_Rule_Key NVARCHAR(100)
			, Web_Subscription_Key NVARCHAR(100)
			, Donor_Key NVARCHAR(100)
			, Fund_Key NVARCHAR(100)
			, Hier_Key NVARCHAR(100)
			, Appeal_Key NVARCHAR(100)
			, Payroll_Group_Key NVARCHAR(100)
			, Recurring_Amount MONEY
			' -- Dest_Create_Fields
		, '	Recurring_Gift_Rule_Key
			, Web_Subscription_Key
			, Donor_Key 
			, Fund_Key
			, Hier_Key
			, Appeal_Key
			, Payroll_Group_Key
			, Recurring_Amount
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Ldsp_Org_Gifts_Dataset
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Ldsp_Org_Gifts_Dataset' -- Source_Table
		, 'dbo.View_Ldsp_Org_Gifts_Dataset' -- Destination_Table
		,'	New_GiftId NVARCHAR(100)
			, Donor_Type NVARCHAR(400)
			, Gift_Amount MONEY
			, Post_Date DATE
			, Receipt_Date DATE
			, Kind NVARCHAR(400)
			, TenderType NVARCHAR(400)
			, Transmitted NVARCHAR(1)
			, Gift_Source NVARCHAR(400)
			, Gift_Match NVARCHAR(400)
			, Gift_Text NVARCHAR(4000)
			, Telefund_Gift NVARCHAR(1)
			, CID NVARCHAR(200)
			, CDE2 NVARCHAR(200)
			, Gift_Created_On DATE
			, Gift_Modified_On DATE
			, Gift_Status NVARCHAR(400)
			, Gift_Status_Reason NVARCHAR(400) 
			, Appeal_Name NVARCHAR(100)
			, Appeal_Code NVARCHAR(20)
			, Appeal_Delivery_Type NVARCHAR(400) 
			, Institution NVARCHAR(100)
			, Level_1 NVARCHAR(100)
			, Level_2 NVARCHAR(100)
			, Level_3 NVARCHAR(100)
			, Hierarchy_Name NVARCHAR(100)
			, LDSP_Account_Number NVARCHAR(100)
			, Fund_Account_Name NVARCHAR(100)	
			, Fund_Account_Online_Approved NVARCHAR(1)
			, Fund_Account_Online_Name NVARCHAR(100)
			, Batch NVARCHAR(100)
			, Batch_Type NVARCHAR(400)
			, DonorID NVARCHAR(100)
			, GenderCode NVARCHAR(400)
			, Donor_Preferred_Name NVARCHAR(100)
			, Donor_Name NVARCHAR(160)
			, Donor_Linked_Lds_Account NVARCHAR(1)
			, Donor_LDSPID NVARCHAR(100)
			, Web_Subscription_OA_ID NVARCHAR(100)
			, Web_Subscription_Transaction_ID NVARCHAR(100)
			, Web_Subscription_Type_of_Donation NVARCHAR(400)
			, Web_Transaction_ID NVARCHAR(100)
			' -- Dest_Create_Fields
		, '	New_GiftId
			, Donor_Type
			, Gift_Amount
			, Post_Date
			, Receipt_Date
			, Kind
			, TenderType
			, Transmitted
			, Gift_Source
			, Gift_Match
			, Gift_Text
			, Telefund_Gift 
			, CID
			, CDE2
			, Gift_Created_On 
			, Gift_Modified_On
			, Gift_Status
			, Gift_Status_Reason 
			, Appeal_Name
			, Appeal_Code
			, Appeal_Delivery_Type 
			, Institution
			, Level_1
			, Level_2
			, Level_3
			, Hierarchy_Name
			, LDSP_Account_Number
			, Fund_Account_Name	
			, Fund_Account_Online_Approved
			, Fund_Account_Online_Name
			, Batch
			, Batch_Type
			, DonorID
			, GenderCode
			, Donor_Preferred_Name
			, Donor_Name
			, Donor_Linked_Lds_Account
			, Donor_LDSPID
			, Web_Subscription_OA_ID
			, Web_Subscription_Transaction_ID
			, Web_Subscription_Type_of_Donation
			, Web_Transaction_ID
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Ldsp_Org_Donor_Dataset
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Ldsp_Org_Donor_Dataset' -- Source_Table
		, 'dbo.View_Ldsp_Org_Donor_Dataset' -- Destination_Table
		,'	Donor_Key NVARCHAR(100)
			, Donor_Linked_Lds_Account NVARCHAR(1)
			, Ldsp_Org_Donor NVARCHAR(1) 
			, Ldsp_Org_Current_Recurring_Donor_Type NVARCHAR(50)
			, Ldsp_Org_Recurring_Donor NVARCHAR(1)
			, Ldsp_Org_Current_Recurring_Donor  NVARCHAR(1)
			, Donor_Ldsp_Id NVARCHAR(100)
			, Donor_Contact_Type NVARCHAR(100)
			, Donor_Deceased_Yn NVARCHAR(1)
			, Donor_Name NVARCHAR(160)
			, Donor_First_Name NVARCHAR(50)
			, Donor_Middle_Name NVARCHAR(50)
			, Donor_Last_Name NVARCHAR(50)
			, Donor_Marriage_Status NVARCHAR(400)
			, Donor_Gender NVARCHAR(400)
			, Plus_CoordinatingLiaison NVARCHAR(200)
			, Donor_Age INT
			, Spouse_Age INT
			, Byu_Donor NVARCHAR(1)
			, ByuI_Donor NVARCHAR(1)
			, ByuH_Donor NVARCHAR(1)
			, Ldsbc_Donor NVARCHAR(1)
			, Address_Street_1 NVARCHAR(100)
			, Address_Street_2 NVARCHAR(100)
			, Address_Street_3 NVARCHAR(100)
			, Address_City NVARCHAR(100)
			, Address_State_Code NVARCHAR(100)
			, Address_Post_Code_Full NVARCHAR(100)
			, Address_Post_Code_Last_4 NVARCHAR(15)
			, Address_Country NVARCHAR(100)
			, Address_State_Province NVARCHAR(50)
			, Address_County NVARCHAR(100)
			, Address_County_Code NVARCHAR(10)
			, Donor_Total_Lifetime_Giving MONEY
			, Donor_Total_Lifetime_Giving_Byu MONEY
			, Donor_Total_Lifetime_Giving_Byui MONEY
			, Donor_Total_Lifetime_Giving_Byuh MONEY
			, Donor_Total_Lifetime_Giving_Ldsbc MONEY
			, Donor_Total_Lifetime_Giving_Church MONEY
			, Donor_Total_Lifetime_Giving_Pcc MONEY
			, Donor_Total_Lifetime_Giving_Ces MONEY
			, Donor_Total_Lifetime_Giving_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Byui_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Byuh_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Ldsbc_Last_5_Years MONEY
			, Donor_Total_Lifetime_Giving_To_Church_Last_5_Years MONEY
			' -- Dest_Create_Fields
		, '	Donor_Key
			, Donor_Linked_Lds_Account
			, Ldsp_Org_Donor
			, Ldsp_Org_Current_Recurring_Donor_Type
			, Ldsp_Org_Recurring_Donor
			, Ldsp_Org_Current_Recurring_Donor 
			, Donor_Ldsp_Id
			, Donor_Contact_Type
			, Donor_Deceased_Yn
			, Donor_Name
			, Donor_First_Name
			, Donor_Middle_Name
			, Donor_Last_Name
			, Donor_Marriage_Status
			, Donor_Gender
			, Plus_CoordinatingLiaison
			, Donor_Age
			, Spouse_Age
			, Byu_Donor
			, ByuI_Donor
			, ByuH_Donor
			, Ldsbc_Donor
			, Address_Street_1
			, Address_Street_2
			, Address_Street_3
			, Address_City
			, Address_State_Code
			, Address_Post_Code_Full
			, Address_Post_Code_Last_4
			, Address_Country
			, Address_State_Province
			, Address_County
			, Address_County_Code
			, Donor_Total_Lifetime_Giving
			, Donor_Total_Lifetime_Giving_Byu
			, Donor_Total_Lifetime_Giving_Byui
			, Donor_Total_Lifetime_Giving_Byuh
			, Donor_Total_Lifetime_Giving_Ldsbc
			, Donor_Total_Lifetime_Giving_Church
			, Donor_Total_Lifetime_Giving_Pcc
			, Donor_Total_Lifetime_Giving_Ces
			, Donor_Total_Lifetime_Giving_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Byui_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Byuh_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Ldsbc_Last_5_Years
			, Donor_Total_Lifetime_Giving_To_Church_Last_5_Years
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Ldsp_Org_Recurring_Gift_Rules_Dataset
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Ldsp_Org_Recurring_Gift_Rules_Dataset' -- Source_Table
		, 'dbo.View_Ldsp_Org_Recurring_Gift_Rules_Dataset' -- Destination_Table
		,'	Plus_RecurringGiftRulesId NVARCHAR(100)
			, Donor_Type NVARCHAR(400)
			, Recurring_Gift_Type NVARCHAR(400)
			, Recurring_Amount MONEY
			, Frequency NVARCHAR(400)
			, Payment_Start DATE
			, Payment_Stop DATE
			, Recurring_Gift_Rule_Name NVARCHAR(100)
			, Recurring_Gift_Rule_Status NVARCHAR(400)
			, Reucrring_Gift_Rule_Status_Reason NVARCHAR(400)
			, Recurring_Group_Name NVARCHAR(100)
			, New_FundAccountID NVARCHAR(100)
			, LDSP_Account_Number NVARCHAR(100)
			, Fund_Account_Online_Public_Name NVARCHAR(100)
			, Fund_Account_Online_Approved NVARCHAR(1)
			, Fund_Account_Gift_Purpose_Type NVARCHAR(400)
			, Fund_Account_Gift_Purpose_Sub_Type NVARCHAR(400)
			, Fund_Account_Unrestricted NVARCHAR(400)
			, Fund_Account_Scholarship NVARCHAR(1)
			, Fund_Account_Endowment NVARCHAR(1)
			, Appeal_Code NVARCHAR(20)
			, Appeal_Name NVARCHAR(100)
			, Appeal_Delivery_Type NVARCHAR(400)
			, Institution NVARCHAR(100)
			, Level_1 NVARCHAR(100)
			, Level_2 NVARCHAR(100)
			, Level_3 NVARCHAR(100)
			, Hierarchy_Name NVARCHAR(100)
			, DonorID NVARCHAR(100)
			, GenderCode NVARCHAR(400)
			, Birthdate DATE
			, Donor_Preferred_Name NVARCHAR(160)
			, Donor_Name NVARCHAR(160)
			, Donor_Marital_Status NVARCHAR(400)
			, Donor_Linked_Lds_Account NVARCHAR(1)
			, Donor_LDSPID NVARCHAR(100)
			, Donor_Status NVARCHAR(400)
			, Donor_Status_Reason NVARCHAR(400)
			, Web_Subscription_OA_ID NVARCHAR(100)
			, Transaction_ID NVARCHAR(100)
			, Recurring_Donation_Start_Date DATE
			, Recurring_Donation_Stop_Date DATE
			, Next_Payment_Date DATE
			, Payment_Type NVARCHAR(400)
			, Tender_Name NVARCHAR(400)
			' -- Dest_Create_Fields
		, '	Plus_RecurringGiftRulesId
			, Donor_Type
			, Recurring_Gift_Type
			, Recurring_Amount
			, Frequency
			, Payment_Start
			, Payment_Stop
			, Recurring_Gift_Rule_Name
			, Recurring_Gift_Rule_Status
			, Reucrring_Gift_Rule_Status_Reason 
			, Recurring_Group_Name
			, New_FundAccountID
			, LDSP_Account_Number
			, Fund_Account_Online_Public_Name
			, Fund_Account_Online_Approved
			, Fund_Account_Gift_Purpose_Type
			, Fund_Account_Gift_Purpose_Sub_Type
			, Fund_Account_Unrestricted
			, Fund_Account_Scholarship
			, Fund_Account_Endowment
			, Appeal_Code
			, Appeal_Name
			, Appeal_Delivery_Type
			, Institution
			, Level_1
			, Level_2
			, Level_3
			, Hierarchy_Name
			, DonorID
			, GenderCode
			, Birthdate
			, Donor_Preferred_Name
			, Donor_Name
			, Donor_Marital_Status
			, Donor_Linked_Lds_Account
			, Donor_LDSPID
			, Donor_Status
			, Donor_Status_Reason
			, Web_Subscription_OA_ID
			, Transaction_ID
			, Recurring_Donation_Start_Date
			, Recurring_Donation_Stop_Date
			, Next_Payment_Date
			, Payment_Type
			, Tender_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Recurring_Gift_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Recurring_Gift_Dim' -- Source_Table
		, 'dbo._Donor_Recurring_Gift_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100)    
			, Donor_Byu_Recurring_Donor NVARCHAR(1) 
			, Donor_Byui_Recurring_Donor NVARCHAR(1)
			, Donor_Byuh_Recurring_Donor NVARCHAR(1)
			, Donor_Ldsbc_Recurring_Donor NVARCHAR(1)
			, Donor_First_Recurring_Rule_Date_Byu DATE
			, Donor_First_Recurring_Rule_Date_Byui DATE
			, Donor_First_Recurring_Rule_Date_Byuh DATE
			, Donor_First_Recurring_Rule_Date_Ldsbc DATE
			, Donor_Recurring_Total_Last_Month_Byu MONEY
			, Donor_Recurring_Total_Last_Month_Byui MONEY
			, Donor_Recurring_Total_Last_Month_Byuh MONEY
			, Donor_Recurring_Total_Last_Month_Ldsbc MONEY
			, Donor_Recurring_Total_Month_Before_Last_Byu MONEY
			, Donor_Recurring_Total_Month_Before_Last_Byui MONEY
			, Donor_Recurring_Total_Month_Before_Last_Byuh MONEY
			, Donor_Recurring_Total_Month_Before_Last_Ldsbc MONEY
			, Donor_Recurring_Gift_Upgrade_Byu NVARCHAR(1)
			, Donor_Recurring_Gift_Upgrade_Byui NVARCHAR(1)
			, Donor_Recurring_Gift_Upgrade_Byuh NVARCHAR(1)
			, Donor_Recurring_Gift_Upgrade_Ldsbc NVARCHAR(1)
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_Byu_Recurring_Donor
			, Donor_Byui_Recurring_Donor
			, Donor_Byuh_Recurring_Donor
			, Donor_Ldsbc_Recurring_Donor
			, Donor_First_Recurring_Rule_Date_Byu
			, Donor_First_Recurring_Rule_Date_Byui
			, Donor_First_Recurring_Rule_Date_Byuh
			, Donor_First_Recurring_Rule_Date_Ldsbc
			, Donor_Recurring_Total_Last_Month_Byu
			, Donor_Recurring_Total_Last_Month_Byui
			, Donor_Recurring_Total_Last_Month_Byuh
			, Donor_Recurring_Total_Last_Month_Ldsbc
			, Donor_Recurring_Total_Month_Before_Last_Byu
			, Donor_Recurring_Total_Month_Before_Last_Byui
			, Donor_Recurring_Total_Month_Before_Last_Byuh
			, Donor_Recurring_Total_Month_Before_Last_Ldsbc
			, Donor_Recurring_Gift_Upgrade_Byu
			, Donor_Recurring_Gift_Upgrade_Byui
			, Donor_Recurring_Gift_Upgrade_Byuh
			, Donor_Recurring_Gift_Upgrade_Ldsbc
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Retention_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Retention_Dim' -- Source_Table
		, 'dbo._Donor_Retention_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100)      
			, Donor_Retention_Type_Code_Byu_Minus_1 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byu_Minus_2 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byu_Minus_3 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byu_Minus_4 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byu_Minus_5 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui_Minus_1 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui_Minus_2 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui_Minus_3 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui_Minus_4 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui_Minus_5 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh_Minus_1 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh_Minus_2 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh_Minus_3 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh_Minus_4 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh_Minus_5 NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc_Minus_1 NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc_Minus_2 NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc_Minus_3 NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc_Minus_4 NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc_Minus_5 NVARCHAR(2)
			, Donor_Retention_Type_Code_Byu NVARCHAR(2)
			, Donor_Retention_Type_Code_Byui NVARCHAR(2)
			, Donor_Retention_Type_Code_Byuh NVARCHAR(2)
			, Donor_Retention_Type_Code_Ldsbc NVARCHAR(2)
			, Donor_Type_Code_Ldsp NVARCHAR(2)
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_Retention_Type_Code_Byu_Minus_1
			, Donor_Retention_Type_Code_Byu_Minus_2
			, Donor_Retention_Type_Code_Byu_Minus_3
			, Donor_Retention_Type_Code_Byu_Minus_4
			, Donor_Retention_Type_Code_Byu_Minus_5
			, Donor_Retention_Type_Code_Byui_Minus_1
			, Donor_Retention_Type_Code_Byui_Minus_2
			, Donor_Retention_Type_Code_Byui_Minus_3
			, Donor_Retention_Type_Code_Byui_Minus_4
			, Donor_Retention_Type_Code_Byui_Minus_5
			, Donor_Retention_Type_Code_Byuh_Minus_1
			, Donor_Retention_Type_Code_Byuh_Minus_2
			, Donor_Retention_Type_Code_Byuh_Minus_3
			, Donor_Retention_Type_Code_Byuh_Minus_4
			, Donor_Retention_Type_Code_Byuh_Minus_5
			, Donor_Retention_Type_Code_Ldsbc_Minus_1
			, Donor_Retention_Type_Code_Ldsbc_Minus_2
			, Donor_Retention_Type_Code_Ldsbc_Minus_3
			, Donor_Retention_Type_Code_Ldsbc_Minus_4
			, Donor_Retention_Type_Code_Ldsbc_Minus_5
			, Donor_Retention_Type_Code_Byu
			, Donor_Retention_Type_Code_Byui
			, Donor_Retention_Type_Code_Byuh
			, Donor_Retention_Type_Code_Ldsbc
			, Donor_Type_Code_Ldsp
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Telefund_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Telefund_Dim' -- Source_Table
		, 'dbo._Donor_Telefund_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100)      
			, Donor_Open_Byu_Telefund_Pledge NVARCHAR(1)
			, Donor_Open_Byui_Telefund_Pledge NVARCHAR(1)
			, Donor_Open_Byuh_Telefund_Pledge NVARCHAR(1)
			, Donor_Open_Ldsbc_Telefund_Pledge NVARCHAR(1)
			, Donor_Previously_Contacted_Byu_Yn NVARCHAR(1)
			, Donor_Previously_Contacted_Byui_Yn NVARCHAR(1)
			, Donor_Previously_Contacted_Byuh_Yn NVARCHAR(1)
			, Donor_Previously_Contacted_Ldsbc_Yn NVARCHAR(1)
			, Donor_Lds_TelefundNotes NVARCHAR(4000)
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_Open_Byu_Telefund_Pledge
			, Donor_Open_Byui_Telefund_Pledge
			, Donor_Open_Byuh_Telefund_Pledge
			, Donor_Open_Ldsbc_Telefund_Pledge
			, Donor_Previously_Contacted_Byu_Yn
			, Donor_Previously_Contacted_Byui_Yn
			, Donor_Previously_Contacted_Byuh_Yn
			, Donor_Previously_Contacted_Ldsbc_Yn
			, Donor_Lds_TelefundNotes
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Donor_Initiative_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Donor_Initiative_Dim' -- Source_Table
		, 'dbo._Donor_Initiative_Dim' -- Destination_Table
		,'	Donor_Key NVARCHAR(100)      
			, Donor_Furthest_Initiative_Stage NVARCHAR(400)
			, Donor_Number_Of_Open_Initiatives INT
			, Donor_Last_F2F_Visit_Date DATE
			, Donor_Pledge_Reminder_Email_Content_Byu NVARCHAR(2000)
			, Donor_Pledge_Reminder_Email_Content_Byui NVARCHAR(2000)
			, Donor_Pledge_Reminder_Email_Content_Byuh NVARCHAR(2000)
			, Donor_Pledge_Reminder_Email_Content_Ldsbc NVARCHAR(2000)
			, Donor_Is_Qualified NVARCHAR(1)
			, Donor_Qualified_On DATE
			, Donor_Qualified_By NVARCHAR(200)
			' -- Dest_Create_Fields
		, '	Donor_Key      
			, Donor_Furthest_Initiative_Stage
			, Donor_Number_Of_Open_Initiatives
			, Donor_Last_F2F_Visit_Date
			, Donor_Pledge_Reminder_Email_Content_Byu
			, Donor_Pledge_Reminder_Email_Content_Byui
			, Donor_Pledge_Reminder_Email_Content_Byuh
			, Donor_Pledge_Reminder_Email_Content_Ldsbc
			, Donor_Is_Qualified
			, Donor_Qualified_On 
			, Donor_Qualified_By
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Web_Batch_Dim
-- --------------------------
	( 1 -- Tier
		, 'dbo._Web_Batch_Dim' -- Source_Table
		, 'dbo._Web_Batch_Dim' -- Destination_Table
		,'	Web_Batch_Dim_Key NVARCHAR(100)
			, Web_Batch_Key NVARCHAR(100)
			, Web_Batch_Status NVARCHAR(400)
			, Web_Batch_Status_Reason NVARCHAR(400)
			, Web_Batch_Created_On DATE
			, Web_Batch_Processed_Date DATETIME
			, Web_Batch_Modified_On DATE
			, Web_Batch_Modified_By NVARCHAR(200)
			' -- Dest_Create_Fields
		, '	Web_Batch_Dim_Key
			, Web_Batch_Key
			, Web_Batch_Status
			, Web_Batch_Status_Reason
			, Web_Batch_Created_On
			, Web_Batch_Processed_Date
			, Web_Batch_Modified_On
			, Web_Batch_Modified_By
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- _Web_Batch_Fact
-- --------------------------
	( 1 -- Tier
		, 'dbo._Web_Batch_Fact' -- Source_Table
		, 'dbo._Web_Batch_Fact' -- Destination_Table
		,'	Web_Batch_Key NVARCHAR(100)
			, Web_Batch_Total_Amount MONEY
			, Average_Match_Score NVARCHAR(100)
			, Total_Record_Count INT
			' -- Dest_Create_Fields
		, '	Web_Batch_Key
			, Web_Batch_Total_Amount
			, Average_Match_Score
			, Total_Record_Count
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
	,
-- --------------------------
-- View_Ldsp_Org_Web_Batches_Dataset
-- --------------------------
	( 1 -- Tier
		, 'dbo.View_Ldsp_Org_Web_Batches_Dataset' -- Source_Table
		, 'dbo.View_Ldsp_Org_Web_Batches_Dataset' -- Destination_Table
		,'	Plus_WebBatchID NVARCHAR(100)
			, Web_Batch_Total_Amount MONEY
			, Average_Match_Score NVARCHAR(100)
			, Total_Record_Count INT
			, Web_Batch_Status NVARCHAR(400)
			, Web_Batch_Status_Reason NVARCHAR(400)
			, Web_Batch_Created_On DATE
			, Web_Batch_Processed_Date DATETIME
			, Web_Batch_Modified_On DATE
			, Web_Batch_Modified_By NVARCHAR(200)
			' -- Dest_Create_Fields
		, '	Plus_WebBatchID
			, Web_Batch_Total_Amount
			, Average_Match_Score
			, Total_Record_Count
			, Web_Batch_Status
			, Web_Batch_Status_Reason
			, Web_Batch_Created_On
			, Web_Batch_Processed_Date
			, Web_Batch_Modified_On
			, Web_Batch_Modified_By
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, GETDATE()
		, NULL
	)
;	


	
	
	