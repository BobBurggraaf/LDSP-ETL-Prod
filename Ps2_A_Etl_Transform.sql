/******************************************************************************
   NAME: CREATE_TRANS_LOAD_TABLES 
   PURPOSE: Create stage tables for Business Objects (W15904\S01)

   
   Barsoom (usp_Barsoom, usp_Barsoom_usp, LDSP_Table_Check) 1336764
   
******************************************************************************/



IF OBJECT_ID('LDSPhilanthropiesDW.dbo.Create_Trans_Load_Tables','U') IS NOT NULL
DROP TABLE LDSPhilanthropiesDW.dbo.Create_Trans_Load_Tables;
GO

CREATE TABLE LDSPhilanthropiesDW.dbo.Create_Trans_Load_Tables
	(
	Fields_Key  INT IDENTITY(1,1) PRIMARY KEY
	, Dim_Object NVARCHAR(100)
	, Table_Name NVARCHAR(100)
	, Create_Fields NVARCHAR(MAX)
	, Insert_Fields NVARCHAR(MAX)
	, From_Statement NVARCHAR(MAX)
	, Where_Statement NVARCHAR(MAX)
	, Attribute_1 NVARCHAR(MAX)
	, Attribute_2 NVARCHAR(MAX)
	, Attribute_3 NVARCHAR(MAX)
	, Attribute_4 NVARCHAR(MAX)
	, Attribute_5 NVARCHAR(MAX)
	, Attribute_6 NVARCHAR(MAX)
	, Attribute_7 NVARCHAR(MAX)
	, Attribute_8 NVARCHAR(MAX)
	, Attribute_9 NVARCHAR(MAX)
	, Attribute_10 NVARCHAR(MAX)
	, Attribute_11 NVARCHAR(MAX)
	, Attribute_12 NVARCHAR(MAX)
	, Attribute_13 NVARCHAR(MAX)
	, Attribute_14 NVARCHAR(MAX)
	, Attribute_15 NVARCHAR(MAX)
	, Attribute_16 NVARCHAR(MAX)
	, Attribute_17 NVARCHAR(MAX)
	, Attribute_18 NVARCHAR(MAX)
	, Attribute_19 NVARCHAR(MAX)
	, Attribute_20 NVARCHAR(MAX)
	, Attribute_21 NVARCHAR(MAX)
	, Active BIT
	, Insert_Date DATETIME
	, Update_Date DATETIME
	);
              
INSERT INTO LDSPhilanthropiesDW.dbo.Create_Trans_Load_Tables
	(
	Dim_Object
	, Table_Name
	, Create_Fields
	, Insert_Fields
	, From_Statement
	, Where_Statement
	, Attribute_1
	, Attribute_2
	, Attribute_3
	, Attribute_4
	, Attribute_5
	, Attribute_6
	, Attribute_7
	, Attribute_8
	, Attribute_9
	, Attribute_10
	, Attribute_11
	, Attribute_12
	, Attribute_13
	, Attribute_14
	, Attribute_15
	, Attribute_16
	, Attribute_17
	, Attribute_18
	, Attribute_19
	, Attribute_20
	, Attribute_21
	, Active
	, Insert_Date
	, Update_Date
	)
	VALUES	
-- --------------------------
-- DONOR DIM (_Donor_Dim)
-- --------------------------
	('Dim'
		, '_Donor_Dim'
		, 'Donor_Key  NVARCHAR(100)  PRIMARY KEY
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
			--, Wealth_Key INT
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
			--, Donor_Ethnicity  NVARCHAR(400)  /*Delete from source 5/15/17*/ 
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
			--, Donor_Org_Graduate_Prof_Yn  NVARCHAR(1)  /*Delete from source 5/15/17*/ 
			--, Donor_Org_Alumni_Assoc_Yn  NVARCHAR(1)  /*Delete from source 5/15/17*/ 
			--, Donor_Org_Athletics_Yn  NVARCHAR(1)  /*Delete from source 5/15/17*/ 
			--, Donor_Org_Four_Year_Yn  NVARCHAR(1)  /*Delete from source 5/15/17*/ 
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
			, Donor_Marriage_Status_Value  INT 
			--, Donor_Ethnicity_Value  INT  /*Delete from source 5/15/17*/ 
			, Donor_Lds_Member_Value  INT 
			, Donor_Personal_Suffix_Value  INT 
			, Donor_Major_Gift_Propen_Value  INT 
			, Donor_Annual_Gift_Value  INT 
			, Donor_Planned_Gift_Value  INT 
			, Donor_Gift_Capacity_Enp_Value  INT 
			, Donor_Gift_Capacity_En_Value  INT 
			, Donor_Philan_Cap_Rating_Value  INT 
			, Donor_Est_Household_Income_Value  INT 
			, Donor_Est_Home_Market_Val_Value  INT 
			, Donor_Block_Clusters_Value  INT 
			, Donor_Org_Class_Code_Value  INT 
			, Donor_Org_Retiree_Ratio_Value  INT 
			, Donor_Org_Split_Ratio_Value  INT 
			, Donor_Org_Matching_Ratio_Value  INT 
			, Donor_Org_Pref_Cont_Meth_Val  INT
			, All_Personal_Connections NVARCHAR(4000)
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
			'
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
			--, Wealth_Key
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
			--, Donor_Ethnicity  /*Delete from source 5/15/17*/ 
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
			--, Donor_Org_Graduate_Prof_Yn  /*Delete from source 5/15/17*/ 
			--, Donor_Org_Alumni_Assoc_Yn  /*Delete from source 5/15/17*/ 
			--, Donor_Org_Athletics_Yn  /*Delete from source 5/15/17*/
			--, Donor_Org_Four_Year_Yn  /*Delete from source 5/15/17*/ 
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
			, Donor_Marriage_Status_Value
			--, Donor_Ethnicity_Value  /*Delete from source 5/15/17*/
			, Donor_Lds_Member_Value 
			, Donor_Personal_Suffix_Value 
			, Donor_Major_Gift_Propen_Value 
			, Donor_Annual_Gift_Value
			, Donor_Planned_Gift_Value
			, Donor_Gift_Capacity_Enp_Value 
			, Donor_Gift_Capacity_En_Value
			, Donor_Philan_Cap_Rating_Value
			, Donor_Est_Household_Income_Value
			, Donor_Est_Home_Market_Val_Value
			, Donor_Block_Clusters_Value 
			, Donor_Org_Class_Code_Value
			, Donor_Org_Retiree_Ratio_Value 
			, Donor_Org_Split_Ratio_Value 
			, Donor_Org_Matching_Ratio_Value
			, Donor_Org_Pref_Cont_Meth_Val
			, All_Personal_Connections
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
			'
		, ' '
		, ' '
		, 'USE LDSPhilanthropiesDW

			IF OBJECT_ID(''tempdb..#ContactId_Temp'') IS NOT NULL
			DROP TABLE #ContactId_Temp

			IF OBJECT_ID(''tempdb..#Group_Key_Temp_1'') IS NOT NULL
			DROP TABLE #Group_Key_Temp_1

			IF OBJECT_ID(''tempdb..#Group_Key_Temp_2'') IS NOT NULL
			DROP TABLE #Group_Key_Temp_2

			IF OBJECT_ID(''tempdb..#Group_Key_Temp_3'') IS NOT NULL
			DROP TABLE #Group_Key_Temp_3

			IF OBJECT_ID(''tempdb..#Group_Key_Temp'') IS NOT NULL
			DROP TABLE #Group_Key_Temp

			IF OBJECT_ID(''tempdb..#Contact_Account_Temp'') IS NOT NULL
			DROP TABLE #Contact_Account_Temp

			IF OBJECT_ID(''tempdb..#LdspId_Temp'') IS NOT NULL
			DROP TABLE #LdspId_Temp 

			IF OBJECT_ID(''tempdb..#Contact_Added_Temp'') IS NOT NULL
			DROP TABLE #Contact_Added_Temp 

			IF OBJECT_ID(''dbo._Donor_Pre_Dim'') IS NOT NULL
			DROP TABLE dbo._Donor_Pre_Dim 

			'
		, 'BEGIN TRY
				DECLARE @TABLE_NAME NVARCHAR(100)
				SET @TABLE_NAME = ''_Donor_Dim'' ; ------> HARDCODE <------
				DECLARE @TABLE_CNT_1 NVARCHAR(100)                                                          
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122D'', @Alpha_Step_Name = ''Support Tables - All ContactIds - Begin'', @Alpha_Result = 1;                                        
					SELECT * INTO #ContactId_Temp
						FROM 
						(  
						SELECT DISTINCT ContactId FROM _Activity_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Address_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Alumni_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Association_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Award_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Drop_Include_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Email_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Employment_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Language_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Phone_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Psa_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Connection_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Id_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Interest_Bridge
						UNION
						SELECT DISTINCT ContactId FROM _Affiliated_Dim
						UNION
						SELECT DISTINCT ContactId FROM _Student_Bridge
						-- UNION 
						-- SELECT DISTINCT ContactId FROM _Wealth_Dim
						UNION
						SELECT DISTINCT CONVERT(NVARCHAR(100),New_ConstituentDonor) AS ContactId FROM Ext_Pledge
						UNION
						SELECT DISTINCT CONVERT(NVARCHAR(100),New_OrganizationDonor) AS ContactId FROM Ext_Pledge
						) A
				SELECT @TABLE_CNT_1 = (SELECT CONVERT(NVARCHAR(100), COUNT(*) ) FROM #ContactId_Temp);
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122D'', @Alpha_Step_Name = ''Support Tables - All ContactIds - End'', @Alpha_Count = @TABLE_CNT_1, @Alpha_Result = 1;
			END TRY
			BEGIN CATCH    
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Support Tables - All ContactIds - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;                
			END CATCH
			'
		, 'BEGIN TRY
				DECLARE @TABLE_CNT_2 NVARCHAR(100)                                                                   
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122E'', @Alpha_Step_Name = ''Support Tables - Group Keys 1 - Begin'', @Alpha_Result = 1;                                         
					SELECT * INTO #Group_Key_Temp_1
						FROM 
							(
							SELECT DISTINCT A.ContactId
								, COALESCE(B.Activity_Group_Key,0) AS Activity_Group_Key
								, COALESCE(C.Address_Group_Key,0) AS Address_Group_Key
								, COALESCE(D.Alumni_Group_Key,0) AS Alumni_Group_Key
								, COALESCE(E.Association_Group_Key,0) AS Association_Group_Key
								, COALESCE(F.Award_Group_Key,0) AS Award_Group_Key
								, COALESCE(G.Drop_Include_Group_Key,0) AS Drop_Include_Group_Key 
								, COALESCE(H.Affiliated_Key,0) AS Affiliated_Key
								--, COALESCE(I.Wealth_Key,0) AS Wealth_Key
								FROM #ContactId_Temp A
									LEFT JOIN _Activity_Bridge B ON A.ContactId = B.ContactId
									LEFT JOIN _Address_Bridge C ON A.ContactId = C.ContactId
									LEFT JOIN _Alumni_Bridge D ON A.ContactId = D.ContactId
									LEFT JOIN _Association_Bridge E ON A.ContactId = E.ContactId
									LEFT JOIN _Award_Bridge F ON A.ContactId = F.ContactId
									LEFT JOIN _Drop_Include_Bridge G ON A.ContactId = G.ContactId
									LEFT JOIN _Affiliated_Dim H ON A.ContactId = H.ContactId
									-- LEFT JOIN _Wealth_Dim I ON A.ContactId = I.ContactId
							) A
				SELECT @TABLE_CNT_2 = (SELECT CONVERT(NVARCHAR(100), COUNT(*) ) FROM #Group_Key_Temp_1);
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122E'', @Alpha_Step_Name = ''Support Tables - Group Keys 1 - End'', @Alpha_Count = @TABLE_CNT_2, @Alpha_Result = 1;
			END TRY
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Support Tables - Group Keys 1 - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;                                                           
			END CATCH
			'
		, 'BEGIN TRY
				DECLARE @TABLE_CNT_3 NVARCHAR(100)                                                                   
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122F'', @Alpha_Step_Name = ''Support Tables - Group Keys 2 - Begin'', @Alpha_Result = 1;                                                       
					SELECT * INTO #Group_Key_Temp_2
						FROM 
							(
							SELECT DISTINCT A.ContactId
								, COALESCE(H.Email_Group_Key,0) AS Email_Group_Key
								, COALESCE(I.Employment_Group_Key,0) AS Employment_Group_Key
								, COALESCE(J.Language_Group_Key,0) AS Language_Group_Key
								, COALESCE(K.Phone_Group_Key,0) AS Phone_Group_Key
								, COALESCE(L.Psa_Group_Key,0) AS Psa_Group_Key 
								FROM #ContactId_Temp A
									LEFT JOIN _Email_Bridge H ON A.ContactId = H.ContactId
									LEFT JOIN _Employment_Bridge I ON A.ContactId = I.ContactId
									LEFT JOIN _Language_Bridge J ON A.ContactId = J.ContactId
									LEFT JOIN _Phone_Bridge K ON A.ContactId = K.ContactId
									LEFT JOIN _Psa_Bridge L ON A.ContactId = L.ContactId 
							) A                                                     
				SELECT @TABLE_CNT_3 = (SELECT CONVERT(NVARCHAR(100), COUNT(*) ) FROM #Group_Key_Temp_2);
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122F'', @Alpha_Step_Name = ''Support Tables - Group Keys 2 - End'', @Alpha_Count = @TABLE_CNT_3, @Alpha_Result = 1;
			END TRY
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Support Tables - Group Keys 2 - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;                                                           
			END CATCH
			'
		, 'BEGIN TRY
				DECLARE @TABLE_CNT_3A NVARCHAR(100)                                                                 
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122G'', @Alpha_Step_Name = ''Support Tables - Group Keys 3 - Begin'', @Alpha_Result = 1;                                                     
					SELECT * INTO #Group_Key_Temp_3
						FROM 
							(
							SELECT DISTINCT A.ContactId
								, COALESCE(M.Connection_Group_Key,0) AS Connection_Group_Key 
								, COALESCE(N.Id_Group_Key,0) AS Id_Group_Key  
								, COALESCE(O.Interest_Group_Key,0) AS Interest_Group_Key
								, COALESCE(P.Student_Group_Key,0) AS Student_Group_Key
								FROM #ContactId_Temp A
									LEFT JOIN _Connection_Bridge M ON A.ContactId = M.ContactId 
									LEFT JOIN _Id_Bridge N ON A.ContactId = N.ContactId 
									LEFT JOIN _Interest_Bridge O ON A.ContactId = O.ContactId
									LEFT JOIN _Student_Bridge P ON A.ContactId = P.ContactId
							) A                                                     
				SELECT @TABLE_CNT_3A = (SELECT CONVERT(NVARCHAR(100), COUNT(*) ) FROM #Group_Key_Temp_3);
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122G'', @Alpha_Step_Name = ''Support Tables - Group Keys 3 - End'', @Alpha_Count = @TABLE_CNT_3A, @Alpha_Result = 1;
			END TRY
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Support Tables - Group Keys 2 - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;                                                           
			END CATCH
			'
		, 'BEGIN TRY
				DECLARE @TABLE_CNT_4 NVARCHAR(100)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122I'', @Alpha_Step_Name = ''Support Tables - Group Keys Join - Begin'', @Alpha_Result = 1;                                                   
					SELECT * INTO #Group_Key_Temp
						FROM 
							(
							SELECT DISTINCT CONVERT(NVARCHAR(100),A.ContactId) AS ContactId
								, A.Activity_Group_Key
								, A.Address_Group_Key
								, A.Alumni_Group_Key
								, A.Association_Group_Key
								, A.Award_Group_Key
								, A.Drop_Include_Group_Key
								, B.Email_Group_Key
								, B.Employment_Group_Key
								, B.Language_Group_Key
								, B.Phone_Group_Key
								, B.Psa_Group_Key   
								, C.Connection_Group_Key
								, C.Id_Group_Key
								, C.Interest_Group_Key
								, A.Affiliated_Key
								--  , A.Wealth_Key
								, C.Student_Group_Key
								FROM #Group_Key_Temp_1 A
								LEFT JOIN #Group_Key_Temp_2 B ON A.ContactId = B.ContactId
								LEFT JOIN #Group_Key_Temp_3 C ON A.ContactId = C.ContactId
							) A
				SELECT @TABLE_CNT_4 = (SELECT CONVERT(NVARCHAR(100), COUNT(*) ) FROM #Group_Key_Temp);
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122I'', @Alpha_Step_Name = ''Support Tables - Group Keys Join - End'', @Alpha_Count = @TABLE_CNT_4, @Alpha_Result = 1;
			END TRY
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Support Tables - Group Keys Join - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;                                                           
			END CATCH
			'
		, 'BEGIN TRY
				DECLARE @TABLE_CNT_5 NVARCHAR(100)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122J'', @Alpha_Step_Name = ''Support Tables - LdspId - Begin'', @Alpha_Result = 1;                                                                                                                              
					SELECT * INTO #LdspId_Temp
						FROM
							(SELECT DISTINCT CONVERT(NVARCHAR(100),ContactId) AS ContactId
								, COALESCE(New_LdspId,0) AS New_LdspId
								, Donor_Contact_Type
								, COALESCE(CONVERT(NVARCHAR(100),Donor_Organization_Id),''0'') AS Donor_Organization_Id
								FROM
									(SELECT A.ContactId
										, A.New_LdspId
										, ''Constituent'' AS Donor_Contact_Type
										, ''0'' AS Donor_Organization_Id
										FROM Ext_Contact A
									UNION
									SELECT B.AccountId AS ContactId
										, B.New_LdspId
										, ''Organization'' AS Donor_Contact_Type
										, CONVERT(NVARCHAR(100),B.AccountId) AS Donor_Organization_Id
										FROM Ext_Account B
									) A
							) A
				SELECT @TABLE_CNT_5 = (SELECT CONVERT(NVARCHAR(100), COUNT(*) ) FROM #LdspId_Temp);
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122J'', @Alpha_Step_Name = ''Support Tables - LdspId - End'', @Alpha_Count = @TABLE_CNT_5, @Alpha_Result = 1;
			END TRY
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Support Tables - LdspId - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;                                                                         
			END CATCH
			'
		, 'BEGIN TRY
				DECLARE @TABLE_CNT_6 NVARCHAR(100)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122K'', @Alpha_Step_Name = ''Support Tables - LdspId Join - Begin'', @Alpha_Result = 1;                 
					SELECT * INTO #Contact_Account_Temp
						FROM
							(                                                        
							SELECT DISTINCT COALESCE(A.ContactId,B.ContactId) AS Donor_Key
								, COALESCE(A.Activity_Group_Key,0) AS Activity_Group_Key
								, COALESCE(A.Address_Group_Key,0) AS Address_Group_Key
								, COALESCE(A.Alumni_Group_Key,0) AS Alumni_Group_Key
								, COALESCE(A.Association_Group_Key,0) AS Association_Group_Key
								, COALESCE(A.Award_Group_Key,0) AS Award_Group_Key
								, COALESCE(A.Drop_Include_Group_Key,0) AS Drop_Include_Group_Key
								, COALESCE(A.Email_Group_Key,0) AS Email_Group_Key
								, COALESCE(A.Employment_Group_Key,0) AS Employment_Group_Key
								, COALESCE(A.Language_Group_Key,0) AS Language_Group_Key
								, COALESCE(A.Phone_Group_Key,0) AS Phone_Group_Key
								, COALESCE(A.Psa_Group_Key,0) AS Psa_Group_Key
								, COALESCE(A.Connection_Group_Key,0) AS Connection_Group_Key
								, COALESCE(A.Id_Group_Key,0) AS Id_Group_Key
								, COALESCE(A.Interest_Group_Key,0) AS Interest_Group_Key
								, COALESCE(A.Affiliated_Key,0) AS Affiliated_Key
								--, COALESCE(A.Wealth_Key,0) AS Wealth_Key
								, COALESCE(A.Student_Group_Key,0) AS Student_Group_Key
								, B.New_LdspId
								, B.Donor_Contact_Type
								, B.Donor_Organization_Id
								FROM #LdspId_Temp B
									LEFT JOIN #Group_Key_Temp A ON B.ContactId = A.ContactId                                                      
							) A                                                     
				SELECT @TABLE_CNT_6 = (SELECT CONVERT(NVARCHAR(100), COUNT(*) ) FROM #Contact_Account_Temp);
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122K'', @Alpha_Step_Name = ''Support Tables - LdspId Join - End'', @Alpha_Count = @TABLE_CNT_6, @Alpha_Result = 1;
			END TRY
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Support Tables - LdspId Join - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			'
		, 'BEGIN TRY
				DECLARE @TABLE_CNT_7 NVARCHAR(100)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122L'', @Alpha_Step_Name = ''Support Tables - Contact Join - Begin'', @Alpha_Result = 1;                                                                                                                                 
					SELECT * INTO #Contact_Added_Temp
						FROM
							(
							SELECT DISTINCT A.Donor_Key
								, A.Activity_Group_Key
								, A.Address_Group_Key
								, A.Alumni_Group_Key
								, A.Association_Group_Key
								, A.Award_Group_Key
								, A.Drop_Include_Group_Key
								, A.Email_Group_Key
								, A.Employment_Group_Key
								, A.Language_Group_Key
								, A.Phone_Group_Key
								, A.Psa_Group_Key
								, A.Connection_Group_Key
								, A.Id_Group_Key
								, A.Interest_Group_Key
								, A.Affiliated_Key
								--, A.Wealth_Key
								, A.Student_Group_Key
								, A.New_LdspId
								, A.Donor_Contact_Type
								, A.Donor_Organization_Id
								, B.Plus_CoordinatingLiaison
								, B.FullName
								, B.FirstName
								, B.MiddleName
								, B.LastName
								, B.NickName
								, B.New_MiddleName2
								, B.New_LastName2
								, B.New_PreferredName
								, B.Plus_DisplayName
								, B.New_BirthName
								, B.Plus_CurrentStudent
								, B.New_BirthDate
								, B.New_BirthdateDay
								, B.New_BirthdateMonth
								, B.New_BirthdateYear
								, B.New_Deceased
								, B.New_DeceasedDate
								, B.New_DeceasedDay
								, B.New_DeceasedMonth
								, B.New_DeceasedYear
								, B.Plus_WealthDate
								, B.SpousesName
								, B.New_Title
								, B.New_ProfessionalSuffix
								, B.New_HomeCountry
								, B.GenderCode
								, B.FamilyStatusCode
								--, B.New_Ethnicity  /*Delete from source 5/15/17*/
								, B.Plus_ChurchMember
								, B.New_PersonalSuffix
								, B.StatusCode
								, B.New_MajorGiftPropensity1
								, B.Plus_AnnualGift1
								, B.Plus_PlannedGift
								, B.Plus_GiftCapacityEnp
								, B.Plus_GiftCapacityEn
								, B.Plus_PhilanthropicCapacityRatingPcr
								, B.Plus_EstimatedHouseHoldIncome
								, B.Plus_EstimatedHomemarketValue
								, B.Plus_BlockClusters
								, B.Plus_PreferredFirstName
								, B.Plus_PreferredMiddleName
								, B.Plus_PreferredLastName
								, B.Plus_PreferredFullName
								, B.Plus_SpousePreferredFirstName
								, B.Plus_SpousePreferredMiddleName
								, B.Plus_SpousePreferredLastName
								, B.Plus_SpousePreferredFullName
								, B.Plus_I5TextLinesLdsp AS Donor_Ldsp_Text_Lines
								, B.Lds_TelefundNotes AS Donor_Lds_TelefundNotes
								FROM #Contact_Account_Temp A
									LEFT JOIN Ext_Contact B ON A.Donor_Key = CONVERT(NVARCHAR(100),B.ContactId)                                                      
				) A
				SELECT @TABLE_CNT_7 = (SELECT CONVERT(NVARCHAR(100), COUNT(*) ) FROM #Contact_Added_Temp);
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122L'', @Alpha_Step_Name = ''Support Tables - Contact Join - End'', @Alpha_Count = @TABLE_CNT_7, @Alpha_Result = 1;
			END TRY
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Support Tables - Contact Join - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			'
		, 'BEGIN TRY
				DECLARE @TABLE_CNT_8 NVARCHAR(100)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122M'', @Alpha_Step_Name = ''Support Tables - _Donor_Pre_Dim - Begin'', @Alpha_Result = 1;                                                
					SELECT * INTO dbo._Donor_Pre_Dim
						FROM
							(
							SELECT DISTINCT CONVERT(NVARCHAR(100),A.Donor_Key) AS Donor_Key
								, A.Activity_Group_Key
								, A.Address_Group_Key
								, A.Alumni_Group_Key
								, A.Association_Group_Key
								, A.Award_Group_Key
								, A.Drop_Include_Group_Key
								, A.Email_Group_Key
								, A.Employment_Group_Key
								, A.Language_Group_Key
								, A.Phone_Group_Key
								, A.Psa_Group_Key
								, A.Connection_Group_Key
								, A.Id_Group_Key
								, A.Interest_Group_Key
								, A.Affiliated_Key
								-- , A.Wealth_Key
								, A.Student_Group_Key
								, A.New_LdspId
								, A.New_LdspId AS Donor_Ldsp_Id
								, A.Donor_Contact_Type
								, A.Donor_Organization_Id
								, A.Plus_CoordinatingLiaison
								, A.FullName
								, A.FirstName
								, A.MiddleName
								, A.LastName
								, A.NickName
								, A.New_MiddleName2
								, A.New_LastName2
								, A.New_PreferredName
								, A.Plus_DisplayName
								, A.New_BirthName
								, A.Plus_CurrentStudent
								, CASE WHEN SUBSTRING(New_BirthDate,1,2) IN (''01'',''02'',''03'',''04'',''05'',''06'',''07'',''08'',''09'',''10'',''11'',''12'')
										AND SUBSTRING(New_BirthDate,4,2) IN (''01'',''02'',''03'',''04'',''05'',''06'',''07'',''08'',''09'',''10'',
											''11'',''12'',''13'',''14'',''15'',''16'',''17'',''18'',''19'',''20'',
											''21'',''22'',''23'',''24'',''25'',''26'',''27'',''28'',''29'',''30'',''31'') 
										AND SUBSTRING(New_BirthDate,7,2) IN (''19'',''20'')
										THEN CONVERT(VARCHAR(10),A.New_BirthDate,101) ELSE NULL END AS New_BirthDate
								, A.New_BirthdateDay
								, A.New_BirthdateMonth
								, A.New_BirthdateYear
								, A.New_Deceased
								, CASE WHEN SUBSTRING(New_DeceasedDate,1,2) IN (''01'',''02'',''03'',''04'',''05'',''06'',''07'',''08'',''09'',''10'',''11'',''12'')
										AND SUBSTRING(New_DeceasedDate,4,2) IN (''01'',''02'',''03'',''04'',''05'',''06'',''07'',''08'',''09'',''10'',
											''11'',''12'',''13'',''14'',''15'',''16'',''17'',''18'',''19'',''20'',
											''21'',''22'',''23'',''24'',''25'',''26'',''27'',''28'',''29'',''30'',''31'') 
										AND SUBSTRING(New_DeceasedDate,7,2) IN (''19'',''20'')
										THEN CONVERT(VARCHAR(10),A.New_DeceasedDate,101) ELSE NULL END AS New_DeceasedDate
								, A.New_DeceasedDay
								, A.New_DeceasedMonth
								, A.New_DeceasedYear
								, A.Plus_WealthDate
								, A.SpousesName
								, A.New_Title
								, A.New_ProfessionalSuffix
								, A.New_HomeCountry
								, A.GenderCode
								, A.FamilyStatusCode
								--, A.New_Ethnicity  /*Delete from source 5/15/17*/
								, A.Plus_ChurchMember
								, A.New_PersonalSuffix
								, A.StatusCode
								, A.New_MajorGiftPropensity1
								, A.Plus_AnnualGift1
								, A.Plus_PlannedGift
								, A.Plus_GiftCapacityEnp
								, A.Plus_GiftCapacityEn
								, A.Plus_PhilanthropicCapacityRatingPcr
								, A.Plus_EstimatedHouseHoldIncome
								, A.Plus_EstimatedHomemarketValue
								, A.Plus_BlockClusters
								, A.Plus_PreferredFirstName
								, A.Plus_PreferredMiddleName
								, A.Plus_PreferredLastName
								, A.Plus_PreferredFullName
								, A.Plus_SpousePreferredFirstName
								, A.Plus_SpousePreferredMiddleName
								, A.Plus_SpousePreferredLastName
								, A.Plus_SpousePreferredFullName
								, A.Donor_Ldsp_Text_Lines
								, B.Name
								, B.ParentAccountId
								--, B.Plus_Matchesgifts  /*Delete from source 5/15/17*/
								--, B.New_GraduateProfessional  /*Delete from source 5/15/17*/
								--, B.New_AlumniAssociation  /*Delete from source 5/15/17*/
								--, B.New_Athletics  /*Delete from source 5/15/17*/
								--, B.New_FourYear  /*Delete from source 5/15/17*/
								, B.Description AS Donor_Org_Description
								, B.DoNotPostalMail
								, B.DoNotBulkPostalMail
								, B.DoNotEmail
								, B.DoNotBulkEmail
								, B.DoNotPhone
								, B.DoNotFax
								, B.AccountClassificationCode
								, B.New_RetireeRatio
								, B.New_SplitRatio
								, B.New_MatchingRatio
								, B.PreferredContactMethodCode
								, B.Plus_MatchingGiftProgram
								, A.Donor_Lds_TelefundNotes
								FROM #Contact_Added_Temp A
									LEFT JOIN Ext_Account B ON A.Donor_Key = CONVERT(NVARCHAR(100),B.AccountId)
				) A                                                      
				SELECT @TABLE_CNT_8 = (SELECT CONVERT(NVARCHAR(100), COUNT(*) ) FROM dbo._Donor_Pre_Dim);
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122M'', @Alpha_Step_Name = ''Support Tables - _Donor_Pre_Dim - End'', @Alpha_Count = @TABLE_CNT_8, @Alpha_Result = 1;
			END TRY
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Support Tables - _Donor_Pre_Dim - Errorr'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			'
		, 'USE LDSPhilanthropiesDW

					IF OBJECT_ID(''dbo._Numbered_ContactIds'',''U'') IS NOT NULL
					DROP TABLE dbo._Numbered_ContactIds
			BEGIN TRY
				DECLARE @TABLE_CNT_10 NVARCHAR(100)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122N'', @Alpha_Step_Name = ''Support Tables - dbo._Numbered_ContactIds - Begin'', @Alpha_Result = 1;                               
					CREATE TABLE dbo._Numbered_ContactIds (
						ContactId NVARCHAR(100) 
						, RowNum INT PRIMARY KEY
						)
					INSERT INTO _Numbered_ContactIds
						(ContactId, RowNum)
						SELECT CONVERT(NVARCHAR(100),A.ContactId) AS ContactId
							, ROW_NUMBER() OVER(ORDER BY A.ContactId) AS RowNum
							FROM
								(SELECT DISTINCT COALESCE(Donor_Key,Donor_Organization_Id) AS ContactId
									FROM LDSPhilanthropiesDW.dbo._Donor_Pre_Dim
								UNION
								SELECT DISTINCT CONVERT(NVARCHAR(100),New_ConstituentDonor) AS ContactId
									FROM dbo._Gift_
								UNION
								SELECT DISTINCT CONVERT(NVARCHAR(100),New_OrganizationDonor) AS ContactId
									FROM dbo._Gift_
								) A
							WHERE 1 = 1      
								AND ContactId IS NOT NULL
				SELECT @TABLE_CNT_10 = (SELECT CONVERT(NVARCHAR(100), COUNT(*) ) FROM _Numbered_ContactIds);
					INSERT INTO LDSPhilanthropiesDW.dbo.Alpha_Table_2                         
						(Alpha_DateTime,Alpha_Stage,Alpha_Step_Number,Alpha_Step_Name,Alpha_Begin_Time,Alpha_End_Time,Alpha_Duration_In_Seconds,Alpha_Count,Alpha_Query,Alpha_Result,ErrorNumber,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine,ErrorMessage)
							VALUES(GETDATE(),''Donor Dim'',''122N'',''Support Tables - dbo._Numbered_ContactIds - End'',NULL,NULL,NULL,@TABLE_CNT_10,NULL,1,NULL,NULL,NULL,NULL,NULL,NULL);
			END TRY
			BEGIN CATCH
					INSERT INTO LDSPhilanthropiesDW.dbo.Alpha_Table_2                      
						(Alpha_DateTime,Alpha_Stage,Alpha_Step_Number,Alpha_Step_Name,Alpha_Begin_Time,Alpha_End_Time,Alpha_Duration_In_Seconds,Alpha_Count,Alpha_Query,Alpha_Result,ErrorNumber,ErrorSeverity,ErrorState,ErrorProcedure,ErrorLine,ErrorMessage)
							VALUES(GETDATE(),''Donor Dim'',''122X'',''Support Tables - dbo._Numbered_ContactIds - Error'',NULL,NULL,NULL,NULL,NULL,0,ERROR_NUMBER(),ERROR_SEVERITY(),ERROR_STATE(),ERROR_PROCEDURE(),ERROR_LINE(),ERROR_MESSAGE());              
			END CATCH
				IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id(''dbo._Connection_Dim'') AND NAME =''IX_Connection_ContactId'') 
				DROP INDEX IX_Connection_ContactId ON dbo._Connection_Dim; 
				IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id(''dbo._Connection_Dim'') AND NAME =''IX_Connection_ContactId2'') 
				DROP INDEX IX_Connection_ContactId2 ON dbo._Connection_Dim;

				IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id(''dbo._Connection_Dim'') AND NAME =''Relationship'')
				DROP INDEX Relationship ON dbo._Connection_Dim;

				IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id(''dbo._Numbered_ContactIds'') AND NAME =''ContactId'')
				DROP INDEX ContactId ON dbo._Numbered_ContactIds;

				CREATE NONCLUSTERED INDEX IX_Connection_ContactId 
					ON _Connection_Dim(ContactId ASC)
					INCLUDE (
						Relationship 
							, Relationship_LdspId 
							, Relationship_Name 
						)
						;
				CREATE NONCLUSTERED INDEX IX_Connection_ContactId2
					ON _Connection_Dim(ContactId ASC)
				;
				
				
				CREATE INDEX Relationship ON dbo._Connection_Dim(Relationship);

				CREATE NONCLUSTERED INDEX ContactId 
				ON dbo._Numbered_ContactIds(ContactId)
					INCLUDE (
						RowNum
					);

				UPDATE STATISTICS dbo._Connection_Dim

				UPDATE STATISTICS dbo._Numbered_ContactIds 

			'
		, 'SET ANSI_WARNINGS OFF
		
			DECLARE @Total_Loop_Num INT
			DECLARE @RowNum_Beg INT
			DECLARE @RowNum_End INT
				SELECT @Total_Loop_Num = (
					SELECT (Max_RowNum / 10000) + 1 AS Total_Loop_Num
						FROM
							(SELECT MAX(RowNum) AS Max_RowNum
								FROM _Numbered_ContactIds) A
					)
			--DECLARE @Barsoom_Base BIGINT
			--SET @Barsoom_Base = ((136 - 1336900)/-1)
			--EXEC usp_Barsoom @Barsoom_Cnt = @Barsoom_Base
			DECLARE @LOOP_NUM INT
			SET @LOOP_NUM = 1
				WHILE  @LOOP_NUM <= @Total_Loop_Num 
				BEGIN
					SELECT @RowNum_Beg = (SELECT (@LOOP_NUM * 10000) - 9999)
					SELECT @RowNum_End = (SELECT (@LOOP_NUM * 10000))
						BEGIN TRY
							DECLARE @TABLE_CNT_20 NVARCHAR(100)                                                                                     
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122O'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Begin'', @Alpha_Result = 1;
								INSERT INTO _Donor_Dim (
									Donor_Key
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
									--, Wealth_Key
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
									--, Donor_Ethnicity  /*Delete from source 5/15/17*/
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
									--, Donor_Org_Graduate_Prof_Yn  /*Delete from source 5/15/17*/
									--, Donor_Org_Alumni_Assoc_Yn  /*Delete from source 5/15/17*/
									--, Donor_Org_Athletics_Yn  /*Delete from source 5/15/17*/
									--, Donor_Org_Four_Year_Yn  /*Delete from source 5/15/17*/
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
									, Donor_Marriage_Status_Value
									--, Donor_Ethnicity_Value  /*Delete from source 5/15/17*/
									, Donor_Lds_Member_Value
									, Donor_Personal_Suffix_Value
									, Donor_Major_Gift_Propen_Value
									, Donor_Annual_Gift_Value
									, Donor_Planned_Gift_Value
									, Donor_Gift_Capacity_Enp_Value
									, Donor_Gift_Capacity_En_Value
									, Donor_Philan_Cap_Rating_Value
									, Donor_Est_Household_Income_Value
									, Donor_Est_Home_Market_Val_Value
									, Donor_Block_Clusters_Value
									, Donor_Org_Class_Code_Value
									, Donor_Org_Retiree_Ratio_Value
									, Donor_Org_Split_Ratio_Value
									, Donor_Org_Matching_Ratio_Value
									, Donor_Org_Pref_Cont_Meth_Val
									, All_Personal_Connections
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
									)
									SELECT DISTINCT A.Donor_Key
										, COALESCE(A.Activity_Group_Key,0) AS Activity_Group_Key
										, COALESCE(A.Address_Group_Key,0) AS Address_Group_Key
										, COALESCE(A.Alumni_Group_Key,0) AS Alumni_Group_Key
										, COALESCE(A.Association_Group_Key,0) AS Association_Group_Key
										, COALESCE(A.Award_Group_Key,0) AS Award_Group_Key
										, COALESCE(A.Drop_Include_Group_Key,0) AS Drop_Include_Group_Key
										, COALESCE(A.Email_Group_Key,0) AS Email_Group_Key
										, COALESCE(A.Employment_Group_Key,0) AS Employment_Group_Key
										, COALESCE(A.Language_Group_Key,0) AS Language_Group_Key
										, COALESCE(A.Phone_Group_Key,0) AS Phone_Group_Key
										, COALESCE(A.Psa_Group_Key,0) AS Psa_Group_Key
										, COALESCE(A.Connection_Group_Key,0) AS Connection_Group_Key
										, COALESCE(A.Id_Group_Key,0) AS Id_Group_Key
										, COALESCE(A.Interest_Group_Key,0) AS Interest_Group_Key
										, COALESCE(A.Affiliated_Key,0) AS Affiliated_Key
										--, COALESCE(A.Wealth_Key,0) AS Wealth_Key
										, COALESCE(A.Student_Group_Key,0) AS Student_Group_Key
										, COALESCE(A.Donor_Ldsp_Id,A.New_LdspId) AS Donor_Ldsp_Id 
										, A.Donor_Contact_Type
										, COALESCE(A.Donor_Organization_Id,''0'') AS Donor_Organization_Id
										, COALESCE(A.FullName,A.Name) AS Donor_Name
										, A.FirstName AS Donor_First_Name
										, A.MiddleName AS Donor_Middle_Name
										, A.LastName AS Donor_Last_Name
										, A.NickName AS Donor_Nick_Name
										, A.New_MiddleName2 AS Donor_Middle_Name2
										, A.New_LastName2 AS Donor_Last_Name2
										, A.New_PreferredName AS Donor_Preferred_Name
										, COALESCE(A.Plus_DisplayName,A.Name) AS Donor_Display_Name
										, A.New_BirthName AS Donor_Maiden_Name
										, NULL AS Donor_Title
										, NULL As Donor_Professional_Suffix
										, NULL AS Donor_Personal_Suffix
										, C.Column_Label AS Donor_Marriage_Status
										, A.SpousesName AS Donor_Spouses_Name
										, B.Column_Label AS Donor_Gender
										--, D.Column_Label AS Donor_Ethnicity  /*Delete from source 5/15/17*/
										, E.Column_Label AS Donor_Lds_Member
										, CASE WHEN A.Plus_CurrentStudent = 1 THEN ''Y'' ELSE ''N'' END AS Donor_Current_Student_Yn
										, A.New_BirthDate AS Donor_Birth_Dt
										, A.New_BirthdateDay AS Donor_Birth_Dt_Day
										, A.New_BirthdateMonth AS Donor_Birth_Dt_Month
										, A.New_BirthdateYear AS Donor_Birth_Dt_Year
										, A.New_DeceasedDate AS Donor_Deceased_Dt
										, A.New_DeceasedDay AS Donor_Deceased_Dt_Day
										, A.New_DeceasedMonth AS Donor_Deceased_Dt_Month
										, A.New_DeceasedYear AS Donor_Deceased_Dt_Year
										, CONVERT(VARCHAR(10),A.Plus_WealthDate,101) AS Donor_Wealth_Dt
										, NULL AS Donor_Major_Gift_Propen
										, NULL AS Donor_Annual_Gift
										, NULL AS Donor_Planned_Gift
										, NULL AS Donor_Gift_Capacity_Enp
										, NULL AS Donor_Gift_Capacity_En
										, NULL AS Donor_Philan_Cap_Rating
										, NULL AS Donor_Est_Household_Income
										, NULL AS Donor_Est_Home_Market_Val
										, NULL AS Donor_Block_Clusters
										, NULL AS Donor_Individual_Infor_Envel
										, NULL AS Donor_Couple_Infor_Envel
										, NULL AS Donor_Individual_Form_Envel
										, NULL AS Donor_Couple_Form_Envel
										, NULL AS Donor_Country
										, CASE WHEN A.Plus_MatchingGiftProgram = 100000000 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Matches_Gifts_Yn
										--, CASE WHEN A.New_GraduateProfessional = 1 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Graduate_Prof_Yn  /*Delete from source 5/15/17*/
										--, CASE WHEN A.New_AlumniAssociation = 1 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Alumni_Assoc_Yn  /*Delete from source 5/15/17*/
										--, CASE WHEN A.New_Athletics = 1 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Athletics_Yn  /*Delete from source 5/15/17*/
										--, CASE WHEN A.New_FourYear = 1 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Four_Year_Yn  /*Delete from source 5/15/17*/
										, CASE WHEN A.New_Deceased = 1 THEN ''Y'' ELSE ''N'' END AS Donor_Deceased_Yn
										, CASE WHEN A.DoNotPostalMail = 0 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Allow_Mail_Yn
										, CASE WHEN A.DoNotBulkPostalMail = 0 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Allow_Bulk_Mail_Yn
										, CASE WHEN A.DoNotEmail = 0 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Allow_Email_Yn
										, CASE WHEN A.DoNotBulkEmail = 0 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Allow_Bulk_Email_Yn
										, CASE WHEN A.DoNotPhone = 0 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Allow_Phone_Yn
										, CASE WHEN A.DoNotFax = 0 THEN ''Y'' ELSE ''N'' END AS Donor_Org_Allow_Fax_Yn
										, NULL AS Donor_Org_Class_Code
										, NULL AS Donor_Org_Retiree_Ratio
										, NULL AS Donor_Org_Split_Ratio
										, NULL AS Donor_Org_Matching_Ratio
										, NULL AS Donor_Org_Pref_Cont_Meth
										, A.Donor_Org_Description
										, C.Column_Value AS Donor_Marriage_Status_Value
										--, D.Column_Value AS Donor_Ethnicity_Value  /*Delete from source 5/15/17*/  
										, E.Column_Value AS Donor_Lds_Member_Value
										, NULL AS Donor_Personal_Suffix_Value 
										, NULL AS Donor_Major_Gift_Propen_Value 
										, NULL AS Donor_Annual_Gift_Value 
										, NULL AS Donor_Planned_Gift_Value
										, NULL AS Donor_Gift_Capacity_Enp_Value
										, NULL AS Donor_Gift_Capacity_En_Value
										, NULL AS Donor_Philan_Cap_Rating_Value
										, NULL AS Donor_Est_Household_Income_Value
										, NULL AS Donor_Est_Home_Market_Val_Value
										, NULL AS Donor_Block_Clusters_Value
										, NULL AS Donor_Org_Class_Code_Value
										, NULL AS Donor_Org_Retiree_Ratio_Value
										, NULL AS Donor_Org_Split_Ratio_Value
										, NULL AS Donor_Org_Matching_Ratio_Value
										, NULL AS Donor_Org_Pref_Cont_Meth_Val
										, NULL AS All_Personal_Connections
										, Z.Byu_Student_Id
										, Z.ByuI_Student_Id
										, Z.ByuH_Student_Id
										, Z.Ldsbc_Student_Id
										, Z.Byu_Employee_Id
										, Z.ByuI_Employee_Id
										, Z.ByuH_Employee_Id
										, Z.Ldsbc_Employee_Id
										, AA.Spouse_Name
										, AA.Spouse_LdspId
										, Z.Ces_Id
										, Z.Church_Payroll_Id
										, NULL AS Donor_Total_Name
										, NULL AS Donor_Total_Donation
										, A.Plus_PreferredFirstName
										, A.Plus_PreferredMiddleName
										, A.Plus_PreferredLastName
										, A.Plus_PreferredFullName
										, A.Plus_SpousePreferredFirstName
										, A.Plus_SpousePreferredMiddleName
										, A.Plus_SpousePreferredLastName
										, A.Plus_SpousePreferredFullName
										, BB.Plus_CoordinatingLiaison
										, BB.Plus_ConnectedLiaison
										, BB.Plus_PendingLiaison
										, NULL AS Byu_Degrees
										, NULL AS ByuI_Degrees
										, NULL AS ByuH_Degrees
										, NULL AS Ldsbc_Degrees
										, NULL AS Donor_Age
										, NULL AS General_Authority
										, NULL AS Emeritus_General_Authority
										, NULL AS Mission_President
										, NULL AS Temple_President
										, NULL AS All_Employment 
										, NULL AS Current_Employment
										, NULL AS Former_Employment
										, AA.Spouse_Phone_Number
										, AA.Spouse_Email 
										, AA.Spouse_First_Name
										, AA.Spouse_Last_Name
										, CONVERT(VARCHAR(10),AA.Spouse_Birth_Date,101) AS Spouse_Birth_Date
										, AA.Spouse_Age
										, NULL AS Byu_Donor
										, NULL AS ByuI_Donor
										, NULL AS ByuH_Donor
										, NULL AS Ldsbc_Donor
										, NULL AS Cell_Phone
										, NULL AS Current_Employer_Name
										, NULL AS Current_Job_Title
										, NULL AS Current_Job_Code
										, NULL AS Current_Job_Date_Started
										, NULL AS Current_Job_Work_Phone
										, NULL AS Current_Job_Work_Address
										, NULL AS Donor_Total_Giving_Current_Year
										, NULL AS Donor_Total_Giving_Current_Year_Minus_1
										, NULL AS Donor_Total_Giving_Current_Year_Minus_2
										, NULL AS Donor_Total_Giving_Current_Year_Minus_3
										, ''N'' AS Donor_Any_School_Current_Student
										, ''N'' AS Donor_BYU_Current_Student
										, ''N'' AS Donor_BYUI_Current_Student
										, ''N'' AS Donor_BYUH_Current_Student
										, ''N'' AS Donor_LDSBC_Current_Student
										, ''N'' AS Donor_Given_This_Year_To_Byu
										, ''N'' AS Donor_Given_This_Year_To_ByuI
										, ''N'' AS Donor_Given_This_Year_To_ByuH
										, ''N'' AS Donor_Given_This_Year_To_LDSBC
										, ''N'' AS Donor_Byu_Plc
										, ''N'' AS Donor_Byuh_Plc
										, ''N'' AS Donor_Nac
										, ''N'' AS Donor_Byu_Law_Grads
										, ''N'' AS Donor_Byu_Msm_Grads
										, ''N'' AS Donor_Open_Byu_Telefund_Pledge
										, ''N'' AS Donor_Open_Byui_Telefund_Pledge
										, ''N'' AS Donor_Open_Byuh_Telefund_Pledge
										, ''N'' AS Donor_Open_Ldsbc_Telefund_Pledge
										, ''N'' AS Donor_Byu_Recurring_Donor
										, ''N'' AS Donor_Byui_Recurring_Donor
										, ''N'' AS Donor_Byuh_Recurring_Donor
										, ''N'' AS Donor_Ldsbc_Recurring_Donor
										, A.Donor_Ldsp_Text_Lines
										, 0 AS Donor_Largest_Gift_Amt_Byu
										, 0 AS Donor_Largest_Gift_Amt_Byui
										, 0 AS Donor_Largest_Gift_Amt_Byuh
										, 0 AS Donor_Largest_Gift_Amt_Ldsbc
										, ''D1'' AS Donor_Retention_Type_Code_Byu  -- See TFS # 438115 1/24/2018
										, ''D1'' AS Donor_Retention_Type_Code_Byui  -- See TFS # 438115 1/24/2018
										, ''D1'' AS Donor_Retention_Type_Code_Byuh  -- See TFS # 438115 1/24/2018
										, ''D1'' AS Donor_Retention_Type_Code_Ldsbc  -- See TFS # 438115 1/24/2018
										, NULL AS Donor_Total_Giving_To_Byu_Current_Year_Amt
										, NULL AS Donor_Total_Giving_To_Byu_Current_Year_Minus_1_Amt
										, NULL AS Donor_Total_Giving_To_Byu_Current_Year_Minus_2_Amt
										, NULL AS Donor_Total_Giving_To_Byu_Current_Year_Minus_3_Amt
										, NULL AS Donor_Total_Giving_To_Byui_Current_Year_Amt
										, NULL AS Donor_Total_Giving_To_Byui_Current_Year_Minus_1_Amt
										, NULL AS Donor_Total_Giving_To_Byui_Current_Year_Minus_2_Amt
										, NULL AS Donor_Total_Giving_To_Byui_Current_Year_Minus_3_Amt
										, NULL AS Donor_Total_Giving_To_Byuh_Current_Year_Amt
										, NULL AS Donor_Total_Giving_To_Byuh_Current_Year_Minus_1_Amt
										, NULL AS Donor_Total_Giving_To_Byuh_Current_Year_Minus_2_Amt
										, NULL AS Donor_Total_Giving_To_Byuh_Current_Year_Minus_3_Amt
										, NULL AS Donor_Total_Giving_To_Ldsbc_Current_Year_Amt
										, NULL AS Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_1_Amt
										, NULL AS Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_2_Amt
										, NULL AS Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_3_Amt
										, NULL AS Donor_Total_Giving_To_Byu_Current_Year_Minus_4_Amt
										, NULL AS Donor_Total_Giving_To_Byu_Current_Year_Minus_5_Amt
										, NULL AS Donor_Total_Giving_To_Byui_Current_Year_Minus_4_Amt
										, NULL AS Donor_Total_Giving_To_Byui_Current_Year_Minus_5_Amt
										, NULL AS Donor_Total_Giving_To_Byuh_Current_Year_Minus_4_Amt
										, NULL AS Donor_Total_Giving_To_Byuh_Current_Year_Minus_5_Amt
										, NULL AS Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_4_Amt
										, NULL AS Donor_Total_Giving_To_Ldsbc_Current_Year_Minus_5_Amt
										, NULL AS Donor_Total_Giving_Current_Year_Minus_4_Amt
										, NULL AS Donor_Total_Giving_Current_Year_Minus_5_Amt
										, ''N'' AS Donor_Total_Giving_Byu_High_Flag
										, ''N'' AS Donor_Total_Giving_Byui_High_Flag
										, ''N'' AS Donor_Total_Giving_Byuh_High_Flag
										, ''N'' AS Donor_Total_Giving_Ldsbc_High_Flag
										, ''N'' AS Current_Byu_Employment_Yn
										, ''N'' AS Current_Byui_Employment_Yn
										, ''N'' AS Current_Byuh_Employment_Yn
										, ''N'' AS Current_Ldsbc_Employment_Yn
										, NULL AS Informal_Mailing_Name
										, NULL AS Informal_Salutation
										, ''N'' AS Byu_Night_Society_Member
										, ''N'' AS Byui_Legacy_Society_Member
										, ''N'' AS Byuh_Cowley_Society_Member
										, ''N'' AS Ldsbc_Fox_Society_Member
										, NULL AS Donor_Spouse_Coordinating_Liaison
										, ''N'' AS Donor_Previously_Contacted_Byu_Yn
										, ''N'' AS Donor_Previously_Contacted_Byui_Yn 
										, ''N'' AS Donor_Previously_Contacted_Byuh_Yn 
										, ''N'' AS Donor_Previously_Contacted_Ldsbc_Yn
										, ''N'' AS Donor_Given_Last_3_Months_To_Byu
										, ''N'' AS Donor_Given_Last_3_Months_To_Byui
										, ''N'' AS Donor_Given_Last_3_Months_To_Byuh
										, ''N'' AS Donor_Given_Last_3_Months_To_Ldsbc
										, ''N'' AS Donor_Given_Last_3_Months_To_Church
										, NULL AS Donor_Liaison_Connections
										, NULL AS Donor_Total_Lifetime_Giving
										, NULL AS Donor_Total_Lifetime_Giving_Last_5_Years
										, NULL AS Donor_Total_Lifetime_Giving_Byu
										, NULL AS Donor_Total_Lifetime_Giving_Byui
										, NULL AS Donor_Total_Lifetime_Giving_Byuh
										, NULL AS Donor_Total_Lifetime_Giving_Ldsbc
										, NULL AS Donor_Total_Lifetime_Giving_Church
										, NULL AS Donor_Total_Lifetime_Giving_Pcc
										, NULL AS Donor_Total_Lifetime_Giving_Ces
										, NULL AS Donor_Most_Recent_Gift_Date_Ldsp
										, NULL AS Donor_Most_Recent_Gift_Date_Byu
										, NULL AS Donor_Most_Recent_Gift_Date_Byui
										, NULL AS Donor_Most_Recent_Gift_Date_Byuh
										, NULL AS Donor_Most_Recent_Gift_Date_Ldsbc
										, NULL AS Donor_Most_Recent_Gift_Date_Church
										, NULL AS Donor_Ldsp_Largest_Gift
										, NULL AS Donor_First_Gift_Post_Date_Byu
										, NULL AS Donor_First_Gift_Post_Date_Byui
										, NULL AS Donor_First_Gift_Post_Date_Byuh
										, NULL AS Donor_First_Gift_Post_Date_Ldsbc
										, NULL AS Donor_Furthest_Initiative_Stage
										, NULL AS Donor_Number_Of_Open_Initiatives
										, NULL AS Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years
										, NULL AS Donor_Total_Lifetime_Giving_To_Byui_Last_5_Years
										, NULL AS Donor_Total_Lifetime_Giving_To_Byuh_Last_5_Years
										, NULL AS Donor_Total_Lifetime_Giving_To_Ldsbc_Last_5_Years
										, NULL AS Donor_Total_Lifetime_Giving_To_Church_Last_5_Years
										, NULL AS Donor_Most_Recent_Gift_To_Ldsp_Amt
										, NULL AS Donor_Most_Recent_Gift_To_Byu_Amt
										, NULL AS Donor_Most_Recent_Gift_To_Byui_Amt
										, NULL AS Donor_Most_Recent_Gift_To_Byuh_Amt
										, NULL AS Donor_Most_Recent_Gift_To_Ldsbc_Amt
										, NULL AS Donor_Most_Recent_Gift_To_Church_Amt
										, NULL AS Donor_Last_F2F_Visit_Date
										, ''D1'' AS Donor_Type_Code_Ldsp  -- See TFS # 438115 1/24/2018
										, NULL AS Donor_Largest_Gift_Amt_Church
										, NULL AS Donor_Largest_Gift_Date_Ldsp
										, NULL AS Donor_Largest_Gift_Date_Byu
										, NULL AS Donor_Largest_Gift_Date_Byui
										, NULL AS Donor_Largest_Gift_Date_Byuh
										, NULL AS Donor_Largest_Gift_Date_Ldsbc
										, NULL AS Donor_Largest_Gift_Date_Church
										, NULL AS Donor_Institution_Giving_Areas
										, NULL AS Donor_Byu_Giving_Areas
										, NULL AS Donor_Church_Giving_Areas
										, NULL AS Donor_Pledge_Reminder_Email_Content_Byu
										, NULL AS Donor_Pledge_Reminder_Email_Content_Byui
										, NULL AS Donor_Pledge_Reminder_Email_Content_Byuh
										, NULL AS Donor_Pledge_Reminder_Email_Content_Ldsbc
										, NULL AS Donor_Total_Name_Display
										, NULL AS Plus_CoordinatingLiaison_DomainName
										, NULL AS Plus_PendingLiaison_DomainName
										, NULL AS Plus_ConnectedLiaison_DomainName
										, NULL AS Donor_Gift_Count_Previous_5_Years
										, NULL AS Donor_Average_Single_Gift_Previous_5_Years
										, NULL AS Donor_Is_Qualified
										, NULL AS Donor_Qualified_On 
										, NULL AS Donor_Qualified_By
										, NULL AS Donor_First_Recurring_Rule_Date_Byu
										, NULL AS Donor_First_Recurring_Rule_Date_Byui
										, NULL AS Donor_First_Recurring_Rule_Date_Byuh
										, NULL AS Donor_First_Recurring_Rule_Date_Ldsbc
										, NULL AS Donor_Recurring_Total_Last_Month_Byu
										, NULL AS Donor_Recurring_Total_Last_Month_Byui
										, NULL AS Donor_Recurring_Total_Last_Month_Byuh
										, NULL AS Donor_Recurring_Total_Last_Month_Ldsbc
										, NULL AS Donor_Recurring_Total_Month_Before_Last_Byu
										, NULL AS Donor_Recurring_Total_Month_Before_Last_Byui
										, NULL AS Donor_Recurring_Total_Month_Before_Last_Byuh
										, NULL AS Donor_Recurring_Total_Month_Before_Last_Ldsbc
										, NULL AS Donor_Recurring_Gift_Upgrade_Byu
										, NULL AS Donor_Recurring_Gift_Upgrade_Byui
										, NULL AS Donor_Recurring_Gift_Upgrade_Byuh
										, NULL AS Donor_Recurring_Gift_Upgrade_Ldsbc
										, NULL AS Donor_Total_Giving_To_Church_Current_Year_Amt
										, NULL AS Donor_Total_Giving_To_Church_Current_Year_Minus_1_Amt
										, NULL AS Donor_Total_Giving_To_Church_Current_Year_Minus_2_Amt
										, NULL AS Donor_Total_Giving_To_Church_Current_Year_Minus_3_Amt
										, NULL AS Donor_Total_Giving_To_Church_Current_Year_Minus_4_Amt
										, NULL AS Donor_Total_Giving_To_Church_Current_Year_Minus_5_Amt
										, NULL AS Donor_Retention_Type_Code_Byu_Minus_1
										, NULL AS Donor_Retention_Type_Code_Byu_Minus_2
										, NULL AS Donor_Retention_Type_Code_Byu_Minus_3
										, NULL AS Donor_Retention_Type_Code_Byu_Minus_4
										, NULL AS Donor_Retention_Type_Code_Byu_Minus_5
										, NULL AS Donor_Retention_Type_Code_Byui_Minus_1
										, NULL AS Donor_Retention_Type_Code_Byui_Minus_2
										, NULL AS Donor_Retention_Type_Code_Byui_Minus_3
										, NULL AS Donor_Retention_Type_Code_Byui_Minus_4
										, NULL AS Donor_Retention_Type_Code_Byui_Minus_5
										, NULL AS Donor_Retention_Type_Code_Byuh_Minus_1
										, NULL AS Donor_Retention_Type_Code_Byuh_Minus_2
										, NULL AS Donor_Retention_Type_Code_Byuh_Minus_3
										, NULL AS Donor_Retention_Type_Code_Byuh_Minus_4
										, NULL AS Donor_Retention_Type_Code_Byuh_Minus_5
										, NULL AS Donor_Retention_Type_Code_Ldsbc_Minus_1
										, NULL AS Donor_Retention_Type_Code_Ldsbc_Minus_2
										, NULL AS Donor_Retention_Type_Code_Ldsbc_Minus_3
										, NULL AS Donor_Retention_Type_Code_Ldsbc_Minus_4
										, NULL AS Donor_Retention_Type_Code_Ldsbc_Minus_5
										, NULL AS Donor_First_Gift_To_Byu_Amt
										, NULL AS Donor_First_Gift_To_Byui_Amt
										, NULL AS Donor_First_Gift_To_Byuh_Amt
										, NULL AS Donor_First_Gift_To_Ldsbc_Amt
										, NULL AS Donor_First_Gift_To_Church_Amt
										, NULL AS Donor_First_Gift_To_Ldsp_Amt
										, NULL AS Donor_First_Gift_Date_Byu
										, NULL AS Donor_First_Gift_Date_Byui
										, NULL AS Donor_First_Gift_Date_Byuh
										, NULL AS Donor_First_Gift_Date_Ldsbc
										, NULL AS Donor_First_Gift_Date_Church
										, NULL AS Donor_First_Gift_Date_Ldsp
										, AA.Spouse_Middle_Name AS Donor_Spouse_Middle_Name
										, AA.Spouse_Birth_Name AS Donor_Spouse_Birth_Name
										, NULL AS Donor_Total_Giving_Current_Year_With_Matching
										, NULL AS Donor_Total_Giving_Current_Year_Minus_1_With_Matching
										, NULL AS Donor_Total_Giving_Current_Year_Minus_2_With_Matching
										, NULL AS Donor_Total_Giving_Current_Year_Minus_3_With_Matching
										, NULL AS Donor_Total_Giving_Current_Year_Minus_4_With_Matching
										, NULL AS Donor_Total_Giving_Current_Year_Minus_5_With_Matching
										, A.Donor_Lds_TelefundNotes
										FROM LDSPhilanthropiesDW.dbo._Donor_Pre_Dim A
											INNER JOIN LDSPhilanthropiesDW.dbo._Numbered_ContactIds NUM ON A.Donor_Key = NUM.ContactId 
											LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Gender_ B ON A.GenderCode = B.Column_Value
											LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Family_Status_ C ON A.FamilyStatusCode = C.Column_Value
											--LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Ethnicity_ D ON A.New_Ethnicity = D.Column_Value  /*Delete from source 5/15/17*/
											LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Church_Member_ E ON A.Plus_ChurchMember = E.Column_Value
											LEFT JOIN 
												(SELECT DISTINCT CONVERT(NVARCHAR(100),ContactId) AS ContactId
													, MAX(CASE WHEN New_Type = ''BYU Student ID'' THEN Plus_Id ELSE NULL END) AS Byu_Student_Id
													, MAX(CASE WHEN New_Type = ''BYU Idaho Student ID'' THEN Plus_Id ELSE NULL END) AS ByuI_Student_Id
													, MAX(CASE WHEN New_Type = ''BYU Hawaii Student ID'' THEN Plus_Id ELSE NULL END) AS ByuH_Student_Id
													, MAX(CASE WHEN New_Type = ''LDSBC Student ID'' THEN Plus_Id ELSE NULL END) AS Ldsbc_Student_Id
													, MAX(CASE WHEN New_Type = ''BYU Employee ID'' THEN Plus_Id ELSE NULL END) AS Byu_Employee_Id
													, MAX(CASE WHEN New_Type = ''BYU Idaho Employee ID'' THEN Plus_Id ELSE NULL END) AS ByuI_Employee_Id
													, MAX(CASE WHEN New_Type = ''BYU Hawaii Employee ID'' THEN Plus_Id ELSE NULL END) AS ByuH_Employee_Id
													, MAX(CASE WHEN New_Type = ''LDSBC Employee ID'' THEN Plus_Id ELSE NULL END) AS Ldsbc_Employee_Id
													, MAX(CASE WHEN New_Type = ''CES ID'' THEN Plus_Id ELSE NULL END) AS Ces_Id
													, MAX(CASE WHEN New_Type = ''Church Payroll ID'' THEN Plus_Id ELSE NULL END) AS Church_Payroll_Id
													FROM LDSPhilanthropiesDW.dbo._Id_Dim 
													GROUP BY CONVERT(NVARCHAR(100),ContactId)
												) Z ON A.Donor_Key = Z.ContactId
											LEFT JOIN
												(SELECT ContactId
													, MAX(CASE WHEN _Connection_Dim.Relationship = ''Spouse'' THEN Relationship_Name ELSE NULL END) AS Spouse_Name
													, MAX(CASE WHEN _Connection_Dim.Relationship = ''Spouse'' THEN Relationship_LdspId ELSE NULL END) AS Spouse_LdspId
													, MAX(CASE WHEN _Connection_Dim.Relationship = ''Spouse'' THEN Relationship_Phone_Number ELSE NULL END) AS Spouse_Phone_Number
													, MAX(CASE WHEN _Connection_Dim.Relationship = ''Spouse'' THEN Relationship_Email ELSE NULL END) AS Spouse_Email 
													, MAX(CASE WHEN _Connection_Dim.Relationship = ''Spouse'' THEN Relationship_First_Name ELSE NULL END) AS Spouse_First_Name
													, MAX(CASE WHEN _Connection_Dim.Relationship = ''Spouse'' THEN Relationship_Last_Name ELSE NULL END) AS Spouse_Last_Name
													, MAX(CASE WHEN _Connection_Dim.Relationship = ''Spouse'' THEN Relationship_Birth_Date ELSE NULL END) AS Spouse_Birth_Date
													, MAX(CASE WHEN _Connection_Dim.Relationship = ''Spouse'' THEN Relationship_Age ELSE NULL END) AS Spouse_Age
													, MAX(CASE WHEN _Connection_Dim.Relationship = ''Spouse'' THEN Relationship_Middle_Name ELSE NULL END) AS Spouse_Middle_Name
													, MAX(CASE WHEN _Connection_Dim.Relationship = ''Spouse'' THEN Relationship_Birth_Name ELSE NULL END) AS Spouse_Birth_Name
													FROM LDSPhilanthropiesDW.dbo._Connection_Dim
													GROUP BY ContactId                          
												) AA ON A.Donor_Key = AA.ContactId
											LEFT JOIN
													(
													SELECT ContactId
														, Plus_CoordinatingLiaison
														, Plus_ConnectedLiaison
														, Plus_PendingLiaison
														FROM 
															(SELECT ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY Liaison_Type) AS Row_Num
																, CONVERT(NVARCHAR(100),ContactId) AS ContactId
																, CASE WHEN Liaison_Type = ''Coordinating_Liaison'' THEN Liaison ELSE NULL END AS Plus_CoordinatingLiaison
																, CASE WHEN Liaison_Type = ''Connected_Liaison'' THEN Liaison ELSE NULL END AS Plus_ConnectedLiaison
																, CASE WHEN Liaison_Type = ''Pending_Liaison'' THEN Liaison ELSE NULL END AS Plus_PendingLiaison
																FROM
																	(SELECT DISTINCT ''Coordinating_Liaison'' AS Liaison_Type
																		, A.FullName AS Liaison
																		, B.ContactId
																		, B.FullName
																		FROM Ext_System_User A
																			INNER JOIN Ext_Contact B ON A.SystemUserId = B.Plus_CoordinatingLiaison
																	UNION
																	SELECT DISTINCT ''Coordinating_Liaison'' AS Liaison_Type 
																		, A.FullName AS Liaison
																		, B.AccountId AS ContactId
																		, B.Name AS FullName
																		FROM Ext_System_User A
																			INNER JOIN Ext_Account B ON A.SystemUserId = B.Plus_CoordinatingLiaison
																	UNION
																	SELECT DISTINCT ''Connected_Liaison'' AS Liaison_Type 
																		, A.FullName AS Liaison
																		, B.ContactId
																		, B.FullName
																		FROM Ext_System_User A
																			INNER JOIN Ext_Contact B ON A.SystemUserId = B.Plus_ConnectedLiaison
																	UNION
																	SELECT DISTINCT ''Connected_Liaison'' AS Liaison_Type 
																		, A.FullName AS Liaison
																		, B.AccountId AS ContactId
																		, B.Name AS FullName
																		FROM Ext_System_User A
																			INNER JOIN Ext_Account B ON A.SystemUserId = B.Plus_ConnectedLiaison
																	UNION
																	SELECT DISTINCT ''Pending_Liaison'' AS Liaison_Type 
																		, A.FullName AS Liaison
																		, B.ContactId
																		, B.FullName
																		FROM Ext_System_User A
																			INNER JOIN Ext_Contact B ON A.SystemUserId = B.Plus_PendingLiaison
																	UNION
																	SELECT DISTINCT ''Pending_Liaison'' AS Liaison_Type 
																		, A.FullName AS Liaison
																		, B.AccountId AS ContactId
																		, B.Name AS FullName
																		FROM Ext_System_User A
																			INNER JOIN Ext_Account B ON A.SystemUserId = B.Plus_PendingLiaison
																	) A
															) A
														WHERE 1 = 1
															AND Row_Num = 1
													) BB ON A.Donor_Key = BB.ContactId
												WHERE 1 = 1
													AND NUM.RowNum BETWEEN @RowNum_Beg AND @RowNum_End                                              
							SELECT @TABLE_CNT_20 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM _Donor_Dim);
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim'', @Alpha_Step_Number = ''122O'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - End'', @Alpha_Count = @TABLE_CNT_20, @Alpha_Result = 1;
						END TRY
						BEGIN CATCH
							SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
							SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
							SELECT @ERROR_STATE = (SELECT ERROR_STATE())
							SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
							SELECT @ERROR_LINE = (SELECT ERROR_LINE())
							SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Donor_Dim'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Error'', @Alpha_Result = 0
							, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
						END CATCH
					SET @LOOP_NUM = @LOOP_NUM + 1   
				END
			SET @LOOP_NUM = 0
			SET ANSI_WARNINGS ON
			'
		, 'IF OBJECT_ID(''dbo._Donor_Dim_1'',''U'') IS NOT NULL
			DROP TABLE dbo._Donor_Dim_1
			CREATE TABLE dbo._Donor_Dim_1 (
				[Donor_Key] NVARCHAR(100),
				[Donor_Personal_Suffix] nvarchar(400),
				[Donor_Major_Gift_Propen] nvarchar(400),
				[Donor_Annual_Gift] nvarchar(400),
				[Donor_Planned_Gift] nvarchar(400),
				[Donor_Gift_Capacity_Enp] nvarchar(400),
				[Donor_Gift_Capacity_En] nvarchar(400),
				[Donor_Philan_Cap_Rating] nvarchar(400),
				[Donor_Est_Household_Income] nvarchar(400),
				[Donor_Est_Home_Market_Val] nvarchar(400),   
				[Donor_Personal_Suffix_Value] INT,
				[Donor_Major_Gift_Propen_Value] INT,
				[Donor_Annual_Gift_Value] INT,
				[Donor_Planned_Gift_Value] INT,
				[Donor_Gift_Capacity_Enp_Value] INT,
				[Donor_Gift_Capacity_En_Value] INT,
				[Donor_Philan_Cap_Rating_Value] INT,
				[Donor_Est_Household_Income_Value] INT,
				[Donor_Est_Home_Market_Val_Value] INT,
				)
			IF OBJECT_ID(''dbo._Donor_Dim_2'',''U'') IS NOT NULL
			DROP TABLE dbo._Donor_Dim_2
			CREATE TABLE dbo._Donor_Dim_2 (
				[Donor_Key] NVARCHAR(100),
				[Donor_Title] nvarchar(100),
				[Donor_Professional_Suffix] nvarchar(100),
				[Donor_Block_Clusters] nvarchar(400),
				[Donor_Country] nvarchar(100),
				[Donor_Org_Class_Code] nvarchar(400),
				[Donor_Org_Retiree_Ratio] nvarchar(400),
				[Donor_Org_Split_Ratio] nvarchar(400),
				[Donor_Org_Matching_Ratio] nvarchar(400),
				[Donor_Org_Pref_Cont_Meth] nvarchar(400),
				[Donor_Block_Clusters_Value] INT,
				[Donor_Org_Class_Code_Value] INT,
				[Donor_Org_Retiree_Ratio_Value] INT,
				[Donor_Org_Split_Ratio_Value] INT,
				[Donor_Org_Matching_Ratio_Value] INT,
				[Donor_Org_Pref_Cont_Meth_Val] INT
				)
			IF OBJECT_ID(''dbo._Donor_Dim_3'',''U'') IS NOT NULL
			DROP TABLE dbo._Donor_Dim_3
			CREATE TABLE dbo._Donor_Dim_3 (
				[Donor_Key] NVARCHAR(100),
				[Donor_Individual_Infor_Envel] nvarchar(300),
				[Donor_Couple_Infor_Envel] nvarchar(300),
				[Donor_Individual_Form_Envel] nvarchar(300),
				[Donor_Couple_Form_Envel] nvarchar(300)
				)
				
			-- Stage Index
			IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id(''dbo.Ext_Envelope_Names_And_Salutations'') AND NAME =''Plus_NameType'') --> HARD CODED <--
			DROP INDEX Plus_NameType ON dbo.Ext_Envelope_Names_And_Salutations;  --> HARD CODED <--
			CREATE INDEX Plus_NameType ON dbo.Ext_Envelope_Names_And_Salutations(Plus_NameType); --> HARD CODED <--
			IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id(''dbo.Ext_Envelope_Names_And_Salutations'') AND NAME =''StateCode'') --> HARD CODED <--
			DROP INDEX StateCode ON dbo.Ext_Envelope_Names_And_Salutations;  --> HARD CODED <--
			CREATE INDEX StateCode ON dbo.Ext_Envelope_Names_And_Salutations(StateCode); --> HARD CODED <--
			UPDATE STATISTICS dbo.Ext_Envelope_Names_And_Salutations --> HARD CODED <--
			
			-- Create Tables
			IF OBJECT_ID(''dbo._Donor_Dim_41'',''U'') IS NOT NULL
			DROP TABLE dbo._Donor_Dim_41
			CREATE TABLE dbo._Donor_Dim_41 (
				Donor_Key NVARCHAR(100)
				, All_Personal_Connections NVARCHAR(4000)
				, Donor_Age INT
				)
			
			IF OBJECT_ID(''dbo._Donor_Dim_42'',''U'') IS NOT NULL
			DROP TABLE dbo._Donor_Dim_42
			CREATE TABLE dbo._Donor_Dim_42 (
				Donor_Key NVARCHAR(100)
				, Byu_Degrees NVARCHAR(4000)
				, ByuI_Degrees NVARCHAR(4000)
				)
				
			IF OBJECT_ID(''dbo._Donor_Dim_43'',''U'') IS NOT NULL
			DROP TABLE dbo._Donor_Dim_43
			CREATE TABLE dbo._Donor_Dim_43 (
				Donor_Key NVARCHAR(100)
				, ByuH_Degrees NVARCHAR(4000)
				, Ldsbc_Degrees NVARCHAR(4000)
				)
				
			-- Stage Index
			IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id(''dbo.Ext_Psa'') AND NAME =''IX_ContactId'') --> HARD CODED <--
			DROP INDEX IX_ContactId ON dbo.Ext_Psa;  --> HARD CODED <--                                                        
			CREATE NONCLUSTERED INDEX IX_ContactId 
			ON Ext_Psa(ContactId ASC)
				INCLUDE (
					Psa_Code
				);                                         
			UPDATE STATISTICS dbo.Ext_Psa --> HARD CODED <--
			IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id(''dbo.Ext_International_Experience'') AND NAME =''New_InternationalExperiencesAId'') --> HARD CODED <--
			DROP INDEX New_InternationalExperiencesAId ON dbo.Ext_International_Experience ;  --> HARD CODED <--                                                        
			CREATE NONCLUSTERED INDEX New_InternationalExperiencesAId 
			ON Ext_International_Experience (New_InternationalExperiencesAId ASC);
			IF EXISTS(SELECT * FROM sys.indexes WHERE object_id = object_id(''dbo.Ext_International_Experience'') AND NAME =''IX_New_InternationalExperiencesAId'') --> HARD CODED <--
			DROP INDEX IX_New_InternationalExperiencesAId ON dbo.Ext_International_Experience ;  --> HARD CODED <--                                                    
			CREATE NONCLUSTERED INDEX IX_New_InternationalExperiencesAId 
			ON Ext_International_Experience (New_InternationalExperiencesAId ASC)
				INCLUDE (
					New_Experience
					, Plus_LdsPosition
					, New_EndDate
					, Plus_Emeritus
				);
			UPDATE STATISTICS dbo.Ext_International_Experience  --> HARD CODED <-- 
			
			-- Create Table
			IF OBJECT_ID(''dbo._Donor_Dim_6'',''U'') IS NOT NULL
			DROP TABLE dbo._Donor_Dim_6
			CREATE TABLE dbo._Donor_Dim_6 (
				Donor_Key NVARCHAR(100)
				, All_Employment NVARCHAR(4000) 
				, Current_Employment NVARCHAR(4000)
				, Former_Employment NVARCHAR(4000)
				)
			'
		, 'DECLARE @Total_Loop_Num INT
			DECLARE @RowNum_Beg INT
			DECLARE @RowNum_End INT
				SELECT @Total_Loop_Num = (
					SELECT (Max_RowNum / 10000) + 1 AS Total_Loop_Num
						FROM
							(SELECT MAX(RowNum) AS Max_RowNum
								FROM _Numbered_ContactIds) A
					)
			DECLARE @LOOP_NUM INT
			SET @LOOP_NUM = 1
				WHILE  @LOOP_NUM <= @Total_Loop_Num 
				BEGIN
					SELECT @RowNum_Beg = (SELECT (@LOOP_NUM * 10000) - 9999)
					SELECT @RowNum_End = (SELECT (@LOOP_NUM * 10000))
					BEGIN TRY
						DECLARE @TABLE_CNT_20 NVARCHAR(100)                                                                                     
						EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 1'', @Alpha_Step_Number = ''122P'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Begin'', @Alpha_Result = 1;
							INSERT INTO dbo._Donor_Dim_1 (
								Donor_Key
								, Donor_Personal_Suffix   
								, Donor_Major_Gift_Propen
								, Donor_Annual_Gift
								, Donor_Planned_Gift
								, Donor_Gift_Capacity_Enp
								, Donor_Gift_Capacity_En
								, Donor_Philan_Cap_Rating
								, Donor_Est_Household_Income
								, Donor_Est_Home_Market_Val   
								, Donor_Personal_Suffix_Value
								, Donor_Major_Gift_Propen_Value
								, Donor_Annual_Gift_Value
								, Donor_Planned_Gift_Value
								, Donor_Gift_Capacity_Enp_Value
								, Donor_Gift_Capacity_En_Value
								, Donor_Philan_Cap_Rating_Value
								, Donor_Est_Household_Income_Value
								, Donor_Est_Home_Market_Val_Value   
								)
								SELECT DISTINCT NUM.ContactId AS Donor_Key
									, F.Column_Label AS Donor_Personal_Suffix
									, G.Column_Label AS Donor_Major_Gift_Propen
									, H.Column_Label AS Donor_Annual_Gift
									, I.Column_Label AS Donor_Planned_Gift
									, J.Column_Label AS Donor_Gift_Capacity_Enp
									, K.Column_Label AS Donor_Gift_Capacity_En
									, L.Column_Label AS Donor_Philan_Cap_Rating
									, M.Column_Label AS Donor_Est_Household_Income
									, N.Column_Label AS Donor_Est_Home_Market_Val
									, F.Column_Value AS Donor_Personal_Suffix_Value 
									, G.Column_Value AS Donor_Major_Gift_Propen_Value 
									, H.Column_Value AS Donor_Annual_Gift_Value 
									, I.Column_Value AS Donor_Planned_Gift_Value
									, J.Column_Value AS Donor_Gift_Capacity_Enp_Value
									, K.Column_Value AS Donor_Gift_Capacity_En_Value
									, L.Column_Value AS Donor_Philan_Cap_Rating_Value
									, M.Column_Value AS Donor_Est_Household_Income_Value
									, N.Column_Value AS Donor_Est_Home_Market_Val_Value
									FROM LDSPhilanthropiesDW.dbo._Donor_Pre_Dim A
										INNER JOIN LDSPhilanthropiesDW.dbo._Numbered_ContactIds NUM ON A.Donor_Key = NUM.ContactId 
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Personal_Suffix_ F ON A.New_PersonalSuffix = F.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Major_Gift_ G ON A.New_MajorGiftPropensity1 = G.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Annual_Gift_ H ON A.Plus_AnnualGift1 = H.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Planned_Gift_ I ON A.Plus_PlannedGift = I.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Gift_Cap_Enp_ J ON A.Plus_GiftCapacityEnp = J.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Gift_Cap_En_ K ON A.Plus_GiftCapacityEn = K.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Phil_Cap_Rate_ L ON A.Plus_PhilanthropicCapacityRatingPcr = L.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Est_House_Income_ M ON A.Plus_EstimatedHouseHoldIncome = M.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Est_House_Value_ N ON A.Plus_EstimatedHomemarketValue = N.Column_Value
									WHERE 1 = 1
										AND NUM.RowNum BETWEEN @RowNum_Beg AND @RowNum_End                                              
						SELECT @TABLE_CNT_20 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._Donor_Dim_1);
						EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 1'', @Alpha_Step_Number = ''122P'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - End'', @Alpha_Count = @TABLE_CNT_20, @Alpha_Result = 1;
					END TRY
					BEGIN CATCH    
						DECLARE @ERROR_NUMBER INT
						DECLARE @ERROR_SEVERITY INT
						DECLARE @ERROR_STATE INT
						DECLARE @ERROR_PROCEDURE NVARCHAR(500)
						DECLARE @ERROR_LINE INT
						DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
						SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
						SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
						SELECT @ERROR_STATE = (SELECT ERROR_STATE())
						SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
						SELECT @ERROR_LINE = (SELECT ERROR_LINE())
						SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
						EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Donor_Dim_1'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Error'', @Alpha_Result = 0
						, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
					END CATCH
				SET @LOOP_NUM = @LOOP_NUM + 1   
				END
			SET @LOOP_NUM = 0
			'
		, 'DECLARE @Total_Loop_Num INT
			DECLARE @RowNum_Beg INT
			DECLARE @RowNum_End INT
				SELECT @Total_Loop_Num = (
					SELECT (Max_RowNum / 10000) + 1 AS Total_Loop_Num
						FROM
							(SELECT MAX(RowNum) AS Max_RowNum
								FROM _Numbered_ContactIds) A
					)
			DECLARE @LOOP_NUM INT
			SET @LOOP_NUM = 1
				WHILE  @LOOP_NUM <= @Total_Loop_Num 
				BEGIN
					SELECT @RowNum_Beg = (SELECT (@LOOP_NUM * 10000) - 9999)
					SELECT @RowNum_End = (SELECT (@LOOP_NUM * 10000))
					BEGIN TRY
						DECLARE @TABLE_CNT_20 NVARCHAR(100)                                                                                     
						EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 2'', @Alpha_Step_Number = ''122Q'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Begin'', @Alpha_Result = 1;
							INSERT INTO dbo._Donor_Dim_2 (
								Donor_Key
								, Donor_Title
								, Donor_Professional_Suffix
								, Donor_Block_Clusters
								, Donor_Country
								, Donor_Org_Class_Code
								, Donor_Org_Retiree_Ratio
								, Donor_Org_Split_Ratio
								, Donor_Org_Matching_Ratio
								, Donor_Org_Pref_Cont_Meth
								, Donor_Block_Clusters_Value
								, Donor_Org_Class_Code_Value
								, Donor_Org_Retiree_Ratio_Value
								, Donor_Org_Split_Ratio_Value
								, Donor_Org_Matching_Ratio_Value
								, Donor_Org_Pref_Cont_Meth_Val
								)
								SELECT DISTINCT NUM.ContactId  AS Donor_Key
									, U.new_title AS Donor_Title
									, V.new_professionalsuffix As Donor_Professional_Suffix
									, O.Column_Label AS Donor_Block_Clusters
									, W.new_name AS Donor_Country
									, P.Column_Label AS Donor_Org_Class_Code
									, Q.Column_Label AS Donor_Org_Retiree_Ratio
									, R.Column_Label AS Donor_Org_Split_Ratio
									, S.Column_Label AS Donor_Org_Matching_Ratio
									, T.Column_Label AS Donor_Org_Pref_Cont_Meth
									, O.Column_Value AS Donor_Block_Clusters_Value
									, P.Column_Value AS Donor_Org_Class_Code_Value
									, Q.Column_Value AS Donor_Org_Retiree_Ratio_Value
									, R.Column_Value AS Donor_Org_Split_Ratio_Value
									, S.Column_Value AS Donor_Org_Matching_Ratio_Value
									, T.Column_Value AS Donor_Org_Pref_Cont_Meth_Val
									FROM LDSPhilanthropiesDW.dbo._Donor_Pre_Dim A
										INNER JOIN LDSPhilanthropiesDW.dbo._Numbered_ContactIds NUM ON A.Donor_Key = NUM.ContactId 
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Blockclusters_ O ON A.Plus_BlockClusters = O.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Act_Class_Code_ P ON A.AccountClassificationCode = P.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Retiree_Ratio_ Q ON A.new_RetireeRatio = Q.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Split_Ratio_ R ON A.new_SplitRatio = R.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Matching_Ratio_ S ON A.new_MatchingRatio = S.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo._Donor_Pref_Contact_Method_ T ON A.PreferredContactMethodCode = T.Column_Value
										LEFT JOIN LDSPhilanthropiesDW.dbo.Ext_Title U ON A.New_Title = U.New_TitleId
										LEFT JOIN LDSPhilanthropiesDW.dbo.Ext_Professional_Suffix V ON A.New_ProfessionalSuffix = V.New_ProfessionalSuffixId
										LEFT JOIN LDSPhilanthropiesDW.dbo.Ext_Country W ON A.New_HomeCountry = W.New_CountryId
									WHERE 1 = 1
										AND NUM.RowNum BETWEEN @RowNum_Beg AND @RowNum_End                                              
						SELECT @TABLE_CNT_20 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._Donor_Dim_2);
						EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 2'', @Alpha_Step_Number = ''122Q'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - End'', @Alpha_Count = @TABLE_CNT_20, @Alpha_Result = 1;
					END TRY
					BEGIN CATCH    
						DECLARE @ERROR_NUMBER INT
						DECLARE @ERROR_SEVERITY INT
						DECLARE @ERROR_STATE INT
						DECLARE @ERROR_PROCEDURE NVARCHAR(500)
						DECLARE @ERROR_LINE INT
						DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
						SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
						SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
						SELECT @ERROR_STATE = (SELECT ERROR_STATE())
						SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
						SELECT @ERROR_LINE = (SELECT ERROR_LINE())
						SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
						EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Donor_Dim_2'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Error'', @Alpha_Result = 0
						, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
					END CATCH
				SET @LOOP_NUM = @LOOP_NUM + 1   
				END
			SET @LOOP_NUM = 0
			'
		, 'DECLARE @Total_Loop_Num INT
			DECLARE @RowNum_Beg INT
			DECLARE @RowNum_End INT
				SELECT @Total_Loop_Num = (
					SELECT (Max_RowNum / 10000) + 1 AS Total_Loop_Num
						FROM
							(SELECT MAX(RowNum) AS Max_RowNum
								FROM _Numbered_ContactIds) A
					)
			DECLARE @LOOP_NUM INT
			SET @LOOP_NUM = 1
				WHILE  @LOOP_NUM <= @Total_Loop_Num 
				BEGIN
					SELECT @RowNum_Beg = (SELECT (@LOOP_NUM * 10000) - 9999)
					SELECT @RowNum_End = (SELECT (@LOOP_NUM * 10000))
						BEGIN TRY
							DECLARE @TABLE_CNT_20 NVARCHAR(100)                                                                                     
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 3'', @Alpha_Step_Number = ''122R'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Begin'', @Alpha_Result = 1;
								INSERT INTO dbo._Donor_Dim_3 (
									Donor_Key
									, Donor_Individual_Infor_Envel
									, Donor_Couple_Infor_Envel
									, Donor_Individual_Form_Envel
									, Donor_Couple_Form_Envel
									)
									SELECT DISTINCT NUM.ContactId AS Donor_Key
										, Y.Informal_Individual AS Donor_Individual_Infor_Envel
										, Y.Informal_Couple AS Donor_Couple_Infor_Envel
										, Y.Formal_Individual AS Donor_Individual_Form_Envel
										, Y.Formal_Couple AS Donor_Couple_Form_Envel
										FROM LDSPhilanthropiesDW.dbo._Donor_Pre_Dim A
											INNER JOIN LDSPhilanthropiesDW.dbo._Numbered_ContactIds NUM ON A.Donor_Key = NUM.ContactId   
											LEFT JOIN
												(SELECT CONVERT(NVARCHAR(100), ContactId) AS ContactId
													, MAX(Informal_Individual) AS Informal_Individual
													, MAX(Informal_Couple) AS Informal_Couple
													, MAX(Formal_Individual) AS Formal_Individual
													, MAX(Formal_Couple) AS Formal_Couple
													FROM
														(SELECT DISTINCT Y1.Plus_EnvelopeSalutationConstituent AS ContactId
															, CASE WHEN Y1.Plus_Etiquette = 100000000 AND Y1.Plus_Household = 100000000  THEN Y1.Plus_SalutationEnvelopeName ELSE NULL END AS Informal_Individual 
															, CASE WHEN Y1.Plus_Etiquette = 100000000 AND Y1.Plus_Household = 100000001  THEN Y1.Plus_SalutationEnvelopeName ELSE NULL END AS Informal_Couple
															, CASE WHEN Y1.Plus_Etiquette = 100000001 AND Y1.Plus_Household = 100000000  THEN Y1.Plus_SalutationEnvelopeName ELSE NULL END AS Formal_Individual
															, CASE WHEN Y1.Plus_Etiquette = 100000001 AND Y1.Plus_Household = 100000001  THEN Y1.Plus_SalutationEnvelopeName ELSE NULL END AS Formal_Couple
															FROM dbo.Ext_Envelope_Names_And_Salutations Y1
																INNER JOIN dbo._Donor_Etiquette_ Y2 ON Y1.Plus_Etiquette = Y2.Column_Value
															WHERE 1 = 1
																AND Y1.StateCode = 0
																AND Y1.Plus_NameType = 100000000
														) A 
													GROUP BY ContactId
												) Y ON A.Donor_Key = Y.ContactId
											WHERE 1 = 1
												AND NUM.RowNum BETWEEN @RowNum_Beg AND @RowNum_End                                              
							SELECT @TABLE_CNT_20 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._Donor_Dim_3);
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 3'', @Alpha_Step_Number = ''122R'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - End'', @Alpha_Count = @TABLE_CNT_20, @Alpha_Result = 1;
						END TRY
						BEGIN CATCH    
							DECLARE @ERROR_NUMBER INT
							DECLARE @ERROR_SEVERITY INT
							DECLARE @ERROR_STATE INT
							DECLARE @ERROR_PROCEDURE NVARCHAR(500)
							DECLARE @ERROR_LINE INT
							DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
							SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
							SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
							SELECT @ERROR_STATE = (SELECT ERROR_STATE())
							SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
							SELECT @ERROR_LINE = (SELECT ERROR_LINE())
							SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Donor_Dim_3'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Error'', @Alpha_Result = 0
							, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
						END CATCH
					SET @LOOP_NUM = @LOOP_NUM + 1   
				END
			SET @LOOP_NUM = 0
			'
		, 'DECLARE @Total_Loop_Num INT
			DECLARE @RowNum_Beg INT
			DECLARE @RowNum_End INT
				SELECT @Total_Loop_Num = (
					SELECT (Max_RowNum / 100000) + 1 AS Total_Loop_Num
						FROM
							(SELECT MAX(RowNum) AS Max_RowNum
								FROM _Numbered_ContactIds) A
					)
			DECLARE @LOOP_NUM INT
			SET @LOOP_NUM = 1
				WHILE  @LOOP_NUM <= @Total_Loop_Num 
				BEGIN
					SELECT @RowNum_Beg = (SELECT (@LOOP_NUM * 100000) - 99999)
					SELECT @RowNum_End = (SELECT (@LOOP_NUM * 100000))
						BEGIN TRY
							-- _Donor_Dim_41
							DECLARE @TABLE_CNT_201 NVARCHAR(100)                                                                                     
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 41'', @Alpha_Step_Number = ''122S'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Begin'', @Alpha_Result = 1;
								INSERT INTO dbo._Donor_Dim_41 (
									Donor_Key
									, All_Personal_Connections
									, Donor_Age
									)
									SELECT DISTINCT NUM.ContactId AS Donor_Key
										, CONVERT(NVARCHAR(4000),Z.All_Personal_Connections) AS All_Personal_Connections
										, AGE.Donor_Age
										FROM LDSPhilanthropiesDW.dbo._Numbered_ContactIds NUM  
											LEFT JOIN 
												(SELECT ContactId 
													, STUFF(( SELECT  '' | '' + All_Personal_Connections 
																	FROM 
																		(SELECT DISTINCT ContactId
																			, Relationship + '': ('' + COALESCE(RTRIM(CONVERT(NVARCHAR(50),Relationship_LdspId)),'' '') + '') '' + Relationship_Name AS All_Personal_Connections
																			FROM _Connection_Dim 
																		) A
																	WHERE B.ContactId = A.ContactId FOR XML PATH('''')),1 ,3, ''''
															)  All_Personal_Connections
													FROM 
														(SELECT DISTINCT ContactId
															FROM _Connection_Dim)  B
													WHERE 1 = 1
														AND ContactId IS NOT NULL
													GROUP BY ContactId
												) Z ON NUM.ContactId = Z.ContactId
											LEFT JOIN
												(SELECT Donor_Key AS ContactId
													, CASE WHEN DATEADD(YEAR, DATEDIFF (YEAR, Birthdate, GETDATE()), Birthdate) > GETDATE()
														THEN DATEDIFF(YEAR, Birthdate, GETDATE()) - 1
														ELSE DATEDIFF(YEAR, Birthdate, GETDATE()) END AS Donor_Age
													FROM
														(SELECT Donor_Key
															, CONVERT(NVARCHAR(20),CAST(New_Birthdate AS DATETIME),110) AS Birthdate
															FROM dbo._Donor_Pre_Dim 
															WHERE 1 = 1
																AND SUBSTRING(New_Birthdate,4,2) <> ''00''
																AND SUBSTRING(New_Birthdate,1,2) <> ''00''
																AND SUBSTRING(New_Birthdate,4,2) <> ''##''
																AND SUBSTRING(New_Birthdate,1,2) <> ''##''
														) A
												) AGE ON NUM.ContactId = AGE.ContactId
										WHERE 1 = 1
											AND NUM.RowNum BETWEEN @RowNum_Beg AND @RowNum_End                                              
							SELECT @TABLE_CNT_201 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._Donor_Dim_41);
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 41'', @Alpha_Step_Number = ''122S'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - End'', @Alpha_Count = @TABLE_CNT_201, @Alpha_Result = 1;
							-- _Donor_Dim_42
							DECLARE @TABLE_CNT_202 NVARCHAR(100)                                                                                     
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 42'', @Alpha_Step_Number = ''122S'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Begin'', @Alpha_Result = 1;
								INSERT INTO dbo._Donor_Dim_42 (
									Donor_Key
									, Byu_Degrees
									, ByuI_Degrees
									)
									SELECT DISTINCT NUM.ContactId AS Donor_Key
										, BYU.Byu_Degrees
										, BYUI.ByuI_Degrees
										FROM LDSPhilanthropiesDW.dbo._Numbered_ContactIds NUM  
											LEFT JOIN
												(SELECT DISTINCT ContactId
													, CONVERT(NVARCHAR(4000),Z.BYU_Degrees) AS BYU_Degrees
													FROM  
														(SELECT ContactId 
															, STUFF(( SELECT  '' \\ '' + BYU_Degrees 
																	FROM 
																		(SELECT DISTINCT ContactId
																			, COALESCE(New_University,'' '') + '' '' + COALESCE(Plus_AlumniStatus,'' '') + '' | '' + RTRIM(COALESCE(CONVERT(NVARCHAR(50),Plus_ActualGraduationDate,1),'' '')) + '' | '' + COALESCE(New_DegreeCode,'' '') + '' | '' + COALESCE(Program,'' '') AS BYU_Degrees
																			FROM _Alumni_Dim
																			WHERE 1 = 1
																				AND New_University = ''BYU''
																		) A
																	WHERE B.ContactId = A.ContactId FOR XML PATH('''')),1 ,4, ''''
																	)  BYU_Degrees
															FROM 
																(SELECT DISTINCT ContactId
																	FROM _Alumni_Dim)  B
															WHERE 1 = 1
																AND ContactId IS NOT NULL
															GROUP BY ContactId
														) Z 
												) BYU ON NUM.ContactId = BYU.ContactId  
											LEFT JOIN
												(SELECT DISTINCT ContactId
													, CONVERT(NVARCHAR(4000),Z.BYU_Degrees) AS BYUI_Degrees
													FROM  
														(SELECT ContactId 
															, STUFF(( SELECT  '' \\ '' + BYU_Degrees 
																	FROM 
																		(SELECT DISTINCT ContactId
																			, COALESCE(New_University,'' '') + '' '' + COALESCE(Plus_AlumniStatus,'' '') + '' | '' + RTRIM(COALESCE(CONVERT(NVARCHAR(50),Plus_ActualGraduationDate,1),'' '')) + '' | '' + COALESCE(New_DegreeCode,'' '') + '' | '' + COALESCE(Program,'' '') AS BYU_Degrees
																			FROM _Alumni_Dim
																			WHERE 1 = 1
																				AND New_University = ''BYUI''
																		) A
																	WHERE B.ContactId = A.ContactId FOR XML PATH('''')),1 ,4, ''''
																	)  BYU_Degrees
															FROM 
																(SELECT DISTINCT ContactId
																	FROM _Alumni_Dim)  B
															WHERE 1 = 1
																AND ContactId IS NOT NULL
															GROUP BY ContactId
														) Z
												) BYUI ON NUM.ContactId = BYUI.ContactId  
										WHERE 1 = 1
											AND NUM.RowNum BETWEEN @RowNum_Beg AND @RowNum_End                                              
							SELECT @TABLE_CNT_202 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._Donor_Dim_42);
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 42'', @Alpha_Step_Number = ''122S'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - End'', @Alpha_Count = @TABLE_CNT_202, @Alpha_Result = 1;
							-- _Donor_Dim_43
							DECLARE @TABLE_CNT_203 NVARCHAR(100)                                                                                     
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 43'', @Alpha_Step_Number = ''122S'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Begin'', @Alpha_Result = 1;
								INSERT INTO dbo._Donor_Dim_43 (
									Donor_Key
									, ByuH_Degrees
									, Ldsbc_Degrees 
									)
									SELECT DISTINCT NUM.ContactId AS Donor_Key
										, BYUH.ByuH_Degrees
										, LDSBC.Ldsbc_Degrees
										FROM LDSPhilanthropiesDW.dbo._Numbered_ContactIds NUM  
											LEFT JOIN  
												(SELECT DISTINCT ContactId
													, CONVERT(NVARCHAR(4000),Z.BYU_Degrees) AS BYUH_Degrees
													FROM  
														(SELECT ContactId 
															, STUFF(( SELECT  '' \\ '' + BYU_Degrees 
																	FROM 
																		(SELECT DISTINCT ContactId
																			, COALESCE(New_University,'' '') + '' '' + COALESCE(Plus_AlumniStatus,'' '') + '' | '' + RTRIM(COALESCE(CONVERT(NVARCHAR(50),Plus_ActualGraduationDate,1),'' '')) + '' | '' + COALESCE(New_DegreeCode,'' '') + '' | '' + COALESCE(Program,'' '') AS BYU_Degrees
																			FROM _Alumni_Dim
																			WHERE 1 = 1
																				AND New_University = ''BYUH''
																		) A
																	WHERE B.ContactId = A.ContactId FOR XML PATH('''')),1 ,4, ''''
																	)  BYU_Degrees
															FROM 
																(SELECT DISTINCT ContactId
																	FROM _Alumni_Dim)  B
															WHERE 1 = 1
																AND ContactId IS NOT NULL
															GROUP BY ContactId
														) Z
												) BYUH ON NUM.ContactId = BYUH.ContactId  
											LEFT JOIN
												(SELECT DISTINCT ContactId
													, CONVERT(NVARCHAR(4000),Z.BYU_Degrees) AS LDSBC_Degrees
														FROM  
															(SELECT ContactId 
																, STUFF(( SELECT  '' \\ '' + BYU_Degrees 
																		FROM 
																			(SELECT DISTINCT ContactId
																				, COALESCE(New_University,'' '') + '' '' + COALESCE(Plus_AlumniStatus,'' '') + '' | '' + RTRIM(COALESCE(CONVERT(NVARCHAR(50),Plus_ActualGraduationDate,1),'' '')) + '' | '' + COALESCE(New_DegreeCode,'' '') + '' | '' + COALESCE(Program,'' '') AS BYU_Degrees
																				FROM _Alumni_Dim
																				WHERE 1 = 1
																					AND New_University = ''LDS BUSINESS COLLEGE''
																			) A
																		WHERE B.ContactId = A.ContactId FOR XML PATH('''')),1 ,4, ''''
																		)  BYU_Degrees
																FROM 
																	(SELECT DISTINCT ContactId
																		FROM _Alumni_Dim)  B
																		WHERE 1 = 1
																			AND ContactId IS NOT NULL
																GROUP BY ContactId
															) Z
												) LDSBC ON NUM.ContactId = LDSBC.ContactId
										WHERE 1 = 1
											AND NUM.RowNum BETWEEN @RowNum_Beg AND @RowNum_End                                              
							SELECT @TABLE_CNT_203 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._Donor_Dim_43);
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 43'', @Alpha_Step_Number = ''122S'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - End'', @Alpha_Count = @TABLE_CNT_203, @Alpha_Result = 1;
						END TRY
						BEGIN CATCH    
							DECLARE @ERROR_NUMBER INT
							DECLARE @ERROR_SEVERITY INT
							DECLARE @ERROR_STATE INT
							DECLARE @ERROR_PROCEDURE NVARCHAR(500)
							DECLARE @ERROR_LINE INT
							DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
							SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
							SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
							SELECT @ERROR_STATE = (SELECT ERROR_STATE())
							SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
							SELECT @ERROR_LINE = (SELECT ERROR_LINE())
							SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Donor_Dim_4'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Error'', @Alpha_Result = 0
							, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
						END CATCH
					SET @LOOP_NUM = @LOOP_NUM + 1   
				END
			SET @LOOP_NUM = 0
			'
		, 'BEGIN TRY
				DECLARE @TABLE_CNT_20 NVARCHAR(100)             
				DECLARE @TABLE_CNT_21 NVARCHAR(100)
				DECLARE @TABLE_CNT_22 NVARCHAR(100)
				DECLARE @TABLE_CNT_23 NVARCHAR(100)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''GA Tables'', @Alpha_Step_Number = ''122T'', @Alpha_Step_Name = ''GA Tables - Begin'', @Alpha_Result = 1;
					IF OBJECT_ID(''dbo._General_Authority_'',''U'') IS NOT NULL
					DROP TABLE dbo._General_Authority_
					CREATE TABLE dbo._General_Authority_ (
						Donor_Key  NVARCHAR(100) 
						, General_Authority NVARCHAR(1)
						) 
					INSERT INTO dbo._General_Authority_ (
						Donor_Key
						, General_Authority
						)
						SELECT CONVERT(NVARCHAR(100),Donor_Key) AS Donor_Key
							, MAX(General_Authority) AS General_Authority
							FROM
								(SELECT DISTINCT COALESCE(A.ContactId, B.New_InternationalExperiencesAId) AS Donor_Key
									, CASE WHEN (A.Psa_Code IN (''1AC03'',''1AC04'') 
													OR (UPPER(B.New_Experience) = ''LDS EXPERIENCE''
														AND UPPER(B.Plus_LdsPosition) IN (''GENERAL AUTHORITY'',''GENERAL OFFICER'',''AREA SEVENTY'')
														AND(B.New_EndDate IS NULL OR B.New_EndDate > GETDATE())
														AND B.Plus_Emeritus = ''F''
														)
												) THEN ''Y'' ELSE ''N'' END AS General_Authority
									FROM Ext_Psa A
									FULL OUTER JOIN Ext_International_Experience B ON A.ContactId = B.New_InternationalExperiencesAId) A
									GROUP BY CONVERT(NVARCHAR(100),Donor_Key)
				IF OBJECT_ID(''dbo._Emeritus_General_Authority_'',''U'') IS NOT NULL
				DROP TABLE dbo._Emeritus_General_Authority_
					CREATE TABLE dbo._Emeritus_General_Authority_ (
						Donor_Key  NVARCHAR(100) 
						, Emeritus_General_Authority NVARCHAR(1)
						) 
					INSERT INTO dbo._Emeritus_General_Authority_ (
						Donor_Key
						, Emeritus_General_Authority
						)
						SELECT CONVERT(NVARCHAR(100),Donor_Key) AS Donor_Key
							, MAX(Emeritus_General_Authority) AS Emeritus_General_Authority
							FROM
								(SELECT DISTINCT COALESCE(A.ContactId, B.New_InternationalExperiencesAId) AS Donor_Key
									, CASE WHEN (A.Psa_Code = ''1AC12'' 
													OR (UPPER(B.New_Experience) = ''LDS EXPERIENCE''
															AND UPPER(B.Plus_LdsPosition) IN (''GENERAL AUTHORITY'',''GENERAL OFFICER'',''AREA SEVENTY'')
															AND(B.New_EndDate IS NULL OR B.New_EndDate > GETDATE())
															AND B.Plus_Emeritus = ''Y''
														)
												) THEN ''Y'' ELSE ''N'' END AS Emeritus_General_Authority
									FROM Ext_Psa A
									FULL OUTER JOIN Ext_International_Experience B ON A.ContactId = B.New_InternationalExperiencesAId) A
									GROUP BY CONVERT(NVARCHAR(100),Donor_Key)
				IF OBJECT_ID(''dbo._Mission_President_'',''U'') IS NOT NULL
				DROP TABLE dbo._Mission_President_
					CREATE TABLE dbo._Mission_President_ (
						Donor_Key  NVARCHAR(100) 
						, Mission_President NVARCHAR(1)
						) 
					INSERT INTO dbo._Mission_President_ (
						Donor_Key
						, Mission_President
						)
						SELECT CONVERT(NVARCHAR(100),Donor_Key) AS Donor_Key
							, MAX(Mission_President) AS Mission_President
							FROM
								(SELECT DISTINCT COALESCE(A.ContactId, B.New_InternationalExperiencesAId) AS Donor_Key
									, CASE WHEN (A.Psa_Code = ''1AC06'' 
													OR (UPPER(B.New_Experience) = ''LDS EXPERIENCE''
														AND UPPER(B.Plus_LdsPosition) IN (''MISSION PRESIDENT'')
														AND(B.New_EndDate IS NULL OR B.New_EndDate > GETDATE())
													)
												) THEN ''Y'' ELSE ''N'' END AS Mission_President
									FROM Ext_Psa A
									FULL OUTER JOIN Ext_International_Experience B ON A.ContactId = B.New_InternationalExperiencesAId) A
									GROUP BY CONVERT(NVARCHAR(100),Donor_Key)
				IF OBJECT_ID(''dbo._Temple_President_'',''U'') IS NOT NULL
				DROP TABLE dbo._Temple_President_
					CREATE TABLE dbo._Temple_President_ (
						Donor_Key  NVARCHAR(100) 
						, Temple_President NVARCHAR(1)
						) 
					INSERT INTO dbo._Temple_President_ (
						Donor_Key
						, Temple_President
						)
						SELECT CONVERT(NVARCHAR(100),Donor_Key) AS Donor_Key
							, MAX(Temple_President) AS Temple_President
							FROM 
								(SELECT DISTINCT COALESCE(A.ContactId, B.New_InternationalExperiencesAId) AS Donor_Key
									, CASE WHEN (A.Psa_Code = ''1AC16'' 
													OR (UPPER(B.New_Experience) = ''LDS EXPERIENCE''
															AND UPPER(B.Plus_LdsPosition) IN (''TEMPLE PRESIDENT'')
															AND(B.New_EndDate IS NULL OR B.New_EndDate > GETDATE())
														)
												) THEN ''Y'' ELSE ''N'' END AS Temple_President
									FROM Ext_Psa A
									FULL OUTER JOIN Ext_International_Experience B ON A.ContactId = B.New_InternationalExperiencesAId) A
									GROUP BY Donor_Key
				SELECT @TABLE_CNT_20 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._General_Authority_);
				SELECT @TABLE_CNT_21 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._Emeritus_General_Authority_);
				SELECT @TABLE_CNT_22 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._Mission_President_);
				SELECT @TABLE_CNT_23 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._Temple_President_);
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''GA Tables'', @Alpha_Step_Number = ''122T'', @Alpha_Step_Name = ''GA Table'', @Alpha_Count = @TABLE_CNT_20, @Alpha_Result = 1;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''GA Tables'', @Alpha_Step_Number = ''122T'', @Alpha_Step_Name = ''EGA Table'', @Alpha_Count = @TABLE_CNT_21, @Alpha_Result = 1;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''GA Tables'', @Alpha_Step_Number = ''122T'', @Alpha_Step_Name = ''MP Table'', @Alpha_Count = @TABLE_CNT_22, @Alpha_Result = 1;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''GA Tables'', @Alpha_Step_Number = ''122T'', @Alpha_Step_Name = ''TP Table'', @Alpha_Count = @TABLE_CNT_23, @Alpha_Result = 1;
				MERGE _Donor_Dim AS T
					USING dbo._General_Authority_ AS S
					ON (T.Donor_Key = S.Donor_Key)
					WHEN MATCHED 
					THEN UPDATE SET 
					T.General_Authority = S.General_Authority
				;
				MERGE _Donor_Dim AS T
					USING dbo._Emeritus_General_Authority_ AS S
					ON (T.Donor_Key = S.Donor_Key)
					WHEN MATCHED 
					THEN UPDATE SET 
					T.Emeritus_General_Authority = S.Emeritus_General_Authority
				;
				MERGE _Donor_Dim AS T
					USING dbo._Mission_President_ AS S
					ON (T.Donor_Key = S.Donor_Key)
					WHEN MATCHED 
					THEN UPDATE SET 
					T.Mission_President = S.Mission_President
				;
				MERGE _Donor_Dim AS T
					USING dbo._Temple_President_ AS S
					ON (T.Donor_Key = S.Donor_Key)
					WHEN MATCHED 
					THEN UPDATE SET 
					T.Temple_President = S.Temple_President
				;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''GA Tables'', @Alpha_Step_Number = ''122T'', @Alpha_Step_Name = ''GA Tables - End'', @Alpha_Result = 1;
			END TRY
			BEGIN CATCH    
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''GA Tables'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''GA Tables - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			'
		, 'DECLARE @Total_Loop_Num INT
			DECLARE @RowNum_Beg INT
			DECLARE @RowNum_End INT
				SELECT @Total_Loop_Num = (
					SELECT (Max_RowNum / 10000) + 1 AS Total_Loop_Num
						FROM
							(SELECT MAX(RowNum) AS Max_RowNum
								FROM _Numbered_ContactIds) A
					)
			DECLARE @LOOP_NUM INT
			SET @LOOP_NUM = 1
				WHILE  @LOOP_NUM <= @Total_Loop_Num 
				BEGIN
					SELECT @RowNum_Beg = (SELECT (@LOOP_NUM * 10000) - 9999)
					SELECT @RowNum_End = (SELECT (@LOOP_NUM * 10000))
						BEGIN TRY
							DECLARE @TABLE_CNT_20 NVARCHAR(100)                                                                                     
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 6'', @Alpha_Step_Number = ''122U'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Begin'', @Alpha_Result = 1;
								INSERT INTO dbo._Donor_Dim_6 (
									Donor_Key
									, All_Employment 
									, Current_Employment
									, Former_Employment
									)
									SELECT DISTINCT CONVERT(NVARCHAR(100),NUM.ContactId) AS Donor_Key
										, EA.All_Employment 
										, EC.Current_Employment
										, EF.Former_Employment
										FROM LDSPhilanthropiesDW.dbo._Numbered_ContactIds NUM  
											LEFT JOIN
												(SELECT ContactId 
													, STUFF(( SELECT  '' ; '' + All_Employment 
																FROM 
																	(SELECT DISTINCT ContactId
																		, ''('' + COALESCE(StatusCode,'' '') + '') '' + COALESCE(Organization_Name,Plus_AlternateOrganizationName,Institutional_Hierarchy,'' '') + '' | '' + RTRIM(COALESCE(New_Title,'' '')) + '' | '' + RTRIM(COALESCE(New_JobCode,'' '')) + '' | '' + COALESCE(CONVERT(NVARCHAR(50),New_DateStarted,1),'' '') AS All_Employment
																		FROM 
																			(SELECT *
																				FROM _All_Employment
																			) A                                                                                                               
																	) A
																WHERE B.ContactId = A.ContactId FOR XML PATH('''')),1 ,2, ''''
															)  All_Employment
													FROM 
														(SELECT *
															FROM _All_Employment
														)  B
													WHERE 1 = 1
														AND ContactId IS NOT NULL
													GROUP BY ContactId
												) EA ON NUM.ContactId = EA.ContactId
											LEFT JOIN
												(SELECT ContactId 
													, STUFF(( SELECT  '' ; '' + Current_Employment 
																FROM 
																	(SELECT DISTINCT ContactId
																		, ''('' + COALESCE(StatusCode,'' '') + '') '' + COALESCE(Organization_Name,Plus_AlternateOrganizationName,Institutional_Hierarchy,'' '') + '' | '' + RTRIM(COALESCE(New_Title,'' '')) + '' | '' + RTRIM(COALESCE(New_JobCode,'' '')) + '' | '' + COALESCE(CONVERT(NVARCHAR(50),New_DateStarted,1),'' '') AS Current_Employment
																		FROM 
																			(SELECT *
																				FROM _All_Employment
																				WHERE 1 = 1
																					AND StatusCode = ''C''
																			) A                                                                                                               
																	) A
																WHERE B.ContactId = A.ContactId FOR XML PATH('''')),1 ,2, ''''
															)  Current_Employment
													FROM 
														(SELECT *
															FROM _All_Employment
															WHERE 1 = 1
																AND StatusCode = ''C''
														)  B
													WHERE 1 = 1
														AND ContactId IS NOT NULL
													GROUP BY ContactId
												) EC ON NUM.ContactId = EC.ContactId
											LEFT JOIN
												(SELECT ContactId 
													, STUFF(( SELECT  '' ; '' + Former_Employment 
																FROM 
																	(SELECT DISTINCT ContactId
																		, ''('' + COALESCE(StatusCode,'' '') + '') '' + COALESCE(Organization_Name,Plus_AlternateOrganizationName,Institutional_Hierarchy,'' '') + '' | '' + RTRIM(COALESCE(New_Title,'' '')) + '' | '' + RTRIM(COALESCE(New_JobCode,'' '')) + '' | '' + COALESCE(CONVERT(NVARCHAR(50),New_DateStarted,1),'' '') AS Former_Employment
																		FROM 
																			(SELECT *
																				FROM _All_Employment
																				WHERE 1 = 1
																					AND StatusCode IN (''F'',''R'')
																			) A                                                                                                              
																	) A
																WHERE B.ContactId = A.ContactId FOR XML PATH('''')),1 ,2, ''''
															)  Former_Employment
													FROM 
														(SELECT *
															FROM _All_Employment
															WHERE 1 = 1
																AND StatusCode IN (''F'',''R'')
														)  B
													WHERE 1 = 1
														AND ContactId IS NOT NULL
													GROUP BY ContactId
												) EF ON NUM.ContactId = EF.ContactId                                                                                         
										WHERE 1 = 1
											AND NUM.RowNum BETWEEN @RowNum_Beg AND @RowNum_End                                              
							SELECT @TABLE_CNT_20 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM dbo._Donor_Dim_6);
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Dim 6'', @Alpha_Step_Number = ''122U'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - End'', @Alpha_Count = @TABLE_CNT_20, @Alpha_Result = 1;
						END TRY
						BEGIN CATCH    
							DECLARE @ERROR_NUMBER INT
							DECLARE @ERROR_SEVERITY INT
							DECLARE @ERROR_STATE INT
							DECLARE @ERROR_PROCEDURE NVARCHAR(500)
							DECLARE @ERROR_LINE INT
							DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
							SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
							SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
							SELECT @ERROR_STATE = (SELECT ERROR_STATE())
							SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
							SELECT @ERROR_LINE = (SELECT ERROR_LINE())
							SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
							EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Donor_Dim_6'', @Alpha_Step_Number = ''122X'', @Alpha_Step_Name = ''Loop Tables - Loop 1 - Error'', @Alpha_Result = 0
							, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
						END CATCH
					SET @LOOP_NUM = @LOOP_NUM + 1   
				END
			SET @LOOP_NUM = 0
			'
		, 'MERGE _Donor_Dim AS T
				USING dbo._Donor_Dim_1 AS S
				ON (T.Donor_Key = S.Donor_Key)
				WHEN MATCHED 
				THEN UPDATE SET 
				T.Donor_Personal_Suffix = S.Donor_Personal_Suffix  
				, T.Donor_Major_Gift_Propen = S.Donor_Major_Gift_Propen
				, T.Donor_Annual_Gift = S.Donor_Annual_Gift
				, T.Donor_Planned_Gift = S.Donor_Planned_Gift
				, T.Donor_Gift_Capacity_Enp = S.Donor_Gift_Capacity_Enp
				, T.Donor_Gift_Capacity_En = S.Donor_Gift_Capacity_En
				, T.Donor_Philan_Cap_Rating = S.Donor_Philan_Cap_Rating
				, T.Donor_Est_Household_Income = S.Donor_Est_Household_Income
				, T.Donor_Est_Home_Market_Val = S.Donor_Est_Home_Market_Val  
				, T.Donor_Personal_Suffix_Value = S.Donor_Personal_Suffix_Value
				, T.Donor_Major_Gift_Propen_Value = S.Donor_Major_Gift_Propen_Value
				, T.Donor_Annual_Gift_Value = S.Donor_Annual_Gift_Value
				, T.Donor_Planned_Gift_Value = S.Donor_Planned_Gift_Value
				, T.Donor_Gift_Capacity_Enp_Value = S.Donor_Gift_Capacity_Enp_Value
				, T.Donor_Gift_Capacity_En_Value = S.Donor_Gift_Capacity_En_Value
				, T.Donor_Philan_Cap_Rating_Value = S.Donor_Philan_Cap_Rating_Value
				, T.Donor_Est_Household_Income_Value = S.Donor_Est_Household_Income_Value
				, T.Donor_Est_Home_Market_Val_Value = S.Donor_Est_Home_Market_Val_Value;
			MERGE _Donor_Dim AS T
				USING dbo._Donor_Dim_2 AS S
				ON (T.Donor_Key = S.Donor_Key)
				WHEN MATCHED 
				THEN UPDATE SET 
				T.Donor_Title = S.Donor_Title
				, T.Donor_Professional_Suffix = S.Donor_Professional_Suffix
				, T.Donor_Block_Clusters = S.Donor_Block_Clusters
				, T.Donor_Country = S.Donor_Country
				, T.Donor_Org_Class_Code = S.Donor_Org_Class_Code
				, T.Donor_Org_Retiree_Ratio = S.Donor_Org_Retiree_Ratio
				, T.Donor_Org_Split_Ratio = S.Donor_Org_Split_Ratio
				, T.Donor_Org_Matching_Ratio = S.Donor_Org_Matching_Ratio
				, T.Donor_Org_Pref_Cont_Meth = S.Donor_Org_Pref_Cont_Meth
				, T.Donor_Block_Clusters_Value = S.Donor_Block_Clusters_Value
				, T.Donor_Org_Class_Code_Value = S.Donor_Org_Class_Code_Value
				, T.Donor_Org_Retiree_Ratio_Value = S.Donor_Org_Retiree_Ratio_Value
				, T.Donor_Org_Split_Ratio_Value = S.Donor_Org_Split_Ratio_Value
				, T.Donor_Org_Matching_Ratio_Value = S.Donor_Org_Matching_Ratio_Value
				, T.Donor_Org_Pref_Cont_Meth_Val = S.Donor_Org_Pref_Cont_Meth_Val;
			MERGE _Donor_Dim AS T
				USING dbo._Donor_Dim_3 AS S
				ON (T.Donor_Key = S.Donor_Key)
				WHEN MATCHED 
				THEN UPDATE SET 
				T.Donor_Individual_Infor_Envel = S.Donor_Individual_Infor_Envel
				, T.Donor_Couple_Infor_Envel = S.Donor_Couple_Infor_Envel
				, T.Donor_Individual_Form_Envel = S.Donor_Individual_Form_Envel
				, T.Donor_Couple_Form_Envel = S.Donor_Couple_Form_Envel;
			MERGE _Donor_Dim AS T
				USING dbo._Donor_Dim_41 AS S
				ON (T.Donor_Key = S.Donor_Key)
				WHEN MATCHED 
				THEN UPDATE SET 
				T.All_Personal_Connections = S.All_Personal_Connections
				, T.Donor_Age = S.Donor_Age
				;
			MERGE _Donor_Dim AS T
				USING dbo._Donor_Dim_42 AS S
				ON (T.Donor_Key = S.Donor_Key)
				WHEN MATCHED 
				THEN UPDATE SET 
				T.Byu_Degrees = S.Byu_Degrees
				, T.ByuI_Degrees = S.ByuI_Degrees
				;
			MERGE _Donor_Dim AS T
				USING dbo._Donor_Dim_43 AS S
				ON (T.Donor_Key = S.Donor_Key)
				WHEN MATCHED 
				THEN UPDATE SET 
				T.ByuH_Degrees = S.ByuH_Degrees
				, T.Ldsbc_Degrees = S.Ldsbc_Degrees
				;
			MERGE _Donor_Dim AS T
				USING dbo._Donor_Dim_6 AS S
				ON (T.Donor_Key = S.Donor_Key)
				WHEN MATCHED 
				THEN UPDATE SET 
				T.All_Employment = S.All_Employment 
				, T.Current_Employment = S.Current_Employment
				, T.Former_Employment = S.Former_Employment
				;
			DECLARE @TABLE_CNT_251  VARCHAR(100)
			SELECT @TABLE_CNT_251 = (SELECT CONVERT(NVARCHAR (100), COUNT(*) ) FROM _Donor_Dim);
			DECLARE @TABLE_NAME NVARCHAR(100)
			SET @TABLE_NAME = ''_Donor_Dim'' ; ------> HARDCODE <------
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = Donor_Dim, @Alpha_Step_Number = ''122V'', @Alpha_Step_Name = ''Loop Tables - Final Merge - End'',@Alpha_Result = 1;                               
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = Donor_Dim, @Alpha_Step_Number = ''122V'', @Alpha_Step_Name = ''_Donor_Dim - Count'', @Alpha_Count = @TABLE_CNT_251 ,@Alpha_Result = 1;
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''122H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1;
			'
		, 'EXEC dbo.usp_Transform_Data @Transform_Data_Table_Name = ''_Donor_Dim''; ------> HARDCODE <------
			' -- Attribute_21
		, 1 -- Active
		, GETDATE()
		, NULL
	)             
	, 
-- --------------------------
-- Donor Columns
-- --------------------------
	('Support' -- Dim_Object
		, '_Donor_Columns_' -- Table_Name
		, 'Place_Holder INT' -- Create_Table
		, 'Place_Holder' -- Insert_Fields
		, ' ' -- From_Statement
		, ' ' -- Where_Statement
		, 'DECLARE @TABLE_NAME NVARCHAR(100)
			SET @TABLE_NAME = ''_Donor_Columns_'' ; ------> HARDCODE <------
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''131D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1;                               
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''131D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_1
		, '
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Columns'', @Alpha_Step_Number = ''131E'', @Alpha_Step_Name = ''Create Donor Columns - Begin'', @Alpha_Result = 1;                                                                              
					IF OBJECT_ID(''tempdb..#Donor_Columns'') IS NOT NULL
					DROP TABLE #Donor_Columns
			BEGIN TRY
				SELECT * INTO #Donor_Columns
					FROM
						(SELECT A.Donor_Key
							, MAX(A.Byu_Donor) AS Byu_Donor
							, MAX(A.ByuI_Donor) AS ByuI_Donor
							, MAX(A.ByuH_Donor) AS ByuH_Donor
							, MAX(A.Ldsbc_Donor) AS Ldsbc_Donor
							FROM
								(SELECT A.Donor_Key
									, CASE WHEN B.Donor_Key IS NOT NULL AND B.New_Inst = ''BYU'' THEN ''Y''
										ELSE ''N'' END AS Byu_Donor
									, CASE WHEN B.Donor_Key IS NOT NULL AND B.New_Inst = ''BYUI'' THEN ''Y''
										ELSE ''N'' END AS ByuI_Donor
									, CASE WHEN B.Donor_Key IS NOT NULL AND B.New_Inst = ''BYUH'' THEN ''Y''
										ELSE ''N'' END AS ByuH_Donor
									, CASE WHEN B.Donor_Key IS NOT NULL AND B.New_Inst = ''LDSBC'' THEN ''Y''
										ELSE ''N'' END AS Ldsbc_Donor
									FROM _Donor_Dim A
										LEFT JOIN
											(SELECT A.Donor_Key
												, B.New_Inst
												, SUM(A.Donation_Credit_Amt) AS Donation_Credit_Amt
												FROM _Donation_Fact A
													INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
												WHERE 1 = 1
													AND New_Inst IN (''BYU'',''BYUI'',''BYUH'',''LDSBC'')
												GROUP BY A.Donor_Key
													, B.New_Inst
											) B ON A.Donor_Key = B.Donor_Key
								) A
							GROUP BY A.Donor_Key
						) A
				MERGE _Donor_Dim AS T
					USING #Donor_Columns AS S
					ON (T.Donor_Key = S.Donor_Key)
					WHEN MATCHED 
					THEN UPDATE SET 
					T.Byu_Donor = S.Byu_Donor
					, T.ByuI_Donor = S.ByuI_Donor
					, T.ByuH_Donor = S.ByuH_Donor
					, T.Ldsbc_Donor = S.Ldsbc_Donor
					;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Columns'', @Alpha_Step_Number = ''131E'', @Alpha_Step_Name = ''Create Donor_Columns - End'', @Alpha_Result = 1;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor Columns'', @Alpha_Step_Number = ''131X'', @Alpha_Step_Name = ''Donor Columns - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_2
		, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''131H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1;
			' -- Attribute_3
		, ' ' -- Attribute_4
		, ' ' -- Attribute_5
		, ' ' -- Attribute_6
		, ' ' -- Attribute_7
		, ' ' -- Attribute_8
		, ' ' -- Attribute_9
		, ' ' -- Attribute_10
		, ' ' -- Attribute_11
		, ' ' -- Attribute_12
		, ' ' -- Attribute_13
		, ' ' -- Attribute_14
		, ' ' -- Attribute_15
		, ' ' -- Attribute_16
		, ' ' -- Attribute_17
		, ' ' -- Attribute_18
		, ' ' -- Attribute_19
		, ' ' -- Attribute_20
		, 'EXEC dbo.usp_Transform_Data @Transform_Data_Table_Name = ''_Donor_Columns_''; ------> HARDCODE <------
			' -- Attribute_21
		, 1 -- Active
		, GETDATE() -- Insert_Date
		, NULL  -- Update_Date                
	)
	,
-- --------------------------
-- _Household_Donations and Script QA
-- --------------------------
	('Post_Attributes' -- Dim_Object
		, '_Household_Donations' -- Table_Name
		, '_Household_Donations INT
			' -- Create_Table
		, '_Household_Donations
			' -- Insert_Fields
		, ' ' -- From_Statement
		, ' ' -- Where_Statement
		, 'DECLARE @TABLE_NAME NVARCHAR(100)
			SET @TABLE_NAME = ''_Household_Donations'' ; ------> HARDCODE <------
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''133D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1;                               
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''133D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_1
		, ' ' -- Attribute_2
		, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''133E'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1;                                                                             
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''133E'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_3
		, 'IF OBJECT_ID(''tempdb..#All_Donors_Totals'') IS NOT NULL
					DROP TABLE #All_Donors_Totals 
					IF OBJECT_ID(''tempdb..#Couples_Totals1'') IS NOT NULL
					DROP TABLE #Couples_Totals1 
					IF OBJECT_ID(''tempdb..#Couples_Totals2'') IS NOT NULL
					DROP TABLE #Couples_Totals2 
			BEGIN TRY
				SET ANSI_WARNINGS OFF
				
				DECLARE @TABLE_CNT1 AS VARCHAR(100)
				DECLARE @TABLE_CNT2 AS VARCHAR(100)
				DECLARE @TABLE_CNT3 AS VARCHAR(100)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Household_Donations'', @Alpha_Step_Number = ''133F'', @Alpha_Step_Name = ''Update Queries - Begin'', @Alpha_Result = 1;  
					SELECT * INTO #All_Donors_Totals
						FROM
							(
							SELECT DISTINCT A.Donor_Key
								, CASE WHEN CONCAT(COALESCE(Plus_PreferredFirstName,Donor_First_Name),'' '',COALESCE(Plus_PreferredLastName,Donor_Last_Name)) = '' '' THEN COALESCE(Plus_PreferredFullName,Donor_Name)
									ELSE CONCAT(COALESCE(Plus_PreferredFirstName,Donor_First_Name),'' '',COALESCE(Plus_PreferredLastName,Donor_Last_Name)) END AS Donor_Total_Name
								, COALESCE(Total_Donation, 0) + COALESCE(Matching_Credit,0) AS Donor_Total_Donation
								FROM
									(SELECT A.Donor_Key
										, A.Donor_First_Name 
										, A.Donor_Last_Name
										, A.Donor_Name
										, SUM(B.Donation_Primary_Amt) AS Total_Donation
										, SUM(C.Credit_Amount) AS Matching_Credit
										FROM _Donor_Dim A
											LEFT JOIN _Donation_Fact B ON A.Donor_Key = B.Donor_Key
											LEFT JOIN 
												(SELECT CONVERT(NVARCHAR(100),Plus_OriginatingConstituent) AS Originating_Constituent
													, SUM(New_CreditAmount) AS Credit_Amount
													FROM 
														(SELECT DISTINCT Plus_OriginatingConstituent
															, New_CreditAmount
															, New_RelatedGift
															FROM _Gift_Credit_
															WHERE 1 = 1
																AND Plus_OriginatingConstituent IS NOT NULL
																AND New_OrganizationId IS NOT NULL
														) A
													GROUP BY CONVERT(NVARCHAR(100),Plus_OriginatingConstituent)
												) C ON A.Donor_Key = C.Originating_Constituent
										GROUP BY A.Donor_Key
											, A.Donor_First_Name 
											, A.Donor_Last_Name
											, A.Donor_Name
									) A 
									LEFT JOIN 
									(SELECT Donor_Key
										, Plus_PreferredFirstName
										, Plus_PreferredLastName
										, Plus_PreferredFullName
										FROM _Donor_Dim
									) B ON A.Donor_Key = B.Donor_Key
							) A                                      
					SELECT * INTO #Couples_Totals1
						FROM
							(                                                        
							SELECT MAX(CONCAT(Husbands_First_Name,'' & '',Wifes_First_Name,'' '',Husbands_Last_Name)) AS Couples_Name
								, SUM(COALESCE(Husbands_Donation, 0) + COALESCE(Wifes_Donation,0)) AS Couples_Combind_Donation
								, Husbands_ContactId
								FROM                                                                                                        
									(SELECT CASE WHEN Primary_Gender = ''Male'' THEN Primary_ContactId
											ELSE Secondary_ContactId END AS Husbands_ContactId
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_First_Name
											ELSE Secondary_First_Name END AS Husbands_First_Name
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_Last_Name
											ELSE Secondary_Last_Name END AS Husbands_Last_Name
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_LdspId
											ELSE Secondary_LdspId END AS Husbands_LdspId
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_Donation + Matching_Credit
											ELSE Secondary_Donation END AS Husbands_Donation
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_ContactId
											ELSE Secondary_ContactId END AS Wifes_ContactId
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_First_Name
											ELSE Secondary_First_Name END AS Wifes_First_Name
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_Last_Name
											ELSE Secondary_Last_Name END AS Wifes_Last_Name
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_LdspId
											ELSE Secondary_LdspId END AS Wifes_LdspId
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_Donation + Matching_Credit
											ELSE Secondary_Donation END AS Wifes_Donation
										FROM
											(SELECT A.Donor_Key AS Primary_ContactId
												, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name) AS Primary_First_Name
												, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name) AS Primary_Last_Name
												, A.Donor_Gender AS Primary_Gender
												, A.Donor_Ldsp_Id AS Primary_LdspId
												, B.Relationship_Name AS Primary_Spouse_Name
												, B.Relationship_LdspId AS Primary_Spouse_LdspId
												, SUM(C.Donation_Primary_Amt) AS Primary_Donation
												, SUM(D.Credit_Amount) AS Matching_Credit
												FROM _Donor_Dim A
													LEFT JOIN _Connection_Dim B ON A.Donor_Key = B.ContactId
													LEFT JOIN _Donation_Fact C ON A.Donor_Key = C.Donor_Key
													LEFT JOIN 
														(SELECT A.Plus_OriginatingConstituent AS Originating_Constituent
															, SUM(A.New_CreditAmount) AS Credit_Amount
															FROM 
																(SELECT DISTINCT CONVERT(NVARCHAR(100),Plus_OriginatingConstituent) AS Plus_OriginatingConstituent
																	, New_CreditAmount
																	, New_RelatedGift
																	FROM _Gift_Credit_
																	WHERE 1 = 1
																		AND Plus_OriginatingConstituent IS NOT NULL
																		AND New_OrganizationId IS NOT NULL
																) A
															GROUP BY A.Plus_OriginatingConstituent
														) D ON A.Donor_Key = D.Originating_Constituent
												WHERE 1 = 1
													AND UPPER(B.Relationship) = ''SPOUSE''
													AND UPPER(A.Donor_Marriage_Status) NOT LIKE ''%WIDOW%''
												GROUP BY A.Donor_Key
													, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name)
													, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name)
													, A.Donor_Gender
													, A.Donor_Ldsp_Id
													, B.Relationship_Name
													, B.Relationship_LdspId
											) A 
											INNER JOIN
											(SELECT A.Donor_Key AS Secondary_ContactId
												, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name) AS Secondary_First_Name
												, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name) AS Secondary_Last_Name
												, A.Donor_Gender AS Secondary_Gender
												, A.Donor_Ldsp_Id AS Secondary_LdspId
												, B.Relationship_Name AS Secondary_Spouse_Name
												, B.Relationship_LdspId AS Secondary_Spouse_LdspId
												, SUM(C.Donation_Primary_Amt) AS Secondary_Donation
												FROM _donor_dim A
													LEFT JOIN _Connection_dim B ON A.Donor_Key = B.ContactId
													LEFT JOIN _Donation_Fact C ON A.Donor_Key = C.Donor_Key
												WHERE 1 = 1
													AND UPPER(B.Relationship) = ''SPOUSE''
													AND UPPER(A.Donor_Marriage_Status) NOT LIKE ''%WIDOW%''
												GROUP BY A.Donor_Key
													, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name)
													, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name)
													, A.Donor_Gender
													, A.Donor_Ldsp_Id
													, B.Relationship_Name
													, B.Relationship_LdspId
											) B ON CONVERT(NVARCHAR(15),A.Primary_LdspId) = REPLACE(LTRIM(REPLACE(CONVERT(NVARCHAR(15),B.Secondary_Spouse_LdspId),''0'','' '')),'' '',''0'')
									) B
								GROUP BY Husbands_ContactId
							) A
					SELECT * INTO #Couples_Totals2
						FROM
							(                                                        
							SELECT MAX(CONCAT(Husbands_First_Name,'' & '',Wifes_First_Name,'' '',Husbands_Last_Name)) AS Couples_Name
								, SUM(COALESCE(Husbands_Donation, 0) + COALESCE(Wifes_Donation,0)) AS Couples_Combind_Donation
								, Wifes_ContactId
								FROM                                                                                                        
									(SELECT CASE WHEN Primary_Gender = ''Male'' THEN Primary_ContactId
											ELSE Secondary_ContactId END AS Husbands_ContactId
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_First_Name
											ELSE Secondary_First_Name END AS Husbands_First_Name
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_Last_Name
											ELSE Secondary_Last_Name END AS Husbands_Last_Name
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_LdspId
											ELSE Secondary_LdspId END AS Husbands_LdspId
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_Donation + Matching_Credit
											ELSE Secondary_Donation END AS Husbands_Donation
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_ContactId
											ELSE Secondary_ContactId END AS Wifes_ContactId
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_First_Name
											ELSE Secondary_First_Name END AS Wifes_First_Name
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_Last_Name
											ELSE Secondary_Last_Name END AS Wifes_Last_Name
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_LdspId
											ELSE Secondary_LdspId END AS Wifes_LdspId
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_Donation + Matching_Credit
											ELSE Secondary_Donation END AS Wifes_Donation
										FROM
											(SELECT A.Donor_Key AS Primary_ContactId
												, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name) AS Primary_First_Name
												, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name) AS Primary_Last_Name
												, A.Donor_Gender AS Primary_Gender
												, A.Donor_Ldsp_Id AS Primary_LdspId
												, B.Relationship_Name AS Primary_Spouse_Name
												, B.Relationship_LdspId AS Primary_Spouse_LdspId
												, SUM(C.Donation_Primary_Amt) AS Primary_Donation
												, SUM(D.Credit_Amount) AS Matching_Credit
												FROM _Donor_Dim A
													LEFT JOIN _Connection_Dim B ON A.Donor_Key = B.ContactId
													LEFT JOIN _Donation_Fact C ON A.Donor_Key = C.Donor_Key
													LEFT JOIN 
														(SELECT A.Plus_OriginatingConstituent AS Originating_Constituent
															, SUM(A.New_CreditAmount) AS Credit_Amount
															FROM 
																(SELECT DISTINCT CONVERT(NVARCHAR(100),Plus_OriginatingConstituent) AS Plus_OriginatingConstituent
																	, New_CreditAmount
																	, New_RelatedGift
																	FROM _Gift_Credit_	
																	WHERE 1 = 1
																		AND Plus_OriginatingConstituent IS NOT NULL
																		AND New_OrganizationId IS NOT NULL
																) A
															GROUP BY A.Plus_OriginatingConstituent
														) D ON A.Donor_Key = D.Originating_Constituent
												WHERE 1 = 1
													AND UPPER(B.Relationship) = ''SPOUSE''
													AND UPPER(A.Donor_Marriage_Status) NOT LIKE ''%WIDOW%''
												GROUP BY A.Donor_Key
													, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name)
													, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name)
													, A.Donor_Gender
													, A.Donor_Ldsp_Id
													, B.Relationship_Name
													, B.Relationship_LdspId
											) A 
											INNER JOIN
											(SELECT A.Donor_Key AS Secondary_ContactId
												, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name) AS Secondary_First_Name
												, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name) AS Secondary_Last_Name
												, A.Donor_Gender AS Secondary_Gender
												, A.Donor_Ldsp_Id AS Secondary_LdspId
												, B.Relationship_Name AS Secondary_Spouse_Name
												, B.Relationship_LdspId AS Secondary_Spouse_LdspId
												, SUM(C.Donation_Primary_Amt) AS Secondary_Donation
												FROM _donor_dim A
													LEFT JOIN _Connection_dim B ON A.Donor_Key = B.ContactId
													LEFT JOIN _Donation_Fact C ON A.Donor_Key = C.Donor_Key
												WHERE 1 = 1
													AND UPPER(B.Relationship) = ''SPOUSE''
													AND UPPER(A.Donor_Marriage_Status) NOT LIKE ''%WIDOW%''
												GROUP BY A.Donor_Key
													, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name)
													, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name)
													, A.Donor_Gender
													, A.Donor_Ldsp_Id
													, B.Relationship_Name
													, B.Relationship_LdspId
											) B ON CONVERT(NVARCHAR(15),A.Primary_LdspId) = REPLACE(LTRIM(REPLACE(CONVERT(NVARCHAR(15),B.Secondary_Spouse_LdspId),''0'','' '')),'' '',''0'')
									) B
								GROUP BY Wifes_ContactId
							) A
					MERGE _Donor_Dim AS T
						USING #All_Donors_Totals AS S
						ON (T.Donor_Key = S.Donor_Key)
						WHEN MATCHED 
						THEN UPDATE SET 
						T.Donor_Total_Name = S.Donor_Total_Name
						, T.Donor_Total_Donation = CONCAT(''$'',CONVERT(NVARCHAR(50),S.Donor_Total_Donation))
						;
					MERGE _Donor_Dim AS T
						USING #Couples_Totals1 AS S
						ON (T.Donor_Key = S.Husbands_ContactId)
						WHEN MATCHED 
						THEN UPDATE SET 
						T.Donor_Total_Name = S.Couples_Name
						, T.Donor_Total_Donation = CONCAT(''$'',CONVERT(NVARCHAR(50),S.Couples_Combind_Donation))
						;
					MERGE _Donor_Dim AS T
						USING #Couples_Totals2 AS S
						ON (T.Donor_Key = S.Wifes_ContactId)
						WHEN MATCHED 
						THEN UPDATE SET 
						T.Donor_Total_Name = S.Couples_Name
						, T.Donor_Total_Donation = CONCAT(''$'',CONVERT(NVARCHAR(50),S.Couples_Combind_Donation))
						;
					SET ANSI_WARNINGS ON
				SELECT @TABLE_CNT1 = (SELECT CONVERT(NVARCHAR(100),COUNT(*)) FROM #All_Donors_Totals)
				SELECT @TABLE_CNT2 = (SELECT CONVERT(NVARCHAR(100),COUNT(*)) FROM #Couples_Totals1)
				SELECT @TABLE_CNT3 = (SELECT CONVERT(NVARCHAR(100),COUNT(*)) FROM #Couples_Totals2)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Household_Donations'', @Alpha_Step_Number = ''133F'', @Alpha_Step_Name = ''Merge Update 1 - Count'', @Alpha_Count = @TABLE_CNT1, @Alpha_Result = 1;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Household_Donations'', @Alpha_Step_Number = ''133F'', @Alpha_Step_Name = ''Merge Update 2 - Count'', @Alpha_Count = @TABLE_CNT2, @Alpha_Result = 1;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Household_Donations'', @Alpha_Step_Number = ''133F'', @Alpha_Step_Name = ''Merge Update 3 - Count'', @Alpha_Count = @TABLE_CNT3, @Alpha_Result = 1;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Household_Donations'', @Alpha_Step_Number = ''133F'', @Alpha_Step_Name = ''Update Queries - End'', @Alpha_Result = 1;                                    
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Household_Donations'', @Alpha_Step_Number = ''133X'', @Alpha_Step_Name = ''Update Queries - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
			
		IF OBJECT_ID(''tempdb..#All_Donors_Totals_Display'') IS NOT NULL
		DROP TABLE #All_Donors_Totals_Display 
		IF OBJECT_ID(''tempdb..#Couples_Totals1_Display'') IS NOT NULL
		DROP TABLE #Couples_Totals1_Display 
		IF OBJECT_ID(''tempdb..#Couples_Totals2_Display'') IS NOT NULL
		DROP TABLE #Couples_Totals2_Display  
			BEGIN TRY
				DECLARE @TABLE_CNT1_DISPLAY AS VARCHAR(100)
				DECLARE @TABLE_CNT2_DISPLAY AS VARCHAR(100)
				DECLARE @TABLE_CNT3_DISPLAY AS VARCHAR(100)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Name_Display'', @Alpha_Step_Number = ''133F'', @Alpha_Step_Name = ''Update Queries - Begin'', @Alpha_Result = 1;  
					
					SELECT * INTO #All_Donors_Totals_Display
						FROM
							(
							SELECT DISTINCT A.Donor_Key
								, CASE WHEN CONCAT(COALESCE(B.Plus_PreferredLastName,A.Donor_Last_Name),'', '',COALESCE(B.Plus_PreferredFirstName,A.Donor_First_Name)) = '', '' THEN A.Donor_Display_Name
									ELSE CONCAT(COALESCE(B.Plus_PreferredLastName,A.Donor_Last_Name),'', '',COALESCE(B.Plus_PreferredFirstName,A.Donor_First_Name)) END AS Donor_Total_Name_Display
								FROM
									(SELECT A.Donor_Key
										, A.Donor_First_Name 
										, A.Donor_Last_Name
										, A.Donor_Name
										, A.Donor_Display_Name
										FROM _Donor_Dim A
									) A 
									LEFT JOIN 
									(SELECT Donor_Key
										, Plus_PreferredFirstName
										, Plus_PreferredLastName
										, Plus_PreferredFullName
										FROM _Donor_Dim
									) B ON A.Donor_Key = B.Donor_Key
							) A  
																
					SELECT * INTO #Couples_Totals1_Display
						FROM
							(                                                        
							SELECT MAX(CONCAT(Husbands_Last_Name,'', '', Husbands_First_Name,'' & '',Wifes_First_Name)) AS Couples_Name_Display
								, Husbands_ContactId
								FROM                                                                                                        
									(SELECT CASE WHEN Primary_Gender = ''Male'' THEN Primary_ContactId
											ELSE Secondary_ContactId END AS Husbands_ContactId
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_First_Name
											ELSE Secondary_First_Name END AS Husbands_First_Name
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_Last_Name
											ELSE Secondary_Last_Name END AS Husbands_Last_Name
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_LdspId
											ELSE Secondary_LdspId END AS Husbands_LdspId
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_ContactId
											ELSE Secondary_ContactId END AS Wifes_ContactId
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_First_Name
											ELSE Secondary_First_Name END AS Wifes_First_Name
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_Last_Name
											ELSE Secondary_Last_Name END AS Wifes_Last_Name
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_LdspId
											ELSE Secondary_LdspId END AS Wifes_LdspId
										FROM
											(SELECT A.Donor_Key AS Primary_ContactId
												, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name) AS Primary_First_Name
												, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name) AS Primary_Last_Name
												, A.Donor_Gender AS Primary_Gender
												, A.Donor_Ldsp_Id AS Primary_LdspId
												, B.Relationship_Name AS Primary_Spouse_Name
												, B.Relationship_LdspId AS Primary_Spouse_LdspId
												FROM _Donor_Dim A
													LEFT JOIN _Connection_Dim B ON A.Donor_Key = B.ContactId
												WHERE 1 = 1
													AND UPPER(B.Relationship) = ''SPOUSE''
													AND UPPER(A.Donor_Marriage_Status) NOT LIKE ''%WIDOW%''
											) A 
											INNER JOIN
											(SELECT A.Donor_Key AS Secondary_ContactId
												, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name) AS Secondary_First_Name
												, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name) AS Secondary_Last_Name
												, A.Donor_Gender AS Secondary_Gender
												, A.Donor_Ldsp_Id AS Secondary_LdspId
												, B.Relationship_Name AS Secondary_Spouse_Name
												, B.Relationship_LdspId AS Secondary_Spouse_LdspId
												FROM _Donor_Dim A
													LEFT JOIN _Connection_Dim B ON A.Donor_Key = B.ContactId
												WHERE 1 = 1
													AND UPPER(B.Relationship) = ''SPOUSE''
													AND UPPER(A.Donor_Marriage_Status) NOT LIKE ''%WIDOW%''
											) B ON CONVERT(NVARCHAR(15),A.Primary_LdspId) = REPLACE(LTRIM(REPLACE(CONVERT(NVARCHAR(15),B.Secondary_Spouse_LdspId),''0'','' '')),'' '',''0'')
									) B
								GROUP BY Husbands_ContactId
							) A

					SELECT * INTO #Couples_Totals2_Display
						FROM
							(                                                        
							SELECT MAX(CONCAT(Husbands_Last_Name,'', '',Husbands_First_Name,'' & '',Wifes_First_Name)) AS Couples_Name_Display
								, Wifes_ContactId
								FROM                                                                                                        
									(SELECT CASE WHEN Primary_Gender = ''Male'' THEN Primary_ContactId
											ELSE Secondary_ContactId END AS Husbands_ContactId
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_First_Name
											ELSE Secondary_First_Name END AS Husbands_First_Name
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_Last_Name
											ELSE Secondary_Last_Name END AS Husbands_Last_Name
										, CASE WHEN Primary_Gender = ''Male'' THEN Primary_LdspId
											ELSE Secondary_LdspId END AS Husbands_LdspId
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_ContactId
											ELSE Secondary_ContactId END AS Wifes_ContactId
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_First_Name
											ELSE Secondary_First_Name END AS Wifes_First_Name
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_Last_Name
											ELSE Secondary_Last_Name END AS Wifes_Last_Name
										, CASE WHEN Primary_Gender = ''Female'' THEN Primary_LdspId
											ELSE Secondary_LdspId END AS Wifes_LdspId
										FROM
											(SELECT A.Donor_Key AS Primary_ContactId
												, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name) AS Primary_First_Name
												, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name) AS Primary_Last_Name
												, A.Donor_Gender AS Primary_Gender
												, A.Donor_Ldsp_Id AS Primary_LdspId
												, B.Relationship_Name AS Primary_Spouse_Name
												, B.Relationship_LdspId AS Primary_Spouse_LdspId
												FROM _Donor_Dim A
													LEFT JOIN _Connection_Dim B ON A.Donor_Key = B.ContactId
												WHERE 1 = 1
													AND UPPER(B.Relationship) = ''SPOUSE''
													AND UPPER(A.Donor_Marriage_Status) NOT LIKE ''%WIDOW%''
											) A 
											INNER JOIN
											(SELECT A.Donor_Key AS Secondary_ContactId
												, COALESCE(A.Plus_PreferredFirstName,A.Donor_First_Name) AS Secondary_First_Name
												, COALESCE(A.Plus_PreferredLastName,A.Donor_Last_Name) AS Secondary_Last_Name
												, A.Donor_Gender AS Secondary_Gender
												, A.Donor_Ldsp_Id AS Secondary_LdspId
												, B.Relationship_Name AS Secondary_Spouse_Name
												, B.Relationship_LdspId AS Secondary_Spouse_LdspId
												FROM _donor_dim A
													LEFT JOIN _Connection_dim B ON A.Donor_Key = B.ContactId
												WHERE 1 = 1
													AND UPPER(B.Relationship) = ''SPOUSE''
													AND UPPER(A.Donor_Marriage_Status) NOT LIKE ''%WIDOW%''
											) B ON CONVERT(NVARCHAR(15),A.Primary_LdspId) = REPLACE(LTRIM(REPLACE(CONVERT(NVARCHAR(15),B.Secondary_Spouse_LdspId),''0'','' '')),'' '',''0'')
									) B
								GROUP BY Wifes_ContactId
							) A
					
					MERGE _Donor_Dim AS T
						USING #All_Donors_Totals_Display AS S
						ON (T.Donor_Key = S.Donor_Key)
						WHEN MATCHED 
						THEN UPDATE SET 
						T.Donor_Total_Name_Display = S.Donor_Total_Name_Display
						;
					MERGE _Donor_Dim AS T
						USING #Couples_Totals1_Display AS S
						ON (T.Donor_Key = S.Husbands_ContactId)
						WHEN MATCHED 
						THEN UPDATE SET 
						T.Donor_Total_Name_Display = S.Couples_Name_Display
						;
					MERGE _Donor_Dim AS T
						USING #Couples_Totals2_Display AS S
						ON (T.Donor_Key = S.Wifes_ContactId)
						WHEN MATCHED 
						THEN UPDATE SET 
						T.Donor_Total_Name_Display = S.Couples_Name_Display
						;
				SELECT @TABLE_CNT1_DISPLAY = (SELECT CONVERT(NVARCHAR(100),COUNT(*)) FROM #All_Donors_Totals_Display)
				SELECT @TABLE_CNT2_DISPLAY = (SELECT CONVERT(NVARCHAR(100),COUNT(*)) FROM #Couples_Totals1_Display)
				SELECT @TABLE_CNT3_DISPLAY = (SELECT CONVERT(NVARCHAR(100),COUNT(*)) FROM #Couples_Totals2_Display)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Name_Display'', @Alpha_Step_Number = ''133F'', @Alpha_Step_Name = ''Merge Update 1 - Count'', @Alpha_Count = @TABLE_CNT1_DISPLAY, @Alpha_Result = 1;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Name_Display'', @Alpha_Step_Number = ''133F'', @Alpha_Step_Name = ''Merge Update 2 - Count'', @Alpha_Count = @TABLE_CNT2_DISPLAY, @Alpha_Result = 1;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Name_Display'', @Alpha_Step_Number = ''133F'', @Alpha_Step_Name = ''Merge Update 3 - Count'', @Alpha_Count = @TABLE_CNT3_DISPLAY, @Alpha_Result = 1;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Name_Display'', @Alpha_Step_Number = ''133F'', @Alpha_Step_Name = ''Update Queries - End'', @Alpha_Result = 1;                                    
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Name_Display'', @Alpha_Step_Number = ''133X'', @Alpha_Step_Name = ''Update Queries - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_4
		, '
			' -- Attribute_5
		, 'IF OBJECT_ID(''tempdb..#Mobile'') IS NOT NULL
				DROP TABLE #Mobile
			BEGIN TRY
				SELECT * 
					INTO #Mobile
					FROM
						(SELECT A.New_PhoneId
							, A.New_NumberId
							, A.New_PhoneNumber
							, (COALESCE(B.Filter_Number,0) + COALESCE(C.Filter_Number,0) + COALESCE(D.Filter_Number,0) + COALESCE(E.Filter_Number,0)) AS Filter_Number
							, A.ModifiedOn
							FROM
								(SELECT New_PhoneId
									, New_NumberId
									, New_PhoneNumber
									, NULL AS Filter_Number
									, ModifiedOn
									FROM Ext_Phone
									WHERE 1 = 1
										AND Plus_LineType = 100000000 -- Mobile
										AND StatusCode = 100000002 -- Active
								) A
								LEFT JOIN
								(SELECT New_PhoneId
									, New_NumberId
									, New_PhoneNumber
									, 7 AS Filter_Number
									FROM Ext_Phone
									WHERE 1 = 1
										AND Plus_LineType = 100000000 -- Mobile
										AND StatusCode = 100000002 -- Active
										AND New_Primary = 1
								) B ON A.New_PhoneId = B.New_PhoneId
								LEFT JOIN
								(SELECT New_PhoneId
									, New_NumberId
									, New_PhoneNumber
									, 3 AS Filter_Number
									FROM Ext_Phone
									WHERE 1 = 1
										AND Plus_LineType = 100000000 -- Mobile
										AND New_Primary = 1  -- Primary
										AND StatusCode = 100000002 -- Active
										AND New_Type = 100000000 -- Personal
								) C ON A.New_PhoneId = C.New_PhoneId
								LEFT JOIN
								(SELECT New_PhoneId
									, New_NumberId
									, New_PhoneNumber
									, 2 AS Filter_Number
									FROM Ext_Phone
									WHERE 1 = 1
										AND Plus_LineType = 100000000 -- Mobile
										AND New_Primary = 1  -- Primary
										AND StatusCode = 100000002 -- Active
										AND New_Type = 100000001 -- Business
								) D ON A.New_PhoneId = D.New_PhoneId
								LEFT JOIN
								(SELECT New_PhoneId
									, New_NumberId
									, New_PhoneNumber
									, 1 AS Filter_Number
									FROM Ext_Phone
									WHERE 1 = 1
										AND Plus_LineType = 100000000 -- Mobile
										AND New_Primary = 1  -- Primary
										AND StatusCode = 100000002 -- Active
										AND New_Type = 100000003 -- Parent
								) E ON A.New_PhoneId = E.New_PhoneId
						) A						
				MERGE INTO _Donor_Dim T
					USING (
							SELECT A.New_NumberId AS Donor_Key
								, A.New_PhoneNumber AS Cell_Phone
								FROM
									(SELECT A.New_NumberId
										, A.New_PhoneNumber
										, ROW_NUMBER() OVER(PARTITION BY A.New_NumberId ORDER BY A.New_NumberId) AS RowNumber
										FROM #Mobile A
											INNER JOIN
												(SELECT New_NumberId
													, MAX(Filter_Number) AS Filter_Number
													FROM #Mobile
													GROUP BY New_NumberId
												) B ON A.New_NumberId = B.New_NumberId AND A.Filter_Number = B.Filter_Number
											INNER JOIN
												(SELECT New_NumberId
													, MAX(ModifiedOn) AS ModifiedOn
													FROM #Mobile
													GROUP BY New_NumberId
												) C ON A.New_NumberId = C.New_NumberId AND A.ModifiedOn = C.ModifiedOn
											INNER JOIN
												(SELECT New_NumberId
													, MAX(New_PhoneNumber) AS New_PhoneNumber
													FROM #Mobile
													GROUP BY New_NumberId
												) D ON A.New_NumberId = D.New_NumberId AND A.New_PhoneNumber = D.New_PhoneNumber
									) A
								WHERE 1 = 1
									AND RowNumber = 1 
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Cell_Phone = S.Cell_Phone;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Cell Phone'', @Alpha_Step_Number = ''135X'', @Alpha_Step_Name = ''Cell Phone - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
			' -- Attribute_6
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT Donor_Key
								, Current_Employer_Name
								, Current_Job_Title
								, Current_Job_Code
								, Current_Job_Date_Started
								, Current_Job_Work_Phone
								, Current_Job_Work_Address
								FROM
									(SELECT E.New_EmploymentId
										, E.New_EmploymentsId AS Donor_Key
										, ROW_NUMBER() OVER(PARTITION BY E.New_EmploymentsId ORDER BY E.New_EmploymentsId, E.New_DateStarted DESC, E.ModifiedOn DESC, COALESCE(E.Plus_AlternateOrganizationName, A.Name) DESC) AS RowNumber
										, COALESCE(E.Plus_AlternateOrganizationName, A.Name) AS Current_Employer_Name
										, E.New_Title  AS Current_Job_Title
										, NJ.New_Name AS Current_Job_Code
										, CONVERT(VARCHAR(10), E.New_DateStarted,101) AS Current_Job_Date_Started
										, P.New_PhoneNumber AS Current_Job_Work_Phone
										, AD.Plus_AddressDisplay AS Current_Job_Work_Address
										, E.ModifiedOn
										FROM Ext_Employment E
											LEFT JOIN Ext_Job_Code NJ ON E.New_JobCode = NJ.New_JobCodeId
											LEFT JOIN Ext_Account A ON E.New_Company = A.AccountId
											LEFT JOIN Ext_Address AD ON E.Plus_RelatedAddress = AD.New_AddressId
											LEFT JOIN Ext_Phone P ON E.Plus_RelatedPhone = P.New_PhoneId
										WHERE 1 = 1
											AND E.StatusCode = 100000002
									) A
								WHERE 1 = 1
									AND RowNumber = 1
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Current_Employer_Name = S.Current_Employer_Name
								, T.Current_Job_Title = S.Current_Job_Title
								, T.Current_Job_Code = S.Current_Job_Code
								, T.Current_Job_Date_Started = S.Current_Job_Date_Started
								, T.Current_Job_Work_Phone = S.Current_Job_Work_Phone
								, T.Current_Job_Work_Address = S.Current_Job_Work_Address
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Current Employment'', @Alpha_Step_Number = ''136X'', @Alpha_Step_Name = ''Current Employment - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
			' -- Attribute_7
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT Donor_Key
								, Current_Employer_Name
								, Current_Job_Title
								, Current_Job_Code
								, Current_Job_Date_Started
								, Current_Job_Work_Phone
								, Current_Job_Work_Address
								FROM
									(SELECT E.New_EmploymentId
										, E.New_EmploymentsId AS Donor_Key
										, ROW_NUMBER() OVER(PARTITION BY E.New_EmploymentsId ORDER BY E.New_EmploymentsId, E.New_DateStarted DESC, E.ModifiedOn DESC, COALESCE(E.Plus_AlternateOrganizationName, A.Name) DESC) AS RowNumber
										, COALESCE(E.Plus_AlternateOrganizationName, A.Name) AS Current_Employer_Name
										, E.New_Title  AS Current_Job_Title
										, NJ.New_Name AS Current_Job_Code
										, CONVERT(VARCHAR(10), E.New_DateStarted,101) AS Current_Job_Date_Started
										, P.New_PhoneNumber AS Current_Job_Work_Phone
										, AD.Plus_AddressDisplay AS Current_Job_Work_Address
										, E.ModifiedOn
										FROM Ext_Employment E
											LEFT JOIN Ext_Job_Code NJ ON E.New_JobCode = NJ.New_JobCodeId
											LEFT JOIN Ext_Account A ON E.New_Company = A.AccountId
											LEFT JOIN Ext_Address AD ON E.Plus_RelatedAddress = AD.New_AddressId
											LEFT JOIN Ext_Phone P ON E.Plus_RelatedPhone = P.New_PhoneId
										WHERE 1 = 1
											AND E.StatusCode = 100000002
									) A
								WHERE 1 = 1
									AND RowNumber = 1
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Current_Employer_Name = S.Current_Employer_Name
								, T.Current_Job_Title = S.Current_Job_Title
								, T.Current_Job_Code = S.Current_Job_Code
								, T.Current_Job_Date_Started = S.Current_Job_Date_Started
								, T.Current_Job_Work_Phone = S.Current_Job_Work_Phone
								, T.Current_Job_Work_Address = S.Current_Job_Work_Address
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Current Employment'', @Alpha_Step_Number = ''136X'', @Alpha_Step_Name = ''Current Employment - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
			' -- Attribute_8
		, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''134H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1;
			' -- Attribute_9
		
		, ' ' -- Attribute_10
		, ' ' -- Attribute_11
		, ' ' -- Attribute_12
		, ' ' -- Attribute_13
		, ' ' -- Attribute_14
		, ' ' -- Attribute_15
		, ' ' -- Attribute_16
		, ' ' -- Attribute_17
		, ' ' -- Attribute_18
		, ' ' -- Attribute_19
		, ' ' -- Attribute_20
		, 'EXEC dbo.usp_Transform_Data @Transform_Data_Table_Name = ''_Household_Donations''; ------> HARDCODE <------
			' -- Attribute_21
		, 1 -- Active
		, GETDATE() -- Insert_Date
		, NULL  -- Update_Date                
	)             
	,
-- --------------------------
-- Telefund
-- --------------------------
	('Post_Attributes' -- Dim_Object
		, '_Telefund' -- Table_Name
		, '_Telefund INT
			' -- Create_Table
		, '_Telefund
			' -- Insert_Fields
		, ' ' -- From_Statement
		, ' ' -- Where_Statement
		, 'DECLARE @TABLE_NAME NVARCHAR(100)
			SET @TABLE_NAME = ''_Telefund'' ; ------> HARDCODE <------
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''138D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_1
		, ' ' -- Attribute_2
		, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''138E'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1; 
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''138E'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_3
		, '
			' -- Attribute_4
		, ' 
			' -- Attribute_5
		, ' 
			' -- Attribute_6
		, '
			' -- Attribute_7
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT A.New_StudentsAttendanceId AS Donor_Key
								, ''Y'' AS Donor_Any_School_Current_Student
								FROM Ext_Student A
								WHERE 1 = 1
									AND A.Plus_Year = CONVERT(NVARCHAR(10),YEAR(GETDATE()-1)) -- Current Year
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Any_School_Current_Student = S.Donor_Any_School_Current_Student
							;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Any_School_Current_Student'', @Alpha_Step_Number = ''138X'', @Alpha_Step_Name = ''Donor_Any_School_Current_Student - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_8
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT ContactId AS Donor_Key
								, ''Y'' AS Donor_BYU_Current_Student
								FROM _Student_Dim
								WHERE 1 = 1
									AND Current_Year_Plus_4_Student = ''Y''
									AND New_University = ''BYU''
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_BYU_Current_Student = S.Donor_BYU_Current_Student
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_BYU_Current_Student'', @Alpha_Step_Number = ''138X'', @Alpha_Step_Name = ''Donor_BYU_Current_Student - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_9		
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT ContactId AS Donor_Key
								, ''Y'' AS Donor_BYUI_Current_Student
								FROM _Student_Dim
								WHERE 1 = 1
									AND Current_Year_Plus_4_Student = ''Y''
									AND New_University = ''BYUI''
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_BYUI_Current_Student = S.Donor_BYUI_Current_Student
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_BYUI_Current_Student'', @Alpha_Step_Number = ''138X'', @Alpha_Step_Name = ''Donor_BYUI_Current_Student - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_10
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT ContactId AS Donor_Key
								, ''Y'' AS Donor_BYUH_Current_Student
								FROM _Student_Dim
								WHERE 1 = 1
									AND Current_Year_Plus_4_Student = ''Y''
									AND New_University = ''BYUH''
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_BYUH_Current_Student = S.Donor_BYUH_Current_Student
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_BYUH_Current_Student'', @Alpha_Step_Number = ''138X'', @Alpha_Step_Name = ''Donor_BYUH_Current_Student - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_11
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT ContactId AS Donor_Key
								, ''Y'' AS Donor_LDSBC_Current_Student
								FROM _Student_Dim
								WHERE 1 = 1
									AND Current_Year_Plus_4_Student = ''Y''
									AND New_University = ''LDSBC''
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_LDSBC_Current_Student = S.Donor_LDSBC_Current_Student
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_LDSBC_Current_Student'', @Alpha_Step_Number = ''138X'', @Alpha_Step_Name = ''Donor_LDSBC_Current_Student - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_12
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT ContactId AS Donor_Key
								, CASE WHEN A.Credit_Amount > 0 THEN ''Y'' ELSE ''N'' END AS Donor_Given_This_Year_To_Byu
								FROM
									(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS ContactId 
										, SUM(A.New_CreditAmount) AS Credit_Amount
										FROM dbo._Gift_Credit_ A
											INNER JOIN Ext_Institution B ON A.Plus_InstitutionalHieararchy = B.New_Institutionid
										WHERE 1 = 1
											AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) -- Beginning of this year
																	 AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) -- End of this year
											AND A.Plus_Type != 100000001 --Exclude Influence
											AND A.Plus_SubType != 100000002 --Exclude Match
											AND B.New_Inst = ''BYU''
										GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
									) A
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Given_This_Year_To_Byu = S.Donor_Given_This_Year_To_Byu
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Given_This_Year_To_Byu'', @Alpha_Step_Number = ''138X'', @Alpha_Step_Name = ''Donor_Given_This_Year_To_Byu - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_13
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT ContactId AS Donor_Key
								, CASE WHEN A.Credit_Amount > 0 THEN ''Y'' ELSE ''N'' END AS Donor_Given_This_Year_To_ByuI
								FROM
									(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS ContactId 
										, SUM(A.New_CreditAmount) AS Credit_Amount
										FROM dbo._Gift_Credit_ A
											INNER JOIN Ext_Institution B ON A.Plus_InstitutionalHieararchy = B.New_Institutionid
										WHERE 1 = 1
											AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) -- Beginning of this year
																	 AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) -- End of this year
											AND A.Plus_Type != 100000001 --Exclude Influence
											AND A.Plus_SubType != 100000002 --Exclude Match
											AND B.New_Inst = ''BYUI''
										GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
									) A
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Given_This_Year_To_ByuI = S.Donor_Given_This_Year_To_ByuI
							;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Given_This_Year_To_ByuI'', @Alpha_Step_Number = ''138X'', @Alpha_Step_Name = ''Donor_Given_This_Year_To_ByuI - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_14
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT ContactId AS Donor_Key
								, CASE WHEN A.Credit_Amount > 0 THEN ''Y'' ELSE ''N'' END AS Donor_Given_This_Year_To_ByuH
								FROM
									(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS ContactId 
										, SUM(A.New_CreditAmount) AS Credit_Amount
										FROM dbo._Gift_Credit_ A
											INNER JOIN Ext_Institution B ON A.Plus_InstitutionalHieararchy = B.New_Institutionid
										WHERE 1 = 1
											AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) -- Beginning of this year
																	 AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) -- End of this year
											AND A.Plus_Type != 100000001 --Exclude Influence
											AND A.Plus_SubType != 100000002 --Exclude Match
											AND B.New_Inst = ''BYUH''
										GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
									) A
						
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Given_This_Year_To_ByuH = S.Donor_Given_This_Year_To_ByuH
							;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Given_This_Year_To_ByuH'', @Alpha_Step_Number = ''138X'', @Alpha_Step_Name = ''Donor_Given_This_Year_To_ByuH - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_15
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT ContactId AS Donor_Key
								, CASE WHEN A.Credit_Amount > 0 THEN ''Y'' ELSE ''N'' END AS Donor_Given_This_Year_To_Ldsbc
								FROM
									(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS ContactId 
										, SUM(A.New_CreditAmount) AS Credit_Amount
										FROM dbo._Gift_Credit_ A
											INNER JOIN Ext_Institution B ON A.Plus_InstitutionalHieararchy = B.New_Institutionid
										WHERE 1 = 1
											AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) -- Beginning of this year
																	 AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) -- End of this year
											AND A.Plus_Type != 100000001 --Exclude Influence
											AND A.Plus_SubType != 100000002 --Exclude Match
											AND B.New_Inst = ''LDSBC''
										GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
									) A						
							) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Given_This_Year_To_Ldsbc = S.Donor_Given_This_Year_To_Ldsbc
							;
							
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Given_This_Year_To_Ldsbc'', @Alpha_Step_Number = ''138X'', @Alpha_Step_Name = ''Donor_Given_This_Year_To_Ldsbc - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_16
		, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Telefund'', @Alpha_Step_Number = ''138H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1;
		' -- Attribute_17
		, ' ' -- Attribute_18
		, ' ' -- Attribute_19
		, ' ' -- Attribute_20
		, 'EXEC dbo.usp_Transform_Data @Transform_Data_Table_Name = ''_Telefund''; ------> HARDCODE <------
			' -- Attribute_21
		, 1 -- Active
		, GETDATE() -- Insert_Date
		, NULL  -- Update_Date                
	)	
 	,
-- --------------------------
-- Telefund 2
-- --------------------------
	('Post_Attributes' -- Dim_Object
		, '_Telefund2' -- Table_Name
		, '_Telefund2 INT
			' -- Create_Table
		, '_Telefund2
			' -- Insert_Fields
		, ' ' -- From_Statement
		, ' ' -- Where_Statement
		, 'DECLARE @TABLE_NAME NVARCHAR(100)
			SET @TABLE_NAME = ''_Telefund2'' ; ------> HARDCODE <------
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''139D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1; 
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''139D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_1
		, ' ' -- Attribute_2
		, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''139E'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1; 
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''139E'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_3
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Donor_Byu_Plc
							FROM _Association_Dim
							WHERE 1 = 1
								AND Association_Name = ''President''''s Leadership Council''
								AND StatusCode = ''Current''
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Byu_Plc = S.Donor_Byu_Plc
							;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Byu_Plc'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Byu_Plc - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_4
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Donor_Byuh_Plc
							FROM Ext_Psa
							WHERE 1 = 1 
								AND Psa_Code IN (''2DL01'', ''2DL02'',''2DL03'',''2DL04'',''2DL05'',''2DL06'') --BYUH PLC PSA Codes
								AND (Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) OR Psa_Eff_Thru IS NULL)
						UNION
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Donor_Byuh_Plc
							FROM _Association_Dim
							WHERE 1 = 1 
								AND Association_Name IN (''David O McKay Circle'', ''Genuine Gold Society'')
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Byuh_Plc = S.Donor_Byuh_Plc
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Byuh_Plc'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Byuh_Plc - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
			' -- Attribute_5
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Donor_Nac
							FROM Ext_Psa
							WHERE 1 = 1 
								AND Psa_Code IN (''1MV05'',''1MV26'', ''1MV07'')
								AND Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) 
						UNION
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Donor_Nac
							FROM _Association_Dim
							WHERE 1 = 1 
								AND Association_Name IN (''National Advisory Council'')
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Nac = S.Donor_Nac
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Nac'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Nac - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
			' -- Attribute_6
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
						SELECT DISTINCT ContactId AS Donor_Key
							, ''Y'' AS Donor_Byu_Law_Grads
							FROM _Alumni_Dim
							WHERE 1 = 1 
								AND New_University = ''BYU''
								AND College_Name = ''Law School, J. Reuben Clark''
								AND Plus_AlumniStatus = ''Graduated''
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Byu_Law_Grads = S.Donor_Byu_Law_Grads
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Byu_Law_Grads'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Byu_Law_Grads - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
			' -- Attribute_7
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT A.Plus_Constituent AS Donor_Key
								, ''Y'' AS Donor_Byu_Msm_Grads
								FROM Ext_Alumni A
									INNER JOIN Ext_Degree B ON A.Plus_Degree = B.New_DegreeId
								WHERE 1 = 1
									AND A.Plus_University = ''4229C3E3-2A45-4CD9-AD1E-AED5844676B0'' --BYU
									AND (CONVERT(NVARCHAR(100),A.Plus_College) = ''97CA0DC5-4B98-476B-B85D-32A65CF46CD0'' --Business, Marriott School of
											OR CONVERT(NVARCHAR(100),A.Plus_College) = ''9F5570ED-4C24-48D1-A1A9-7D8AD4EBBF'') --Business
									AND A.Plus_AlumniStatus = 100000000 --Graduated
									AND B.Plus_DegreeLevel = 100000000 --Graduate
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Byu_Msm_Grads = S.Donor_Byu_Msm_Grads
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Byu_Msm_Grads'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Byu_Msm_Grads - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_8
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
								, ''Y'' AS Donor_Open_Byu_Telefund_Pledge
								FROM Ext_Pledge A
									LEFT JOIN Ext_Institution D ON A.New_InstitutionalHierarchy = D.New_InstitutionId
								WHERE 1 = 1
									AND EXISTS
										(SELECT *
											FROM Ext_Campaign_Activity B
												LEFT JOIN Ext_Activity_Pointer C ON B.ActivityId = C.ActivityId	
											WHERE 1 = 1
												AND A.Plus_Appeal = B.ActivityId
												AND C.CampactChannelTypeCode = 1 -- Phone
												AND (B.Plus_CommunicationType = 100000009 OR B.Plus_CommunicationType = 100000019) -- Soliciation 
												AND A.StatusCode = 1 -- Outstanding
												AND A.New_BeginDate > DATEADD(MONTH,-6,GETDATE()) -- Dynamic 6 months from today
										)
									AND D.New_Inst = ''BYU''
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Open_Byu_Telefund_Pledge = S.Donor_Open_Byu_Telefund_Pledge
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Open_Byu_Telefund_Pledge'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Open_Byu_Telefund_Pledge - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_9		
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
								, ''Y'' AS Donor_Open_Byui_Telefund_Pledge
								FROM Ext_Pledge A
									LEFT JOIN Ext_Institution D ON A.New_InstitutionalHierarchy = D.New_InstitutionId
								WHERE 1 = 1
									AND EXISTS
										(SELECT *
											FROM Ext_Campaign_Activity B
												LEFT JOIN Ext_Activity_Pointer C ON B.ActivityId = C.ActivityId	
											WHERE 1 = 1
												AND A.Plus_Appeal = B.ActivityId
												AND C.CampactChannelTypeCode = 1 -- Phone
												AND (B.Plus_CommunicationType = 100000009 OR B.Plus_CommunicationType = 100000019) -- Soliciation 
												AND A.StatusCode = 1 -- Outstanding
												AND A.New_BeginDate > DATEADD(MONTH,-6,GETDATE()) -- Dynamic 6 months from today
										)
									AND D.New_Inst = ''BYUI''
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Open_Byui_Telefund_Pledge = S.Donor_Open_Byui_Telefund_Pledge
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Open_Byui_Telefund_Pledge'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Open_Byui_Telefund_Pledge - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_10
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
								, ''Y'' AS Donor_Open_Byuh_Telefund_Pledge
								FROM Ext_Pledge A
									LEFT JOIN Ext_Institution D ON A.New_InstitutionalHierarchy = D.New_InstitutionId
								WHERE 1 = 1
									AND EXISTS
										(SELECT *
											FROM Ext_Campaign_Activity B
												LEFT JOIN Ext_Activity_Pointer C ON B.ActivityId = C.ActivityId	
											WHERE 1 = 1
												AND A.Plus_Appeal = B.ActivityId
												AND C.CampactChannelTypeCode = 1 -- Phone
												AND (B.Plus_CommunicationType = 100000009 OR B.Plus_CommunicationType = 100000019) -- Soliciation 
												AND A.StatusCode = 1 -- Outstanding
												AND A.New_BeginDate > DATEADD(MONTH,-6,GETDATE()) -- Dynamic 6 months from today
										)
									AND D.New_Inst = ''BYUH''
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Open_Byuh_Telefund_Pledge = S.Donor_Open_Byuh_Telefund_Pledge
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Open_Byuh_Telefund_Pledge'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Open_Byuh_Telefund_Pledge - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_11
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
								, ''Y'' AS Donor_Open_Ldsbc_Telefund_Pledge
								FROM Ext_Pledge A
									LEFT JOIN Ext_Institution D ON A.New_InstitutionalHierarchy = D.New_InstitutionId
								WHERE 1 = 1
									AND EXISTS
										(SELECT *
											FROM Ext_Campaign_Activity B
												LEFT JOIN Ext_Activity_Pointer C ON B.ActivityId = C.ActivityId	
											WHERE 1 = 1
												AND A.Plus_Appeal = B.ActivityId
												AND C.CampactChannelTypeCode = 1 -- Phone
												AND (B.Plus_CommunicationType = 100000009 OR B.Plus_CommunicationType = 100000019) -- Soliciation 
												AND A.StatusCode = 1 -- Outstanding
												AND A.New_BeginDate > DATEADD(MONTH,-6,GETDATE()) -- Dynamic 6 months from today
										)
									AND D.New_Inst = ''LDSBC''
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Open_Ldsbc_Telefund_Pledge = S.Donor_Open_Ldsbc_Telefund_Pledge
							;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Open_Ldsbc_Telefund_Pledge'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Open_Ldsbc_Telefund_Pledge - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_12
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT A.Plus_Constituent AS Donor_Key
								, ''Y'' AS Donor_BYU_Recurring_Donor
								FROM Ext_Recurring_Gift_Rules A
								WHERE 1 = 1 
									AND EXISTS
										(SELECT *
											FROM Ext_Fund_Account B
												LEFT JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
											WHERE 1 = 1
												AND A.Plus_FundAccount = B.New_FundAccountId
												AND A.StatusCode <> 2 --all statuses except canceled.
												AND C.New_Inst = ''BYU''
										)
									AND NOT EXISTS
										(SELECT *
											FROM Ext_Recurring_Gift_Rules D
											WHERE 1 = 1
												AND A.Plus_RecurringGiftRulesId = D.Plus_RecurringGiftRulesId
												AND D.Plus_PaymentStop < CONVERT(NVARCHAR(10), GETDATE() -1, 112)
										) 
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_BYU_Recurring_Donor = S.Donor_BYU_Recurring_Donor
								;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_BYU_Recurring_Donor'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_BYU_Recurring_Donor - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_13
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT A.Plus_Constituent AS Donor_Key
								, ''Y'' AS Donor_BYUI_Recurring_Donor
								FROM Ext_Recurring_Gift_Rules A
								WHERE 1 = 1 
									AND EXISTS
										(SELECT *
											FROM Ext_Fund_Account B
												LEFT JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
											WHERE 1 = 1
												AND A.Plus_FundAccount = B.New_FundAccountId
												AND A.StatusCode <> 2 --all statuses except canceled.
												AND C.New_Inst = ''BYUI''
										)
									AND NOT EXISTS
										(SELECT *
											FROM Ext_Recurring_Gift_Rules D
											WHERE 1 = 1
												AND A.Plus_RecurringGiftRulesId = D.Plus_RecurringGiftRulesId
												AND D.Plus_PaymentStop < CONVERT(NVARCHAR(10), GETDATE() -1, 112)
										) 
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_BYUI_Recurring_Donor = S.Donor_BYUI_Recurring_Donor
								;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_BYUI_Recurring_Donor'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_BYUI_Recurring_Donor - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_14
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT A.Plus_Constituent AS Donor_Key
								, ''Y'' AS Donor_BYUH_Recurring_Donor
								FROM Ext_Recurring_Gift_Rules A
								WHERE 1 = 1 
									AND EXISTS
										(SELECT *
											FROM Ext_Fund_Account B
												LEFT JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
											WHERE 1 = 1
												AND A.Plus_FundAccount = B.New_FundAccountId
												AND A.StatusCode <> 2 --all statuses except canceled.
												AND C.New_Inst = ''BYUH''
										)
									AND NOT EXISTS
										(SELECT *
											FROM Ext_Recurring_Gift_Rules D
											WHERE 1 = 1
												AND A.Plus_RecurringGiftRulesId = D.Plus_RecurringGiftRulesId
												AND D.Plus_PaymentStop < CONVERT(NVARCHAR(10), GETDATE() -1, 112)
										)
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_BYUH_Recurring_Donor = S.Donor_BYUH_Recurring_Donor
								;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_BYUH_Recurring_Donor'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_BYUH_Recurring_Donor - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_15
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT DISTINCT A.Plus_Constituent AS Donor_Key
								, ''Y'' AS Donor_LDSBC_Recurring_Donor
								FROM Ext_Recurring_Gift_Rules A
								WHERE 1 = 1 
									AND EXISTS
										(SELECT *
											FROM Ext_Fund_Account B
												LEFT JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
											WHERE 1 = 1
												AND A.Plus_FundAccount = B.New_FundAccountId
												AND A.StatusCode <> 2 --all statuses except canceled.
												AND C.New_Inst = ''LDSBC''
										)
									AND NOT EXISTS
										(SELECT *
											FROM Ext_Recurring_Gift_Rules D
											WHERE 1 = 1
												AND A.Plus_RecurringGiftRulesId = D.Plus_RecurringGiftRulesId
												AND D.Plus_PaymentStop < CONVERT(NVARCHAR(10), GETDATE() -1, 112)
										) 
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_LDSBC_Recurring_Donor = S.Donor_LDSBC_Recurring_Donor
								;
							
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_LDSBC_Recurring_Donor'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_LDSBC_Recurring_Donor - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_16
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_Largest_Gift_Amt_Byu
								FROM _Donation_Fact A
									INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
								WHERE 1 = 1
									--AND A.Donation_Primary_Amt IS NOT NULL
									AND B.New_Inst = ''BYU''
								GROUP BY A.Donor_Key
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_Largest_Gift_Amt_Byu = S.Donor_Largest_Gift_Amt_Byu
								;						
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Largest_Gift_Amt_Byu'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Largest_Gift_Amt_Byu - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_17
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_Largest_Gift_Amt_Byui
								FROM _Donation_Fact A
									INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
								WHERE 1 = 1
									--AND A.Donation_Primary_Amt IS NOT NULL
									AND B.New_Inst = ''BYUI''
								GROUP BY A.Donor_Key
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_Largest_Gift_Amt_Byui = S.Donor_Largest_Gift_Amt_Byui
								;						
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Largest_Gift_Amt_Byui'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Largest_Gift_Amt_Byui - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
			' -- Attribute_18
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_Largest_Gift_Amt_Byuh
								FROM _Donation_Fact A
									INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
								WHERE 1 = 1
									--AND A.Donation_Primary_Amt IS NOT NULL
									AND B.New_Inst = ''BYUH''
								GROUP BY A.Donor_Key
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_Largest_Gift_Amt_Byuh = S.Donor_Largest_Gift_Amt_Byuh
								;						
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Largest_Gift_Amt_Byuh'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Largest_Gift_Amt_Byuh - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
			' -- Attribute_19
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (
							SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_Largest_Gift_Amt_Ldsbc
								FROM _Donation_Fact A
									INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
								WHERE 1 = 1
									--AND A.Donation_Primary_Amt IS NOT NULL
									AND B.New_Inst = ''LDSBC''
								GROUP BY A.Donor_Key
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_Largest_Gift_Amt_Ldsbc = S.Donor_Largest_Gift_Amt_Ldsbc
								;						
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Largest_Gift_Amt_Ldsbc'', @Alpha_Step_Number = ''139X'', @Alpha_Step_Name = ''Donor_Largest_Gift_Amt_Ldsbc - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Telefund2'', @Alpha_Step_Number = ''139H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1;
			' -- Attribute_20
		, 'EXEC dbo.usp_Transform_Data @Transform_Data_Table_Name = ''_Telefund2''; ------> HARDCODE <------
			' -- Attribute_21
		, 1 -- Active
		, GETDATE() -- Insert_Date
		, NULL  -- Update_Date                
	)
	,
-- --------------------------
-- _Total_Giving_2
-- --------------------------
	('Post_Attributes' -- Dim_Object
		, '_Total_Giving_2' -- Table_Name
		, '_Total_Giving_2 INT
			' -- Create_Table
		, '_Total_Giving_2
			' -- Insert_Fields
		, ' ' -- From_Statement
		, ' ' -- Where_Statement
		, 'DECLARE @TABLE_NAME NVARCHAR(100)
			SET @TABLE_NAME = ''_Total_Giving_2'' ; ------> HARDCODE <------
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''146D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1; 
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''146D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_1
		, ' ' -- Attribute_2
		, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''146E'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1; 
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''146E'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_3
		, '
			' -- Attribute_4
		, ' 
			' -- Attribute_5
		, '
			' -- Attribute_6
		, '
			' -- Attribute_7
		, '
			' -- Attribute_8
		, '
			' -- Attribute_9		
		, '
			' -- Attribute_10
		, '
			' -- Attribute_11
		, '
			' -- Attribute_12
		, '
			' -- Attribute_13
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (SELECT DISTINCT Donor_Key
							, ''Y'' AS Donor_Total_Giving_Byu_High_Flag
							FROM
							(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byu_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) -- Beginning of this year -1
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112) -- End of this year -1
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYU''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byu_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112) -- Beginning of this year -2
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112) -- End of this year -2
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYU''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byu_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) -- Beginning of this year -3
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) -- End of this year -3
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYU''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byu_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) -- Beginning of this year -4
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112) -- End of this year -4
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYU''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byu_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) -- Beginning of this year -5
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112) -- End of this year -5
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYU''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							) A						
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Total_Giving_Byu_High_Flag = S.Donor_Total_Giving_Byu_High_Flag
							;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Giving_Byu_High_Flag'', @Alpha_Step_Number = ''146X'', @Alpha_Step_Name = ''Donor_Total_Giving_Byu_High_Flag - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_14
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (SELECT DISTINCT Donor_Key
							, ''Y'' AS Donor_Total_Giving_Byui_High_Flag
							FROM
							(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byui_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) -- Beginning of this year -1
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112) -- End of this year -1
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUI''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byui_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112) -- Beginning of this year -2
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112) -- End of this year -2
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUI''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byui_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) -- Beginning of this year -3
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) -- End of this year -3
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUI''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byui_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) -- Beginning of this year -4
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112) -- End of this year -4
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUI''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byui_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) -- Beginning of this year -5
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112) -- End of this year -5
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUI''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							) A						
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Total_Giving_Byui_High_Flag = S.Donor_Total_Giving_Byui_High_Flag
							;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Giving_Byui_High_Flag'', @Alpha_Step_Number = ''146X'', @Alpha_Step_Name = ''Donor_Total_Giving_Byui_High_Flag - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_15
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (SELECT DISTINCT Donor_Key
							, ''Y'' AS Donor_Total_Giving_Byuh_High_Flag
							FROM
							(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byuh_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) -- Beginning of this year -1
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112) -- End of this year -1
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUH''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byuh_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112) -- Beginning of this year -2
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112) -- End of this year -2
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUH''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byuh_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) -- Beginning of this year -3
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) -- End of this year -3
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUH''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byuh_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) -- Beginning of this year -4
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112) -- End of this year -4
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUH''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Byuh_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) -- Beginning of this year -5
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112) -- End of this year -5
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUH''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							) A						
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Total_Giving_Byuh_High_Flag = S.Donor_Total_Giving_Byuh_High_Flag
							;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Giving_Byuh_High_Flag'', @Alpha_Step_Number = ''146X'', @Alpha_Step_Name = ''Donor_Total_Giving_Byuh_High_Flag - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_16
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (SELECT DISTINCT Donor_Key
							, ''Y'' AS Donor_Total_Giving_Ldsbc_High_Flag
							FROM
							(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Ldsbc_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) -- Beginning of this year -1
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112) -- End of this year -1
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''LDSBC''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Ldsbc_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112) -- Beginning of this year -2
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112) -- End of this year -2
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''LDSBC''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Ldsbc_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) -- Beginning of this year -3
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) -- End of this year -3
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''LDSBC''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Ldsbc_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) -- Beginning of this year -4
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112) -- End of this year -4
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''LDSBC''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							UNION
							SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS Donor_Key 
								, SUM(A.New_CreditAmount) AS Donor_Total_Giving_Ldsbc_High_Flag
								FROM dbo._Gift_Credit_ A
									INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) -- Beginning of this year -5
																AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112) -- End of this year -5
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''LDSBC''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
								HAVING SUM(A.New_CreditAmount) BETWEEN 500 AND 5000
							) A						
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Total_Giving_Ldsbc_High_Flag = S.Donor_Total_Giving_Ldsbc_High_Flag
							;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Giving_Ldsbc_High_Flag'', @Alpha_Step_Number = ''146X'', @Alpha_Step_Name = ''Donor_Total_Giving_Ldsbc_High_Flag - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_17
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (SELECT DISTINCT ContactId AS Donor_Key
								FROM _Employment_Dim A
									LEFT JOIN _Hier_Dim B ON CONVERT(NVARCHAR(100),A.New_InstitutionalHierarchyId) = CONVERT(NVARCHAR(100),B.Hier_Key)
								WHERE 1 = 1
									AND B.New_Inst = ''BYU''
									AND A.StatusCode = ''Current''
									AND A.Church_Affiliated = ''Y''
									AND A.Church_Employment_Status IN (''Full-time'',''Part-time'')					
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Current_Byu_Employment_Yn = ''Y''
							;
				MERGE INTO _Donor_Dim T
					USING (SELECT DISTINCT ContactId AS Donor_Key
								FROM _Employment_Dim A
									LEFT JOIN _Hier_Dim B ON CONVERT(NVARCHAR(100),A.New_InstitutionalHierarchyId) = CONVERT(NVARCHAR(100),B.Hier_Key)
								WHERE 1 = 1
									AND B.New_Inst = ''BYUI''
									AND A.StatusCode = ''Current''
									AND A.Church_Affiliated = ''Y''
									AND A.Church_Employment_Status IN (''Full-time'',''Part-time'')					
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Current_Byui_Employment_Yn = ''Y''
							;
				MERGE INTO _Donor_Dim T
					USING (SELECT DISTINCT ContactId AS Donor_Key
								FROM _Employment_Dim A
									LEFT JOIN _Hier_Dim B ON CONVERT(NVARCHAR(100),A.New_InstitutionalHierarchyId) = CONVERT(NVARCHAR(100),B.Hier_Key)
								WHERE 1 = 1
									AND B.New_Inst = ''BYUH''
									AND A.StatusCode = ''Current''
									AND A.Church_Affiliated = ''Y''
									AND A.Church_Employment_Status IN (''Full-time'',''Part-time'')					
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Current_Byuh_Employment_Yn = ''Y''
							;
				MERGE INTO _Donor_Dim T
					USING (SELECT DISTINCT ContactId AS Donor_Key
								FROM _Employment_Dim A
									LEFT JOIN _Hier_Dim B ON CONVERT(NVARCHAR(100),A.New_InstitutionalHierarchyId) = CONVERT(NVARCHAR(100),B.Hier_Key)
								WHERE 1 = 1
									AND B.New_Inst = ''LDSBC''
									AND A.StatusCode = ''Current''
									AND A.Church_Affiliated = ''Y''
									AND A.Church_Employment_Status IN (''Full-time'',''Part-time'')					
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Current_Ldsbc_Employment_Yn = ''Y''
							;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Giving_Ldsbc_High_Flag'', @Alpha_Step_Number = ''146X'', @Alpha_Step_Name = ''Donor_Total_Giving_Ldsbc_High_Flag - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_18
		, 'BEGIN TRY
				MERGE INTO _Donor_Dim T
					USING (SELECT DISTINCT Donor_Key
								, CASE WHEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) IS NOT NULL
											AND COALESCE(Plus_SpousePreferredFirstName,Spouse_First_Name) IS NOT NULL
											AND COALESCE(Plus_PreferredLastName,Donor_Last_Name) IS NOT NULL
											AND Donor_Marriage_Status = ''Married''
											THEN CONCAT(COALESCE(Plus_PreferredFirstName,Donor_First_Name),'' & '',COALESCE(Plus_SpousePreferredFirstName,Spouse_First_Name), '' '',COALESCE(Plus_PreferredLastName,Donor_Last_Name)) 
										WHEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) IS NOT NULL
											AND COALESCE(Plus_SpousePreferredFirstName,Spouse_First_Name) IS NULL
											AND COALESCE(Plus_PreferredLastName,Donor_Last_Name) IS NOT NULL
											THEN CONCAT(COALESCE(Plus_PreferredFirstName,Donor_First_Name),'' '',COALESCE(Plus_PreferredLastName,Donor_Last_Name)) 	
										WHEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) IS NOT NULL
											AND COALESCE(Plus_SpousePreferredFirstName,Spouse_First_Name) IS NOT NULL
											AND COALESCE(Plus_PreferredLastName,Donor_Last_Name) IS NOT NULL
											AND Donor_Marriage_Status != ''Married''
											THEN CONCAT(COALESCE(Plus_PreferredFirstName,Donor_First_Name),'' '',COALESCE(Plus_PreferredLastName,Donor_Last_Name))
										WHEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) IS NOT NULL
											AND COALESCE(Plus_SpousePreferredFirstName,Spouse_First_Name) IS NOT NULL
											AND COALESCE(Plus_PreferredLastName,Donor_Last_Name) IS NOT NULL
											AND Donor_Marriage_Status IS NULL
											THEN CONCAT(COALESCE(Plus_PreferredFirstName,Donor_First_Name),'' '',COALESCE(Plus_PreferredLastName,Donor_Last_Name))
										END AS Informal_Mailing_Name
								FROM _Donor_Dim				
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Informal_Mailing_Name = S.Informal_Mailing_Name
							;
				MERGE INTO _Donor_Dim T
					USING (SELECT DISTINCT Donor_Key
								, CASE WHEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) IS NOT NULL
											AND COALESCE(Plus_SpousePreferredFirstName,Spouse_First_Name) IS NOT NULL
											AND Donor_Marriage_Status = ''Married''
											THEN CONCAT(COALESCE(Plus_PreferredFirstName,Donor_First_Name),'' and '',COALESCE(Plus_SpousePreferredFirstName,Spouse_First_Name)) 
										WHEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) IS NOT NULL
											AND COALESCE(Plus_SpousePreferredFirstName,Spouse_First_Name) IS NULL
											THEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) 	
										WHEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) IS NOT NULL
											AND COALESCE(Plus_SpousePreferredFirstName,Spouse_First_Name) IS NOT NULL
											AND Donor_Marriage_Status != ''Married''
											THEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) 
										WHEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) IS NOT NULL
											AND COALESCE(Plus_SpousePreferredFirstName,Spouse_First_Name) IS NOT NULL
											AND Donor_Marriage_Status IS NULL
											THEN COALESCE(Plus_PreferredFirstName,Donor_First_Name) 
										END AS Informal_Salutation
								FROM _Donor_Dim				
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Informal_Salutation = S.Informal_Salutation
							;
				MERGE INTO _Donor_Dim T
					USING (
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Byu_Night_Society_Member
							FROM Ext_Psa
							WHERE 1 = 1 
								AND Psa_Code IN (''JK003'') -- Byu_Night_Society_Member PSA Codes
								AND (Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) OR Psa_Eff_Thru IS NULL)  -- Currently a member
						UNION
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Byu_Night_Society_Member 
							FROM _Association_Dim
							WHERE 1 = 1 
								AND Association_Name = ''BYU Knight Society''
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Byu_Night_Society_Member = ''Y''
							;
				MERGE INTO _Donor_Dim T
					USING (
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Byui_Legacy_Society_Member
							FROM Ext_Psa
							WHERE 1 = 1 
								AND Psa_Code IN (''6LS01'') -- Byui_Legacy_Society_Member PSA Codes
								AND (Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) OR Psa_Eff_Thru IS NULL)  -- Currently a member
						UNION
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Byui_Legacy_Society_Member 
							FROM _Association_Dim
							WHERE 1 = 1 
								AND Association_Name = ''BYUI Legacy Society''
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Byui_Legacy_Society_Member = ''Y''
							;
				MERGE INTO _Donor_Dim T
					USING (
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Byuh_Cowley_Society_Member
							FROM Ext_Psa
							WHERE 1 = 1 
								AND Psa_Code IN (''1DC01'') -- Byuh_Cowley_Society_Member PSA Codes
								AND (Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) OR Psa_Eff_Thru IS NULL)  -- Currently a member
						UNION
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Byuh_Cowley_Society_Member
							FROM _Association_Dim
							WHERE 1 = 1 
								AND Association_Name = ''BYUH Cowley Society''
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Byuh_Cowley_Society_Member = ''Y''
							;
				MERGE INTO _Donor_Dim T
					USING (
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Ldsbc_Fox_Society_Member
							FROM Ext_Psa
							WHERE 1 = 1 
								AND Psa_Code IN (''FXMBR'') -- Ldsbc_Fox_Society_Member PSA Codes
								AND (Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) OR Psa_Eff_Thru IS NULL)  -- Currently a member
						UNION
						SELECT ContactId AS Donor_Key
							, ''Y'' AS Ldsbc_Fox_Society_Member
							FROM _Association_Dim
							WHERE 1 = 1 
								AND Association_Name = ''LDSBC Fox Society''
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Ldsbc_Fox_Society_Member = ''Y''
							;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Informal_Mailing'', @Alpha_Step_Number = ''146X'', @Alpha_Step_Name = ''Informal_Mailing - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_19
		, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Total_Giving_2'', @Alpha_Step_Number = ''146H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1; 
			' -- Attribute_20
		, 'EXEC dbo.usp_Transform_Data @Transform_Data_Table_Name = ''_Total_Giving_2''; ------> HARDCODE <------
			' -- Attribute_21
		, 1 -- Active
		, GETDATE() -- Insert_Date
		, NULL  -- Update_Date                
	)
	,
-- --------------------------
-- _Reporting_Group_Dim Table
-- --------------------------
	('Dim' -- Dim_Object
		, '_Reporting_Group_Dim' -- Table_Name
		, 'Reporting_Group_Key INT PRIMARY KEY
			, Reporting_Group_Name NVARCHAR(100)
			, Reporting_Group_Tab INT
			, Reporting_Group_Inst NVARCHAR(100)
			, Reporting_Group_Primary_Hier_Name NVARCHAR(100)
			, Reporting_Group_Additional_Hier_Names NVARCHAR(4000)
			, Reporting_Group_Cip_Yearly_Goal_Amt MONEY
			' -- Create_Table
		, 'Reporting_Group_Key
			, Reporting_Group_Name
			, Reporting_Group_Tab
			, Reporting_Group_Inst
			, Reporting_Group_Primary_Hier_Name
			, Reporting_Group_Additional_Hier_Names
			, Reporting_Group_Cip_Yearly_Goal_Amt
			' -- Insert_Fields
		, ' ' -- From_Statement
		, ' ' -- Where_Statement
		, 'DECLARE @TABLE_NAME NVARCHAR(100)
			SET @TABLE_NAME = ''_Reporting_Group_Dim'' ; ------> HARDCODE <------
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''155D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1;
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''155D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_1
		, '
			' -- Attribute_2
		, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''155F'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1; 							
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''155F'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
			' -- Attribute_3
		, 'BEGIN TRY                                      
				DECLARE @TABLE_CNT1 AS VARCHAR(100)                                
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Reporting_Group_Dim'', @Alpha_Step_Number = ''155G'', @Alpha_Step_Name = ''Dim Tables - Transform - Begin'', @Alpha_Result = 1;                                    		
					INSERT INTO _Reporting_Group_Dim (
						Reporting_Group_Key
						, Reporting_Group_Name
						, Reporting_Group_Tab
						, Reporting_Group_Inst
						, Reporting_Group_Primary_Hier_Name
						, Reporting_Group_Additional_Hier_Names
						, Reporting_Group_Cip_Yearly_Goal_Amt
					)
					VALUES
						(100002,''BYU'',2,''BYU'',''BYU'',''(All with an institution name of BYU)'',NULL)
						, (100003,''BYUI'',3,''BYUI'',''BYUI'',''(All with an institution name of BYUI)'',NULL)
						, (100004,''BYUH'',4,''BYUH'',''BYUH'',''(All with an institution name of BYUH)'',NULL)
						, (100005,''LDSBC'',5,''LDSBC'',''LDSBC'',''(All with an institution name of LDSBC)'',NULL)
						, (100006,''HUMAN'',6,''Church'',''Church - Humanitarian - General'',''Church - Humanitarian - Benson Institute'',NULL)
						, (100007,''PEF'',7,''Church'',''Church - Self-Reliance Services'',NULL,NULL)
						, (100008,''MISSIONARY'',8,''Church'',''Church - Missionary'',NULL,NULL)
						, (100009,''FAMILY SEARCH'',9,''Church'',''Church - FamilySearch'',''Church - Church History'',NULL)
						, (100010,''CHURCH GENERAL'',10,''Church'',''Church - General'',NULL,NULL)
						, (100011,''S&I'',11,''CES'',''CES - General'',NULL,NULL)
						, (100012,''PCC'',12,''PCC'',''PCC - General'',NULL,NULL)
						, (100013,''TEMPLE PATRON'',13,''Church'',''Church - Temples'',NULL,NULL)
						, (0,NULL,NULL,NULL,NULL,NULL,NULL)
				SELECT @TABLE_CNT1 = (SELECT CONVERT(NVARCHAR(100),COUNT(*)) FROM _Reporting_Group_Dim)
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Reporting_Group_Dim'', @Alpha_Step_Number = ''155G'', @Alpha_Step_Name = ''Dim Temp Table - Count'', @Alpha_Count = @TABLE_CNT1, @Alpha_Result = 1;
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Reporting_Group_Dim'', @Alpha_Step_Number = ''155G'', @Alpha_Step_Name = ''Dim Table - Transform - End'', @Alpha_Result = 1;
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Reporting_Group_Dim'', @Alpha_Step_Number = ''155X'', @Alpha_Step_Name = ''Dim Table - Transform - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH
			' -- Attribute_4
		, 'BEGIN TRY
					MERGE INTO _Reporting_Group_Dim T
						USING (
							SELECT Reporting_Group_Key
								, CASE WHEN Reporting_Group_Name = ''BYUH'' THEN 11525000  ---------->  HARD CODED  <----------  
										WHEN Reporting_Group_Name = ''BYUI'' THEN 11525000  ---------->  HARD CODED  <----------
										WHEN Reporting_Group_Name = ''FAMILY SEARCH'' THEN 4000000  ---------->  HARD CODED  <----------
										WHEN Reporting_Group_Name = ''CHURCH GENERAL'' THEN 12300000  ---------->  HARD CODED  <----------
										WHEN Reporting_Group_Name = ''HUMAN'' THEN 25000000  ---------->  HARD CODED  <----------
										WHEN Reporting_Group_Name = ''MISSIONARY'' THEN 10000000  ---------->  HARD CODED  <----------
										WHEN Reporting_Group_Name = ''PEF'' THEN 5000000  ---------->  HARD CODED  <----------
										WHEN Reporting_Group_Name = ''LDSBC'' THEN 1800000  ---------->  HARD CODED  <----------
									ELSE NULL END AS Reporting_Group_Cip_Yearly_Goal_Amt
								FROM _Reporting_Group_Dim
							) S ON T.Reporting_Group_Key = S.Reporting_Group_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Reporting_Group_Cip_Yearly_Goal_Amt = S.Reporting_Group_Cip_Yearly_Goal_Amt
								;
			END TRY 
			BEGIN CATCH
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''CIP Yearly Goal'', @Alpha_Step_Number = ''155X'', @Alpha_Step_Name = ''CIP Yearly Goal - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH		
			' -- Attribute_5
		, '	
			' -- Attribute_6
		, '
			' -- Attribute_7
		, '
			' -- Attribute_8
		, '
			' -- Attribute_9
		, '
			' -- Attribute_10
		, '
			' -- Attribute_11
		, ' ' -- Attribute_12
		, ' ' -- Attribute_13
		, ' ' -- Attribute_14
		, ' ' -- Attribute_15
		, ' ' -- Attribute_16
		, ' ' -- Attribute_17
		, ' ' -- Attribute_18
		, ' ' -- Attribute_19
		, 'DECLARE @TABLE_NAME NVARCHAR(100)
			SET @TABLE_NAME = ''_Reporting_Group_Dim'' ; ------> HARDCODE <------ 
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''155H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1; 
			' -- Attribute_20
		, 'EXEC dbo.usp_Transform_Data @Transform_Data_Table_Name = ''_Reporting_Group_Dim''; ------> HARDCODE <------
			' -- Attribute_21
		, 1 -- Active
		, GETDATE() -- Insert_Date
		, NULL  -- Update_Date                
	)	
	,
-- --------------------------
-- _Merge_Into_Donor_Dim Table
-- --------------------------
('Post_Attributes' -- Dim_Object
	, '_Merge_Into_Donor_Dim' -- Table_Name
	, '_Merge_Into_Donor_Dim INT' -- Create_Table
	, '_Merge_Into_Donor_Dim' -- Insert_Fields
	, ' ' -- From_Statement
	, ' ' -- Where_Statement
	, 'DECLARE @TABLE_NAME NVARCHAR(100)
		SET @TABLE_NAME = ''_Merge_Into_Donor_Dim'' ; ------> HARDCODE <------
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''158D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1;
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''158D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_1
	, '
		' -- Attribute_2
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''158F'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1; 							
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''158F'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_3
	, '
	BEGIN TRY
		MERGE INTO _Donor_Dim T
			USING (
					SELECT ContactId AS Donor_Key
						FROM
							(SELECT DISTINCT F.PartyID AS ContactId
								FROM Ext_Campaign_Response A 													--bridge table, used to connect the appealresponseactivity to campaignactivity and to the activityparty
									INNER JOIN Ext_Activity_Pointer B ON B.ActivityId = A.ActivityId  			--joining CampaignResponseBase bridge table to the activitypointer table get the CampaignResponseBase data
									INNER JOIN Ext_Campaign_Activity C ON C.ActivityId = A.Plus_CampaignAppeal 	--joining CampaignResponseBase bridge table to campaignactivity to get the appeal data
									INNER JOIN Ext_Activity_Pointer D ON C.ActivityId = D.ActivityId 			--joining campaignactivity (appeal) to the activitypointer table to get the complete appeal data, (mainly for the campactchanneltypecode)
									INNER JOIN Ext_Campaign E ON E.CampaignId = B.RegardingObjectId and B.regardingobjecttypecode = 4400 --joining CampaignResponseBase activitypointer to the campaign table to get the campaign information.
									INNER JOIN Ext_Activity F ON F.ActivityId = A.ActivityId 				--joining the CampaignResponseBase table to the activityparty table to get the constituent/organization data.
									INNER JOIN Ext_Institution G ON C.Plus_InstitutionalHierarchy = G.New_InstitutionId
								WHERE 1 = 1
									AND D.CampactChannelTypeCode = 1 											--phone
									AND B.CreatedOn > DATEADD(m,-3,GETDATE()) 									--any record which was created in the last 3 months.
									AND F.PartyObjectTypeCode IN (2) 
									AND G.New_Inst = ''BYU''											--1 Organizations(Accounts) 2 Constituents (Contact)
							UNION
							SELECT Relationship_ContactId AS ContactId
								FROM _Connection_Dim CD
								WHERE 1 = 1 
									AND EXISTS
										(SELECT *
											FROM Ext_Campaign_Response A 													--bridge table, used to connect the appealresponseactivity to campaignactivity and to the activityparty
												INNER JOIN Ext_Activity_Pointer B ON B.ActivityId = A.ActivityId  			--joining CampaignResponseBase bridge table to the activitypointer table get the CampaignResponseBase data
												INNER JOIN Ext_Campaign_Activity C ON C.ActivityId = A.Plus_CampaignAppeal 	--joining CampaignResponseBase bridge table to campaignactivity to get the appeal data
												INNER JOIN Ext_Activity_Pointer D ON C.ActivityId = D.ActivityId 			--joining campaignactivity (appeal) to the activitypointer table to get the complete appeal data, (mainly for the campactchanneltypecode)
												INNER JOIN Ext_Campaign E ON E.CampaignId = B.RegardingObjectId and B.regardingobjecttypecode = 4400 --joining CampaignResponseBase activitypointer to the campaign table to get the campaign information.
												INNER JOIN Ext_Activity F ON F.ActivityId = A.ActivityId 				--joining the CampaignResponseBase table to the activityparty table to get the constituent/organization data.
												INNER JOIN Ext_Institution G ON C.Plus_InstitutionalHierarchy = G.New_InstitutionId
											WHERE 1 = 1
												AND CD.ContactId = F.PartyId
												AND D.CampactChannelTypeCode = 1 											--phone
												AND B.CreatedOn > DATEADD(m,-3,GETDATE()) 									--any record which was created in the last 3 months.
												AND F.PartyObjectTypeCode IN (2)
												AND G.New_Inst = ''BYU''											--1 Organizations(Accounts) 2 Constituents (Contact)
										) 
								AND Relationship = ''Spouse''
							) A
						WHERE 1 = 1 
							AND ContactId IS NOT NULL
					) S ON T.Donor_Key = S.Donor_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Previously_Contacted_Byu_Yn = ''Y''
					;
		MERGE INTO _Donor_Dim T
			USING (
					SELECT ContactId AS Donor_Key
						FROM
							(SELECT DISTINCT F.PartyID AS ContactId
								FROM Ext_Campaign_Response A 													--bridge table, used to connect the appealresponseactivity to campaignactivity and to the activityparty
									INNER JOIN Ext_Activity_Pointer B ON B.ActivityId = A.ActivityId  			--joining CampaignResponseBase bridge table to the activitypointer table get the CampaignResponseBase data
									INNER JOIN Ext_Campaign_Activity C ON C.ActivityId = A.Plus_CampaignAppeal 	--joining CampaignResponseBase bridge table to campaignactivity to get the appeal data
									INNER JOIN Ext_Activity_Pointer D ON C.ActivityId = D.ActivityId 			--joining campaignactivity (appeal) to the activitypointer table to get the complete appeal data, (mainly for the campactchanneltypecode)
									INNER JOIN Ext_Campaign E ON E.CampaignId = B.RegardingObjectId and B.regardingobjecttypecode = 4400 --joining CampaignResponseBase activitypointer to the campaign table to get the campaign information.
									INNER JOIN Ext_Activity F ON F.ActivityId = A.ActivityId 				--joining the CampaignResponseBase table to the activityparty table to get the constituent/organization data.
									INNER JOIN Ext_Institution G ON C.Plus_InstitutionalHierarchy = G.New_InstitutionId
								WHERE 1 = 1
									AND D.CampactChannelTypeCode = 1 											--phone
									AND B.CreatedOn > DATEADD(m,-3,GETDATE()) 									--any record which was created in the last 3 months.
									AND F.PartyObjectTypeCode IN (2) 
									AND G.New_Inst = ''BYUI''											--1 Organizations(Accounts) 2 Constituents (Contact)
							UNION
							SELECT Relationship_ContactId AS ContactId
								FROM _Connection_Dim CD
								WHERE 1 = 1 
									AND EXISTS
										(SELECT *
											FROM Ext_Campaign_Response A 													--bridge table, used to connect the appealresponseactivity to campaignactivity and to the activityparty
												INNER JOIN Ext_Activity_Pointer B ON B.ActivityId = A.ActivityId  			--joining CampaignResponseBase bridge table to the activitypointer table get the CampaignResponseBase data
												INNER JOIN Ext_Campaign_Activity C ON C.ActivityId = A.Plus_CampaignAppeal 	--joining CampaignResponseBase bridge table to campaignactivity to get the appeal data
												INNER JOIN Ext_Activity_Pointer D ON C.ActivityId = D.ActivityId 			--joining campaignactivity (appeal) to the activitypointer table to get the complete appeal data, (mainly for the campactchanneltypecode)
												INNER JOIN Ext_Campaign E ON E.CampaignId = B.RegardingObjectId and B.regardingobjecttypecode = 4400 --joining CampaignResponseBase activitypointer to the campaign table to get the campaign information.
												INNER JOIN Ext_Activity F ON F.ActivityId = A.ActivityId 				--joining the CampaignResponseBase table to the activityparty table to get the constituent/organization data.
												INNER JOIN Ext_Institution G ON C.Plus_InstitutionalHierarchy = G.New_InstitutionId
											WHERE 1 = 1
												AND CD.ContactId = F.PartyId
												AND D.CampactChannelTypeCode = 1 											--phone
												AND B.CreatedOn > DATEADD(m,-3,GETDATE()) 									--any record which was created in the last 3 months.
												AND F.PartyObjectTypeCode IN (2)
												AND G.New_Inst = ''BYUI''											--1 Organizations(Accounts) 2 Constituents (Contact)
										) 
								AND Relationship = ''Spouse''
							) A
						WHERE 1 = 1 
							AND ContactId IS NOT NULL
					) S ON T.Donor_Key = S.Donor_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Previously_Contacted_Byui_Yn = ''Y''
					;
		MERGE INTO _Donor_Dim T
			USING (
					SELECT ContactId AS Donor_Key
						FROM
							(SELECT DISTINCT F.PartyID AS ContactId
								FROM Ext_Campaign_Response A 													--bridge table, used to connect the appealresponseactivity to campaignactivity and to the activityparty
									INNER JOIN Ext_Activity_Pointer B ON B.ActivityId = A.ActivityId  			--joining CampaignResponseBase bridge table to the activitypointer table get the CampaignResponseBase data
									INNER JOIN Ext_Campaign_Activity C ON C.ActivityId = A.Plus_CampaignAppeal 	--joining CampaignResponseBase bridge table to campaignactivity to get the appeal data
									INNER JOIN Ext_Activity_Pointer D ON C.ActivityId = D.ActivityId 			--joining campaignactivity (appeal) to the activitypointer table to get the complete appeal data, (mainly for the campactchanneltypecode)
									INNER JOIN Ext_Campaign E ON E.CampaignId = B.RegardingObjectId and B.regardingobjecttypecode = 4400 --joining CampaignResponseBase activitypointer to the campaign table to get the campaign information.
									INNER JOIN Ext_Activity F ON F.ActivityId = A.ActivityId 				--joining the CampaignResponseBase table to the activityparty table to get the constituent/organization data.
									INNER JOIN Ext_Institution G ON C.Plus_InstitutionalHierarchy = G.New_InstitutionId
								WHERE 1 = 1
									AND D.CampactChannelTypeCode = 1 											--phone
									AND B.CreatedOn > DATEADD(m,-3,GETDATE()) 									--any record which was created in the last 3 months.
									AND F.PartyObjectTypeCode IN (2) 
									AND G.New_Inst = ''BYUH''											--1 Organizations(Accounts) 2 Constituents (Contact)
							UNION
							SELECT Relationship_ContactId AS ContactId
								FROM _Connection_Dim CD
								WHERE 1 = 1 
									AND EXISTS
										(SELECT *
											FROM Ext_Campaign_Response A 													--bridge table, used to connect the appealresponseactivity to campaignactivity and to the activityparty
												INNER JOIN Ext_Activity_Pointer B ON B.ActivityId = A.ActivityId  			--joining CampaignResponseBase bridge table to the activitypointer table get the CampaignResponseBase data
												INNER JOIN Ext_Campaign_Activity C ON C.ActivityId = A.Plus_CampaignAppeal 	--joining CampaignResponseBase bridge table to campaignactivity to get the appeal data
												INNER JOIN Ext_Activity_Pointer D ON C.ActivityId = D.ActivityId 			--joining campaignactivity (appeal) to the activitypointer table to get the complete appeal data, (mainly for the campactchanneltypecode)
												INNER JOIN Ext_Campaign E ON E.CampaignId = B.RegardingObjectId and B.regardingobjecttypecode = 4400 --joining CampaignResponseBase activitypointer to the campaign table to get the campaign information.
												INNER JOIN Ext_Activity F ON F.ActivityId = A.ActivityId 				--joining the CampaignResponseBase table to the activityparty table to get the constituent/organization data.
												INNER JOIN Ext_Institution G ON C.Plus_InstitutionalHierarchy = G.New_InstitutionId
											WHERE 1 = 1
												AND CD.ContactId = F.PartyId
												AND D.CampactChannelTypeCode = 1 											--phone
												AND B.CreatedOn > DATEADD(m,-3,GETDATE()) 									--any record which was created in the last 3 months.
												AND F.PartyObjectTypeCode IN (2)
												AND G.New_Inst = ''BYUH''											--1 Organizations(Accounts) 2 Constituents (Contact)
										) 
								AND Relationship = ''Spouse''
							) A
						WHERE 1 = 1 
							AND ContactId IS NOT NULL
					) S ON T.Donor_Key = S.Donor_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Previously_Contacted_Byuh_Yn = ''Y''
					;
		MERGE INTO _Donor_Dim T
			USING (
					SELECT ContactId AS Donor_Key
						FROM
							(SELECT DISTINCT F.PartyID AS ContactId
								FROM Ext_Campaign_Response A 													--bridge table, used to connect the appealresponseactivity to campaignactivity and to the activityparty
									INNER JOIN Ext_Activity_Pointer B ON B.ActivityId = A.ActivityId  			--joining CampaignResponseBase bridge table to the activitypointer table get the CampaignResponseBase data
									INNER JOIN Ext_Campaign_Activity C ON C.ActivityId = A.Plus_CampaignAppeal 	--joining CampaignResponseBase bridge table to campaignactivity to get the appeal data
									INNER JOIN Ext_Activity_Pointer D ON C.ActivityId = D.ActivityId 			--joining campaignactivity (appeal) to the activitypointer table to get the complete appeal data, (mainly for the campactchanneltypecode)
									INNER JOIN Ext_Campaign E ON E.CampaignId = B.RegardingObjectId and B.regardingobjecttypecode = 4400 --joining CampaignResponseBase activitypointer to the campaign table to get the campaign information.
									INNER JOIN Ext_Activity F ON F.ActivityId = A.ActivityId 				--joining the CampaignResponseBase table to the activityparty table to get the constituent/organization data.
									INNER JOIN Ext_Institution G ON C.Plus_InstitutionalHierarchy = G.New_InstitutionId
								WHERE 1 = 1
									AND D.CampactChannelTypeCode = 1 											--phone
									AND B.CreatedOn > DATEADD(m,-3,GETDATE()) 									--any record which was created in the last 3 months.
									AND F.PartyObjectTypeCode IN (2) 
									AND G.New_Inst = ''LDSBC''											--1 Organizations(Accounts) 2 Constituents (Contact)
							UNION
							SELECT Relationship_ContactId AS ContactId
								FROM _Connection_Dim CD
								WHERE 1 = 1 
									AND EXISTS
										(SELECT *
											FROM Ext_Campaign_Response A 													--bridge table, used to connect the appealresponseactivity to campaignactivity and to the activityparty
												INNER JOIN Ext_Activity_Pointer B ON B.ActivityId = A.ActivityId  			--joining CampaignResponseBase bridge table to the activitypointer table get the CampaignResponseBase data
												INNER JOIN Ext_Campaign_Activity C ON C.ActivityId = A.Plus_CampaignAppeal 	--joining CampaignResponseBase bridge table to campaignactivity to get the appeal data
												INNER JOIN Ext_Activity_Pointer D ON C.ActivityId = D.ActivityId 			--joining campaignactivity (appeal) to the activitypointer table to get the complete appeal data, (mainly for the campactchanneltypecode)
												INNER JOIN Ext_Campaign E ON E.CampaignId = B.RegardingObjectId and B.regardingobjecttypecode = 4400 --joining CampaignResponseBase activitypointer to the campaign table to get the campaign information.
												INNER JOIN Ext_Activity F ON F.ActivityId = A.ActivityId 				--joining the CampaignResponseBase table to the activityparty table to get the constituent/organization data.
												INNER JOIN Ext_Institution G ON C.Plus_InstitutionalHierarchy = G.New_InstitutionId
											WHERE 1 = 1
												AND CD.ContactId = F.PartyId
												AND D.CampactChannelTypeCode = 1 											--phone
												AND B.CreatedOn > DATEADD(m,-3,GETDATE()) 									--any record which was created in the last 3 months.
												AND F.PartyObjectTypeCode IN (2)
												AND G.New_Inst = ''LDSBC''											--1 Organizations(Accounts) 2 Constituents (Contact)
										) 
								AND Relationship = ''Spouse''
							) A
						WHERE 1 = 1 
							AND ContactId IS NOT NULL
					) S ON T.Donor_Key = S.Donor_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Previously_Contacted_Ldsbc_Yn = ''Y''
					;
	END TRY 
	BEGIN CATCH
		DECLARE @ERROR_NUMBER INT
		DECLARE @ERROR_SEVERITY INT
		DECLARE @ERROR_STATE INT
		DECLARE @ERROR_PROCEDURE NVARCHAR(500)
		DECLARE @ERROR_LINE INT
		DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
		SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
		SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
		SELECT @ERROR_STATE = (SELECT ERROR_STATE())
		SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
		SELECT @ERROR_LINE = (SELECT ERROR_LINE())
		SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Merge_Into_Donor_Dim'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''_Merge_Into_Donor_Dim - Error'', @Alpha_Result = 0
		, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
	END CATCH
	' -- Attribute_4
	, '
	BEGIN TRY
		MERGE INTO _Donor_Dim T
			USING (
					SELECT DISTINCT B.Donor_Key
						, B.Plus_CoordinatingLiaison AS Donor_Spouse_Coordinating_Liaison
						, CD.Relationship_ContactId
						FROM _Connection_Dim CD
							INNER JOIN _Donor_Dim B ON CD.ContactId = B.Donor_Key 
						WHERE 1 = 1 
							AND EXISTS
								(SELECT *
									FROM _Donor_Dim A
									WHERE 1 = 1
										AND Plus_CoordinatingLiaison IS NOT NULL
										AND CD.ContactId = A.Donor_Key
								) 
							AND Relationship = ''Spouse''
							AND CD.Relationship_ContactId IS NOT NULL
					) S ON T.Donor_Key = S.Relationship_ContactId
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Spouse_Coordinating_Liaison = S.Donor_Spouse_Coordinating_Liaison
					;
	END TRY 
	BEGIN CATCH
		SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
		SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
		SELECT @ERROR_STATE = (SELECT ERROR_STATE())
		SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
		SELECT @ERROR_LINE = (SELECT ERROR_LINE())
		SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Spouse Coordinating Liaison'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Spouse Coordinating Liaison - Error'', @Alpha_Result = 0
		, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
	END CATCH		
		' -- Attribute_5
	, 'BEGIN TRY
		MERGE INTO _Donor_Dim T
			USING (
					SELECT ContactId AS Donor_Key
						, CASE WHEN A.Credit_Amount > 0 THEN ''Y'' ELSE ''N'' END AS Donor_Given_Last_3_Months_To_Byu
						FROM
							(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS ContactId 
								, SUM(A.New_CreditAmount) AS Credit_Amount
								FROM dbo._Gift_Credit_ A
									INNER JOIN Ext_Institution B ON A.Plus_InstitutionalHieararchy = B.New_Institutionid
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(MONTH, -3, GETDATE()),112) -- 3 Months Ago
															 AND CONVERT(NVARCHAR(10),GETDATE()-1,112) -- Yesterday
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYU''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
							) A
					) S ON T.Donor_Key = S.Donor_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Given_Last_3_Months_To_Byu = S.Donor_Given_Last_3_Months_To_Byu
					;
		MERGE INTO _Donor_Dim T
			USING (
					SELECT ContactId AS Donor_Key
						, CASE WHEN A.Credit_Amount > 0 THEN ''Y'' ELSE ''N'' END AS Donor_Given_Last_3_Months_To_Byui
						FROM
							(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS ContactId 
								, SUM(A.New_CreditAmount) AS Credit_Amount
								FROM dbo._Gift_Credit_ A
									INNER JOIN Ext_Institution B ON A.Plus_InstitutionalHieararchy = B.New_Institutionid
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(MONTH, -3, GETDATE()),112) -- 3 Months Ago
															 AND CONVERT(NVARCHAR(10),GETDATE()-1,112) -- Yesterday
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUI''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
							) A
					) S ON T.Donor_Key = S.Donor_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Given_Last_3_Months_To_Byui = S.Donor_Given_Last_3_Months_To_Byui
					;
		MERGE INTO _Donor_Dim T
			USING (
					SELECT ContactId AS Donor_Key
						, CASE WHEN A.Credit_Amount > 0 THEN ''Y'' ELSE ''N'' END AS Donor_Given_Last_3_Months_To_Byuh
						FROM
							(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS ContactId 
								, SUM(A.New_CreditAmount) AS Credit_Amount
								FROM dbo._Gift_Credit_ A
									INNER JOIN Ext_Institution B ON A.Plus_InstitutionalHieararchy = B.New_Institutionid
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(MONTH, -3, GETDATE()),112) -- 3 Months Ago
															 AND CONVERT(NVARCHAR(10),GETDATE()-1,112) -- Yesterday
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''BYUH''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
							) A
					) S ON T.Donor_Key = S.Donor_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Given_Last_3_Months_To_Byuh = S.Donor_Given_Last_3_Months_To_Byuh
					;
		MERGE INTO _Donor_Dim T
			USING (
					SELECT ContactId AS Donor_Key
						, CASE WHEN A.Credit_Amount > 0 THEN ''Y'' ELSE ''N'' END AS Donor_Given_Last_3_Months_To_Ldsbc
						FROM
							(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS ContactId 
								, SUM(A.New_CreditAmount) AS Credit_Amount
								FROM dbo._Gift_Credit_ A
									INNER JOIN Ext_Institution B ON A.Plus_InstitutionalHieararchy = B.New_Institutionid
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(MONTH, -3, GETDATE()),112) -- 3 Months Ago
															 AND CONVERT(NVARCHAR(10),GETDATE()-1,112) -- Yesterday
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''LDSBC''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
							) A
					) S ON T.Donor_Key = S.Donor_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Given_Last_3_Months_To_Ldsbc = S.Donor_Given_Last_3_Months_To_Ldsbc
					;
		MERGE INTO _Donor_Dim T
			USING (
					SELECT ContactId AS Donor_Key
						, CASE WHEN A.Credit_Amount > 0 THEN ''Y'' ELSE ''N'' END AS Donor_Given_Last_3_Months_To_Church
						FROM
							(SELECT COALESCE(A.New_RelatedConstituent, A.New_OrganizationId) AS ContactId 
								, SUM(A.New_CreditAmount) AS Credit_Amount
								FROM dbo._Gift_Credit_ A
									INNER JOIN Ext_Institution B ON A.Plus_InstitutionalHieararchy = B.New_Institutionid
								WHERE 1 = 1
									AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(MONTH, -3, GETDATE()),112) -- 3 Months Ago
															 AND CONVERT(NVARCHAR(10),GETDATE()-1,112) -- Yesterday
									AND A.Plus_Type != 100000001 --Exclude Influence
									AND A.Plus_SubType != 100000002 --Exclude Match
									AND B.New_Inst = ''Church''
								GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
							) A
					) S ON T.Donor_Key = S.Donor_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Given_Last_3_Months_To_Church = S.Donor_Given_Last_3_Months_To_Church
					;
	END TRY 
	BEGIN CATCH
		SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
		SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
		SELECT @ERROR_STATE = (SELECT ERROR_STATE())
		SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
		SELECT @ERROR_LINE = (SELECT ERROR_LINE())
		SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Given_Last_3_Months'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Given_Last_3_Months - Error'', @Alpha_Result = 0
		, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
	END CATCH	
		' -- Attribute_6
	, 'BEGIN TRY
		MERGE INTO _Donor_Dim T
			USING (
					SELECT DISTINCT Donor_Id
						, STUFF(( SELECT  ''; ('' + LdspId + '') '' + DonorWithCL + '', RL: '' + Relationship + '', CL: '' + RelatedCl
										FROM 
											(
											SELECT A.Record1Id AS Donor_Id
												, ISNULL(D.New_LdspId, E.New_LdspId) AS LdspId
												, ISNULL(D.FullName,E.Name) AS DonorWithCL
												, G.Name AS Relationship
												, F.FullName AS RelatedCl
												FROM Ext_Connection A
													LEFT JOIN Ext_Contact B ON A.Record1Id = B.ContactID AND A.Record1IdObjectTypeCode = 2
													LEFT JOIN Ext_Account C ON A.Record1Id = C.AccountID AND A.Record1IdObjectTypeCode = 1
													LEFT JOIN Ext_Contact D ON A.Record2Id = D.ContactID AND A.Record2IdObjectTypeCode = 2
													LEFT JOIN Ext_Account E ON A.Record2Id = E.AccountID AND A.Record2IdObjectTypeCode = 1
													LEFT JOIN Ext_System_User F ON F.SystemUserId = ISNULL(D.plus_CoordinatingLiaison, E.Plus_CoordinatingLiaison)
													INNER JOIN Ext_Connection_Role  G ON A.Record2RoleId = G.ConnectionRoleId 
												WHERE 1 = 1 
													AND (D.plus_CoordinatingLiaison IS NOT NULL OR E.Plus_CoordinatingLiaison IS NOT NULL)
													AND Record1ID IS NOT NULL
													AND REcord1IdObjectTypeCode IN (1,2)
											) A
										WHERE B.Donor_ID = A.Donor_ID FOR XML PATH('''')),1 ,2, ''''
								)  Donor_Liaison_Connections
						FROM 
							(
							SELECT A.Record1Id AS Donor_Id
								, ISNULL(D.New_LdspId, E.New_LdspId) AS LdspId
								, ISNULL(D.FullName,E.Name) AS DonorWithCL
								, G.Name AS Relationship
								, F.FullName AS RelatedCl
								FROM Ext_Connection A
									LEFT JOIN Ext_Contact B ON A.Record1Id = B.ContactID AND A.Record1IdObjectTypeCode = 2
									LEFT JOIN Ext_Account C ON A.Record1Id = C.AccountID AND A.Record1IdObjectTypeCode = 1
									LEFT JOIN Ext_Contact D ON A.Record2Id = D.ContactID AND A.Record2IdObjectTypeCode = 2
									LEFT JOIN Ext_Account E ON A.Record2Id = E.AccountID AND A.Record2IdObjectTypeCode = 1
									LEFT JOIN Ext_System_User F ON F.SystemUserId = ISNULL(D.plus_CoordinatingLiaison, E.Plus_CoordinatingLiaison)
									INNER JOIN Ext_Connection_Role  G ON A.Record2RoleId = G.ConnectionRoleId 
								WHERE 1 = 1 
									AND (D.plus_CoordinatingLiaison IS NOT NULL OR E.Plus_CoordinatingLiaison IS NOT NULL)
									AND Record1ID IS NOT NULL
									AND REcord1IdObjectTypeCode IN (1,2)									
							) B
						WHERE 1 = 1
							AND Donor_Id IS NOT NULL
						GROUP BY Donor_Id
					) S ON T.Donor_Key = S.Donor_Id
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Liaison_Connections = S.Donor_Liaison_Connections
					;
	END TRY 
	BEGIN CATCH
		SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
		SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
		SELECT @ERROR_STATE = (SELECT ERROR_STATE())
		SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
		SELECT @ERROR_LINE = (SELECT ERROR_LINE())
		SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Liaison_Connections'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Liaison_Connections - Error'', @Alpha_Result = 0
		, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
	END CATCH
		' -- Attribute_7
	, 'BEGIN TRY
		MERGE INTO _Fund_Dim T
			USING (
					SELECT DISTINCT A.Fund_Key
						, B.New_Inst AS Hier_New_Inst
						FROM _Fund_Dim A
							LEFT JOIN _Hier_Dim B ON A.New_InstitutionalHierarchy = B.Hier_Key									
					) S ON T.Fund_Key = S.Fund_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Hier_New_Inst = S.Hier_New_Inst
					;
	END TRY 
	BEGIN CATCH
		SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
		SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
		SELECT @ERROR_STATE = (SELECT ERROR_STATE())
		SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
		SELECT @ERROR_LINE = (SELECT ERROR_LINE())
		SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Hier_New_Inst'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Hier_New_Inst - Error'', @Alpha_Result = 0
		, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
	END CATCH
		' -- Attribute_8
	, '	BEGIN TRY
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, SUM(A.Donation_Credit_Amt) AS Donor_Total_Lifetime_Giving
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
							WHERE 1 = 1
								AND B.StatusCode = ''Posted''
								AND A.Plus_Type IN (''Hard'',''Shared'')
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving = S.Donor_Total_Lifetime_Giving
						;
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Lifetime_Giving'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Total_Lifetime_Giving - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_9
	, 'BEGIN TRY
			MERGE INTO _Donor_Dim T
				USING (
						SELECT ContactId AS Donor_Key
							, Plus_TotalGivenLast5Years AS Donor_Total_Lifetime_Giving_Last_5_Years
							FROM Ext_Contact
						UNION
						SELECT AccountId AS Donor_Key
							, Plus_TotalGivenLast5Years AS Donor_Total_Lifetime_Giving_Last_5_Years
							FROM Ext_Account
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_Last_5_Years = S.Donor_Total_Lifetime_Giving_Last_5_Years
						;
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Lifetime_Giving_Last_5_Years'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Total_Lifetime_Giving_Last_5_Years - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_10
	, '	BEGIN TRY
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, SUM(A.Donation_Credit_Amt) AS Donor_Total_Lifetime_Giving_Byu
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND B.StatusCode = ''Posted''
								AND A.Plus_Type IN (''Hard'',''Shared'')
								AND C.New_Inst = ''BYU''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_Byu = S.Donor_Total_Lifetime_Giving_Byu
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, SUM(A.Donation_Credit_Amt) AS Donor_Total_Lifetime_Giving_Byui
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND B.StatusCode = ''Posted''
								AND A.Plus_Type IN (''Hard'',''Shared'')
								AND C.New_Inst = ''BYUI''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_Byui = S.Donor_Total_Lifetime_Giving_Byui
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, SUM(A.Donation_Credit_Amt) AS Donor_Total_Lifetime_Giving_Byuh
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND B.StatusCode = ''Posted''
								AND A.Plus_Type IN (''Hard'',''Shared'')
								AND C.New_Inst = ''BYUH''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_Byuh = S.Donor_Total_Lifetime_Giving_Byuh
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, SUM(A.Donation_Credit_Amt) AS Donor_Total_Lifetime_Giving_Ldsbc
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND B.StatusCode = ''Posted''
								AND A.Plus_Type IN (''Hard'',''Shared'')
								AND C.New_Inst = ''LDSBC''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_Ldsbc = S.Donor_Total_Lifetime_Giving_Ldsbc
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, SUM(A.Donation_Credit_Amt) AS Donor_Total_Lifetime_Giving_Church
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND B.StatusCode = ''Posted''
								AND A.Plus_Type IN (''Hard'',''Shared'')
								AND C.New_Inst = ''Church''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_Church = S.Donor_Total_Lifetime_Giving_Church
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, SUM(A.Donation_Credit_Amt) AS Donor_Total_Lifetime_Giving_Pcc
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND B.StatusCode = ''Posted''
								AND A.Plus_Type IN (''Hard'',''Shared'')
								AND C.New_Inst = ''PCC''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_Pcc = S.Donor_Total_Lifetime_Giving_Pcc
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, SUM(A.Donation_Credit_Amt) AS Donor_Total_Lifetime_Giving_Ces
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND B.StatusCode = ''Posted''
								AND A.Plus_Type IN (''Hard'',''Shared'')
								AND C.New_Inst = ''CES''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_Ces = S.Donor_Total_Lifetime_Giving_Ces
						;
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Lifetime_Giving_Byu'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Total_Lifetime_Giving_Byu - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_11
	, 'BEGIN TRY
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(B.New_ReceiptDate) AS Donor_Most_Recent_Gift_Date_Ldsp
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								-- INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								-- AND C.New_Inst = ''BYU''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_Date_Ldsp = S.Donor_Most_Recent_Gift_Date_Ldsp
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(B.New_ReceiptDate) AS Donor_Most_Recent_Gift_Date_Byu
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND C.New_Inst = ''BYU''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_Date_Byu = S.Donor_Most_Recent_Gift_Date_Byu
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(B.New_ReceiptDate) AS Donor_Most_Recent_Gift_Date_Byui
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND C.New_Inst = ''BYUI''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_Date_Byui = S.Donor_Most_Recent_Gift_Date_Byui
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(B.New_ReceiptDate) AS Donor_Most_Recent_Gift_Date_Byuh
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND C.New_Inst = ''BYUH''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_Date_Byuh = S.Donor_Most_Recent_Gift_Date_Byuh
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(B.New_ReceiptDate) AS Donor_Most_Recent_Gift_Date_Ldsbc
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND C.New_Inst = ''LDSBC''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_Date_Ldsbc = S.Donor_Most_Recent_Gift_Date_Ldsbc
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(B.New_ReceiptDate) AS Donor_Most_Recent_Gift_Date_Church
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND C.New_Inst = ''Church''
							GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_Date_Church = S.Donor_Most_Recent_Gift_Date_Church
						;
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Most_Recent_Gift_Date'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Most_Recent_Gift_Date - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_12
	, '	BEGIN TRY
		MERGE INTO _Donor_Dim T
			USING (
					SELECT Donor_Key
						, MAX(Donation_Credit_Amt) AS Donor_Ldsp_Largest_Gift
						FROM _Donation_Fact A
						GROUP BY Donor_Key
				) S ON T.Donor_Key = S.Donor_Key
			WHEN MATCHED THEN 
				UPDATE
					SET T.Donor_Ldsp_Largest_Gift = S.Donor_Ldsp_Largest_Gift
					;
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Ldsp_Largest_Gift'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Ldsp_Largest_Gift - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH 
		' -- Attribute_13
	, 'BEGIN TRY
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CONVERT(VARCHAR(10),Donor_First_Gift_Post_Date_Byu,101) AS Donor_First_Gift_Post_Date_Byu
							FROM
								(SELECT COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor) AS Donor_Key
									, MIN(A.New_PostDate) AS Donor_First_Gift_Post_Date_Byu 
									FROM dbo._Gift_ A
									WHERE 1 = 1
										AND EXISTS
											(SELECT *
												FROM Ext_Institution B
												WHERE 1 = 1
													AND A.New_InstitutionalHierarchyId = B.New_InstitutionId
													AND UPPER(B.New_Name)  LIKE ''%BYU%''
													AND UPPER(B.New_Name)  NOT LIKE ''%BYUI%''
													AND UPPER(B.New_Name)  NOT LIKE ''%BYUH%''
											)
									GROUP BY COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor)
								) A
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_Post_Date_Byu = S.Donor_First_Gift_Post_Date_Byu
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CONVERT(VARCHAR(10),Donor_First_Gift_Post_Date_Byui,101) AS Donor_First_Gift_Post_Date_Byui
							FROM
								(SELECT COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor) AS Donor_Key
									, MIN(A.New_PostDate) AS Donor_First_Gift_Post_Date_Byui 
									FROM dbo._Gift_ A
									WHERE 1 = 1
										AND EXISTS
											(SELECT *
												FROM Ext_Institution B
												WHERE 1 = 1
													AND A.New_InstitutionalHierarchyId = B.New_InstitutionId
													AND UPPER(B.New_Name)  LIKE ''%BYUI%''
											)
									GROUP BY COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor)
								) A
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_Post_Date_Byui = S.Donor_First_Gift_Post_Date_Byui
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CONVERT(VARCHAR(10),Donor_First_Gift_Post_Date_Byuh,101) AS Donor_First_Gift_Post_Date_Byuh
							FROM
								(SELECT COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor) AS Donor_Key
									, MIN(A.New_PostDate) AS Donor_First_Gift_Post_Date_Byuh 
									FROM dbo._Gift_ A
									WHERE 1 = 1
										AND EXISTS
											(SELECT *
												FROM Ext_Institution B
												WHERE 1 = 1
													AND A.New_InstitutionalHierarchyId = B.New_InstitutionId
													AND UPPER(B.New_Name)  LIKE ''%BYUH%''
											)
									GROUP BY COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor)
								) A
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_Post_Date_Byuh = S.Donor_First_Gift_Post_Date_Byuh
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CONVERT(VARCHAR(10),Donor_First_Gift_Post_Date_Ldsbc,101) AS Donor_First_Gift_Post_Date_Ldsbc
							FROM
								(SELECT COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor) AS Donor_Key
									, MIN(A.New_PostDate) AS Donor_First_Gift_Post_Date_Ldsbc 
									FROM dbo._Gift_ A
									WHERE 1 = 1
										AND EXISTS
											(SELECT *
												FROM Ext_Institution B
												WHERE 1 = 1
													AND A.New_InstitutionalHierarchyId = B.New_InstitutionId
													AND UPPER(B.New_Name) = ''LDSBC - GENERAL'')
									GROUP BY COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor)
								) A
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_Post_Date_Ldsbc = S.Donor_First_Gift_Post_Date_Ldsbc
						;
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_First_Gift_Post_Date'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_First_Gift_Post_Date - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_14
	, 'BEGIN TRY
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.CustomerId AS Donor_Key
							, MAX(A.StepName) AS Donor_Furthest_Initiative_Stage
							FROM Ext_Opportunity A
								LEFT JOIN Ext_Contact B ON A.CustomerId = B.ContactId 
								LEFT JOIN Ext_Account C ON A.Customerid = C.AccountId 
							WHERE 1 = 1
								AND A.StateCode = 0 -- Open Initiative (0 - Open, 1 - Won, 2 - Lost)
							GROUP BY A.CustomerId
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Furthest_Initiative_Stage = S.Donor_Furthest_Initiative_Stage
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT CustomerId AS Donor_Key -- Donor_Key
							, Count(*) AS Donor_Number_Of_Open_Initiatives
							FROM Ext_Opportunity A
								LEFT JOIN Ext_Contact B ON A.CustomerId = B.ContactId 
								LEFT JOIN Ext_Account C ON A.Customerid = C.AccountId 
							WHERE 1 = 1
								AND A.StateCode = 0 -- Open Initiative (0 - Open, 1 - Won, 2 - Lost)
							GROUP BY CustomerId
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Number_Of_Open_Initiatives = S.Donor_Number_Of_Open_Initiatives
						;
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Initiative_'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Initiative_ - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH 
		' -- Attribute_15
	, 'BEGIN TRY
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_RelatedConstituent,A.New_OrganizationId) AS Donor_Key 
							, SUM(A.New_CreditAmount) AS Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years
							FROM dbo._Gift_Credit_ A
								INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
							WHERE 1 = 1
								AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) -- 5 full calendar years + Ytd
														  AND CONVERT(NVARCHAR(10),GETDATE(),112)
								AND A.Plus_Type IN (100000000,100000002) -- Hard, Shared (not Influence 100000001)
								AND A.StatusCode = 1 --Posted
								AND B.New_Inst = ''BYU'' --Institution
							GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years = S.Donor_Total_Lifetime_Giving_To_Byu_Last_5_Years
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_RelatedConstituent,A.New_OrganizationId) AS Donor_Key 
							, SUM(A.New_CreditAmount) AS Donor_Total_Lifetime_Giving_To_Byui_Last_5_Years
							FROM dbo._Gift_Credit_ A
								INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
							WHERE 1 = 1
								AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) -- 5 full calendar years + Ytd
														  AND CONVERT(NVARCHAR(10),GETDATE(),112)
								AND A.Plus_Type IN (100000000,100000002) -- Hard, Shared (not Influence 100000001)
								AND A.StatusCode = 1 --Posted
								AND B.New_Inst = ''BYUI'' --Institution
							GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_To_Byui_Last_5_Years = S.Donor_Total_Lifetime_Giving_To_Byui_Last_5_Years
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_RelatedConstituent,A.New_OrganizationId) AS Donor_Key 
							, SUM(A.New_CreditAmount) AS Donor_Total_Lifetime_Giving_To_Byuh_Last_5_Years
							FROM dbo._Gift_Credit_ A
								INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
							WHERE 1 = 1
								AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) -- 5 full calendar years + Ytd
														  AND CONVERT(NVARCHAR(10),GETDATE(),112)
								AND A.Plus_Type IN (100000000,100000002) -- Hard, Shared (not Influence 100000001)
								AND A.StatusCode = 1 --Posted
								AND B.New_Inst = ''BYUH'' --Institution
							GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_To_Byuh_Last_5_Years = S.Donor_Total_Lifetime_Giving_To_Byuh_Last_5_Years
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_RelatedConstituent,A.New_OrganizationId) AS Donor_Key 
							, SUM(A.New_CreditAmount) AS Donor_Total_Lifetime_Giving_To_Ldsbc_Last_5_Years
							FROM dbo._Gift_Credit_ A
								INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
							WHERE 1 = 1
								AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) -- 5 full calendar years + Ytd
														  AND CONVERT(NVARCHAR(10),GETDATE(),112)
								AND A.Plus_Type IN (100000000,100000002) -- Hard, Shared (not Influence 100000001)
								AND A.StatusCode = 1 --Posted
								AND B.New_Inst = ''LDSBC'' --Institution
							GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_To_Ldsbc_Last_5_Years = S.Donor_Total_Lifetime_Giving_To_Ldsbc_Last_5_Years
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_RelatedConstituent,A.New_OrganizationId) AS Donor_Key 
							, SUM(A.New_CreditAmount) AS Donor_Total_Lifetime_Giving_To_Church_Last_5_Years
							FROM dbo._Gift_Credit_ A
								INNER JOIN _Hier_Dim B ON A.Plus_InstitutionalHieararchy = B.Hier_Key
							WHERE 1 = 1
								AND CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) -- 5 full calendar years + Ytd
														  AND CONVERT(NVARCHAR(10),GETDATE(),112)
								AND A.Plus_Type IN (100000000,100000002) -- Hard, Shared (not Influence 100000001)
								AND A.StatusCode = 1 --Posted
								AND B.New_Inst = ''Church'' --Institution
							GROUP BY COALESCE(A.New_RelatedConstituent, A.New_OrganizationId)
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Total_Lifetime_Giving_To_Church_Last_5_Years = S.Donor_Total_Lifetime_Giving_To_Church_Last_5_Years
						;
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Total_Lifetime_Giving_To_<Institution>_Last_5_Years'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Total_Lifetime_Giving_To_<Institution>_Last_5_Years - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH  
		' -- Attribute_16
	, 'BEGIN TRY	
			MERGE INTO _Donor_Dim T
				USING (	
					SELECT A.Donor_Key
						, MAX(A.Donation_Credit_Amt) AS Donor_Most_Recent_Gift_To_Ldsp_Amt
						FROM _Donation_Fact A
							INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
							INNER JOIN Ldsp_Most_Recent_Donation_Ldsp() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Max_Receipt_Date
							INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
						WHERE 1 = 1
							AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
							AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
							--AND D.New_Inst = ''BYU''
						GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_To_Ldsp_Amt = S.Donor_Most_Recent_Gift_To_Ldsp_Amt
			;
			MERGE INTO _Donor_Dim T
				USING (	
					SELECT A.Donor_Key
						, MAX(A.Donation_Credit_Amt) AS Donor_Most_Recent_Gift_To_Byu_Amt
						FROM _Donation_Fact A
							INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
							INNER JOIN Ldsp_Most_Recent_Donation_Byu() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Max_Receipt_Date
							INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
						WHERE 1 = 1
							AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
							AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
							AND D.New_Inst = ''BYU''
						GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_To_Byu_Amt = S.Donor_Most_Recent_Gift_To_Byu_Amt
			;
			MERGE INTO _Donor_Dim T
				USING (	
					SELECT A.Donor_Key
						, MAX(A.Donation_Credit_Amt) AS Donor_Most_Recent_Gift_To_Byui_Amt
						FROM _Donation_Fact A
							INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
							INNER JOIN Ldsp_Most_Recent_Donation_Byui() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Max_Receipt_Date
							INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
						WHERE 1 = 1
							AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
							AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
							AND D.New_Inst = ''BYUI''
						GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_To_Byui_Amt = S.Donor_Most_Recent_Gift_To_Byui_Amt
			;
			MERGE INTO _Donor_Dim T
				USING (	
					SELECT A.Donor_Key
						, MAX(A.Donation_Credit_Amt) AS Donor_Most_Recent_Gift_To_Byuh_Amt
						FROM _Donation_Fact A
							INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
							INNER JOIN Ldsp_Most_Recent_Donation_Byuh() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Max_Receipt_Date
							INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
						WHERE 1 = 1
							AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
							AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
							AND D.New_Inst = ''BYUH''
						GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_To_Byuh_Amt = S.Donor_Most_Recent_Gift_To_Byuh_Amt
			;
			MERGE INTO _Donor_Dim T
				USING (	
					SELECT A.Donor_Key
						, MAX(A.Donation_Credit_Amt) AS Donor_Most_Recent_Gift_To_Ldsbc_Amt
						FROM _Donation_Fact A
							INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
							INNER JOIN Ldsp_Most_Recent_Donation_Ldsbc() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Max_Receipt_Date
							INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
						WHERE 1 = 1
							AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
							AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
							AND D.New_Inst = ''LDSBC''
						GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_To_Ldsbc_Amt = S.Donor_Most_Recent_Gift_To_Ldsbc_Amt
			;
			MERGE INTO _Donor_Dim T
				USING (	
					SELECT A.Donor_Key
						, MAX(A.Donation_Credit_Amt) AS Donor_Most_Recent_Gift_To_Church_Amt
						FROM _Donation_Fact A
							INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
							INNER JOIN Ldsp_Most_Recent_Donation_Church() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Max_Receipt_Date
							INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
						WHERE 1 = 1
							AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
							AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
							AND D.New_Inst = ''Church''
						GROUP BY A.Donor_Key
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Most_Recent_Gift_To_Church_Amt = S.Donor_Most_Recent_Gift_To_Church_Amt
			;
								
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Most_Recent_Gift_To_<Institution>_Amt'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Most_Recent_Gift_To_<Institution>_Amt - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH 
		' -- Attribute_17
	, '	BEGIN TRY	
			MERGE INTO _Donor_Dim T
				USING (	
					SELECT C.PartyId AS Donor_Key
						, MAX(CONVERT(NVARCHAR(10),A.ActualEnd,110)) AS Donor_Last_F2F_Visit_Date
						FROM Ext_Activity_Pointer A --Contains the shared activity data (data which is used in all activity types)
							INNER JOIN Ext_Appointment B ON A.ActivityId = B.ActivityId --Contains the data specific to appointments
							INNER JOIN Ext_Activity C ON A.ActivityId = C.ActivityId --Attendees/Participants
						WHERE 1 = 1
							AND A.ActivityTypeCode = 4201 --Appointment
							AND A.StateCode = 1 --Completed
							AND B.Plus_FaceToface = 1 --Indicates the appointment is face to face (F2F)
							AND C.PartyObjectTypeCode in (1,2) --Organizations are 1, Constituents are 2	
						GROUP BY C.PartyId
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Last_F2F_Visit_Date = S.Donor_Last_F2F_Visit_Date
			;
			MERGE INTO _Donor_Dim T
				USING (	
						SELECT Donor_Key
							, Donor_Type_Code_Ldsp
							FROM
								(SELECT Donor_Key
									, Donor_Type_Code_Ldsp
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Type_Code_Ldsp) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Type_Code_Ldsp
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())
														AND B.New_Inst = ''LDSP''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())
												AND C.New_Inst = ''LDSP''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
						AND RowNum = 1
					) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Type_Code_Ldsp = S.Donor_Type_Code_Ldsp
			;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(A.Donation_Credit_Amt) AS Donor_Largest_Gift_Amt_Church
							FROM _Donation_Fact A
								INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
							WHERE 1 = 1
								AND B.New_Inst = ''Church''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Largest_Gift_Amt_Church = S.Donor_Largest_Gift_Amt_Church
			;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key 
							, CONVERT(VARCHAR(10),A.New_ReceiptDate,101) AS Donor_Largest_Gift_Date_Ldsp
							FROM
								(SELECT A.Donor_Key
									, C.New_ReceiptDate
									, ROW_NUMBER() OVER(PARTITION BY A.Donor_Key ORDER BY A.Donation_Credit_Amt DESC, C.New_ReceiptDate DESC) AS RowNumber
									FROM _Donation_Fact A
										INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
										INNER JOIN _Donation_Dim C ON A.Donation_Key = C.Donation_Key
									WHERE 1 = 1
								) A
							WHERE 1 = 1
								AND A.RowNumber = 1
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Largest_Gift_Date_Ldsp = S.Donor_Largest_Gift_Date_Ldsp
			;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key 
							, CONVERT(VARCHAR(10),A.New_ReceiptDate,101) AS Donor_Largest_Gift_Date_Byu
							FROM
								(SELECT A.Donor_Key
									, C.New_ReceiptDate
									, ROW_NUMBER() OVER(PARTITION BY A.Donor_Key ORDER BY A.Donation_Credit_Amt DESC, C.New_ReceiptDate DESC) AS RowNumber
									FROM _Donation_Fact A
										INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
										INNER JOIN _Donation_Dim C ON A.Donation_Key = C.Donation_Key
									WHERE 1 = 1
										AND B.New_Inst = ''BYU''
								) A
							WHERE 1 = 1
								AND A.RowNumber = 1
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Largest_Gift_Date_Byu = S.Donor_Largest_Gift_Date_Byu
			;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key 
							, CONVERT(VARCHAR(10),A.New_ReceiptDate,101) AS Donor_Largest_Gift_Date_Byui
							FROM
								(SELECT A.Donor_Key
									, C.New_ReceiptDate
									, ROW_NUMBER() OVER(PARTITION BY A.Donor_Key ORDER BY A.Donation_Credit_Amt DESC, C.New_ReceiptDate DESC) AS RowNumber
									FROM _Donation_Fact A
										INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
										INNER JOIN _Donation_Dim C ON A.Donation_Key = C.Donation_Key
									WHERE 1 = 1
										AND B.New_Inst = ''BYUI''
								) A
							WHERE 1 = 1
								AND A.RowNumber = 1
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Largest_Gift_Date_Byui = S.Donor_Largest_Gift_Date_Byui
			;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key 
							, CONVERT(VARCHAR(10),A.New_ReceiptDate,101) AS Donor_Largest_Gift_Date_Byuh
							FROM
								(SELECT A.Donor_Key
									, C.New_ReceiptDate
									, ROW_NUMBER() OVER(PARTITION BY A.Donor_Key ORDER BY A.Donation_Credit_Amt DESC, C.New_ReceiptDate DESC) AS RowNumber
									FROM _Donation_Fact A
										INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
										INNER JOIN _Donation_Dim C ON A.Donation_Key = C.Donation_Key
									WHERE 1 = 1
										AND B.New_Inst = ''BYUH''
								) A
							WHERE 1 = 1
								AND A.RowNumber = 1
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Largest_Gift_Date_Byuh = S.Donor_Largest_Gift_Date_Byuh
			;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key 
							, CONVERT(VARCHAR(10),A.New_ReceiptDate,101) AS Donor_Largest_Gift_Date_Ldsbc
							FROM
								(SELECT A.Donor_Key
									, C.New_ReceiptDate
									, ROW_NUMBER() OVER(PARTITION BY A.Donor_Key ORDER BY A.Donation_Credit_Amt DESC, C.New_ReceiptDate DESC) AS RowNumber
									FROM _Donation_Fact A
										INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
										INNER JOIN _Donation_Dim C ON A.Donation_Key = C.Donation_Key
									WHERE 1 = 1
										AND B.New_Inst = ''LDSBC''
								) A
							WHERE 1 = 1
								AND A.RowNumber = 1
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Largest_Gift_Date_Ldsbc = S.Donor_Largest_Gift_Date_Ldsbc
			;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key 
							, CONVERT(VARCHAR(10),A.New_ReceiptDate,101) AS Donor_Largest_Gift_Date_Church
							FROM
								(SELECT A.Donor_Key
									, C.New_ReceiptDate
									, ROW_NUMBER() OVER(PARTITION BY A.Donor_Key ORDER BY A.Donation_Credit_Amt DESC, C.New_ReceiptDate DESC) AS RowNumber
									FROM _Donation_Fact A
										INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
										INNER JOIN _Donation_Dim C ON A.Donation_Key = C.Donation_Key
									WHERE 1 = 1
										AND B.New_Inst = ''Church''
								) A
							WHERE 1 = 1
								AND A.RowNumber = 1
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Largest_Gift_Date_Church = S.Donor_Largest_Gift_Date_Church
			;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key 
							, STUFF(	( SELECT  ''; '' + Donor_Institution_Giving_Areas 
											FROM 
												(SELECT DISTINCT A.Donor_Key
													, B.New_Inst AS Donor_Institution_Giving_Areas
													FROM _Donation_Fact A
														INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key						
												) A
											WHERE A.Donor_Key = B.Donor_Key FOR XML PATH('''')
										),1 ,2 , ''''
									)  Donor_Institution_Giving_Areas
							FROM 
								(SELECT DISTINCT Donor_Key
									FROM _Donation_Fact
								) B
							WHERE 1 = 1
								AND Donor_Key IS NOT NULL
							GROUP BY Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Institution_Giving_Areas = S.Donor_Institution_Giving_Areas
			;
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Last_F2F_Visit_Date'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Last_F2F_Visit_Date - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH 
		' -- Attribute_18
	, '	BEGIN TRY	
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key 
							, STUFF(( SELECT  ''; '' + Donor_Byu_Giving_Areas 
										FROM 
											(SELECT DISTINCT A.Donor_Key
												, REPLACE(B.Hier_Level_1,''&'', ''and'') AS Donor_Byu_Giving_Areas
												FROM _Donation_Fact A
													INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key	
												WHERE 1 = 1
													AND B.New_Inst = ''BYU''					
											) A
										 WHERE A.Donor_Key = B.Donor_Key FOR XML PATH('''')
									),1 ,2 , ''''
							)  Donor_Byu_Giving_Areas
							FROM 
								(SELECT DISTINCT Donor_Key
									FROM _Donation_Fact A
										INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
									WHERE 1 = 1
										AND B.New_Inst = ''BYU''
								) B
							WHERE 1 = 1
								AND Donor_Key IS NOT NULL
							GROUP BY Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Byu_Giving_Areas = S.Donor_Byu_Giving_Areas
			;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key 
							, STUFF(( SELECT  ''; '' + Donor_Church_Giving_Areas 
										FROM 
											(SELECT DISTINCT A.Donor_Key
												, REPLACE(B.Hier_Level_1,''&'', ''and'') AS Donor_Church_Giving_Areas
												FROM _Donation_Fact A
													INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key	
												WHERE 1 = 1
													AND B.New_Inst = ''Church''					
											) A
										 WHERE A.Donor_Key = B.Donor_Key FOR XML PATH('''')
									),1 ,2 , ''''
							)  Donor_Church_Giving_Areas
							FROM 
								(SELECT DISTINCT Donor_Key
									FROM _Donation_Fact A
										INNER JOIN _Hier_Dim B ON A.Hier_Key = B.Hier_Key
									WHERE 1 = 1
										AND B.New_Inst = ''Church''
								) B
							WHERE 1 = 1
								AND Donor_Key IS NOT NULL
							GROUP BY Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
					WHEN MATCHED THEN 
						UPDATE
							SET T.Donor_Church_Giving_Areas = S.Donor_Church_Giving_Areas
			;
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Church_Giving_Areas'', @Alpha_Step_Number = ''158X'', @Alpha_Step_Name = ''Donor_Church_Giving_Areas - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH ' -- Attribute_19
	, 'DECLARE @TABLE_NAME NVARCHAR(100)
		SET @TABLE_NAME = ''_Merge_Into_Donor_Dim'' ; ------> HARDCODE <------ 
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''158H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1; 
		' -- Attribute_20
	, 'EXEC dbo.usp_Transform_Data @Transform_Data_Table_Name = ''_Merge_Into_Donor_Dim''; ------> HARDCODE <------
			' -- Attribute_21
	, 1 -- Active
	, GETDATE() -- Insert_Date
	, NULL  -- Update_Date                
)
,
-- --------------------------
-- _Merge_Into_Donor_Dim_2 Table
-- --------------------------
('Post_Attributes' -- Dim_Object
	, '_Merge_Into_Donor_Dim_2' -- Table_Name
	, '_Merge_Into_Donor_Dim_2 INT' -- Create_Table
	, '_Merge_Into_Donor_Dim_2' -- Insert_Fields
	, ' ' -- From_Statement
	, ' ' -- Where_Statement
	, 'DECLARE @TABLE_NAME NVARCHAR(100)
		SET @TABLE_NAME = ''_Merge_Into_Donor_Dim_2'' ; ------> HARDCODE <------
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''164D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1;
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''164D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_1
	, '
		' -- Attribute_2
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''164F'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1; 							
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''164F'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_3
	, '
		BEGIN TRY
			SET ANSI_WARNINGS OFF
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CONCAT(''<table width="100%"> <tr> <th align="left">Date</th> <th align="left">Amount</th> <th align="left">Fund Account</th> </tr> ''
										, REPLACE(
											REPLACE(Pledge_Reminder_Html_Text,''&LT;'',''<'') 
													, ''&gt;'',''>'')
										, '' </table>''
									)
									AS Donor_Pledge_Reminder_Email_Content_Byu
							FROM
								(SELECT Donor_Key
									, STUFF((SELECT '' <tr> <td>'' + New_BeginDate + ''</td> <td>'' +  New_TotalPledged + ''</td> <td>'' + New_Name + ''</td> </tr> ''
												FROM 
													(SELECT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key
														, ROW_NUMBER() OVER (PARTITION BY A.New_ConstituentDonor ORDER BY A.New_BeginDate DESC) AS RowNum
														, CONVERT(NVARCHAR(10),A.New_BeginDate,101) AS New_BeginDate
														, CONVERT(NVARCHAR(20),A.New_TotalPledged) AS New_TotalPledged
														, REPLACE(B.New_Name,''&'',''and'') AS New_Name 
														FROM Ext_Pledge A
															INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId 
															INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
														WHERE 1 = 1 
															AND A.Lds_ExpectancyType = 100000003 --Telefund pledge
															AND A.StatusCode = 1 --Outstanding
															AND DATEADD(DAY,30,A.New_BeginDate) <= GETDATE() --Over 30 days old
															AND DATEADD(DAY,60,A.New_BeginDate) >= GETDATE() --Not 60 days and older
															AND A.New_ConstituentDonor is not null --Get constituent only expectancies
															AND C.New_Inst = ''BYU'' --Replace with respective institution
													) D
												WHERE D.Donor_Key = E.Donor_Key FOR XML PATH('''')),1 ,1, ''''
											) Pledge_Reminder_Html_Text
											FROM 
												(SELECT DISTINCT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key 
													FROM Ext_Pledge A
														INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId 
														INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
													WHERE 1 = 1 
														AND A.Lds_ExpectancyType = 100000003 --Telefund pledge
														AND A.StatusCode = 1 --Outstanding
														AND DATEADD(DAY,30,A.New_BeginDate) <= GETDATE() --Over 30 days old
														AND DATEADD(DAY,60,A.New_BeginDate) >= GETDATE() --Not 60 days and older
														AND A.New_ConstituentDonor is not null --Get constituent only expectancies
														AND C.New_Inst = ''BYU'' --Replace with respective institution
												) E
											WHERE 1 = 1
												AND Donor_Key IS NOT NULL
											GROUP BY Donor_Key
								) A
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Pledge_Reminder_Email_Content_Byu = S.Donor_Pledge_Reminder_Email_Content_Byu
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CONCAT(''<table width="100%"> <tr> <th align="left">Date</th> <th align="left">Amount</th> <th align="left">Fund Account</th> </tr> ''
										, REPLACE(
											REPLACE(Pledge_Reminder_Html_Text,''&LT;'',''<'') 
													, ''&gt;'',''>'')
										, '' </table>''
									)
									AS Donor_Pledge_Reminder_Email_Content_Byui
							FROM
								(SELECT Donor_Key
									, STUFF((SELECT '' <tr> <td>'' + New_BeginDate + ''</td> <td>'' +  New_TotalPledged + ''</td> <td>'' + New_Name + ''</td> </tr> ''
												FROM 
													(SELECT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key
														, ROW_NUMBER() OVER (PARTITION BY A.New_ConstituentDonor ORDER BY A.New_BeginDate DESC) AS RowNum
														, CONVERT(NVARCHAR(10),A.New_BeginDate,101) AS New_BeginDate
														, CONVERT(NVARCHAR(20),A.New_TotalPledged) AS New_TotalPledged
														, REPLACE(B.New_Name,''&'',''and'') AS New_Name 
														FROM Ext_Pledge A
															INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId 
															INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
														WHERE 1 = 1 
															AND A.Lds_ExpectancyType = 100000003 --Telefund pledge
															AND A.StatusCode = 1 --Outstanding
															AND DATEADD(DAY,30,A.New_BeginDate) <= GETDATE() --Over 30 days old
															AND DATEADD(DAY,60,A.New_BeginDate) >= GETDATE() --Not 60 days and older
															AND A.New_ConstituentDonor is not null --Get constituent only expectancies
															AND C.New_Inst = ''BYUI'' --Replace with respective institution
													) D
												WHERE D.Donor_Key = E.Donor_Key FOR XML PATH('''')),1 ,1, ''''
											) Pledge_Reminder_Html_Text
											FROM 
												(SELECT DISTINCT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key 
													FROM Ext_Pledge A
														INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId 
														INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
													WHERE 1 = 1 
														AND A.Lds_ExpectancyType = 100000003 --Telefund pledge
														AND A.StatusCode = 1 --Outstanding
														AND DATEADD(DAY,30,A.New_BeginDate) <= GETDATE() --Over 30 days old
														AND DATEADD(DAY,60,A.New_BeginDate) >= GETDATE() --Not 60 days and older
														AND A.New_ConstituentDonor is not null --Get constituent only expectancies
														AND C.New_Inst = ''BYUI'' --Replace with respective institution
												) E
											WHERE 1 = 1
												AND Donor_Key IS NOT NULL
											GROUP BY Donor_Key
								) A
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Pledge_Reminder_Email_Content_Byui = S.Donor_Pledge_Reminder_Email_Content_Byui
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CONCAT(''<table width="100%"> <tr> <th align="left">Date</th> <th align="left">Amount</th> <th align="left">Fund Account</th> </tr> ''
										, REPLACE(
											REPLACE(Pledge_Reminder_Html_Text,''&LT;'',''<'') 
													, ''&gt;'',''>'')
										, '' </table>''
									)
									AS Donor_Pledge_Reminder_Email_Content_Byuh
							FROM
								(SELECT Donor_Key
									, STUFF((SELECT '' <tr> <td>'' + New_BeginDate + ''</td> <td>'' +  New_TotalPledged + ''</td> <td>'' + New_Name + ''</td> </tr> ''
												FROM 
													(SELECT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key
														, ROW_NUMBER() OVER (PARTITION BY A.New_ConstituentDonor ORDER BY A.New_BeginDate DESC) AS RowNum
														, CONVERT(NVARCHAR(10),A.New_BeginDate,101) AS New_BeginDate
														, CONVERT(NVARCHAR(20),A.New_TotalPledged) AS New_TotalPledged
														, REPLACE(B.New_Name,''&'',''and'') AS New_Name 
														FROM Ext_Pledge A
															INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId 
															INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
														WHERE 1 = 1 
															AND A.Lds_ExpectancyType = 100000003 --Telefund pledge
															AND A.StatusCode = 1 --Outstanding
															AND DATEADD(DAY,30,A.New_BeginDate) <= GETDATE() --Over 30 days old
															AND DATEADD(DAY,60,A.New_BeginDate) >= GETDATE() --Not 60 days and older
															AND A.New_ConstituentDonor is not null --Get constituent only expectancies
															AND C.New_Inst = ''BYUH'' --Replace with respective institution
													) D
												WHERE D.Donor_Key = E.Donor_Key FOR XML PATH('''')),1 ,1, ''''
											) Pledge_Reminder_Html_Text
											FROM 
												(SELECT DISTINCT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key 
													FROM Ext_Pledge A
														INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId 
														INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
													WHERE 1 = 1 
														AND A.Lds_ExpectancyType = 100000003 --Telefund pledge
														AND A.StatusCode = 1 --Outstanding
														AND DATEADD(DAY,30,A.New_BeginDate) <= GETDATE() --Over 30 days old
														AND DATEADD(DAY,60,A.New_BeginDate) >= GETDATE() --Not 60 days and older
														AND A.New_ConstituentDonor is not null --Get constituent only expectancies
														AND C.New_Inst = ''BYUH'' --Replace with respective institution
												) E
											WHERE 1 = 1
												AND Donor_Key IS NOT NULL
											GROUP BY Donor_Key
								) A
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Pledge_Reminder_Email_Content_Byuh = S.Donor_Pledge_Reminder_Email_Content_Byuh
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CONCAT(''<table width="100%"> <tr> <th align="left">Date</th> <th align="left">Amount</th> <th align="left">Fund Account</th> </tr> ''
										, REPLACE(
											REPLACE(Pledge_Reminder_Html_Text,''&LT;'',''<'') 
													, ''&gt;'',''>'')
										, '' </table>''
									)
									AS Donor_Pledge_Reminder_Email_Content_Ldsbc
							FROM
								(SELECT Donor_Key
									, STUFF((SELECT '' <tr> <td>'' + New_BeginDate + ''</td> <td>'' +  New_TotalPledged + ''</td> <td>'' + New_Name + ''</td> </tr> ''
												FROM 
													(SELECT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key
														, ROW_NUMBER() OVER (PARTITION BY A.New_ConstituentDonor ORDER BY A.New_BeginDate DESC) AS RowNum
														, CONVERT(NVARCHAR(10),A.New_BeginDate,101) AS New_BeginDate
														, CONVERT(NVARCHAR(20),A.New_TotalPledged) AS New_TotalPledged
														, REPLACE(B.New_Name,''&'',''and'') AS New_Name 
														FROM Ext_Pledge A
															INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId 
															INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
														WHERE 1 = 1 
															AND A.Lds_ExpectancyType = 100000003 --Telefund pledge
															AND A.StatusCode = 1 --Outstanding
															AND DATEADD(DAY,30,A.New_BeginDate) <= GETDATE() --Over 30 days old
															AND DATEADD(DAY,60,A.New_BeginDate) >= GETDATE() --Not 60 days and older
															AND A.New_ConstituentDonor is not null --Get constituent only expectancies
															AND C.New_Inst = ''LDSBC'' --Replace with respective institution
													) D
												WHERE D.Donor_Key = E.Donor_Key FOR XML PATH('''')),1 ,1, ''''
											) Pledge_Reminder_Html_Text
											FROM 
												(SELECT DISTINCT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key 
													FROM Ext_Pledge A
														INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId 
														INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
													WHERE 1 = 1 
														AND A.Lds_ExpectancyType = 100000003 --Telefund pledge
														AND A.StatusCode = 1 --Outstanding
														AND DATEADD(DAY,30,A.New_BeginDate) <= GETDATE() --Over 30 days old
														AND DATEADD(DAY,60,A.New_BeginDate) >= GETDATE() --Not 60 days and older
														AND A.New_ConstituentDonor is not null --Get constituent only expectancies
														AND C.New_Inst = ''LDSBC'' --Replace with respective institution
												) E
											WHERE 1 = 1
												AND Donor_Key IS NOT NULL
											GROUP BY Donor_Key
								) A
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Pledge_Reminder_Email_Content_Ldsbc = S.Donor_Pledge_Reminder_Email_Content_Ldsbc
						;
			SET ANSI_WARNINGS ON
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Merge_Into_Donor_Dim_2'', @Alpha_Step_Number = ''164X'', @Alpha_Step_Name = ''_Merge_Into_Donor_Dim_2 - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_4
	, 'BEGIN TRY
			SET ANSI_WARNINGS OFF
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Plus_CoordinatingLiaison_DomainName
							, Plus_ConnectedLiaison_DomainName
							, Plus_PendingLiaison_DomainName
							FROM 
								(SELECT ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
									, CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
									, CASE WHEN Liaison_Type = ''Coordinating_Liaison'' THEN DomainName ELSE NULL END AS Plus_CoordinatingLiaison_DomainName
									, CASE WHEN Liaison_Type = ''Connected_Liaison'' THEN DomainName ELSE NULL END AS Plus_ConnectedLiaison_DomainName
									, CASE WHEN Liaison_Type = ''Pending_Liaison'' THEN DomainName ELSE NULL END AS Plus_PendingLiaison_DomainName
									FROM
										(SELECT DISTINCT ''Coordinating_Liaison'' AS Liaison_Type
											, B.ContactId
											, A.DomainName
											FROM Ext_System_User A
												INNER JOIN Ext_Contact B ON A.SystemUserId = B.Plus_CoordinatingLiaison
										UNION
										SELECT DISTINCT ''Coordinating_Liaison'' AS Liaison_Type 
											, B.AccountId AS ContactId
											, A.DomainName
											FROM Ext_System_User A
												INNER JOIN Ext_Account B ON A.SystemUserId = B.Plus_CoordinatingLiaison
										UNION
										SELECT DISTINCT ''Connected_Liaison'' AS Liaison_Type 
											, B.ContactId
											, A.DomainName
											FROM Ext_System_User A
												INNER JOIN Ext_Contact B ON A.SystemUserId = B.Plus_ConnectedLiaison
										UNION
										SELECT DISTINCT ''Connected_Liaison'' AS Liaison_Type 
											, B.AccountId AS ContactId
											, A.DomainName
											FROM Ext_System_User A
												INNER JOIN Ext_Account B ON A.SystemUserId = B.Plus_ConnectedLiaison
										UNION
										SELECT DISTINCT ''Pending_Liaison'' AS Liaison_Type 
											, B.ContactId
											, A.DomainName
											FROM Ext_System_User A
												INNER JOIN Ext_Contact B ON A.SystemUserId = B.Plus_PendingLiaison
										UNION
										SELECT DISTINCT ''Pending_Liaison'' AS Liaison_Type 
											, B.AccountId AS ContactId
											, A.DomainName
											FROM Ext_System_User A
												INNER JOIN Ext_Account B ON A.SystemUserId = B.Plus_PendingLiaison
										) A
								) A
							WHERE 1 = 1
								AND Row_Num = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Plus_CoordinatingLiaison_DomainName = S.Plus_CoordinatingLiaison_DomainName
							, T.Plus_ConnectedLiaison_DomainName = S.Plus_ConnectedLiaison_DomainName
							, T.Plus_PendingLiaison_DomainName = S.Plus_PendingLiaison_DomainName
						;
			SET ANSI_WARNINGS ON
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Merge_Into_Donor_Dim_2'', @Alpha_Step_Number = ''164X'', @Alpha_Step_Name = ''_Merge_Into_Donor_Dim_2 - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH 
		' -- Attribute_5
	, 'BEGIN TRY
			SET ANSI_WARNINGS OFF
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, COUNT(DISTINCT A.Donation_Key) AS Donor_Gift_Count_Previous_5_Years
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
							WHERE 1 = 1
								AND B.New_ReceiptDate BETWEEN CONVERT(DATE,DATEADD(year, DATEDIFF(year, 0, GETDATE()) - 5, 0),101)
														AND CONVERT(DATE,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 0, -1),101)
							GROUP BY Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Gift_Count_Previous_5_Years = S.Donor_Gift_Count_Previous_5_Years
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, ROUND(Donor_Credit_Sum_Amt/Donor_Gift_Count_Previous_5_Years,2) AS Donor_Average_Single_Gift_Previous_5_Years 
							FROM
								(SELECT A.Donor_Key
									, SUM(A.Donation_Credit_Amt) AS Donor_Credit_Sum_Amt
									, COUNT(DISTINCT A.Donation_Key) AS Donor_Gift_Count_Previous_5_Years
									FROM _Donation_Fact A
										INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									WHERE 1 = 1
										AND B.New_ReceiptDate BETWEEN CONVERT(DATE,DATEADD(year, DATEDIFF(year, 0, GETDATE()) - 5, 0),101)
																AND CONVERT(DATE,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 0, -1),101)
									GROUP BY Donor_Key
								) A
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Average_Single_Gift_Previous_5_Years = S.Donor_Average_Single_Gift_Previous_5_Years
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key	
							, CASE WHEN Lds_IsQualified = 0 THEN ''N''
									WHEN Lds_IsQualified = 1 THEN ''Y'' 
									ELSE ''N'' END AS Donor_Is_Qualified
							FROM Ext_Contact
						UNION
						SELECT CONVERT(NVARCHAR(100),AccountId) AS Donor_Key
							, CASE WHEN Lds_IsQualified = 0 THEN ''N''
									WHEN Lds_IsQualified = 1 THEN ''Y'' 
									ELSE ''N'' END AS Donor_Is_Qualified
							FROM Ext_Account
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Is_Qualified = S.Donor_Is_Qualified
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key	
							, CONVERT(DATE,Lds_QualifiedOn,101) AS Donor_Qualified_On
							FROM Ext_Contact
						UNION
						SELECT CONVERT(NVARCHAR(100),AccountId) AS Donor_Key
							, CONVERT(DATE,Lds_QualifiedOn,101) AS Donor_Qualified_On
							FROM Ext_Account
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Qualified_On = S.Donor_Qualified_On
						;
			MERGE INTO _Donor_Dim T
				USING (
							SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key	
								, B.User_Full_Name AS Donor_Qualified_By 
								FROM Ext_Contact A
									LEFT JOIN _User_Dim B ON CONVERT(NVARCHAR(100),A.Lds_QualifiedBy) = B.User_Key
							UNION
							SELECT CONVERT(NVARCHAR(100),AccountId) AS Donor_Key
								, B.User_Full_Name AS Donor_Qualified_By 
								FROM Ext_Account A
									LEFT JOIN _User_Dim B ON CONVERT(NVARCHAR(100),A.Lds_QualifiedBy) = B.User_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Qualified_By = S.Donor_Qualified_By
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization)) AS Donor_Key 
							, MIN(CONVERT(DATE,A.CreatedOn,101)) AS Donor_First_Recurring_Rule_Date_Byu
							FROM Ext_Recurring_Gift_Rules A
								INNER JOIN Ext_Fund_Account B ON A.Plus_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND C.New_Inst = ''BYU''
								AND COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization)) IS NOT NULL
							GROUP BY COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization))
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Recurring_Rule_Date_Byu = S.Donor_First_Recurring_Rule_Date_Byu
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization)) AS Donor_Key 
							, MIN(CONVERT(DATE,A.CreatedOn,101)) AS Donor_First_Recurring_Rule_Date_Byui
							FROM Ext_Recurring_Gift_Rules A
								INNER JOIN Ext_Fund_Account B ON A.Plus_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND C.New_Inst = ''BYUI''
								AND COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization)) IS NOT NULL
							GROUP BY COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization))
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Recurring_Rule_Date_Byui = S.Donor_First_Recurring_Rule_Date_Byui
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization)) AS Donor_Key 
							, MIN(CONVERT(DATE,A.CreatedOn,101)) AS Donor_First_Recurring_Rule_Date_Byuh
							FROM Ext_Recurring_Gift_Rules A
								INNER JOIN Ext_Fund_Account B ON A.Plus_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND C.New_Inst = ''BYUH''
								AND COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization)) IS NOT NULL
							GROUP BY COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization))
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Recurring_Rule_Date_Byuh = S.Donor_First_Recurring_Rule_Date_Byuh
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization)) AS Donor_Key 
							, MIN(CONVERT(DATE,A.CreatedOn,101)) AS Donor_First_Recurring_Rule_Date_Ldsbc
							FROM Ext_Recurring_Gift_Rules A
								INNER JOIN Ext_Fund_Account B ON A.Plus_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND C.New_Inst = ''LDSBC''
								AND COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization)) IS NOT NULL
							GROUP BY COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),CONVERT(NVARCHAR(100),A.Plus_Organization))
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Recurring_Rule_Date_Ldsbc = S.Donor_First_Recurring_Rule_Date_Ldsbc
						;
			SET ANSI_WARNINGS ON
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Merge_Into_Donor_Dim_2'', @Alpha_Step_Number = ''164X'', @Alpha_Step_Name = ''_Merge_Into_Donor_Dim_2 - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH 
		' -- Attribute_6
	, 'BEGIN TRY
			SET ANSI_WARNINGS OFF
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
							, SUM(A.New_GiftAmount) AS Donor_Recurring_Total_Last_Month_Byu
							FROM dbo._Gift_ A
								INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND (A.Lds_RecurringGiftRule IS NOT NULL
										OR A.Lds_RecurringGiftGroup IS NOT NULL)
								AND C.New_Inst = ''BYU''
								AND CONVERT(DATE,A.New_ReceiptDate,101) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0),101)
																	AND CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1),101)
							GROUP BY COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor)
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Total_Last_Month_Byu = S.Donor_Recurring_Total_Last_Month_Byu
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
							, SUM(A.New_GiftAmount) AS Donor_Recurring_Total_Last_Month_Byui
							FROM dbo._Gift_ A
								INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND (A.Lds_RecurringGiftRule IS NOT NULL
										OR A.Lds_RecurringGiftGroup IS NOT NULL)
								AND C.New_Inst = ''BYUI''
								AND CONVERT(DATE,A.New_ReceiptDate,101) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0),101)
																	AND CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1),101)
							GROUP BY COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor)
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Total_Last_Month_Byui = S.Donor_Recurring_Total_Last_Month_Byui
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
							, SUM(A.New_GiftAmount) AS Donor_Recurring_Total_Last_Month_Byuh
							FROM dbo._Gift_ A
								INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND (A.Lds_RecurringGiftRule IS NOT NULL
										OR A.Lds_RecurringGiftGroup IS NOT NULL)
								AND C.New_Inst = ''BYUH''
								AND CONVERT(DATE,A.New_ReceiptDate,101) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0),101)
																	AND CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1),101)
							GROUP BY COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor)
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Total_Last_Month_Byuh = S.Donor_Recurring_Total_Last_Month_Byuh
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
							, SUM(A.New_GiftAmount) AS Donor_Recurring_Total_Last_Month_Ldsbc
							FROM dbo._Gift_ A
								INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND (A.Lds_RecurringGiftRule IS NOT NULL
										OR A.Lds_RecurringGiftGroup IS NOT NULL)
								AND C.New_Inst = ''LDSBC''
								AND CONVERT(DATE,A.New_ReceiptDate,101) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-1, 0),101)
																	AND CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-1, -1),101)
							GROUP BY COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor)
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Total_Last_Month_Ldsbc = S.Donor_Recurring_Total_Last_Month_Ldsbc
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
							, SUM(A.New_GiftAmount) AS Donor_Recurring_Total_Month_Before_Last_Byu
							FROM dbo._Gift_ A
								INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND (A.Lds_RecurringGiftRule IS NOT NULL
										OR A.Lds_RecurringGiftGroup IS NOT NULL)
								AND C.New_Inst = ''BYU''
								AND CONVERT(DATE,A.New_ReceiptDate,101) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-2, 0),101)
																	AND CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-2, -1),101)
							GROUP BY COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor)	
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Total_Month_Before_Last_Byu = S.Donor_Recurring_Total_Month_Before_Last_Byu
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
							, SUM(A.New_GiftAmount) AS Donor_Recurring_Total_Month_Before_Last_Byui
							FROM dbo._Gift_ A
								INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND (A.Lds_RecurringGiftRule IS NOT NULL
										OR A.Lds_RecurringGiftGroup IS NOT NULL)
								AND C.New_Inst = ''BYUI''
								AND CONVERT(DATE,A.New_ReceiptDate,101) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-2, 0),101)
																	AND CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-2, -1),101)
							GROUP BY COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor)
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Total_Month_Before_Last_Byui = S.Donor_Recurring_Total_Month_Before_Last_Byui
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
							, SUM(A.New_GiftAmount) AS Donor_Recurring_Total_Month_Before_Last_Byuh
							FROM dbo._Gift_ A
								INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND (A.Lds_RecurringGiftRule IS NOT NULL
										OR A.Lds_RecurringGiftGroup IS NOT NULL)
								AND C.New_Inst = ''BYUH''
								AND CONVERT(DATE,A.New_ReceiptDate,101) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-2, 0),101)
																	AND CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-2, -1),101)
							GROUP BY COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor)
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Total_Month_Before_Last_Byuh = S.Donor_Recurring_Total_Month_Before_Last_Byuh
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Key
							, SUM(A.New_GiftAmount) AS Donor_Recurring_Total_Month_Before_Last_Ldsbc
							FROM dbo._Gift_ A
								INNER JOIN Ext_Fund_Account B ON A.New_FundAccount = B.New_FundAccountId
								INNER JOIN Ext_Institution C ON B.New_InstitutionalHierarchy = C.New_InstitutionId
							WHERE 1 = 1
								AND (A.Lds_RecurringGiftRule IS NOT NULL
										OR A.Lds_RecurringGiftGroup IS NOT NULL)
								AND C.New_Inst = ''LDSBC''
								AND CONVERT(DATE,A.New_ReceiptDate,101) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE())-2, 0),101)
																	AND CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, -1, GETDATE())-2, -1),101)
							GROUP BY COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor)
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Total_Month_Before_Last_Ldsbc = S.Donor_Recurring_Total_Month_Before_Last_Ldsbc
						;
			SET ANSI_WARNINGS ON
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Merge_Into_Donor_Dim_2'', @Alpha_Step_Number = ''164X'', @Alpha_Step_Name = ''_Merge_Into_Donor_Dim_2 - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_7
	, 'BEGIN TRY
			SET ANSI_WARNINGS OFF
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CASE WHEN Donor_Recurring_Total_Last_Month_Byu > Donor_Recurring_Total_Month_Before_Last_Byu THEN ''Y'' 
									ELSE ''N'' END AS Donor_Recurring_Gift_Upgrade_Byu
							FROM _Donor_Dim
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Gift_Upgrade_Byu = S.Donor_Recurring_Gift_Upgrade_Byu
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CASE WHEN Donor_Recurring_Total_Last_Month_Byui > Donor_Recurring_Total_Month_Before_Last_Byui THEN ''Y'' 
									ELSE ''N'' END AS Donor_Recurring_Gift_Upgrade_Byui
							FROM _Donor_Dim
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Gift_Upgrade_Byui = S.Donor_Recurring_Gift_Upgrade_Byui
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CASE WHEN Donor_Recurring_Total_Last_Month_Byuh > Donor_Recurring_Total_Month_Before_Last_Byuh THEN ''Y'' 
									ELSE ''N'' END AS Donor_Recurring_Gift_Upgrade_Byuh
							FROM _Donor_Dim
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Gift_Upgrade_Byuh = S.Donor_Recurring_Gift_Upgrade_Byuh
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, CASE WHEN Donor_Recurring_Total_Last_Month_Ldsbc > Donor_Recurring_Total_Month_Before_Last_Ldsbc THEN ''Y''
									ELSE ''N'' END AS Donor_Recurring_Gift_Upgrade_Ldsbc
							FROM _Donor_Dim
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Recurring_Gift_Upgrade_Ldsbc = S.Donor_Recurring_Gift_Upgrade_Ldsbc
						;
			SET ANSI_WARNINGS ON
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Merge_Into_Donor_Dim_2'', @Alpha_Step_Number = ''164X'', @Alpha_Step_Name = ''_Merge_Into_Donor_Dim_2 - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH  
		' -- Attribute_8
	, '
		' -- Attribute_9
	, 'BEGIN TRY
			SET ANSI_WARNINGS OFF
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byu_Minus_1
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byu_Minus_1
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byu_Minus_1) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byu_Minus_1
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-1
														AND B.New_Inst = ''BYU''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-1
												AND C.New_Inst = ''BYU''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byu_Minus_1 = S.Donor_Retention_Type_Code_Byu_Minus_1
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byu_Minus_2
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byu_Minus_2
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byu_Minus_2) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byu_Minus_2
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-2
														AND B.New_Inst = ''BYU''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-2
												AND C.New_Inst = ''BYU''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byu_Minus_2 = S.Donor_Retention_Type_Code_Byu_Minus_2
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byu_Minus_3
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byu_Minus_3
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byu_Minus_3) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byu_Minus_3
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-3
														AND B.New_Inst = ''BYU''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-3
												AND C.New_Inst = ''BYU''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byu_Minus_3 = S.Donor_Retention_Type_Code_Byu_Minus_3
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byu_Minus_4
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byu_Minus_4
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byu_Minus_4) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byu_Minus_4
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-4
														AND B.New_Inst = ''BYU''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-4
												AND C.New_Inst = ''BYU''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byu_Minus_4 = S.Donor_Retention_Type_Code_Byu_Minus_4
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byu_Minus_5
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byu_Minus_5
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byu_Minus_5) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byu_Minus_5
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-5
														AND B.New_Inst = ''BYU''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-5
												AND C.New_Inst = ''BYU''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byu_Minus_5 = S.Donor_Retention_Type_Code_Byu_Minus_5
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byui_Minus_1
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byui_Minus_1
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byui_Minus_1) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byui_Minus_1
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-1
														AND B.New_Inst = ''BYUI''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-1
												AND C.New_Inst = ''BYUI''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byui_Minus_1 = S.Donor_Retention_Type_Code_Byui_Minus_1
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byui_Minus_2
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byui_Minus_2
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byui_Minus_2) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byui_Minus_2
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-2
														AND B.New_Inst = ''BYUI''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-2
												AND C.New_Inst = ''BYUI''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byui_Minus_2 = S.Donor_Retention_Type_Code_Byui_Minus_2
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byui_Minus_3
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byui_Minus_3
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byui_Minus_3) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byui_Minus_3
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-3
														AND B.New_Inst = ''BYUI''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-3
												AND C.New_Inst = ''BYUI''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byui_Minus_3 = S.Donor_Retention_Type_Code_Byui_Minus_3
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byui_Minus_4
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byui_Minus_4
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byui_Minus_4) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byui_Minus_4
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-4
														AND B.New_Inst = ''BYUI''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-4
												AND C.New_Inst = ''BYUI''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byui_Minus_4 = S.Donor_Retention_Type_Code_Byui_Minus_4
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byui_Minus_5
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byui_Minus_5
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byui_Minus_5) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byui_Minus_5
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-5
														AND B.New_Inst = ''BYUI''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-5
												AND C.New_Inst = ''BYUI''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byui_Minus_5 = S.Donor_Retention_Type_Code_Byui_Minus_5
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byuh_Minus_1
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byuh_Minus_1
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byuh_Minus_1) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byuh_Minus_1
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-1
														AND B.New_Inst = ''BYUH''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-1
												AND C.New_Inst = ''BYUH''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byuh_Minus_1 = S.Donor_Retention_Type_Code_Byuh_Minus_1
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byuh_Minus_2
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byuh_Minus_2
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byuh_Minus_2) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byuh_Minus_2
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-2
														AND B.New_Inst = ''BYUH''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-2
												AND C.New_Inst = ''BYUH''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byuh_Minus_2 = S.Donor_Retention_Type_Code_Byuh_Minus_2
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byuh_Minus_3
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byuh_Minus_3
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byuh_Minus_3) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byuh_Minus_3
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-3
														AND B.New_Inst = ''BYUH''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-3
												AND C.New_Inst = ''BYUH''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byuh_Minus_3 = S.Donor_Retention_Type_Code_Byuh_Minus_3
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byuh_Minus_4
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byuh_Minus_4
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byuh_Minus_4) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byuh_Minus_4
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-4
														AND B.New_Inst = ''BYUH''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-4
												AND C.New_Inst = ''BYUH''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byuh_Minus_4 = S.Donor_Retention_Type_Code_Byuh_Minus_4
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Byuh_Minus_5
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Byuh_Minus_5
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byuh_Minus_5) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byuh_Minus_5
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-5
														AND B.New_Inst = ''BYUH''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-5
												AND C.New_Inst = ''BYUH''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Byuh_Minus_5 = S.Donor_Retention_Type_Code_Byuh_Minus_5
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Ldsbc_Minus_1
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Ldsbc_Minus_1
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Ldsbc_Minus_1) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Ldsbc_Minus_1
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-1
														AND B.New_Inst = ''LDSBC''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-1
												AND C.New_Inst = ''LDSBC''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Ldsbc_Minus_1 = S.Donor_Retention_Type_Code_Ldsbc_Minus_1
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Ldsbc_Minus_2
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Ldsbc_Minus_2
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Ldsbc_Minus_2) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Ldsbc_Minus_2
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-2
														AND B.New_Inst = ''LDSBC''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-2
												AND C.New_Inst = ''LDSBC''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Ldsbc_Minus_2 = S.Donor_Retention_Type_Code_Ldsbc_Minus_2
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Ldsbc_Minus_3
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Ldsbc_Minus_3
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Ldsbc_Minus_3) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Ldsbc_Minus_3
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-3
														AND B.New_Inst = ''LDSBC''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-3
												AND C.New_Inst = ''LDSBC''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Ldsbc_Minus_3 = S.Donor_Retention_Type_Code_Ldsbc_Minus_3
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Ldsbc_Minus_4
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Ldsbc_Minus_4
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Ldsbc_Minus_4) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Ldsbc_Minus_4
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-4
														AND B.New_Inst = ''LDSBC''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-4
												AND C.New_Inst = ''LDSBC''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Ldsbc_Minus_4 = S.Donor_Retention_Type_Code_Ldsbc_Minus_4
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT Donor_Key
							, Donor_Retention_Type_Code_Ldsbc_Minus_5
							FROM
								(SELECT Donor_Key
									, Donor_Retention_Type_Code_Ldsbc_Minus_5
									, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Ldsbc_Minus_5) AS RowNum
									FROM
										(SELECT A.Donor_Key
											, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Ldsbc_Minus_5
											FROM
												(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
													, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
													FROM Ext_Donor_Score A
														INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
													WHERE 1 = 1
														AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-5
														AND B.New_Inst = ''LDSBC''
														AND A.StatusCode = 1 -- Active
													GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
												) A
												INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																					AND A.ModifiedOn = B.ModifiedOn
												INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
											WHERE 1 = 1
												AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())-5
												AND C.New_Inst = ''LDSBC''
												AND B.StatusCode = 1 -- Active
										) A
								) A
							WHERE 1 = 1
								AND RowNum = 1
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_Retention_Type_Code_Ldsbc_Minus_5 = S.Donor_Retention_Type_Code_Ldsbc_Minus_5
						;
			SET ANSI_WARNINGS ON
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Merge_Into_Donor_Dim_2'', @Alpha_Step_Number = ''164X'', @Alpha_Step_Name = ''_Merge_Into_Donor_Dim_2 - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_10
	, 'BEGIN TRY
			SET ANSI_WARNINGS OFF
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Byu_Amt
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN Ldsp_First_Donation_Date_Byu() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
								INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND D.New_Inst = ''BYU''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_To_Byu_Amt = S.Donor_First_Gift_To_Byu_Amt
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Byui_Amt
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN Ldsp_First_Donation_Date_Byui() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
								INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND D.New_Inst = ''BYUI''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_To_Byui_Amt = S.Donor_First_Gift_To_Byui_Amt
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Byuh_Amt
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN Ldsp_First_Donation_Date_Byuh() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
								INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND D.New_Inst = ''BYUH''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_To_Byuh_Amt = S.Donor_First_Gift_To_Byuh_Amt
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Ldsbc_Amt
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN Ldsp_First_Donation_Date_Ldsbc() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
								INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND D.New_Inst = ''LDSBC''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_To_Ldsbc_Amt = S.Donor_First_Gift_To_Ldsbc_Amt
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Church_Amt
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN Ldsp_First_Donation_Date_Church() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
								INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND D.New_Inst = ''Church''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_To_Church_Amt = S.Donor_First_Gift_To_Church_Amt
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Ldsp_Amt
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN Ldsp_First_Donation_Date_Ldsp() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
								INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_To_Ldsp_Amt = S.Donor_First_Gift_To_Ldsp_Amt
						;
			SET ANSI_WARNINGS ON
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Merge_Into_Donor_Dim_2'', @Alpha_Step_Number = ''164X'', @Alpha_Step_Name = ''_Merge_Into_Donor_Dim_2 - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH 
		' -- Attribute_11
	, 'BEGIN TRY
			SET ANSI_WARNINGS OFF
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Byu
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND C.New_Inst = ''BYU''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_Date_Byu = S.Donor_First_Gift_Date_Byu
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Byui
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND C.New_Inst = ''BYUI''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_Date_Byui = S.Donor_First_Gift_Date_Byui
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Byuh
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND C.New_Inst = ''BYUH''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_Date_Byuh = S.Donor_First_Gift_Date_Byuh
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Ldsbc
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND C.New_Inst = ''LDSBC''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_Date_Ldsbc = S.Donor_First_Gift_Date_Ldsbc
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Church
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
								AND C.New_Inst = ''Church''
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_Date_Church = S.Donor_First_Gift_Date_Church
						;
			MERGE INTO _Donor_Dim T
				USING (
						SELECT A.Donor_Key
							, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Ldsp
							FROM _Donation_Fact A
								INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
							WHERE 1 = 1
								AND A.Plus_SharedCreditType != ''Matching'' -- Not Matching
								AND A.Plus_Type IN (''Hard'',''Shared'') -- Not Influence 100000001
							GROUP BY A.Donor_Key
						) S ON T.Donor_Key = S.Donor_Key
				WHEN MATCHED THEN 
					UPDATE
						SET T.Donor_First_Gift_Date_Ldsp = S.Donor_First_Gift_Date_Ldsp
						;
			SET ANSI_WARNINGS ON
		END TRY 
		BEGIN CATCH
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Merge_Into_Donor_Dim_2'', @Alpha_Step_Number = ''164X'', @Alpha_Step_Name = ''_Merge_Into_Donor_Dim_2 - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH 
		' -- Attribute_12
	, '  
		' -- Attribute_13
	, 'BEGIN TRY
				SET ANSI_WARNINGS OFF
				MERGE INTO _Donor_Dim T
					USING (
							SELECT Donor_Key
								, Donor_Retention_Type_Code_Byu
								FROM
									(SELECT Donor_Key
										, Donor_Retention_Type_Code_Byu
										, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byu) AS RowNum
										FROM
											(SELECT A.Donor_Key
												, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byu
												FROM
													(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
														, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
														FROM Ext_Donor_Score A
															INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
														WHERE 1 = 1
															AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())
															AND B.New_Inst = ''BYU''
															AND A.StatusCode = 1 -- Active
														GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
													) A
													INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																						AND A.ModifiedOn = B.ModifiedOn
													INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
												WHERE 1 = 1
													AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())
													AND C.New_Inst = ''BYU''
													AND B.StatusCode = 1 -- Active
											) A
									) A
								WHERE 1 = 1
									AND RowNum = 1
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_Retention_Type_Code_Byu = S.Donor_Retention_Type_Code_Byu
								;
				SET ANSI_WARNINGS ON
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Retention_Type_Code_Byu'', @Alpha_Step_Number = ''141X'', @Alpha_Step_Name = ''Donor_Retention_Type_Code_Byu - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
		' -- Attribute_14
	, 'BEGIN TRY
				SET ANSI_WARNINGS OFF
				MERGE INTO _Donor_Dim T
					USING (
							SELECT Donor_Key
								, Donor_Retention_Type_Code_Byui
								FROM
									(SELECT Donor_Key
										, Donor_Retention_Type_Code_Byui
										, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byui) AS RowNum
										FROM
											(SELECT A.Donor_Key
												, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byui
												FROM
													(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
														, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
														FROM Ext_Donor_Score A
															INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
														WHERE 1 = 1
															AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())
															AND B.New_Inst = ''BYUI''
															AND A.StatusCode = 1 -- Active
														GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
													) A
													INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																						AND A.ModifiedOn = B.ModifiedOn
													INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
												WHERE 1 = 1
													AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())
													AND C.New_Inst = ''BYUI''
													AND B.StatusCode = 1 -- Active
											) A
									) A
								WHERE 1 = 1
									AND RowNum = 1
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_Retention_Type_Code_Byui = S.Donor_Retention_Type_Code_Byui
								;
				SET ANSI_WARNINGS ON
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Retention_Type_Code_Byui'', @Alpha_Step_Number = ''142X'', @Alpha_Step_Name = ''Donor_Retention_Type_Code_Byui - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
		' -- Attribute_15
	, 'BEGIN TRY
				SET ANSI_WARNINGS OFF
				MERGE INTO _Donor_Dim T
					USING (
							SELECT Donor_Key
								, Donor_Retention_Type_Code_Byuh
								FROM
									(SELECT Donor_Key
										, Donor_Retention_Type_Code_Byuh
										, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Byuh) AS RowNum
										FROM
											(SELECT A.Donor_Key
												, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Byuh
												FROM
													(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
														, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
														FROM Ext_Donor_Score A
															INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
														WHERE 1 = 1
															AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())
															AND B.New_Inst = ''BYUH''
															AND A.StatusCode = 1 -- Active
														GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
													) A
													INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																						AND A.ModifiedOn = B.ModifiedOn
													INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
												WHERE 1 = 1
													AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())
													AND C.New_Inst = ''BYUH''
													AND B.StatusCode = 1 -- Active
											) A
									) A
								WHERE 1 = 1
									AND RowNum = 1
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_Retention_Type_Code_Byuh = S.Donor_Retention_Type_Code_Byuh
								;
				SET ANSI_WARNINGS ON
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Retention_Type_Code_Byuh'', @Alpha_Step_Number = ''143X'', @Alpha_Step_Name = ''Donor_Retention_Type_Code_Byuh - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
		' -- Attribute_16
	, 'BEGIN TRY
				SET ANSI_WARNINGS OFF
				MERGE INTO _Donor_Dim T
					USING (
							SELECT Donor_Key
								, Donor_Retention_Type_Code_Ldsbc
								FROM
									(SELECT Donor_Key
										, Donor_Retention_Type_Code_Ldsbc
										, ROW_NUMBER() OVER(PARTITION BY Donor_Key ORDER BY Donor_Retention_Type_Code_Ldsbc) AS RowNum
										FROM
											(SELECT A.Donor_Key
												, CONVERT(NVARCHAR(2),B.Plus_I5LegacyDonorType) AS Donor_Retention_Type_Code_Ldsbc
												FROM
													(SELECT COALESCE(A.Plus_Constituent,A.Plus_Institution) AS Donor_Key
														, MIN(A.ModifiedOn) AS ModifiedOn -- Earliest Date
														FROM Ext_Donor_Score A
															INNER JOIN Ext_Institution B ON A.Plus_Institution = B.New_InstitutionId
														WHERE 1 = 1
															AND YEAR(A.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())
															AND B.New_Inst = ''LDSBC''
															AND A.StatusCode = 1 -- Active
														GROUP BY COALESCE(A.Plus_Constituent,A.Plus_Institution)
													) A
													INNER JOIN Ext_Donor_Score B ON A.Donor_Key = COALESCE(B.Plus_Constituent,B.Plus_Institution)
																						AND A.ModifiedOn = B.ModifiedOn
													INNER JOIN Ext_Institution C ON B.Plus_Institution = C.New_InstitutionId
												WHERE 1 = 1
													AND YEAR(B.Plus_I5LegacyDonorTypeDate) = YEAR(GETDATE())
													AND C.New_Inst = ''LDSBC''
													AND B.StatusCode = 1 -- Active
											) A
									) A
								WHERE 1 = 1
									AND RowNum = 1
							) S ON T.Donor_Key = S.Donor_Key
						WHEN MATCHED THEN 
							UPDATE
								SET T.Donor_Retention_Type_Code_Ldsbc = S.Donor_Retention_Type_Code_Ldsbc
								;
				SET ANSI_WARNINGS ON
			END TRY 
			BEGIN CATCH
				DECLARE @ERROR_NUMBER INT
				DECLARE @ERROR_SEVERITY INT
				DECLARE @ERROR_STATE INT
				DECLARE @ERROR_PROCEDURE NVARCHAR(500)
				DECLARE @ERROR_LINE INT
				DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
				SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
				SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
				SELECT @ERROR_STATE = (SELECT ERROR_STATE())
				SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
				SELECT @ERROR_LINE = (SELECT ERROR_LINE())
				SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
				EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''Donor_Retention_Type_Code_Ldsbc'', @Alpha_Step_Number = ''144X'', @Alpha_Step_Name = ''Donor_Retention_Type_Code_Ldsbc - Error'', @Alpha_Result = 0
				, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
			END CATCH 
		' -- Attribute_17
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''_Merge_Into_Donor_Dim_2'', @Alpha_Step_Number = ''164H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1; 
		' -- Attribute_18
	, ' ' -- Attribute_19
	, ' ' -- Attribute_20
	, 'EXEC dbo.usp_Transform_Data @Transform_Data_Table_Name = ''_Merge_Into_Donor_Dim_2''; ------> HARDCODE <------
		' -- Attribute_21
	, 1 -- Active
	, GETDATE() -- Insert_Date
	, NULL  -- Update_Date                
)
,
-- --------------------------
-- View_Portfolio_Management Table
-- --------------------------
('View_Table' -- Dim_Object
	, 'View_Portfolio_Management' -- Table_Name
	, 'Ldsp_Id NVARCHAR(100)
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
		' -- Create_Table
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
		' -- Insert_Fields
	, ' ' -- From_Statement
	, ' ' -- Where_Statement
	, 'DECLARE @TABLE_NAME NVARCHAR(100)
		SET @TABLE_NAME = ''View_Portfolio_Management'' ; ------> HARDCODE <------
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''165D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1;
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''165D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_1
	, '
		' -- Attribute_2
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''165F'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1; 							
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''165F'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_3
	, '
		BEGIN TRY
			INSERT INTO View_Portfolio_Management (
				Ldsp_Id
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
			)
			SELECT A.Donor_Ldsp_Id AS Ldsp_Id
				, A.Donor_Name AS Donor_Full_Name
				, A.Donor_Display_Name AS Donor_Display_Name
				, A.Donor_Total_Name AS Couple_Name
				, A.Donor_Total_Name_Display AS Couple_Display_Name
				, A.Plus_CoordinatingLiaison AS Coordinating_Liaison
				, A.Plus_PendingLiaison AS Pending_Liaison
				, A.Plus_ConnectedLiaison AS Connected_Liaison
				, A.Plus_CoordinatingLiaison_DomainName AS Coordinating_Liaison_Domain_Name 
				, A.Plus_PendingLiaison_DomainName AS Pending_Liaison_Domain_Name
				, A.Plus_ConnectedLiaison_DomainName AS Connected_Liaison_Domain_Name
				, A.Donor_Contact_Type AS Contact_Type
				, A.Donor_Type_Code_Ldsp AS Ldsp_Donor_Type
				, C.Donor_Age AS Age
				, C.Donor_Birth_Dt AS Birthdate
				, C.Donor_Birth_Dt_Year AS Birth_Year
				, B.Address_Type AS Address_Type
				, B.Address_Street_1 AS Street_Line_1
				, B.Address_Street_2 AS Street_Line_2
				, B.Address_City AS City
				, B.Address_County AS County
				, B.Address_State_Code AS State_Abbreviation
				, B.Address_Post_Code_Full AS Zip_Code
				, B.Address_Country AS Country
				, B.Phone_Number AS Phone_Number
				, B.Email_Address AS Email_Address
				, A.Spouse_Email AS Spouse_Email
				, A.Donor_Total_Lifetime_Giving AS Total_Lifetime_Giving
				, A.Donor_Total_Lifetime_Giving_Last_5_Years AS Total_Lifetime_Giving_Last_5_Years
				, D.Total_Giving_Current_Year AS Total_Giving_Current_Year
				, D.Total_Giving_Current_Year_Minus_1 AS Total_Giving_1_Years_Ago
				, D.Total_Giving_Current_Year_Minus_2 AS Total_Giving_2_Years_Ago
				, D.Total_Giving_Current_Year_Minus_3 AS Total_Giving_3_Years_Ago
				, D.Total_Giving_Current_Year_Minus_4 AS Total_Giving_4_Years_Ago
				, D.Total_Giving_Current_Year_Minus_5 AS Total_Giving_5_Years_Ago
				, A.Donor_Gift_Capacity_En AS Gift_Capacity_2016_To_2020
				, A.Donor_Gift_Count_Previous_5_Years AS Gift_Count_Previous_5_Years
				, A.Donor_Average_Single_Gift_Previous_5_Years AS Average_Single_Gift_Previous_5_Years
				, A.Donor_Ldsp_Largest_Gift AS Ldsp_Largest_Gift
				, A.Donor_Largest_Gift_Date_Ldsp AS Ldsp_Largest_Gift_Date
				, A.Donor_Most_Recent_Gift_To_Ldsp_Amt AS Ldsp_Most_Recent_Gift
				, A.Donor_Most_Recent_Gift_Date_Ldsp AS Ldsp_Most_Recent_Gift_Date
				, A.Donor_Institution_Giving_Areas AS Institution_Giving_Areas
				, A.Donor_Byu_Giving_Areas AS Byu_Giving_Areas
				, A.Donor_Church_Giving_Areas AS Church_Giving_Areas
				, C.Donor_Qualified AS Is_Qualified
				, C.Donor_Qualified_On AS Qualified_On 
				, C.Donor_Qualified_By AS Qualified_By
				, A.Donor_Key AS DonorId
				, A.Donor_First_Gift_To_Byu_Amt AS First_Gift_To_Byu_Amt
				, A.Donor_First_Gift_To_Byui_Amt AS First_Gift_To_Byui_Amt
				, A.Donor_First_Gift_To_Byuh_Amt AS First_Gift_To_Byuh_Amt
				, A.Donor_First_Gift_To_Ldsbc_Amt AS First_Gift_To_Ldsbc_Amt
				, A.Donor_First_Gift_To_Church_Amt AS First_Gift_To_Church_Amt
				, A.Donor_First_Gift_To_Ldsp_Amt AS First_Gift_To_Ldsp_Amt
				, A.Donor_First_Gift_Date_Byu AS First_Gift_Date_Byu
				, A.Donor_First_Gift_Date_Byui AS First_Gift_Date_Byui
				, A.Donor_First_Gift_Date_Byuh AS First_Gift_Date_Byuh
				, A.Donor_First_Gift_Date_Ldsbc AS First_Gift_Date_Ldsbc
				, A.Donor_First_Gift_Date_Church AS First_Gift_Date_Church
				, A.Donor_First_Gift_Date_Ldsp AS First_Gift_Date_Ldsp
				, E.Total_Giving_With_Matching_Current_Year AS Total_Giving_Current_Year_With_Matching
				, E.Total_Giving_With_Matching_Current_Year_Minus_1 AS Total_Giving_1_Years_Ago_With_Matching
				, E.Total_Giving_With_Matching_Current_Year_Minus_2 AS Total_Giving_2_Years_Ago_With_Matching
				, E.Total_Giving_With_Matching_Current_Year_Minus_3 AS Total_Giving_3_Years_Ago_With_Matching
				, E.Total_Giving_With_Matching_Current_Year_Minus_4 AS Total_Giving_4_Years_Ago_With_Matching
				, E.Total_Giving_With_Matching_Current_Year_Minus_5 AS Total_Giving_5_Years_Ago_With_Matching
				FROM _Donor_Dim A
					LEFT JOIN _Primary_Contact_Dim B ON A.Donor_Key = B.Donor_Key
					LEFT JOIN _Donor_Detail_Dim C ON A.Donor_Key = C.Donor_Key
					LEFT JOIN _Total_Giving_Dim D ON A.Donor_Key = D.Donor_Key
					LEFT JOIN _Total_Giving_With_Matching_Dim E ON A.Donor_Key = E.Donor_Key
					WHERE 1 = 1
						AND (A.Plus_CoordinatingLiaison_DomainName IS NOT NULL
								OR A.Plus_PendingLiaison_DomainName IS NOT NULL
								OR A.Plus_ConnectedLiaison_DomainName IS NOT NULL
							)
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''View_Portfolio_Management'', @Alpha_Step_Number = ''165X'', @Alpha_Step_Name = ''View_Portfolio_Management - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_4
	, '
		' -- Attribute_5
	, '
		' -- Attribute_6
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''165H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1; 
		' -- Attribute_7
	, ' ' -- Attribute_8
	, ' ' -- Attribute_9
	, ' ' -- Attribute_10
	, ' ' -- Attribute_11
	, ' ' -- Attribute_12
	, ' ' -- Attribute_13
	, ' ' -- Attribute_14
	, ' ' -- Attribute_15
	, ' ' -- Attribute_16
	, ' ' -- Attribute_17
	, ' ' -- Attribute_18
	, ' ' -- Attribute_19
	, ' ' -- Attribute_20
	, 'EXEC dbo.usp_Transform_Data @Transform_Data_Table_Name = ''View_Portfolio_Management''; ------> HARDCODE <------
		' -- Attribute_21
	, 1 -- Active
	, GETDATE() -- Insert_Date
	, NULL  -- Update_Date                
)
,
-- --------------------------
-- View_Dl_Activities Table
-- --------------------------
('View_Table' -- Dim_Object
	, 'View_Dl_Activities' -- Table_Name
	, '	Owner NVARCHAR(200)
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
		' -- Create_Table
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
		' -- Insert_Fields
	, ' ' -- From_Statement
	, ' ' -- Where_Statement
	, 'DECLARE @TABLE_NAME NVARCHAR(100)
		SET @TABLE_NAME = ''View_Dl_Activities'' ; ------> HARDCODE <------
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''166D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1;
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''166D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_1
	, '
		' -- Attribute_2
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''166F'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1; 							
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''166F'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_3
	, '
		BEGIN TRY
			INSERT INTO View_Dl_Activities (
				Owner
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
			)
			SELECT C.Owner
				, A.Donor_Ldsp_Id
				, A.Donor_Display_Name
				, C.Type
				, C.Subject
				, C.Regarding
				, C.Face_To_Face
				, C.Scheduled_Start
				, C.Scheduled_End
				, C.Completed
				, C.CreatedOn
				, C.ModifiedOn
				, C.Description
				, C.Attendees
				, C.Source
				, C.StateCode
				, C.StatusCode
				, A.Donor_Key
				, C.Activity_Id
				, C.Regarding_Type
				FROM _Donor_Dim A
					INNER JOIN _Activity_Bridge B ON A.Activity_Group_Key = B.Activity_Group_Key
					INNER JOIN _Activity_Dim C ON B.Activity_Key = C.Activity_Key
				WHERE 1 = 1
					AND C.Type IN (''Appointment'',''Email'',''Letter'',''Phone Call'',''Fax'')
					AND C.Owner IN
								(SELECT DISTINCT B.User_Full_Name
									FROM 
										(SELECT A.Donor_Ldsp_Id
											, A.Donor_Display_Name
											, C.Type
											, C.Subject
											, C.Regarding
											, C.Face_To_Face
											, C.Scheduled_Start
											, C.Scheduled_End
											, C.Completed
											, C.CreatedOn
											, C.ModifiedOn
											, C.Description
											, C.Attendees
											, C.Owner
											, C.Source
											, C.StateCode
											, C.StatusCode
											, A.Donor_Key
											, C.Activity_Id
											, C.Regarding_Type
											FROM _Donor_Dim A
												INNER JOIN _Activity_Bridge B ON A.Activity_Group_Key = B.Activity_Group_Key
												INNER JOIN _Activity_Dim C ON B.Activity_Key = C.Activity_Key
										) A
										LEFT JOIN _User_Coordinating_Liaison_Dim B ON A.Owner = B.User_Full_Name
									WHERE 1 = 1
										AND B.User_Full_Name IS NOT NULL
								)
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''View_Dl_Activities'', @Alpha_Step_Number = ''166X'', @Alpha_Step_Name = ''View_Dl_Activities - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_4
	, '
		' -- Attribute_5
	, '
		' -- Attribute_6
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''166H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1; 
		' -- Attribute_7
	, ' ' -- Attribute_8
	, ' ' -- Attribute_9
	, ' ' -- Attribute_10
	, ' ' -- Attribute_11
	, ' ' -- Attribute_12
	, ' ' -- Attribute_13
	, ' ' -- Attribute_14
	, ' ' -- Attribute_15
	, ' ' -- Attribute_16
	, ' ' -- Attribute_17
	, ' ' -- Attribute_18
	, ' ' -- Attribute_19
	, ' ' -- Attribute_20
	, ' ' -- Attribute_21
	, 1 -- Active
	, GETDATE() -- Insert_Date
	, NULL  -- Update_Date                
)
,
-- --------------------------
-- View_Dl_Initiatives Table
-- --------------------------
('View_Table' -- Dim_Object
	, 'View_Dl_Initiatives' -- Table_Name
	, '	Donor_Ldsp_Id NVARCHAR(100)
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
		' -- Create_Table
	, ' Donor_Ldsp_Id
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
		' -- Insert_Fields
	, ' ' -- From_Statement
	, ' ' -- Where_Statement
	, 'DECLARE @TABLE_NAME NVARCHAR(100)
		SET @TABLE_NAME = ''View_Dl_Initiatives'' ; ------> HARDCODE <------
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''167D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1;
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''167D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_1
	, '
		' -- Attribute_2
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''167F'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1; 							
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''167F'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_3
	, '
		BEGIN TRY
			INSERT INTO View_Dl_Initiatives (
				Donor_Ldsp_Id
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
			)
			SELECT C.Donor_Ldsp_Id
				, A.Initiative_Key
				, A.Initiative_Name_Donor_Name
				, A.Initiative_Step_Name
				, A.Initiative_State_Code
				, A.Initiative_Status_Code
				, A.Initiative_Proposal_Status	
				, A.Initiative_Liaison
				, A.Initiative_New_Account
				, A.Initiative_Proposal_Date
				, A.Initiative_Targeted_Commitment_Date
				, A.Initiative_Committed_Date
				, A.Initiative_Cultivation_Proc_Stg_1_Date
				, A.Initiative_Cultivation_Proc_Stg_2_Date
				, A.Initiative_Cultivation_Proc_Stg_3_Date
				, A.Initiative_Cultivation_Proc_Stg_4_Date
				, A.Initiative_Gift_Notice_Created_Date
				, A.Initiative_Proposal_Status_Change_Date
				, A.Initiative_Coordinating_Liaison
				, A.Initiative_Supporting_Liaisons
				, A.Initiative_Primary_Initiative
				, A.Initiative_Parent_Initiative
				, B.Initiative_Proposal_Amt
				, B.Initiative_Total_Committed_Amt
				, B.Initiative_Total_Given_Amt
				, A.Initiative_Has_Expectancy
				FROM _Initiative_Dim A
					INNER JOIN _Initiative_Fact B ON A.Initiative_Key = B.Initiative_Key
					INNER JOIN _Donor_Dim C ON B.Donor_Key = C.Donor_Key
				WHERE 1 = 1
					AND Initiative_Liaison IS NOT NULL
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''View_Dl_Initiatives'', @Alpha_Step_Number = ''167X'', @Alpha_Step_Name = ''View_Dl_Initiatives - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_4
	, '
		' -- Attribute_5
	, '
		' -- Attribute_6
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''167H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1; 
		' -- Attribute_7
	, ' ' -- Attribute_8
	, ' ' -- Attribute_9
	, ' ' -- Attribute_10
	, ' ' -- Attribute_11
	, ' ' -- Attribute_12
	, ' ' -- Attribute_13
	, ' ' -- Attribute_14
	, ' ' -- Attribute_15
	, ' ' -- Attribute_16
	, ' ' -- Attribute_17
	, ' ' -- Attribute_18
	, ' ' -- Attribute_19
	, ' ' -- Attribute_20
	, ' ' -- Attribute_21
	, 1 -- Active
	, GETDATE() -- Insert_Date
	, NULL  -- Update_Date                
)
,
-- --------------------------
-- View_Qualifieds Table
-- --------------------------
('View_Table' -- Dim_Object
	, 'View_Qualifieds' -- Table_Name
	, '	Ldsp_Id NVARCHAR(100)
		, Donor_Full_Name NVARCHAR(160)
		, Is_Qualified  NVARCHAR(1)
		, Qualified_By NVARCHAR(200)
		, Qualified_On DATE
		, Coordinating_Liaison NVARCHAR(200)
		, Pending_Liaison NVARCHAR(200)
		' -- Create_Table
	, ' Ldsp_Id
		, Donor_Full_Name
		, Is_Qualified
		, Qualified_By
		, Qualified_On
		, Coordinating_Liaison
		, Pending_Liaison
		' -- Insert_Fields
	, ' ' -- From_Statement
	, ' ' -- Where_Statement
	, 'DECLARE @TABLE_NAME NVARCHAR(100)
		SET @TABLE_NAME = ''View_Qualifieds'' ; ------> HARDCODE <------
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''168D'', @Alpha_Step_Name = ''Remove Indexes - Begin'', @Alpha_Result = 1;
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''168D'', @Alpha_Step_Name = ''Remove Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_1
	, '
		' -- Attribute_2
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''168F'', @Alpha_Step_Name = ''Create Indexes - Begin'', @Alpha_Result = 1; 							
		EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''168F'', @Alpha_Step_Name = ''Create Indexes - End'', @Alpha_Result = 1;
		' -- Attribute_3
	, '
		BEGIN TRY
			INSERT INTO View_Qualifieds (
				Ldsp_Id
				, Donor_Full_Name
				, Is_Qualified
				, Qualified_By
				, Qualified_On
				, Coordinating_Liaison
				, Pending_Liaison
			)
			SELECT A.Donor_Ldsp_Id AS Ldsp_Id
				, A.Donor_Name AS Donor_Full_Name
				, C.Donor_Qualified AS Is_Qualified 
				, C.Donor_Qualified_By AS Qualified_By
				, C.Donor_Qualified_On AS Qualified_On
				, A.Plus_CoordinatingLiaison AS Coordinating_Liaison
				, A.Plus_PendingLiaison AS Pending_Liaison
				FROM _Donor_Dim A
					LEFT JOIN _Donor_Detail_Dim C ON A.Donor_Key = C.Donor_Key
				WHERE 1 = 1
					AND (A.Plus_CoordinatingLiaison_DomainName IS NOT NULL
							OR A.Plus_PendingLiaison_DomainName IS NOT NULL
							OR A.Plus_ConnectedLiaison_DomainName IS NOT NULL
						)
		END TRY 
		BEGIN CATCH
			DECLARE @ERROR_NUMBER INT
			DECLARE @ERROR_SEVERITY INT
			DECLARE @ERROR_STATE INT
			DECLARE @ERROR_PROCEDURE NVARCHAR(500)
			DECLARE @ERROR_LINE INT
			DECLARE @ERROR_MESSAGE NVARCHAR(MAX)
			SELECT @ERROR_NUMBER = (SELECT ERROR_NUMBER())
			SELECT @ERROR_SEVERITY = (SELECT ERROR_SEVERITY())
			SELECT @ERROR_STATE = (SELECT ERROR_STATE())
			SELECT @ERROR_PROCEDURE = (SELECT ERROR_PROCEDURE())
			SELECT @ERROR_LINE = (SELECT ERROR_LINE())
			SELECT @ERROR_MESSAGE = (SELECT ERROR_MESSAGE())
			EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = ''View_Qualifieds'', @Alpha_Step_Number = ''168X'', @Alpha_Step_Name = ''View_Qualifieds - Error'', @Alpha_Result = 0
			, @ErrorNumber = @ERROR_NUMBER, @ErrorSeverity = @ERROR_SEVERITY, @ErrorState = @ERROR_STATE, @ErrorProcedure = @ERROR_PROCEDURE, @ErrorLine = @ERROR_LINE, @ErrorMessage = @ERROR_MESSAGE;  
		END CATCH
		' -- Attribute_4
	, '
		' -- Attribute_5
	, '
		' -- Attribute_6
	, 'EXEC dbo.usp_Insert_Alpha_2 @Alpha_Stage = @TABLE_NAME, @Alpha_Step_Number = ''168H'', @Alpha_Step_Name = ''End'', @Alpha_Result = 1; 
		' -- Attribute_7
	, ' ' -- Attribute_8
	, ' ' -- Attribute_9
	, ' ' -- Attribute_10
	, ' ' -- Attribute_11
	, ' ' -- Attribute_12
	, ' ' -- Attribute_13
	, ' ' -- Attribute_14
	, ' ' -- Attribute_15
	, ' ' -- Attribute_16
	, ' ' -- Attribute_17
	, ' ' -- Attribute_18
	, ' ' -- Attribute_19
	, ' ' -- Attribute_20
	, ' ' -- Attribute_21
	, 1 -- Active
	, GETDATE() -- Insert_Date
	, NULL  -- Update_Date                
)



