
DROP TABLE dbo._Donor_Dim

CREATE TABLE dbo._Donor_Dim (
	Donor_Key  NVARCHAR(100)  PRIMARY KEY
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
)

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
SELECT A.Donor_Key      
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
			FROM _Donor_Dim_1 A
				LEFT JOIN _Donor_Dim_2 B ON A.Donor_Key = B.Donor_Key
				LEFT JOIN _Donor_Dim_3 C ON A.Donor_Key = C.Donor_Key
				LEFT JOIN _Donor_Dim_4 D ON A.Donor_Key = D.Donor_Key
				LEFT JOIN _Donor_Dim_5 E ON A.Donor_Key = E.Donor_Key

