/******************************************************************************
   NAME: Ps1_A_Etl_Extract.sql 
   DATE: 2/21/2018
   DESCRIPTION: This is a DDL that creates a table with all of the variables needed
				to run the extract function and bring over the data from OneAccord. 
				Source Database: MSSQL12316\S06
				Destination Database: MSSQL12336\S01
 
******************************************************************************/

IF OBJECT_ID('LDSPhilanthropiesDW.Oa_Extract.Extract_Tables','U') IS NOT NULL
DROP TABLE LDSPhilanthropiesDW.Oa_Extract.Extract_Tables;
GO

CREATE TABLE LDSPhilanthropiesDW.Oa_Extract.Extract_Tables
	(
	Extract_Tables_Key  INT IDENTITY(1,1) PRIMARY KEY
	, Tier INT
	, Source_Table NVARCHAR(100)
	, Destination_Table NVARCHAR(100)
	, Ext_Table NVARCHAR(100)
	, Dest_Create_Fields NVARCHAR(4000)
	, Dest_Insert_Fields NVARCHAR(4000)
	, Dest_Where_Statement NVARCHAR(4000)
	, Ext_Create_Fields NVARCHAR(MAX)
	, Ext_Insert_Fields NVARCHAR(4000)
	, Ext_Select_Statement NVARCHAR(4000)
	, Ext_From_Statement NVARCHAR(4000)
	, Ext_Where_Statement NVARCHAR(4000)
	, Tier_3_Stage NVARCHAR(50)
	, Tier_3_Stage_DateTime DATETIME
	, Tier_4_Stage NVARCHAR(50)
	, Tier_4_Stage_DateTime DATETIME
	, Ext_Select_Statement_2 NVARCHAR(4000)
	, Ext_From_Statement_2 NVARCHAR(4000)
	, Ext_Create_Fields_2 NVARCHAR(4000)
	, Ext_Create_Fields_3 NVARCHAR(4000)
	, Ext_Where_Statement_2 NVARCHAR(4000)
	, Ext_Where_Statement_3 NVARCHAR(4000)
	, Tier_5_Stage NVARCHAR(50)
	, Tier_5_Stage_DateTime DATETIME
	, Tier_6_Stage NVARCHAR(50)
	, Tier_6_Stage_DateTime DATETIME
	, Tier_7_Stage NVARCHAR(50)
	, Tier_7_Stage_DateTime DATETIME
	, Tier_8_Stage NVARCHAR(50)
	, Tier_8_Stage_DateTime DATETIME
	, Tier_9_Stage NVARCHAR(50)
	, Tier_9_Stage_DateTime DATETIME
	, Active BIT
	, Extract_Stage NVARCHAR(50)
	, Extract_Stage_DateTime DATETIME
	, Coupler_Stage NVARCHAR(50)
	, Coupler_Stage_DateTime DATETIME
	, Tier_2_Stage NVARCHAR(50)
	, Tier_2_Stage_DateTime DATETIME
	, Insert_Date DATETIME
	, Update_Date DATETIME
	, Ext_Select_Statement_3 NVARCHAR(4000)
	, Ext_Select_Statement_4 NVARCHAR(4000)
	, Ext_Select_Statement_5 NVARCHAR(4000)
	, Ext_Select_Statement_6 NVARCHAR(4000)
	, Ext_Select_Statement_7 NVARCHAR(4000)
	, Ext_From_Statement_3 NVARCHAR(4000)
	, Ext_From_Statement_4 NVARCHAR(4000)
	, Ext_From_Statement_5 NVARCHAR(4000)
	, Ext_From_Statement_6 NVARCHAR(4000)
	, Ext_From_Statement_7 NVARCHAR(4000)
	, Ext_Where_Statement_4 NVARCHAR(4000)
	, Ext_Where_Statement_5 NVARCHAR(4000)
	, Ext_Where_Statement_6 NVARCHAR(4000)
	, Ext_Where_Statement_7 NVARCHAR(4000)
	, Extra_1 NVARCHAR(4000)
	, Extra_2 NVARCHAR(4000)
	, Extra_3 NVARCHAR(4000)
	, Extra_4 NVARCHAR(4000)
	, Extra_5 NVARCHAR(4000)
	, Extra_6 NVARCHAR(4000)
	, Extra_7 NVARCHAR(4000)
	, Extra_8 NVARCHAR(4000)
	, Extra_9 NVARCHAR(4000)
	, Extra_10 NVARCHAR(4000)
	);
	
INSERT INTO LDSPhilanthropiesDW.Oa_Extract.Extract_Tables
	(
	Tier
	, Source_Table
	, Destination_Table
	, Ext_Table
	, Dest_Create_Fields
	, Dest_Insert_Fields
	, Dest_Where_Statement
	, Ext_Create_Fields
	, Ext_Insert_Fields
	, Ext_Select_Statement
	, Ext_From_Statement
	, Ext_Where_Statement
	, Tier_3_Stage
	, Tier_3_Stage_DateTime
	, Tier_4_Stage
	, Tier_4_Stage_DateTime
	, Ext_Select_Statement_2
	, Ext_From_Statement_2
	, Ext_Create_Fields_2
	, Ext_Create_Fields_3
	, Ext_Where_Statement_2
	, Ext_Where_Statement_3
	, Tier_5_Stage
	, Tier_5_Stage_DateTime
	, Tier_6_Stage
	, Tier_6_Stage_DateTime
	, Tier_7_Stage
	, Tier_7_Stage_DateTime
	, Tier_8_Stage
	, Tier_8_Stage_DateTime
	, Tier_9_Stage
	, Tier_9_Stage_DateTime
	, Active
	, Extract_Stage
	, Extract_Stage_DateTime
	, Coupler_Stage
	, Coupler_Stage_DateTime
	, Tier_2_Stage
	, Tier_2_Stage_DateTime
	, Insert_Date
	, Update_Date
	, Ext_Select_Statement_3
	, Ext_Select_Statement_4
	, Ext_Select_Statement_5
	, Ext_Select_Statement_6
	, Ext_Select_Statement_7
	, Ext_From_Statement_3
	, Ext_From_Statement_4
	, Ext_From_Statement_5
	, Ext_From_Statement_6
	, Ext_From_Statement_7
	, Ext_Where_Statement_4
	, Ext_Where_Statement_5
	, Ext_Where_Statement_6
	, Ext_Where_Statement_7
	, Extra_1
	, Extra_2
	, Extra_3
	, Extra_4
	, Extra_5
	, Extra_6
	, Extra_7
	, Extra_8
	, Extra_9
	, Extra_10
	)
	VALUES
-- --------------------------
-- AccountBase (Ext_Account)
-- --------------------------
	( 1 -- Tier
		, 'dbo.AccountBase' -- Source_Table
		, 'Oa_Extract.AccountBase' -- Destination_Table
		, 'Ext_Account' -- Ext_Table
		,'AccountId UNIQUEIDENTIFIER
			, New_LdspId NVARCHAR(100)
			, Name NVARCHAR(160)
			, ParentAccountId UNIQUEIDENTIFIER
			, Description NVARCHAR(MAX)
			, DoNotPostalMail BIT
			, DoNotBulkPostalMail BIT
			, DoNotEmail BIT
			, DoNotBulkEmail BIT
			, DoNotPhone BIT
			, DoNotFax BIT
			, AccountClassificationCode INT
			, New_RetireeRatio INT
			, New_SplitRatio INT
			, New_MatchingRatio INT
			, PreferredContactMethodCode INT
			, Plus_CoordinatingLiaison UNIQUEIDENTIFIER
			, Plus_ConnectedLiaison UNIQUEIDENTIFIER
			, Plus_PendingLiaison UNIQUEIDENTIFIER
			, Plus_MatchingGiftProgram INT
			, Plus_TotalGivenLast5Years MONEY
			, Lds_IsQualified BIT
			, Lds_QualifiedOn DATETIME
			, Lds_QualifiedBy UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'AccountId
			, New_LdspId
			, Name
			, ParentAccountId
			, Description
			, DoNotPostalMail
			, DoNotBulkPostalMail
			, DoNotEmail
			, DoNotBulkEmail
			, DoNotPhone
			, DoNotFax
			, AccountClassificationCode
			, New_RetireeRatio
			, New_SplitRatio
			, New_MatchingRatio
			, PreferredContactMethodCode
			, Plus_CoordinatingLiaison
			, Plus_ConnectedLiaison
			, Plus_PendingLiaison
			, Plus_MatchingGiftProgram
			, Plus_TotalGivenLast5Years
			, Lds_IsQualified
			, Lds_QualifiedOn
			, Lds_QualifiedBy
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		,'AccountId UNIQUEIDENTIFIER
			, New_LdspId NVARCHAR(100)
			, Name NVARCHAR(160)
			, ParentAccountId UNIQUEIDENTIFIER
			, Description NVARCHAR(4000)
			, DoNotPostalMail BIT
			, DoNotBulkPostalMail BIT
			, DoNotEmail BIT
			, DoNotBulkEmail BIT
			, DoNotPhone BIT
			, DoNotFax BIT
			, AccountClassificationCode INT
			, New_RetireeRatio INT
			, New_SplitRatio INT
			, New_MatchingRatio INT
			, PreferredContactMethodCode INT
			, Plus_CoordinatingLiaison UNIQUEIDENTIFIER
			, Plus_ConnectedLiaison UNIQUEIDENTIFIER
			, Plus_PendingLiaison UNIQUEIDENTIFIER
			, Plus_MatchingGiftProgram INT
			, Plus_TotalGivenLast5Years MONEY
			, Lds_IsQualified BIT
			, Lds_QualifiedOn DATETIME
			, Lds_QualifiedBy UNIQUEIDENTIFIER
			, Zero NVARCHAR(1) DEFAULT ''0''
			, Organization NVARCHAR(15) DEFAULT ''Organization''
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			' -- Ext_Create_Fields
		, 'AccountId
			, New_LdspId
			, Name
			, ParentAccountId
			, Description
			, DoNotPostalMail
			, DoNotBulkPostalMail
			, DoNotEmail
			, DoNotBulkEmail
			, DoNotPhone
			, DoNotFax
			, AccountClassificationCode
			, New_RetireeRatio
			, New_SplitRatio
			, New_MatchingRatio
			, PreferredContactMethodCode
			, Plus_CoordinatingLiaison
			, Plus_ConnectedLiaison
			, Plus_PendingLiaison
			, Plus_MatchingGiftProgram
			, Plus_TotalGivenLast5Years
			, Lds_IsQualified
			, Lds_QualifiedOn
			, Lds_QualifiedBy
			' -- Ext_Insert_Fields
		, 'AccountId
			, New_LdspId
			, Name
			, ParentAccountId
			, CONVERT(NVARCHAR(4000),SUBSTRING(Description,1,4000)) AS Description
			, DoNotPostalMail
			, DoNotBulkPostalMail
			, DoNotEmail
			, DoNotBulkEmail
			, DoNotPhone
			, DoNotFax
			, AccountClassificationCode
			, New_RetireeRatio
			, New_SplitRatio
			, New_MatchingRatio
			, PreferredContactMethodCode
			, Plus_CoordinatingLiaison
			, Plus_ConnectedLiaison
			, Plus_PendingLiaison
			, Plus_MatchingGiftProgram
			, Plus_TotalGivenLast5Years
			, Lds_IsQualified
			, CASE WHEN DATENAME(dy,A.Lds_QualifiedOn) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Lds_QualifiedOn)
					ELSE DATEADD(hh,-7,A.Lds_QualifiedOn) END AS Lds_QualifiedOn
			, Lds_QualifiedBy
			' -- Ext_Select_Statement
		, 'Oa_Extract.AccountBase A
			LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.Lds_QualifiedOn) = B.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- Plus_DonorScoreBase (Ext_Donor_Score)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Plus_DonorScoreBase' -- Source_Table
		, 'Oa_Extract.Plus_DonorScoreBase' -- Destination_Table
		, 'Ext_Donor_Score' -- Ext_Table
		, '	Plus_DonorScoreId UNIQUEIDENTIFIER
			, Plus_Constituent UNIQUEIDENTIFIER
			, Plus_Institution UNIQUEIDENTIFIER
			, Plus_I5LegacyDonorTypeDate DATETIME
			, Plus_I5LegacyDonorType NVARCHAR(10)
			, ModifiedOn DATETIME
			, StatusCode INT
			, StateCode INT
			' -- Dest_Create_Fields
		, '	Plus_DonorScoreId
			, Plus_Constituent
			, Plus_Institution
			, Plus_I5LegacyDonorTypeDate
			, Plus_I5LegacyDonorType
			, ModifiedOn
			, StatusCode
			, StateCode
			' -- Dest_Insert_Fields
		, 'AND YEAR(Plus_I5LegacyDonorTypeDate) >= YEAR(GETDATE())-5
			' -- Dest_Where_Statement
		, '	Plus_DonorScoreId UNIQUEIDENTIFIER
			, Plus_Constituent UNIQUEIDENTIFIER
			, Plus_Institution UNIQUEIDENTIFIER
			, Plus_I5LegacyDonorTypeDate DATETIME
			, Plus_I5LegacyDonorType NVARCHAR(10)
			, ModifiedOn DATETIME
			, StatusCode INT
			, StateCode INT
			' -- Ext_Create_Fields
		, '	Plus_DonorScoreId
			, Plus_Constituent
			, Plus_Institution
			, Plus_I5LegacyDonorTypeDate
			, Plus_I5LegacyDonorType
			, ModifiedOn
			, StatusCode
			, StateCode
			' -- Ext_Insert_Fields
		, 'Plus_DonorScoreId
			, Plus_Constituent
			, Plus_Institution
			, Plus_I5LegacyDonorTypeDate
			, Plus_I5LegacyDonorType
			, ModifiedOn
			, StatusCode
			, StateCode
			' -- Ext_Select_Statement
		, 'Oa_Extract.Plus_DonorScoreBase				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- ActivityPartyBase (Ext_Activity)
-- --------------------------
	( 1 -- Tier
		, 'dbo.ActivityPartyBase' -- Source_Table
		, 'Oa_Extract.ActivityPartyBase' -- Destination_Table
		, 'Ext_Activity' -- Ext_Table
		, 'ActivityPartyId UNIQUEIDENTIFIER
			, ActivityId UNIQUEIDENTIFIER
			, PartyId UNIQUEIDENTIFIER
			, PartyObjectTypeCode INT
			, ScheduledStart DATETIME
			, PartyIdName NVARCHAR(4000)
			, ParticipationTypeMask INT
			' -- Dest_Create_Fields
		, 'ActivityPartyId
			, ActivityId
			, PartyId
			, PartyObjectTypeCode
			, ScheduledStart
			, PartyIdName
			, ParticipationTypeMask
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ActivityPartyId UNIQUEIDENTIFIER
			, ActivityId UNIQUEIDENTIFIER
			, PartyId UNIQUEIDENTIFIER
			, PartyObjectTypeCode INT
			, ScheduledStart DATETIME
			, PartyIdName NVARCHAR(4000)
			, ParticipationTypeMask INT
			, Organization NVARCHAR(25) DEFAULT ''Organization''
			, Constituent NVARCHAR(25) DEFAULT ''Constituent''
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			' -- Ext_Create_Fields
		, 'ActivityPartyId
			, ActivityId
			, PartyId
			, PartyObjectTypeCode
			, ScheduledStart
			, PartyIdName
			, ParticipationTypeMask
			' -- Ext_Insert_Fields
		, 'ActivityPartyId
			, ActivityId
			, PartyId
			, PartyObjectTypeCode
			, CASE WHEN DATENAME(dy,A.ScheduledStart) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ScheduledStart)
					ELSE DATEADD(hh,-7,A.ScheduledStart) END AS ScheduledStart
			, PartyIdName
			, ParticipationTypeMask
			' -- Ext_Select_Statement
		, 'Oa_Extract.ActivityPartyBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.ScheduledStart) = B.Date_Year
			' -- Ext_From_Statement
		, 'CREATE NONCLUSTERED INDEX IX_ActivityId 
			ON Ext_Activity(ActivityId ASC)
				INCLUDE (
						ActivityPartyId
						, ScheduledStart
				); 
			UPDATE STATISTICS dbo.Ext_Activity
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- ActivityPointerBase (Ext_Activity_Pointer)
-- --------------------------
	( 1 -- Tier
		, 'dbo.ActivityPointerBase' -- Source_Table
		, 'Oa_Extract.ActivityPointerBase' -- Destination_Table
		, 'Ext_Activity_Pointer' -- Ext_Table
		, 'ActivityId UNIQUEIDENTIFIER
			, ActivityTypeCode INT
			, RegardingObjectTypeCode INT
			, ScheduledStart DATETIME
			, ScheduledEnd DATETIME
			, ActualStart DATETIME
			, ActualEnd DATETIME
			, RegardingObjectId UNIQUEIDENTIFIER
			, Subject NVARCHAR(200)
			, RegardingObjectIdName NVARCHAR(4000)
			, Description NVARCHAR(MAX)
			, OwnerId UNIQUEIDENTIFIER
			, CampactChannelTypeCode INT
			, CreatedOn DATETIME
			, StateCode INT
			, StatusCode INT
			, ModifiedOn DATETIME
			' -- Dest_Create_Fields
		, 'ActivityId
			, ActivityTypeCode
			, RegardingObjectTypeCode
			, ScheduledStart
			, ScheduledEnd
			, ActualStart
			, ActualEnd
			, RegardingObjectId
			, Subject
			, RegardingObjectIdName
			, Description
			, OwnerId
			, CampactChannelTypeCode
			, CreatedOn
			, StateCode
			, StatusCode
			, ModifiedOn
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ActivityId UNIQUEIDENTIFIER
			, ActivityTypeCode INT
			, RegardingObjectTypeCode INT
			, ScheduledStart DATETIME
			, ScheduledEnd DATETIME
			, ActualStart DATETIME
			, ActualEnd DATETIME
			, RegardingObjectId UNIQUEIDENTIFIER
			, Subject NVARCHAR(200)
			, RegardingObjectIdName NVARCHAR(4000)
			, Description NVARCHAR(4000)
			, OwnerId UNIQUEIDENTIFIER
			, CampactChannelTypeCode INT
			, CreatedOn DATETIME
			, StateCode INT
			, StatusCode INT
			, ModifiedOn DATETIME
			, Other NVARCHAR(5) DEFAULT ''Other''
			, General NVARCHAR(10) DEFAULT ''General''
			, In_Person NVARCHAR(10) DEFAULT ''In Person''
			, Face_To_Face NVARCHAR(15) DEFAULT ''Face-To-Face''
			, Mail NVARCHAR(10) DEFAULT ''Mail''
			, Direct_Mail NVARCHAR(15) DEFAULT ''Direct Mail''
			, Phone NVARCHAR(10) DEFAULT ''Phone''
			, Telefund NVARCHAR(10) DEFAULT ''Telefund''
			, Email NVARCHAR(10) DEFAULT ''Email''
			, Web NVARCHAR(10) DEFAULT ''Web''
			, N100000000 NVARCHAR(15) DEFAULT ''100000000''
			, N100000001 NVARCHAR(15) DEFAULT ''100000001''
			, Organization NVARCHAR(15) DEFAULT ''Organization''
			, Constituent NVARCHAR(15) DEFAULT ''Constituent''
			, Initiative NVARCHAR(15) DEFAULT ''Initiative''
			' -- Ext_Create_Fields
		, 'ActivityId
			, ActivityTypeCode
			, RegardingObjectTypeCode
			, ScheduledStart
			, ScheduledEnd
			, ActualStart
			, ActualEnd
			, RegardingObjectId
			, Subject
			, RegardingObjectIdName
			, Description
			, OwnerId
			, CampactChannelTypeCode
			, CreatedOn
			, StateCode
			, StatusCode
			, ModifiedOn
			' -- Ext_Insert_Fields
		, 'ActivityId
			, ActivityTypeCode
			, RegardingObjectTypeCode
			, CASE WHEN DATENAME(dy,A.ScheduledStart) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ScheduledStart)
					ELSE DATEADD(hh,-7,A.ScheduledStart) END AS ScheduledStart
			, CASE WHEN DATENAME(dy,A.ScheduledEnd) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ScheduledEnd)
					ELSE DATEADD(hh,-7,A.ScheduledEnd) END AS ScheduledEnd
			, CASE WHEN DATENAME(dy,A.ActualStart) BETWEEN D.Mdt_Begin_Date_Number AND D.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ActualStart)
					ELSE DATEADD(hh,-7,A.ActualStart) END AS ActualStart
			, CASE WHEN DATENAME(dy,A.ActualEnd) BETWEEN E.Mdt_Begin_Date_Number AND E.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ActualEnd)
					ELSE DATEADD(hh,-7,A.ActualEnd) END AS ActualEnd
			, RegardingObjectId
			, Subject
			, RegardingObjectIdName
			, CONVERT(NVARCHAR(4000),SUBSTRING(Description,1,4000)) AS Description
			, OwnerId
			, CampactChannelTypeCode
			, CASE WHEN DATENAME(dy,A.CreatedOn) BETWEEN F.Mdt_Begin_Date_Number AND F.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.CreatedOn)
					ELSE DATEADD(hh,-7,A.CreatedOn) END AS CreatedOn
			, StateCode
			, StatusCode
			, CASE WHEN DATENAME(dy,A.ModifiedOn) BETWEEN G.Mdt_Begin_Date_Number AND G.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ModifiedOn)
					ELSE DATEADD(hh,-7,A.ModifiedOn) END AS ModifiedOn
			' -- Ext_Select_Statement
		, 'Oa_Extract.ActivityPointerBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.ScheduledStart) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.ScheduledEnd) = C.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim D ON YEAR(A.ActualStart) = D.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim E ON YEAR(A.ActualEnd) = E.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim F ON YEAR(A.CreatedOn) = F.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim G ON YEAR(A.ModifiedOn) = G.Date_Year
			' -- Ext_From_Statement
		, 'CREATE NONCLUSTERED INDEX IX_ActivityId 
			ON Ext_Activity_Pointer(ActivityId ASC)
				INCLUDE (
					ActivityTypeCode
				);     
					   
			CREATE NONCLUSTERED INDEX IX_ActivityTypeCode 
			ON Ext_Activity_Pointer(ActivityTypeCode ASC)
				INCLUDE (
					ActivityId
			); 
			UPDATE STATISTICS dbo.Ext_Activity_Pointer
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- AppointmentBase (Ext_Appointment)
-- --------------------------
	( 1 -- Tier
		, 'dbo.AppointmentBase' -- Source_Table
		, 'Oa_Extract.AppointmentBase' -- Destination_Table
		, 'Ext_Appointment' -- Ext_Table
		, 'ActivityId UNIQUEIDENTIFIER
			, Plus_FaceToFace BIT
			' -- Dest_Create_Fields
		, 'ActivityId
			, Plus_FaceToFace
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ActivityId UNIQUEIDENTIFIER
			, Plus_FaceToFace BIT
			' -- Ext_Create_Fields
		, 'ActivityId
			, Plus_FaceToFace
			' -- Ext_Insert_Fields
		, 'ActivityId
			, Plus_FaceToFace
			' -- Ext_Select_Statement
		, 'Oa_Extract.AppointmentBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- CampaignActivityBase (Ext_Campaign_Activity)
-- --------------------------
	( 1 -- Tier
		, 'dbo.CampaignActivityBase' -- Source_Table
		, 'Oa_Extract.CampaignActivityBase' -- Destination_Table
		, 'Ext_Campaign_Activity' -- Ext_Table
		, 'ActivityId UNIQUEIDENTIFIER
			, Plus_InstitutionalHierarchy UNIQUEIDENTIFIER
			, Plus_AppealCode NVARCHAR(20)
			, Plus_CommunicationType INT
			, Plus_Format INT
			' -- Dest_Create_Fields
		, 'ActivityId
			, Plus_InstitutionalHierarchy
			, Plus_AppealCode
			, Plus_CommunicationType
			, Plus_Format
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ActivityId UNIQUEIDENTIFIER
			, Plus_InstitutionalHierarchy UNIQUEIDENTIFIER
			, Plus_AppealCode NVARCHAR(20)
			, Plus_CommunicationType INT
			, Plus_Format INT
			' -- Ext_Create_Fields
		, 'ActivityId
			, Plus_InstitutionalHierarchy
			, Plus_AppealCode
			, Plus_CommunicationType
			, Plus_Format
			' -- Ext_Insert_Fields
		, 'ActivityId
			, Plus_InstitutionalHierarchy
			, Plus_AppealCode
			, Plus_CommunicationType
			, Plus_Format
			' -- Ext_Select_Statement
		, 'Oa_Extract.CampaignActivityBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- CampaignBase (Ext_Campaign)
-- --------------------------
	( 1 -- Tier
		, 'dbo.CampaignBase' -- Source_Table
		, 'Oa_Extract.CampaignBase' -- Destination_Table
		, 'Ext_Campaign' -- Ext_Table
		, 'CampaignId UNIQUEIDENTIFIER
			, Name NVARCHAR(128)
			, TypeCode INT			
			, StatusCode INT
			, Plus_Affiliate INT
			, Plus_Association UNIQUEIDENTIFIER
			, Plus_DepartmentFunction INT	
			, Plus_Cause INT		
			, Description NVARCHAR(MAX)
			, BudgetedCost_Base MONEY
			, ExpectedRevenue MONEY
			, OtherCost MONEY
			, TotalCampaignActivityActualCost MONEY
			, TotalActualCost MONEY
			, Plus_CostToRaise1_Base MONEY
			, Plus_TotalGiftRevenueFromCampaign MONEY
			, Plus_CampaignProfit_Base MONEY
			' -- Dest_Create_Fields
		, 'CampaignId
			, Name
			, TypeCode			
			, StatusCode
			, Plus_Affiliate
			, Plus_Association
			, Plus_DepartmentFunction	
			, Plus_Cause		
			, Description
			, BudgetedCost_Base
			, ExpectedRevenue
			, OtherCost
			, TotalCampaignActivityActualCost
			, TotalActualCost
			, Plus_CostToRaise1_Base
			, Plus_TotalGiftRevenueFromCampaign
			, Plus_CampaignProfit_Base
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'CampaignId UNIQUEIDENTIFIER
			, Name NVARCHAR(128)
			, Type_Code	INT			
			, StatusCode INT
			, Plus_Affiliate INT
			, Plus_Association UNIQUEIDENTIFIER
			, Plus_DepartmentFunction INT	
			, Plus_Cause INT		
			, Description NVARCHAR(4000)
			, BudgetedCost_Base NVARCHAR(50)
			, ExpectedRevenue NVARCHAR(50)
			, OtherCost NVARCHAR(50)
			, TotalCampaignActivityActualCost NVARCHAR(50)
			, TotalActualCost NVARCHAR(50)
			, Plus_CostToRaise1_Base NVARCHAR(50)
			, Plus_TotalGiftRevenueFromCampaign NVARCHAR(50)
			, Plus_CampaignProfit_Base NVARCHAR(50)
			' -- Ext_Create_Fields
		, 'CampaignId
			, Name
			, Type_Code			
			, StatusCode
			, Plus_Affiliate
			, Plus_Association
			, Plus_DepartmentFunction	
			, Plus_Cause		
			, Description
			, BudgetedCost_Base
			, ExpectedRevenue
			, OtherCost
			, TotalCampaignActivityActualCost
			, TotalActualCost
			, Plus_CostToRaise1_Base
			, Plus_TotalGiftRevenueFromCampaign
			, Plus_CampaignProfit_Base
			' -- Ext_Insert_Fields
		, 'CampaignId
			, Name
			, TypeCode AS Type_Code			
			, StatusCode
			, Plus_Affiliate
			, Plus_Association
			, Plus_DepartmentFunction	
			, Plus_Cause		
			, CONVERT(NVARCHAR(4000),SUBSTRING(Description,1,4000)) AS Description
			, CONVERT(NVARCHAR(50),BudgetedCost_Base) AS BudgetedCost_Base
			, CONVERT(NVARCHAR(50),ExpectedRevenue) AS ExpectedRevenue
			, CONVERT(NVARCHAR(50),OtherCost) AS OtherCost
			, CONVERT(NVARCHAR(50),TotalCampaignActivityActualCost) AS TotalCampaignActivityActualCost
			, CONVERT(NVARCHAR(50),TotalActualCost) AS TotalActualCost
			, CONVERT(NVARCHAR(50),Plus_CostToRaise1_Base) AS Plus_CostToRaise1_Base
			, CONVERT(NVARCHAR(50),Plus_TotalGiftRevenueFromCampaign) AS Plus_TotalGiftRevenueFromCampaign
			, CONVERT(NVARCHAR(50),Plus_CampaignProfit_Base) AS Plus_CampaignProfit_Base
			' -- Ext_Select_Statement
		, 'Oa_Extract.CampaignBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- CampaignResponseBase (Ext_Campaign_Response)
-- --------------------------
	( 1 -- Tier
		, 'dbo.CampaignResponseBase' -- Source_Table
		, 'Oa_Extract.CampaignResponseBase' -- Destination_Table
		, 'Ext_Campaign_Response' -- Ext_Table
		, 'ActivityId UNIQUEIDENTIFIER
			, Plus_CampaignAppeal UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'ActivityId
			, Plus_CampaignAppeal
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ActivityId UNIQUEIDENTIFIER
			, Plus_CampaignAppeal UNIQUEIDENTIFIER
			' -- Ext_Create_Fields
		, 'ActivityId
			, Plus_CampaignAppeal
			' -- Ext_Insert_Fields
		, 'ActivityId
			, Plus_CampaignAppeal
			' -- Ext_Select_Statement
		, 'Oa_Extract.CampaignResponseBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- ConnectionBase (Ext_Connection)
-- --------------------------
	( 1 -- Tier
		, 'dbo.ConnectionBase' -- Source_Table
		, 'Oa_Extract.ConnectionBase' -- Destination_Table
		, 'Ext_Connection' -- Ext_Table
		, 'Record1Id UNIQUEIDENTIFIER
			, Record2Id UNIQUEIDENTIFIER
			, Plus_AlternateName NVARCHAR(100)
			, Record1RoleId UNIQUEIDENTIFIER
			, Record2RoleId UNIQUEIDENTIFIER
			, Record1ObjectTypeCode INT
			, Record2ObjectTypeCode INT
			, ConnectionId UNIQUEIDENTIFIER
			, Record1IdObjectTypeCode INT
			, Record2IdObjectTypeCode INT
			' -- Dest_Create_Fields
		, 'Record1Id
			, Record2Id
			, Plus_AlternateName
			, Record1RoleId
			, Record2RoleId
			, Record1ObjectTypeCode
			, Record2ObjectTypeCode
			, ConnectionId
			, Record1IdObjectTypeCode
			, Record2IdObjectTypeCode
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Record1Id UNIQUEIDENTIFIER
			, Record2Id UNIQUEIDENTIFIER
			, Plus_AlternateName NVARCHAR(100)
			, Record1RoleId UNIQUEIDENTIFIER
			, Record2RoleId UNIQUEIDENTIFIER
			, Record1ObjectTypeCode INT
			, Record2ObjectTypeCode INT
			, ConnectionId UNIQUEIDENTIFIER
			, Record1IdObjectTypeCode INT
			, Record2IdObjectTypeCode INT
			, Initiative_Liaison NVARCHAR(20) DEFAULT ''Initiative Liaison''
			' -- Ext_Create_Fields
		, 'Record1Id
			, Record2Id
			, Plus_AlternateName
			, Record1RoleId
			, Record2RoleId
			, Record1ObjectTypeCode
			, Record2ObjectTypeCode
			, ConnectionId
			, Record1IdObjectTypeCode
			, Record2IdObjectTypeCode
			' -- Ext_Insert_Fields
		, 'Record1Id
			, Record2Id
			, Plus_AlternateName
			, Record1RoleId
			, Record2RoleId
			, Record1ObjectTypeCode
			, Record2ObjectTypeCode
			, ConnectionId
			, Record1IdObjectTypeCode
			, Record2IdObjectTypeCode
			' -- Ext_Select_Statement
		, 'Oa_Extract.ConnectionBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- ConnectionRoleBase (Ext_Connection_Role)
-- --------------------------
	( 1 -- Tier
		, 'dbo.ConnectionRoleBase' -- Source_Table
		, 'Oa_Extract.ConnectionRoleBase' -- Destination_Table
		, 'Ext_Connection_Role' -- Ext_Table
		, 'ConnectionRoleId UNIQUEIDENTIFIER
			, Name NVARCHAR(100)
			, OverwriteTime DATETIME
			' -- Dest_Create_Fields
		, 'ConnectionRoleId
			, Name
			, OverwriteTime
			' -- Dest_Insert_Fields
		, 'AND OverwriteTime = ''1900-01-01 00:00:00.000''
			' -- Dest_Where_Statement
		, 'ConnectionRoleId UNIQUEIDENTIFIER
			, Name NVARCHAR(100)
			, OverwriteTime DATETIME
			' -- Ext_Create_Fields
		, 'ConnectionRoleId
			, Name
			, OverwriteTime
			' -- Ext_Insert_Fields
		, 'ConnectionRoleId
			, Name
			, OverwriteTime
			' -- Ext_Select_Statement
		, 'Oa_Extract.ConnectionRoleBase			
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- ContactBase (Ext_Contact)
-- --------------------------
	( 1 -- Tier
		, 'dbo.ContactBase' -- Source_Table
		, 'Oa_Extract.ContactBase' -- Destination_Table
		, 'Ext_Contact' -- Ext_Table
		, 'ContactId UNIQUEIDENTIFIER
			, New_Ldspid NVARCHAR(100)
			, Plus_CoordinatingLiaison UNIQUEIDENTIFIER
			, FullName NVARCHAR(160)
			, FirstName NVARCHAR(50)
			, MiddleName NVARCHAR(50)
			, LastName NVARCHAR(50)
			, NickName NVARCHAR(50)
			, New_MiddleName2 NVARCHAR(100)
			, New_LastName2 NVARCHAR(100)
			, New_PreferredName NVARCHAR(100)
			, Plus_DisplayName NVARCHAR(100)
			, New_BirthName NVARCHAR(100)
			, Plus_CurrentStudent BIT
			, New_BirthDate NVARCHAR(100)
			, New_BirthdateDay NVARCHAR(100)
			, New_BirthdateMonth NVARCHAR(100)
			, New_BirthdateYear NVARCHAR(100)
			, New_Deceased BIT
			, New_DeceasedDate NVARCHAR(100)
			, New_DeceasedDay NVARCHAR(100)
			, New_DeceasedMonth NVARCHAR(100)
			, New_DeceasedYear NVARCHAR(100)
			, Plus_WealthDate DATETIME
			, SpousesName NVARCHAR(100)
			, New_Title UNIQUEIDENTIFIER
			, New_ProfessionalSuffix UNIQUEIDENTIFIER
			, New_HomeCountry UNIQUEIDENTIFIER
			, GenderCode INT
			, FamilyStatusCode INT
			, Plus_ChurchMember INT
			, New_PersonalSuffix INT
			, StatusCode INT
			, New_MajorGiftPropensity1 INT
			, Plus_AnnualGift1 INT
			, Plus_PlannedGift INT
			, Plus_GiftCapacityEnp INT
			, Plus_GiftCapacityEn INT
			, Plus_PhilanthropicCapacityRatingPcr INT
			, Plus_EstimatedHouseHoldIncome INT
			, Plus_EstimatedHomemarketValue INT
			, Plus_BlockClusters INT
			, Plus_PlannedGiftTier INT
			, Plus_PreferredFirstName NVARCHAR(100)
			, Plus_PreferredMiddleName NVARCHAR(100)
			, Plus_PreferredLastName NVARCHAR(100)
			, Plus_PreferredFullName NVARCHAR(100)
			, Plus_SpousePreferredFirstName NVARCHAR(100)
			, Plus_SpousePreferredMiddleName NVARCHAR(100)
			, Plus_SpousePreferredLastName NVARCHAR(100)
			, Plus_SpousePreferredFullName NVARCHAR(100)
			, Plus_ConnectedLiaison UNIQUEIDENTIFIER
			, Plus_PendingLiaison UNIQUEIDENTIFIER
			, Plus_I5TextLinesLdsp NVARCHAR(MAX)
			, Plus_TotalGivenLast5Years MONEY
			, Lds_IsQualified BIT
			, Lds_QualifiedOn DATETIME
			, Lds_QualifiedBy UNIQUEIDENTIFIER
			, Lds_TelefundNotes NVARCHAR(MAX)
			' -- Dest_Create_Fields
		, 'ContactId
			, New_Ldspid
			, Plus_CoordinatingLiaison
			, FullName
			, FirstName
			, MiddleName
			, LastName
			, NickName
			, New_MiddleName2
			, New_LastName2
			, New_PreferredName
			, Plus_DisplayName
			, New_BirthName
			, Plus_CurrentStudent
			, New_BirthDate
			, New_BirthdateDay
			, New_BirthdateMonth
			, New_BirthdateYear
			, New_Deceased
			, New_DeceasedDate
			, New_DeceasedDay
			, New_DeceasedMonth
			, New_DeceasedYear
			, Plus_WealthDate
			, SpousesName
			, New_Title
			, New_ProfessionalSuffix
			, New_HomeCountry
			, GenderCode
			, FamilyStatusCode
			, Plus_ChurchMember
			, New_PersonalSuffix
			, StatusCode
			, New_MajorGiftPropensity1
			, Plus_AnnualGift1
			, Plus_PlannedGift
			, Plus_GiftCapacityEnp
			, Plus_GiftCapacityEn
			, Plus_PhilanthropicCapacityRatingPcr
			, Plus_EstimatedHouseHoldIncome
			, Plus_EstimatedHomemarketValue
			, Plus_BlockClusters
			, Plus_PlannedGiftTier
			, Plus_PreferredFirstName
			, Plus_PreferredMiddleName
			, Plus_PreferredLastName
			, Plus_PreferredFullName
			, Plus_SpousePreferredFirstName
			, Plus_SpousePreferredMiddleName
			, Plus_SpousePreferredLastName
			, Plus_SpousePreferredFullName
			, Plus_ConnectedLiaison
			, Plus_PendingLiaison
			, Plus_I5TextLinesLdsp
			, Plus_TotalGivenLast5Years
			, Lds_IsQualified
			, Lds_QualifiedOn
			, Lds_QualifiedBy
			, Lds_TelefundNotes
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId UNIQUEIDENTIFIER
			, New_Ldspid NVARCHAR(100)
			, Plus_CoordinatingLiaison UNIQUEIDENTIFIER
			, FullName NVARCHAR(160)
			, FirstName NVARCHAR(50)
			, MiddleName NVARCHAR(50)
			, LastName NVARCHAR(50)
			, NickName NVARCHAR(50)
			, New_MiddleName2 NVARCHAR(100)
			, New_LastName2 NVARCHAR(100)
			, New_PreferredName NVARCHAR(100)
			, Plus_DisplayName NVARCHAR(100)
			, New_BirthName NVARCHAR(100)
			, Plus_CurrentStudent BIT
			, New_BirthDate NVARCHAR(100)
			, New_BirthdateDay NVARCHAR(100)
			, New_BirthdateMonth NVARCHAR(100)
			, New_BirthdateYear NVARCHAR(100)
			, New_Deceased BIT
			, New_DeceasedDate NVARCHAR(100)
			, New_DeceasedDay NVARCHAR(100)
			, New_DeceasedMonth NVARCHAR(100)
			, New_DeceasedYear NVARCHAR(100)
			, Plus_WealthDate DATETIME
			, SpousesName NVARCHAR(100)
			, New_Title UNIQUEIDENTIFIER
			, New_ProfessionalSuffix UNIQUEIDENTIFIER
			, New_HomeCountry UNIQUEIDENTIFIER
			, GenderCode INT
			, FamilyStatusCode INT
			, Plus_ChurchMember INT
			, New_PersonalSuffix INT
			, StatusCode INT
			, New_MajorGiftPropensity1 INT
			, Plus_AnnualGift1 INT
			, Plus_PlannedGift INT
			, Plus_GiftCapacityEnp INT
			, Plus_GiftCapacityEn INT
			, Plus_PhilanthropicCapacityRatingPcr INT
			, Plus_EstimatedHouseHoldIncome INT
			, Plus_EstimatedHomemarketValue INT
			, Plus_BlockClusters INT
			, Plus_PlannedGiftTier INT
			, Plus_PreferredFirstName NVARCHAR(100)
			, Plus_PreferredMiddleName NVARCHAR(100)
			, Plus_PreferredLastName NVARCHAR(100)
			, Plus_PreferredFullName NVARCHAR(100)
			, Plus_SpousePreferredFirstName NVARCHAR(100)
			, Plus_SpousePreferredMiddleName NVARCHAR(100)
			, Plus_SpousePreferredLastName NVARCHAR(100)
			, Plus_SpousePreferredFullName NVARCHAR(100)
			, Plus_ConnectedLiaison UNIQUEIDENTIFIER
			, Plus_PendingLiaison UNIQUEIDENTIFIER
			, Plus_I5TextLinesLdsp NVARCHAR(4000)
			, Plus_TotalGivenLast5Years MONEY
			, Lds_IsQualified BIT
			, Lds_QualifiedOn DATETIME
			, Lds_QualifiedBy UNIQUEIDENTIFIER
			, Lds_TelefundNotes NVARCHAR(4000)
			, Number_Signs NVARCHAR(2) DEFAULT ''##''
			, N00 NVARCHAR(2) DEFAULT ''00''
			, N01 NVARCHAR(2) DEFAULT ''01''
			, N02 NVARCHAR(2) DEFAULT ''02''
			, N03 NVARCHAR(2) DEFAULT ''03''
			, N04 NVARCHAR(2) DEFAULT ''04''
			, N05 NVARCHAR(2) DEFAULT ''05''
			, N06 NVARCHAR(2) DEFAULT ''06''
			, N07 NVARCHAR(2) DEFAULT ''07''
			, N08 NVARCHAR(2) DEFAULT ''08''
			, N09 NVARCHAR(2) DEFAULT ''09''
			, N10 NVARCHAR(2) DEFAULT ''10''
			, N11 NVARCHAR(2) DEFAULT ''11''
			, N12 NVARCHAR(2) DEFAULT ''12''
			, N13 NVARCHAR(2) DEFAULT ''13''
			, N14 NVARCHAR(2) DEFAULT ''14''
			, N15 NVARCHAR(2) DEFAULT ''15''
			, N16 NVARCHAR(2) DEFAULT ''16''
			, N17 NVARCHAR(2) DEFAULT ''17''
			, N18 NVARCHAR(2) DEFAULT ''18''
			, N19 NVARCHAR(2) DEFAULT ''19''
			, N20 NVARCHAR(2) DEFAULT ''20''
			, N21 NVARCHAR(2) DEFAULT ''21''
			, N22 NVARCHAR(2) DEFAULT ''22''
			, N23 NVARCHAR(2) DEFAULT ''23''
			, N24 NVARCHAR(2) DEFAULT ''24''
			, N25 NVARCHAR(2) DEFAULT ''25''
			, N26 NVARCHAR(2) DEFAULT ''26''
			, N27 NVARCHAR(2) DEFAULT ''27''
			, N28 NVARCHAR(2) DEFAULT ''28''
			, N29 NVARCHAR(2) DEFAULT ''29''
			, N30 NVARCHAR(2) DEFAULT ''30''
			, N31 NVARCHAR(2) DEFAULT ''31''
			, Zero NVARCHAR(1) DEFAULT ''0''
			, Constituent NVARCHAR(15) DEFAULT ''Constituent''
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			, Space NVARCHAR(1) DEFAULT '' ''
			, Married NVARCHAR(10) DEFAULT ''Married''
			, Space_Amp_Space NVARCHAR(5) DEFAULT '' & ''
			, Space_And_Space NVARCHAR(10) DEFAULT '' and ''
			, Comma_Space NVARCHAR(2) DEFAULT '', ''
			' -- Ext_Create_Fields
		, 'ContactId
			, New_Ldspid
			, Plus_CoordinatingLiaison
			, FullName
			, FirstName
			, MiddleName
			, LastName
			, NickName
			, New_MiddleName2
			, New_LastName2
			, New_PreferredName
			, Plus_DisplayName
			, New_BirthName
			, Plus_CurrentStudent
			, New_BirthDate
			, New_BirthdateDay
			, New_BirthdateMonth
			, New_BirthdateYear
			, New_Deceased
			, New_DeceasedDate
			, New_DeceasedDay
			, New_DeceasedMonth
			, New_DeceasedYear
			, Plus_WealthDate
			, SpousesName
			, New_Title
			, New_ProfessionalSuffix
			, New_HomeCountry
			, GenderCode
			, FamilyStatusCode
			, Plus_ChurchMember
			, New_PersonalSuffix
			, StatusCode
			, New_MajorGiftPropensity1
			, Plus_AnnualGift1
			, Plus_PlannedGift
			, Plus_GiftCapacityEnp
			, Plus_GiftCapacityEn
			, Plus_PhilanthropicCapacityRatingPcr
			, Plus_EstimatedHouseHoldIncome
			, Plus_EstimatedHomemarketValue
			, Plus_BlockClusters
			, Plus_PlannedGiftTier
			, Plus_PreferredFirstName
			, Plus_PreferredMiddleName
			, Plus_PreferredLastName
			, Plus_PreferredFullName
			, Plus_SpousePreferredFirstName
			, Plus_SpousePreferredMiddleName
			, Plus_SpousePreferredLastName
			, Plus_SpousePreferredFullName
			, Plus_ConnectedLiaison
			, Plus_PendingLiaison
			, Plus_I5TextLinesLdsp
			, Plus_TotalGivenLast5Years
			, Lds_IsQualified
			, Lds_QualifiedOn
			, Lds_QualifiedBy
			, Lds_TelefundNotes
			' -- Ext_Insert_Fields
		, 'ContactId
			, New_Ldspid
			, Plus_CoordinatingLiaison
			, FullName
			, FirstName
			, MiddleName
			, LastName
			, NickName
			, New_MiddleName2
			, New_LastName2
			, New_PreferredName
			, Plus_DisplayName
			, New_BirthName
			, Plus_CurrentStudent
			, New_BirthDate
			, New_BirthdateDay
			, New_BirthdateMonth
			, New_BirthdateYear
			, New_Deceased
			, New_DeceasedDate
			, New_DeceasedDay
			, New_DeceasedMonth
			, New_DeceasedYear
			, CASE WHEN DATENAME(dy,A.Plus_WealthDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_WealthDate)
					ELSE DATEADD(hh,-7,A.Plus_WealthDate) END AS Plus_WealthDate
			, SpousesName
			, New_Title
			, New_ProfessionalSuffix
			, New_HomeCountry
			, GenderCode
			, FamilyStatusCode
			, Plus_ChurchMember
			, New_PersonalSuffix
			, StatusCode
			, New_MajorGiftPropensity1
			, Plus_AnnualGift1
			, Plus_PlannedGift
			, Plus_GiftCapacityEnp
			, Plus_GiftCapacityEn
			, Plus_PhilanthropicCapacityRatingPcr
			, Plus_EstimatedHouseHoldIncome
			, Plus_EstimatedHomemarketValue
			, Plus_BlockClusters
			, Plus_PlannedGiftTier
			, Plus_PreferredFirstName
			, Plus_PreferredMiddleName
			, Plus_PreferredLastName
			, Plus_PreferredFullName
			, Plus_SpousePreferredFirstName
			, Plus_SpousePreferredMiddleName
			, Plus_SpousePreferredLastName
			, Plus_SpousePreferredFullName
			, Plus_ConnectedLiaison
			, Plus_PendingLiaison
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_I5TextLinesLdsp,1,4000)) AS Plus_I5TextLinesLdsp
			, Plus_TotalGivenLast5Years
			, Lds_IsQualified
			, CASE WHEN DATENAME(dy,A.Lds_QualifiedOn) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Lds_QualifiedOn)
					ELSE DATEADD(hh,-7,A.Lds_QualifiedOn) END AS Lds_QualifiedOn
			, Lds_QualifiedBy
			, CONVERT(NVARCHAR(4000),SUBSTRING(Lds_TelefundNotes,1,4000)) AS Lds_TelefundNotes
			' -- Ext_Select_Statement
		, 'Oa_Extract.ContactBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.Plus_WealthDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.Lds_QualifiedOn) = C.Date_Year
			' -- Ext_From_Statement
		, 'CREATE NONCLUSTERED INDEX IX_Contact_C_L_F 
			ON Ext_Contact(ContactId)
				INCLUDE (
				New_LdspId
				, FullName
				);
			UPDATE STATISTICS dbo.Ext_Contact 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- Entity (Ext_Entity)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Entity' -- Source_Table
		, 'Oa_Extract.Entity' -- Destination_Table
		, 'Ext_Entity' -- Ext_Table
		, 'ObjectTypeCode INT
			, PhysicalName NVARCHAR(64)
			, EntityId UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'ObjectTypeCode
			, PhysicalName
			, EntityId
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ObjectTypeCode INT
			, PhysicalName NVARCHAR(64)
			, EntityId UNIQUEIDENTIFIER
			' -- Ext_Create_Fields
		, 'ObjectTypeCode
			, PhysicalName
			, EntityId
			' -- Ext_Insert_Fields
		, 'ObjectTypeCode
			, PhysicalName
			, EntityId
			' -- Ext_Select_Statement
		, 'Oa_Extract.Entity
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_Address (Ext_Address)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_AddressBase' -- Source_Table
		, 'Oa_Extract.New_AddressBase' -- Destination_Table
		, 'Ext_Address' -- Ext_Table
		, 'Plus_RelatedContact UNIQUEIDENTIFIER
			, Plus_RelatedAccount UNIQUEIDENTIFIER
			, New_Primary BIT
			, New_Street1 NVARCHAR(100)
			, New_Street2 NVARCHAR(100)
			, New_Street3 NVARCHAR(100)
			, New_Zip4 NVARCHAR(15)
			, Plus_AddressDisplay NVARCHAR(MAX)
			, Plus_Longitude FLOAT
			, Plus_Latitude FLOAT
			, StateCode INT
			, New_Confidential BIT
			, New_CityLookUp UNIQUEIDENTIFIER
			, New_CountyId UNIQUEIDENTIFIER
			, New_StatesProvinces UNIQUEIDENTIFIER
			, New_CountryRegions UNIQUEIDENTIFIER
			, New_PostalCodes UNIQUEIDENTIFIER
			, Plus_OneAccordQuality INT
			, New_AddressType INT
			, New_AddressId UNIQUEIDENTIFIER
			, New_ConfirmedDate DATETIME
			, Plus_ForeignPostalCode NVARCHAR(100)
			, Lds_PostalCode NVARCHAR(100)
			, Lds_StateProvince NVARCHAR(100)
			, Lds_County NVARCHAR(100)
			, Lds_City NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Plus_RelatedContact
			, Plus_RelatedAccount
			, New_Primary
			, New_Street1
			, New_Street2
			, New_Street3
			, New_Zip4
			, Plus_AddressDisplay
			, Plus_Longitude
			, Plus_Latitude
			, StateCode
			, New_Confidential
			, New_CityLookUp
			, New_CountyId
			, New_StatesProvinces
			, New_CountryRegions
			, New_PostalCodes
			, Plus_OneAccordQuality
			, New_AddressType
			, New_AddressId
			, New_ConfirmedDate
			, Plus_ForeignPostalCode
			, Lds_PostalCode
			, Lds_StateProvince
			, Lds_County
			, Lds_City
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Plus_RelatedContact UNIQUEIDENTIFIER
			, New_Primary BIT
			, New_Street1 NVARCHAR(100)
			, New_Street2 NVARCHAR(100)
			, New_Street3 NVARCHAR(100)
			, New_Zip4 NVARCHAR(15)
			, Plus_AddressDisplay NVARCHAR(300)
			, Plus_Longitude FLOAT
			, Plus_Latitude FLOAT
			, StateCode INT
			, New_Confidential BIT
			, New_CityLookUp UNIQUEIDENTIFIER
			, New_CountyId UNIQUEIDENTIFIER
			, New_StatesProvinces UNIQUEIDENTIFIER
			, New_CountryRegions UNIQUEIDENTIFIER
			, New_PostalCodes UNIQUEIDENTIFIER
			, Plus_OneAccordQuality INT
			, New_AddressType INT
			, New_AddressId UNIQUEIDENTIFIER
			, New_ConfirmedDate DATETIME
			, Plus_ForeignPostalCode NVARCHAR(100)
			, Lds_PostalCode NVARCHAR(100)
			, Lds_StateProvince NVARCHAR(100)
			, Lds_County NVARCHAR(100)
			, Lds_City NVARCHAR(100)
			, Row_Num BIGINT
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			, Dash NVARCHAR(1) DEFAULT ''-''
			, Space NVARCHAR(1) DEFAULT '' ''
			, Comma_Space NVARCHAR(2) DEFAULT '', ''
			' -- Ext_Create_Fields
		, 'Plus_RelatedContact
			, New_Primary
			, New_Street1
			, New_Street2
			, New_Street3
			, New_Zip4
			, Plus_AddressDisplay
			, Plus_Longitude
			, Plus_Latitude
			, StateCode
			, New_Confidential
			, New_CityLookUp
			, New_CountyId
			, New_StatesProvinces
			, New_CountryRegions
			, New_PostalCodes
			, Plus_OneAccordQuality
			, New_AddressType
			, New_AddressId
			, New_ConfirmedDate
			, Plus_ForeignPostalCode
			, Lds_PostalCode
			, Lds_StateProvince
			, Lds_County
			, Lds_City
			, Row_Num
			' -- Ext_Insert_Fields
		, 'COALESCE(Plus_RelatedContact,Plus_RelatedAccount) AS Plus_RelatedContact
			, New_Primary
			, New_Street1
			, New_Street2
			, New_Street3
			, New_Zip4
			, CONVERT(NVARCHAR(300),SUBSTRING(Plus_AddressDisplay,1,300)) AS Plus_AddressDisplay
			, Plus_Longitude
			, Plus_Latitude
			, StateCode
			, New_Confidential
			, New_CityLookUp
			, New_CountyId
			, New_StatesProvinces
			, New_CountryRegions
			, New_PostalCodes
			, Plus_OneAccordQuality
			, New_AddressType
			, New_AddressId
			, New_ConfirmedDate
			, Plus_ForeignPostalCode
			, Lds_PostalCode
			, Lds_StateProvince
			, Lds_County
			, Lds_City
			, ROW_NUMBER() OVER(ORDER BY New_AddressId) AS Row_Num
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_AddressBase
			' -- Ext_From_Statement
		, '
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' 
			' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, '	
			' -- Ext_Where_Statement_2
		, '	 
			' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_AssociationBase (Ext_Association)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_AssociationBase' -- Source_Table
		, 'Oa_Extract.New_AssociationBase' -- Destination_Table
		, 'Ext_Association' -- Ext_Table
		, 'New_AssociationId UNIQUEIDENTIFIER
			, New_ShortName NVARCHAR(100)
			, New_Acronym NVARCHAR(100)
			, New_Region NVARCHAR(100)
			, New_ChapterLevel NVARCHAR(100)
			, StateCode INT
			, New_Type INT
			, New_Sponsor INT
			, New_Name NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_AssociationId
			, New_ShortName
			, New_Acronym
			, New_Region
			, New_ChapterLevel
			, StateCode
			, New_Type
			, New_Sponsor
			, New_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_AssociationId UNIQUEIDENTIFIER
			, New_ShortName NVARCHAR(100)
			, New_Acronym NVARCHAR(100)
			, New_Region NVARCHAR(100)
			, New_ChapterLevel NVARCHAR(100)
			, StateCode INT
			, New_Type INT
			, New_Sponsor INT
			, New_Name NVARCHAR(100)
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			' -- Ext_Create_Fields
		, 'New_AssociationId
			, New_ShortName
			, New_Acronym
			, New_Region
			, New_ChapterLevel
			, StateCode
			, New_Type
			, New_Sponsor
			, New_Name
			' -- Ext_Insert_Fields
		, 'New_AssociationId
			, New_ShortName
			, New_Acronym
			, New_Region
			, New_ChapterLevel
			, StateCode
			, New_Type
			, New_Sponsor
			, New_Name
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_AssociationBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_AssociationMembershipBase (Ext_Association_Membership)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_AssociationMembershipBase' -- Source_Table
		, 'Oa_Extract.New_AssociationMembershipBase' -- Destination_Table
		, 'Ext_Association_Membership' -- Ext_Table
		, 'New_AssociationMembershipId UNIQUEIDENTIFIER
			, New_ConstituentId  UNIQUEIDENTIFIER
			, New_Association UNIQUEIDENTIFIER
			, New_StartDate DATETIME
			, New_EndDate DATETIME
			, StatusCode INT
			, New_RelatedOrganization UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'New_AssociationMembershipId
			, New_ConstituentId
			, New_Association
			, New_StartDate
			, New_EndDate
			, StatusCode
			, New_RelatedOrganization
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_AssociationMembershipId UNIQUEIDENTIFIER
			, New_ConstituentId  UNIQUEIDENTIFIER
			, New_Association UNIQUEIDENTIFIER
			, New_StartDate DATETIME
			, New_EndDate DATETIME
			, StatusCode INT
			, New_RelatedOrganization UNIQUEIDENTIFIER
			' -- Ext_Create_Fields
		, 'New_AssociationMembershipId
			, New_ConstituentId
			, New_Association
			, New_StartDate
			, New_EndDate
			, StatusCode
			, New_RelatedOrganization
			' -- Ext_Insert_Fields
		, 'New_AssociationMembershipId
			, New_ConstituentId
			, New_Association
			, CASE WHEN DATENAME(dy,A.New_StartDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_StartDate)
					ELSE DATEADD(hh,-7,A.New_StartDate) END AS New_StartDate
			, CASE WHEN DATENAME(dy,A.New_EndDate) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_EndDate)
					ELSE DATEADD(hh,-7,A.New_EndDate) END AS New_EndDate
			, StatusCode
			, New_RelatedOrganization
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_AssociationMembershipBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.New_StartDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.New_EndDate) = C.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_BatchesBase (Ext_Batch)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_BatchesBase' -- Source_Table
		, 'Oa_Extract.New_BatchesBase' -- Destination_Table
		, 'Ext_Batch' -- Ext_Table
		, 'New_BatchesId UNIQUEIDENTIFIER
			, New_BatchNumber NVARCHAR(100)
			, Lds_BatchType INT
			' -- Dest_Create_Fields
		, 'New_BatchesId
			, New_BatchNumber
			, Lds_BatchType
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_BatchesId UNIQUEIDENTIFIER
			, New_BatchNumber NVARCHAR(100)
			, Lds_BatchType INT
			' -- Ext_Create_Fields
		, 'New_BatchesId
			, New_BatchNumber
			, Lds_BatchType
			' -- Ext_Insert_Fields
		, 'New_BatchesId
			, New_BatchNumber
			, Lds_BatchType
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_BatchesBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- New_CityBase (Ext_City)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_CityBase' -- Source_Table
		, 'Oa_Extract.New_CityBase' -- Destination_Table
		, 'Ext_City' -- Ext_Table
		, 'New_CityId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_CityId
			, New_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_CityId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'New_CityId
			, New_Name
			' -- Ext_Insert_Fields
		, 'New_CityId
			, New_Name
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_CityBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_CollegeBase (Ext_College)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_CollegeBase' -- Source_Table
		, 'Oa_Extract.New_CollegeBase' -- Destination_Table
		, 'Ext_College' -- Ext_Table
		, 'New_CollegeId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, New_CollegeCode NVARCHAR(20)
			' -- Dest_Create_Fields
		, 'New_CollegeId
			, New_Name
			, New_CollegeCode
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_CollegeId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, New_CollegeCode NVARCHAR(20)
			' -- Ext_Create_Fields
		, 'New_CollegeId
			, New_Name
			, New_CollegeCode
			' -- Ext_Insert_Fields
		, 'New_CollegeId
			, New_Name
			, New_CollegeCode
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_CollegeBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_CountryBase (Ext_Country)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_CountryBase' -- Source_Table
		, 'Oa_Extract.New_CountryBase' -- Destination_Table
		, 'Ext_Country' -- Ext_Table
		, 'New_CountryId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, Plus_AdderessFormat UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'New_CountryId
			, New_Name
			, Plus_AdderessFormat
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_CountryId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, Plus_AdderessFormat UNIQUEIDENTIFIER
			' -- Ext_Create_Fields
		, 'New_CountryId
			, New_Name
			, Plus_AdderessFormat
			' -- Ext_Insert_Fields
		, 'New_CountryId
			, New_Name
			, Plus_AdderessFormat
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_CountryBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_CountyBase (Ext_County)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_CountyBase' -- Source_Table
		, 'Oa_Extract.New_CountyBase' -- Destination_Table
		, 'Ext_County' -- Ext_Table
		, 'New_CountyId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, Plus_CountyCode NVARCHAR(10)
			' -- Dest_Create_Fields
		, 'New_CountyId
			, New_Name
			, Plus_CountyCode
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_CountyId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, Plus_CountyCode NVARCHAR(10)
			' -- Ext_Create_Fields
		, 'New_CountyId
			, New_Name
			, Plus_CountyCode
			' -- Ext_Insert_Fields
		, 'New_CountyId
			, New_Name
			, Plus_CountyCode
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_CountyBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_DegreeBase (Ext_Degree)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_DegreeBase' -- Source_Table
		, 'Oa_Extract.New_DegreeBase' -- Destination_Table
		, 'Ext_Degree' -- Ext_Table
		, 'New_DegreeId UNIQUEIDENTIFIER
			, New_Degree NVARCHAR(100)
			, New_DegreeCode NVARCHAR(100)
			, Plus_DegreeLevel INT
			' -- Dest_Create_Fields
		, 'New_DegreeId
			, New_Degree
			, New_DegreeCode
			, Plus_DegreeLevel
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_DegreeId UNIQUEIDENTIFIER
			, New_Degree NVARCHAR(100)
			, New_DegreeCode NVARCHAR(100)
			, Plus_DegreeLevel INT
			' -- Ext_Create_Fields
		, 'New_DegreeId
			, New_Degree
			, New_DegreeCode
			, Plus_DegreeLevel
			' -- Ext_Insert_Fields
		, 'New_DegreeId
			, New_Degree
			, New_DegreeCode
			, Plus_DegreeLevel
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_DegreeBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_DropIncludeBase (Ext_Drop_Include)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_DropIncludeBase' -- Source_Table
		, 'Oa_Extract.New_DropIncludeBase' -- Destination_Table
		, 'Ext_Drop_Include' -- Ext_Table
		, 'New_DropIncludeId UNIQUEIDENTIFIER
			, New_DropIncludesId UNIQUEIDENTIFIER
			, New_InstitutionalHierarchy UNIQUEIDENTIFIER
			, New_EmailDeliveryType BIT
			, New_PhoneDeliveryType BIT
			, New_WebDeliverytype BIT
			, New_VisitDeliveryType BIT
			, New_Reason INT
			, New_CommType INT
			, New_Interaction INT
			, New_Type INT
			, StateCode INT
			, New_MailDeliveryType BIT
			, New_TextDeliveryType BIT
			, New_StartDate DATETIME
			, New_EndDate DATETIME
			, Plus_CampaignId UNIQUEIDENTIFIER
			, New_Association UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'New_DropIncludeId
			, New_DropIncludesId
			, New_InstitutionalHierarchy
			, New_EmailDeliveryType
			, New_PhoneDeliveryType
			, New_WebDeliverytype
			, New_VisitDeliveryType
			, New_Reason
			, New_CommType
			, New_Interaction
			, New_Type
			, StateCode
			, New_MailDeliveryType
			, New_TextDeliveryType
			, New_StartDate
			, New_EndDate
			, Plus_CampaignId
			, New_Association
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_DropIncludeId UNIQUEIDENTIFIER
			, New_DropIncludesId UNIQUEIDENTIFIER
			, New_InstitutionalHierarchy UNIQUEIDENTIFIER
			, New_EmailDeliveryType BIT
			, New_PhoneDeliveryType BIT
			, New_WebDeliverytype BIT
			, New_VisitDeliveryType BIT
			, New_Reason INT
			, New_CommType INT
			, New_Interaction INT
			, New_Type INT
			, StateCode INT
			, New_MailDeliveryType BIT
			, New_TextDeliveryType BIT
			, New_StartDate DATETIME
			, New_EndDate DATETIME
			, Plus_CampaignId UNIQUEIDENTIFIER
			, New_Association UNIQUEIDENTIFIER
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			' -- Ext_Create_Fields
		, 'New_DropIncludeId
			, New_DropIncludesId
			, New_InstitutionalHierarchy
			, New_EmailDeliveryType
			, New_PhoneDeliveryType
			, New_WebDeliverytype
			, New_VisitDeliveryType
			, New_Reason
			, New_CommType
			, New_Interaction
			, New_Type
			, StateCode
			, New_MailDeliveryType
			, New_TextDeliveryType
			, New_StartDate
			, New_EndDate
			, Plus_CampaignId
			, New_Association
			' -- Ext_Insert_Fields
		, 'New_DropIncludeId
			, New_DropIncludesId
			, New_InstitutionalHierarchy
			, New_EmailDeliveryType
			, New_PhoneDeliveryType
			, New_WebDeliverytype
			, New_VisitDeliveryType
			, New_Reason
			, New_CommType
			, New_Interaction
			, New_Type
			, StateCode
			, New_MailDeliveryType
			, New_TextDeliveryType
			, CASE WHEN DATENAME(dy,A.New_StartDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_StartDate)
					ELSE DATEADD(hh,-7,A.New_StartDate) END AS New_StartDate
			, CASE WHEN DATENAME(dy,A.New_EndDate) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_EndDate)
					ELSE DATEADD(hh,-7,A.New_EndDate) END AS New_EndDate
			, Plus_CampaignId
			, New_Association
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_DropIncludeBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.New_StartDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.New_EndDate) = C.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_EmailBase (Ext_Email)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_EmailBase' -- Source_Table
		, 'Oa_Extract.New_EmailBase' -- Destination_Table
		, 'Ext_Email' -- Ext_Table
		, 'New_EmailId UNIQUEIDENTIFIER
			, New_ConstituentId UNIQUEIDENTIFIER
			, New_EmailsId UNIQUEIDENTIFIER
			, New_Emails NVARCHAR(150)
			, New_Primary BIT
			, Statecode INT
			, New_Confidential BIT
			, New_EmailType INT
			, New_ConfirmationDate DATETIME
			' -- Dest_Create_Fields
		, 'New_EmailId
			, New_ConstituentId
			, New_EmailsId
			, New_Emails
			, New_Primary
			, Statecode
			, New_Confidential
			, New_EmailType
			, New_ConfirmationDate
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_EmailId UNIQUEIDENTIFIER
			, New_ConstituentId UNIQUEIDENTIFIER
			, New_Emails NVARCHAR(150)
			, New_Primary BIT
			, Statecode INT
			, New_Confidential BIT
			, New_EmailType INT
			, New_ConfirmationDate DATETIME
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			' -- Ext_Create_Fields
		, 'New_EmailId
			, New_ConstituentId
			, New_Emails
			, New_Primary
			, Statecode
			, New_Confidential
			, New_EmailType
			, New_ConfirmationDate
			' -- Ext_Insert_Fields
		, 'New_EmailId
			, COALESCE(New_ConstituentId,New_EmailsId) AS New_ConstituentId
			, New_Emails
			, New_Primary
			, Statecode
			, New_Confidential
			, New_EmailType
			, New_ConfirmationDate
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_EmailBase
			' -- Ext_From_Statement
		, ' CREATE NONCLUSTERED INDEX IX_New_EmailType 
			ON Ext_Email(New_EmailType ASC)
				INCLUDE (
					New_ConstituentId
					, New_EmailId
					, New_Emails
					, New_Primary
					, StateCode
					, New_Confidential
				);                                                       			
				UPDATE STATISTICS dbo.Ext_Email
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_EmploymentBase (Ext_Employment)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_EmploymentBase' -- Source_Table
		, 'Oa_Extract.New_EmploymentBase' -- Destination_Table
		, 'Ext_Employment' -- Ext_Table
		, 'New_EmploymentsId UNIQUEIDENTIFIER
			, New_EmploymentId UNIQUEIDENTIFIER
			, StateCode INT
			, New_Type INT
			, New_PaymentFrequency INT
			, New_Department NVARCHAR(100)
			, New_ChurchAff BIT
			, Plus_AlternateOrganizationName NVARCHAR(100)
			, New_Title NVARCHAR(100)
			, New_DateStarted DATETIME
			, New_DateEnded DATETIME
			, New_Internship BIT
			, New_InstitutionalHierarchyId UNIQUEIDENTIFIER
			, New_Source UNIQUEIDENTIFIER
			, New_IndustryCategory UNIQUEIDENTIFIER
			, New_JobCode UNIQUEIDENTIFIER
			, Plus_ChurchEmploymentStatus INT
			, New_Company UNIQUEIDENTIFIER
			, StatusCode INT
			, ModifiedOn DATETIME
			, Plus_RelatedAddress UNIQUEIDENTIFIER
			, Plus_RelatedPhone UNIQUEIDENTIFIER
			, Lds_CampusAddress NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_EmploymentsId
			, New_EmploymentId
			, StateCode
			, New_Type
			, New_PaymentFrequency
			, New_Department
			, New_ChurchAff
			, Plus_AlternateOrganizationName
			, New_Title
			, New_DateStarted
			, New_DateEnded
			, New_Internship
			, New_InstitutionalHierarchyId
			, New_Source
			, New_IndustryCategory
			, New_JobCode
			, Plus_ChurchEmploymentStatus
			, New_Company
			, StatusCode
			, ModifiedOn
			, Plus_RelatedAddress
			, Plus_RelatedPhone
			, Lds_CampusAddress
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_EmploymentsId UNIQUEIDENTIFIER
			, New_EmploymentId UNIQUEIDENTIFIER
			, StateCode INT
			, New_Type INT
			, New_PaymentFrequency INT
			, New_Department NVARCHAR(100)
			, New_ChurchAff BIT
			, Plus_AlternateOrganizationName NVARCHAR(100)
			, New_Title NVARCHAR(100)
			, New_DateStarted DATETIME
			, New_DateEnded DATETIME
			, New_Internship BIT
			, New_InstitutionalHierarchyId UNIQUEIDENTIFIER
			, New_Source UNIQUEIDENTIFIER
			, New_IndustryCategory UNIQUEIDENTIFIER
			, New_JobCode UNIQUEIDENTIFIER
			, Plus_ChurchEmploymentStatus INT
			, New_Company UNIQUEIDENTIFIER
			, StatusCode INT
			, ModifiedOn DATETIME
			, Plus_RelatedAddress UNIQUEIDENTIFIER
			, Plus_RelatedPhone UNIQUEIDENTIFIER
			, Lds_CampusAddress NVARCHAR(100)
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			, Emp_Dash NVARCHAR(20) DEFAULT ''Employment - ''
			, Blank NVARCHAR(1) DEFAULT NULL
			, C NVARCHAR(1) DEFAULT ''C''
			, F NVARCHAR(1) DEFAULT ''F''
			, R NVARCHAR(1) DEFAULT ''R''
			, Percent_Byu_Percent NVARCHAR(10) DEFAULT ''%BYU%''
			, Percent_Byui_Percent NVARCHAR(10) DEFAULT ''%BYUI%''
			, Percent_Byuh_Percent NVARCHAR(10) DEFAULT ''%BYUH%''
			, Ldsbc_Dash_General NVARCHAR(20) DEFAULT ''LDSBC - GENERAL''
			' -- Ext_Create_Fields
		, 'New_EmploymentsId
			, New_EmploymentId
			, StateCode
			, New_Type
			, New_PaymentFrequency
			, New_Department
			, New_ChurchAff
			, Plus_AlternateOrganizationName
			, New_Title
			, New_DateStarted
			, New_DateEnded
			, New_Internship
			, New_InstitutionalHierarchyId
			, New_Source
			, New_IndustryCategory
			, New_JobCode
			, Plus_ChurchEmploymentStatus
			, New_Company
			, StatusCode
			, ModifiedOn
			, Plus_RelatedAddress
			, Plus_RelatedPhone
			, Lds_CampusAddress
			' -- Ext_Insert_Fields
		, 'New_EmploymentsId
			, New_EmploymentId
			, StateCode
			, New_Type
			, New_PaymentFrequency
			, New_Department
			, New_ChurchAff
			, Plus_AlternateOrganizationName
			, New_Title
			, CASE WHEN DATENAME(dy,A.New_DateStarted) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_DateStarted)
					ELSE DATEADD(hh,-7,A.New_DateStarted) END AS New_DateStarted
			, CASE WHEN DATENAME(dy,A.New_DateEnded) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_DateEnded)
					ELSE DATEADD(hh,-7,A.New_DateEnded) END AS New_DateEnded
			, New_Internship
			, New_InstitutionalHierarchyId
			, New_Source
			, New_IndustryCategory
			, New_JobCode
			, Plus_ChurchEmploymentStatus
			, New_Company
			, StatusCode
			, CASE WHEN DATENAME(dy,A.ModifiedOn) BETWEEN D.Mdt_Begin_Date_Number AND D.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ModifiedOn)
					ELSE DATEADD(hh,-7,A.ModifiedOn) END AS ModifiedOn
			, Plus_RelatedAddress
			, Plus_RelatedPhone
			, Lds_CampusAddress
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_EmploymentBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.New_DateStarted) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.New_DateEnded) = C.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim D ON YEAR(A.ModifiedOn) = D.Date_Year
			' -- Ext_From_Statement
		, 'CREATE NONCLUSTERED INDEX IX_New_Type 
				ON Ext_Employment(New_Type ASC)
				INCLUDE (
				New_EmploymentsId
				, New_DateStarted
				, New_InstitutionalHierarchyId
				);
			UPDATE STATISTICS dbo.Ext_Employment 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_FundAccountBase (Ext_Fund_Account)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_FundAccountBase' -- Source_Table
		, 'Oa_Extract.New_FundAccountBase' -- Destination_Table
		, 'Ext_Fund_Account' -- Ext_Table
		, 'New_FundAccountId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, New_FundName NVARCHAR(100)
			, New_AccountNumber  NVARCHAR(100)
			, Plus_GiftPurposeSubtype INT
			, Plus_GiftPurposeType INT
			, Plus_LdspAccountNumberInt INT
			, New_FormalAccountName NVARCHAR(100)
			, New_InstitutionalHierarchy UNIQUEIDENTIFIER
			, New_InstitutionAccountNumber NVARCHAR(100)
			, Plus_Unrestricted BIT
			, Plus_Scholarship BIT
			, New_Endowment BIT
			, Plus_EffectiveFrom DATETIME
			, Plus_EffectiveTo DATETIME
			, New_CaePurpose INT
			, Plus_SubClassAccountNumber NVARCHAR(100)
			, New_Description NVARCHAR(MAX)
			, Plus_Notes NVARCHAR(MAX)
			, Plus_AwardRestrictionGender INT
			, Plus_AwardRestrictionClassYear INT
			, Plus_AwardRestrictionCollege UNIQUEIDENTIFIER
			, Plus_AwardRestrictionEthnicity INT
			, Plus_AwardRestrictionGPA DECIMAL
			, Plus_AwardRestrictionMajor UNIQUEIDENTIFIER
			, Plus_GeographicArea UNIQUEIDENTIFIER
			, Plus_AwardRestrictionSeminaryGraduate BIT
			, Plus_NeedBased BIT
			, Plus_AwardRestrictionSingleParent BIT
			, Plus_AwardRestrictionReturnedMissionary BIT
			, Plus_PayItForward BIT
			, Plus_AwardRestrictionNotes NVARCHAR(MAX)
			, Plus_Athletics BIT
			, Plus_FourYear BIT
			, Plus_GraduateProfessional BIT
			, Plus_TvRadio BIT
			, Plus_TechnologySpec BIT
			, Plus_AlumniAssociation BIT
			, Plus_MatchingGiftText	NVARCHAR(MAX)
			, Plus_PrincipalAccountNumber NVARCHAR(100)
			, Plus_Spendable NVARCHAR(25)
			, Plus_ProposedEndowment BIT
			, Plus_ReportFrequency INT
			, StatusCode INT
			, New_AllowGifts BIT
			' -- Dest_Create_Fields
		, 'New_FundAccountId
			, New_Name
			, New_FundName
			, New_AccountNumber
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
			, New_AllowGifts
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_FundAccountId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, New_FundName NVARCHAR(100)
			, New_AccountNumber  NVARCHAR(100)
			, Plus_GiftPurposeSubtype INT
			, Plus_GiftPurposeType INT
			, Plus_LdspAccountNumberInt INT
			, New_FormalAccountName NVARCHAR(100)
			, New_InstitutionalHierarchy UNIQUEIDENTIFIER
			, New_InstitutionAccountNumber NVARCHAR(100)
			, Plus_Unrestricted BIT
			, Plus_Scholarship BIT
			, New_Endowment BIT
			, Plus_EffectiveFrom DATETIME
			, Plus_EffectiveTo DATETIME
			, New_CaePurpose INT
			, Plus_SubClassAccountNumber NVARCHAR(100)
			, New_Description NVARCHAR(MAX)
			, Plus_Notes NVARCHAR(MAX)
			, Plus_AwardRestrictionGender INT
			, Plus_AwardRestrictionClassYear INT
			, Plus_AwardRestrictionCollege UNIQUEIDENTIFIER
			, Plus_AwardRestrictionEthnicity INT
			, Plus_AwardRestrictionGPA DECIMAL
			, Plus_AwardRestrictionMajor UNIQUEIDENTIFIER
			, Plus_GeographicArea UNIQUEIDENTIFIER
			, Plus_AwardRestrictionSeminaryGraduate BIT
			, Plus_NeedBased BIT
			, Plus_AwardRestrictionSingleParent BIT
			, Plus_AwardRestrictionReturnedMissionary BIT
			, Plus_PayItForward BIT
			, Plus_AwardRestrictionNotes NVARCHAR(MAX)
			, Plus_Athletics BIT
			, Plus_FourYear BIT
			, Plus_GraduateProfessional BIT
			, Plus_TvRadio BIT
			, Plus_TechnologySpec BIT
			, Plus_AlumniAssociation BIT
			, Plus_MatchingGiftText	NVARCHAR(MAX)
			, Plus_PrincipalAccountNumber NVARCHAR(100)
			, Plus_Spendable NVARCHAR(25)
			, Plus_ProposedEndowment BIT
			, Plus_ReportFrequency INT
			, StatusCode INT
			, New_AllowGifts BIT
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			' -- Ext_Create_Fields
		, 'New_FundAccountId
			, New_Name
			, New_FundName
			, New_AccountNumber
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
			, New_AllowGifts
			' -- Ext_Insert_Fields
		, 'New_FundAccountId
			, New_Name
			, New_FundName
			, New_AccountNumber
			, Plus_GiftPurposeSubtype
			, Plus_GiftPurposeType
			, Plus_LdspAccountNumberInt
			, New_FormalAccountName
			, New_InstitutionalHierarchy
			, New_InstitutionAccountNumber
			, Plus_Unrestricted
			, Plus_Scholarship
			, New_Endowment
			, CASE WHEN DATENAME(dy,A.Plus_EffectiveFrom) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_EffectiveFrom)
					ELSE DATEADD(hh,-7,A.Plus_EffectiveFrom) END AS Plus_EffectiveFrom
			, CASE WHEN DATENAME(dy,A.Plus_EffectiveTo) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_EffectiveTo)
					ELSE DATEADD(hh,-7,A.Plus_EffectiveTo) END AS Plus_EffectiveTo
			, New_CaePurpose
			, Plus_SubClassAccountNumber
			, CONVERT(NVARCHAR(300),SUBSTRING(New_Description,1,300)) AS New_Description
			, CONVERT(NVARCHAR(200),SUBSTRING(Plus_Notes,1,200)) AS Plus_Notes
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
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_AwardRestrictionNotes,1,4000)) AS Plus_AwardRestrictionNotes
			, Plus_Athletics
			, Plus_FourYear
			, Plus_GraduateProfessional
			, Plus_TvRadio
			, Plus_TechnologySpec
			, Plus_AlumniAssociation
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_MatchingGiftText,1,4000)) AS Plus_MatchingGiftText
			, Plus_PrincipalAccountNumber
			, Plus_Spendable
			, Plus_ProposedEndowment
			, Plus_ReportFrequency
			, StatusCode
			, New_AllowGifts
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_FundAccountBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.Plus_EffectiveFrom) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.Plus_EffectiveTo) = C.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- New_GiftBase (Ext_Gift)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_GiftBase' -- Source_Table
		, 'Oa_Extract.New_GiftBase' -- Destination_Table
		, 'Ext_Gift' -- Ext_Table
		, 'New_ConstituentDonor UNIQUEIDENTIFIER
			, New_OrganizationDonor UNIQUEIDENTIFIER
			, New_FundAccount UNIQUEIDENTIFIER
			, New_InstitutionalHierarchyId UNIQUEIDENTIFIER
			, New_AssociatedPledge UNIQUEIDENTIFIER
			, New_GiftAmount MONEY
			, New_BatchNumber NVARCHAR(50)
			, New_GiftId UNIQUEIDENTIFIER
			, OwnerId UNIQUEIDENTIFIER			
			, New_GiftNumber NVARCHAR(50)
			, StatusCode INT
			, Plus_ReceiptText NVARCHAR(MAX)
			, Plus_SpecialGiftInstructions NVARCHAR(MAX)
			, Plus_CheckNumber NVARCHAR(50)
			, Plus_GiftSource INT
			, Plus_Kind INT
			, New_TenderType INT
			, New_AccountingDate DATETIME
			, New_ReceiptDate DATETIME
			, New_PostDate DATETIME
			, Plus_PlannedGift BIT
			, New_Transmitted BIT
			, Plus_AnonymousGift BIT
			, Plus_ReceiptDeliveryMethod INT
			, Plus_GiftInstructions NVARCHAR(MAX)
			, Plus_AcknowledgementInstructions NVARCHAR(MAX)
			, Plus_ExcludeFromReport BIT
			, Plus_IncludeOnYearEndReceipt BIT
			, Plus_GoodsServicesProvided BIT
			, Plus_EntitledBenefitValue MONEY
			, Plus_AcknowledgeContact NVARCHAR(100)
			, Plus_ContactRole INT
			, Plus_Salutation INT
			, Plus_Signer UNIQUEIDENTIFIER
			, Plus_NoAcknowledgement BIT
			, Plus_Appeal UNIQUEIDENTIFIER
			, Plus_MatchExpected BIT
			, New_Batch UNIQUEIDENTIFIER
			, Plus_Description NVARCHAR(MAX)
			, Lds_RecurringGiftRule UNIQUEIDENTIFIER
			, Lds_RecurringGiftGroup UNIQUEIDENTIFIER
			, Plus_ParentGift UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'New_ConstituentDonor
			, New_OrganizationDonor
			, New_FundAccount
			, New_InstitutionalHierarchyId
			, New_AssociatedPledge
			, New_GiftAmount
			, New_BatchNumber
			, New_GiftId
			, OwnerId			
			, New_GiftNumber
			, StatusCode
			, Plus_ReceiptText
			, Plus_SpecialGiftInstructions
			, Plus_CheckNumber
			, Plus_GiftSource
			, Plus_Kind
			, New_TenderType
			, New_AccountingDate
			, New_ReceiptDate
			, New_PostDate
			, Plus_PlannedGift
			, New_Transmitted
			, Plus_AnonymousGift
			, Plus_ReceiptDeliveryMethod
			, Plus_GiftInstructions
			, Plus_AcknowledgementInstructions
			, Plus_ExcludeFromReport
			, Plus_IncludeOnYearEndReceipt
			, Plus_GoodsServicesProvided
			, Plus_EntitledBenefitValue
			, Plus_AcknowledgeContact
			, Plus_ContactRole
			, Plus_Salutation
			, Plus_Signer
			, Plus_NoAcknowledgement
			, Plus_Appeal
			, Plus_MatchExpected
			, New_Batch
			, Plus_Description
			, Lds_RecurringGiftRule
			, Lds_RecurringGiftGroup
			, Plus_ParentGift
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_ConstituentDonor UNIQUEIDENTIFIER
			, New_OrganizationDonor UNIQUEIDENTIFIER
			, New_FundAccount UNIQUEIDENTIFIER
			, New_InstitutionalHierarchyId UNIQUEIDENTIFIER
			, New_AssociatedPledge UNIQUEIDENTIFIER
			, New_GiftAmount MONEY
			, New_BatchNumber NVARCHAR(50)
			, New_GiftId UNIQUEIDENTIFIER
			, OwnerId UNIQUEIDENTIFIER			
			, New_GiftNumber NVARCHAR(50)
			, StatusCode INT
			, Plus_ReceiptText NVARCHAR(4000)
			, Plus_SpecialGiftInstructions NVARCHAR(4000)
			, Plus_CheckNumber NVARCHAR(50)
			, Plus_GiftSource INT
			, Plus_Kind INT
			, New_TenderType INT
			, New_AccountingDate DATETIME
			, New_ReceiptDate DATETIME
			, New_PostDate DATETIME
			, Plus_PlannedGift BIT
			, New_Transmitted BIT
			, Plus_AnonymousGift BIT
			, Plus_ReceiptDeliveryMethod INT
			, Plus_GiftInstructions NVARCHAR(4000)
			, Plus_AcknowledgementInstructions NVARCHAR(4000)
			, Plus_ExcludeFromReport BIT
			, Plus_IncludeOnYearEndReceipt BIT
			, Plus_GoodsServicesProvided BIT
			, Plus_EntitledBenefitValue MONEY
			, Plus_AcknowledgeContact NVARCHAR(100)
			, Plus_ContactRole INT
			, Plus_Salutation INT
			, Plus_Signer UNIQUEIDENTIFIER
			, Plus_NoAcknowledgement BIT
			, Match_Gift_Number NVARCHAR(50)
			, Plus_Appeal UNIQUEIDENTIFIER
			, Plus_MatchExpected BIT
			, New_Batch UNIQUEIDENTIFIER
			, Plus_Description NVARCHAR(4000)
			, Lds_RecurringGiftRule UNIQUEIDENTIFIER
			, Lds_RecurringGiftGroup UNIQUEIDENTIFIER
			' -- Ext_Create_Fields
		, 'New_ConstituentDonor
			, New_OrganizationDonor
			, New_FundAccount
			, New_InstitutionalHierarchyId
			, New_AssociatedPledge
			, New_GiftAmount
			, New_BatchNumber
			, New_GiftId
			, OwnerId			
			, New_GiftNumber
			, StatusCode
			, Plus_ReceiptText
			, Plus_SpecialGiftInstructions
			, Plus_CheckNumber
			, Plus_GiftSource
			, Plus_Kind
			, New_TenderType
			, New_AccountingDate
			, New_ReceiptDate
			, New_PostDate
			, Plus_PlannedGift
			, New_Transmitted
			, Plus_AnonymousGift
			, Plus_ReceiptDeliveryMethod
			, Plus_GiftInstructions
			, Plus_AcknowledgementInstructions
			, Plus_ExcludeFromReport
			, Plus_IncludeOnYearEndReceipt
			, Plus_GoodsServicesProvided
			, Plus_EntitledBenefitValue
			, Plus_AcknowledgeContact
			, Plus_ContactRole
			, Plus_Salutation
			, Plus_Signer
			, Plus_NoAcknowledgement
			, Match_Gift_Number
			, Plus_Appeal
			, Plus_MatchExpected
			, New_Batch
			, Plus_Description
			, Lds_RecurringGiftRule
			, Lds_RecurringGiftGroup
			' -- Ext_Insert_Fields
		, 'New_ConstituentDonor
			, New_OrganizationDonor
			, New_FundAccount
			, New_InstitutionalHierarchyId
			, New_AssociatedPledge
			, New_GiftAmount
			, New_BatchNumber
			, New_GiftId
			, OwnerId
			, New_GiftNumber
			, StatusCode
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_ReceiptText,1,4000)) AS Plus_ReceiptText
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_SpecialGiftInstructions,1,4000)) AS Plus_SpecialGiftInstructions
			, Plus_CheckNumber
			, Plus_GiftSource
			, Plus_Kind
			, New_TenderType
			, CASE WHEN DATENAME(dy,A.New_AccountingDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_AccountingDate)
					ELSE DATEADD(hh,-7,A.New_AccountingDate) END AS New_AccountingDate
			, CASE WHEN DATENAME(dy,A.New_ReceiptDate) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_ReceiptDate)
					ELSE DATEADD(hh,-7,A.New_ReceiptDate) END AS New_ReceiptDate
			, CASE WHEN DATENAME(dy,A.New_PostDate) BETWEEN D.Mdt_Begin_Date_Number AND D.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_PostDate)
					ELSE DATEADD(hh,-7,A.New_PostDate) END AS New_PostDate
			, Plus_PlannedGift
			, New_Transmitted
			, Plus_AnonymousGift
			, Plus_ReceiptDeliveryMethod
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_GiftInstructions,1,4000)) AS Plus_GiftInstructions
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_AcknowledgementInstructions,1,4000)) AS Plus_AcknowledgementInstructions
			, Plus_ExcludeFromReport
			, Plus_IncludeOnYearEndReceipt
			, Plus_GoodsServicesProvided
			, Plus_EntitledBenefitValue
			, Plus_AcknowledgeContact
			, Plus_ContactRole
			, Plus_Salutation
			, Plus_Signer
			, Plus_NoAcknowledgement
			, CASE WHEN Plus_ParentGift IS NOT NULL THEN New_GiftNumber ELSE NULL END AS Match_Gift_Number
			, Plus_Appeal
			, Plus_MatchExpected
			, New_Batch
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_Description,1,4000)) AS Plus_Description
			, Lds_RecurringGiftRule
			, Lds_RecurringGiftGroup
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_GiftBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.New_AccountingDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.New_ReceiptDate) = C.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim D ON YEAR(A.New_PostDate) = D.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_GiftHistoryBase (Ext_Gift_Hist)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_GiftHistoryBase' -- Source_Table
		, 'Oa_Extract.New_GiftHistoryBase' -- Destination_Table
		, 'Ext_Gift_Hist' -- Ext_Table
		, 'New_RelatedGift UNIQUEIDENTIFIER
			, Plus_Constituent UNIQUEIDENTIFIER
			, Plus_Organization UNIQUEIDENTIFIER
			, Plus_FundAccount UNIQUEIDENTIFIER
			, OwnerId UNIQUEIDENTIFIER
			, Plus_AccountingDate DATETIME
			, StatusCode INT
			, New_Amount MONEY
			, New_ReceiptDate DATETIME
			, New_TenderType INT
			, Plus_Kind INT
			, Plus_Transmitted BIT
			, Plus_Description NVARCHAR(MAX)
			, Plus_ReceiptText NVARCHAR(MAX)
			, New_Name NVARCHAR(100)
			, Plus_GiftAdjustmentNote NVARCHAR(MAX)
			, New_GiftHistoryId UNIQUEIDENTIFIER
			, Plus_GiftNumber NVARCHAR(50)
			, Plus_PostDate DATETIME
			' -- Dest_Create_Fields
		, 'New_RelatedGift
			, Plus_Constituent
			, Plus_Organization
			, Plus_FundAccount
			, OwnerId
			, Plus_AccountingDate
			, StatusCode
			, New_Amount
			, New_ReceiptDate
			, New_TenderType
			, Plus_Kind
			, Plus_Transmitted
			, Plus_Description
			, Plus_ReceiptText
			, New_Name
			, Plus_GiftAdjustmentNote
			, New_GiftHistoryId
			, Plus_GiftNumber
			, Plus_PostDate
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_RelatedGift UNIQUEIDENTIFIER
			, Plus_Constituent UNIQUEIDENTIFIER
			, Plus_Organization UNIQUEIDENTIFIER
			, Plus_FundAccount UNIQUEIDENTIFIER
			, OwnerId UNIQUEIDENTIFIER
			, Plus_AccountingDate DATETIME
			, StatusCode INT
			, New_Amount MONEY
			, New_ReceiptDate DATETIME
			, New_TenderType INT
			, Plus_Kind INT
			, Plus_Transmitted BIT
			, Plus_Description NVARCHAR(4000)
			, Plus_ReceiptText NVARCHAR(4000)
			, New_Name NVARCHAR(100)
			, Plus_GiftAdjustmentNote NVARCHAR(4000)
			, New_GiftHistoryId UNIQUEIDENTIFIER
			, Plus_GiftNumber NVARCHAR(50)
			, Plus_PostDate DATETIME
			' -- Ext_Create_Fields
		, 'New_RelatedGift
			, Plus_Constituent
			, Plus_Organization
			, Plus_FundAccount
			, OwnerId
			, Plus_AccountingDate
			, StatusCode
			, New_Amount
			, New_ReceiptDate
			, New_TenderType
			, Plus_Kind
			, Plus_Transmitted
			, Plus_Description
			, Plus_ReceiptText
			, New_Name
			, Plus_GiftAdjustmentNote
			, New_GiftHistoryId
			, Plus_GiftNumber
			, Plus_PostDate
			' -- Ext_Insert_Fields
		, 'New_RelatedGift
			, Plus_Constituent
			, Plus_Organization
			, Plus_FundAccount
			, OwnerId
			, CASE WHEN DATENAME(dy,A.Plus_AccountingDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_AccountingDate)
					ELSE DATEADD(hh,-7,A.Plus_AccountingDate) END AS Plus_AccountingDate
			, StatusCode
			, New_Amount
			, CASE WHEN DATENAME(dy,A.New_ReceiptDate) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_ReceiptDate)
					ELSE DATEADD(hh,-7,A.New_ReceiptDate) END AS New_ReceiptDate
			, New_TenderType
			, Plus_Kind
			, Plus_Transmitted
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_Description,1,4000)) AS Plus_Description
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_ReceiptText,1,4000)) AS Plus_ReceiptText
			, New_Name
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_GiftAdjustmentNote,1,4000)) AS Plus_GiftAdjustmentNote
			, New_GiftHistoryId
			, Plus_GiftNumber
			, CASE WHEN DATENAME(dy,A.Plus_PostDate) BETWEEN D.Mdt_Begin_Date_Number AND D.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_PostDate)
					ELSE DATEADD(hh,-7,A.Plus_PostDate) END AS Plus_PostDate
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_GiftHistoryBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.Plus_AccountingDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.New_ReceiptDate) = C.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim D ON YEAR(A.Plus_PostDate) = D.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_IndustryBase (Ext_Industry)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_IndustryBase' -- Source_Table
		, 'Oa_Extract.New_IndustryBase' -- Destination_Table
		, 'Ext_Industry' -- Ext_Table
		, 'New_IndustryId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_IndustryId
			, New_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_IndustryId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'New_IndustryId
			, New_Name
			' -- Ext_Insert_Fields
		, 'New_IndustryId
			, New_Name
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_IndustryBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_InstitutionBase (Ext_Institution)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_InstitutionBase' -- Source_Table
		, 'Oa_Extract.New_InstitutionBase' -- Destination_Table
		, 'Ext_Institution' -- Ext_Table
		, 'New_Institutionid UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, Plus_ParentInstitutionalHieararchy UNIQUEIDENTIFIER
			, New_Level1 NVARCHAR(100)
			, New_Level2 NVARCHAR(100)
			, New_Level3 NVARCHAR(100)
			, New_AvailableToAlumni BIT
			, New_AvailableToStudent BIT
			, New_IsEndNode BIT
			, New_EducationUsage BIT
			, New_AssociationUsage BIT
			, New_DonationUsage BIT
			, New_Inst NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_Institutionid
			, New_Name
			, Plus_ParentInstitutionalHieararchy
			, New_Level1
			, New_Level2
			, New_Level3
			, New_AvailableToAlumni
			, New_AvailableToStudent
			, New_IsEndNode
			, New_EducationUsage
			, New_AssociationUsage
			, New_DonationUsage
			, New_Inst
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_Institutionid UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, Plus_ParentInstitutionalHieararchy UNIQUEIDENTIFIER
			, New_Level1 NVARCHAR(100)
			, New_Level2 NVARCHAR(100)
			, New_Level3 NVARCHAR(100)
			, New_AvailableToAlumni BIT
			, New_AvailableToStudent BIT
			, New_IsEndNode BIT
			, New_EducationUsage BIT
			, New_AssociationUsage BIT
			, New_DonationUsage BIT
			, New_Inst NVARCHAR(100)
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			, Byu NVARCHAR(10) DEFAULT ''BYU''
			, Byui NVARCHAR(10) DEFAULT ''BYUI''
			, Byuh NVARCHAR(10) DEFAULT ''BYUH''
			, Ldsbc NVARCHAR(10) DEFAULT ''LDSBC''
			, Church NVARCHAR(10) DEFAULT ''Church''
			' -- Ext_Create_Fields
		, 'New_Institutionid
			, New_Name
			, Plus_ParentInstitutionalHieararchy
			, New_Level1
			, New_Level2
			, New_Level3
			, New_AvailableToAlumni
			, New_AvailableToStudent
			, New_IsEndNode
			, New_EducationUsage
			, New_AssociationUsage
			, New_DonationUsage
			, New_Inst
			' -- Ext_Insert_Fields
		, 'New_Institutionid
			, New_Name
			, Plus_ParentInstitutionalHieararchy
			, New_Level1
			, New_Level2
			, New_Level3
			, New_AvailableToAlumni
			, New_AvailableToStudent
			, New_IsEndNode
			, New_EducationUsage
			, New_AssociationUsage
			, New_DonationUsage
			, New_Inst
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_InstitutionBase
			' -- Ext_From_Statement
		, 'CREATE NONCLUSTERED INDEX IX_New_Name 
				ON Ext_Institution(New_Name ASC)
				INCLUDE (
				New_InstitutionId
				);
			UPDATE STATISTICS dbo.Ext_Institution 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,	
-- --------------------------
-- New_InternationalExperienceBase (Ext_International_Experience)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_InternationalExperienceBase' -- Source_Table
		, 'Oa_Extract.New_InternationalExperienceBase' -- Destination_Table
		, 'Ext_International_Experience' -- Ext_Table
		, 'New_InternationalExperienceId UNIQUEIDENTIFIER
			, New_InternationalExperiencesAId UNIQUEIDENTIFIER
			, New_Experience INT
			, Plus_Emeritus BIT   
			, Plus_StudyAbroad BIT   
			, New_Source UNIQUEIDENTIFIER 
			, New_StartDate DATETIME
			, New_EndDate  DATETIME
			, Plus_Interest UNIQUEIDENTIFIER 
			, Plus_LdsPosition INT 
			, Plus_InstitutionalHierarchy UNIQUEIDENTIFIER 
			, New_Country UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'New_InternationalExperienceId
			, New_InternationalExperiencesAId
			, New_Experience
			, Plus_Emeritus   
			, Plus_StudyAbroad   
			, New_Source 
			, New_StartDate
			, New_EndDate
			, Plus_Interest 
			, Plus_LdsPosition 
			, Plus_InstitutionalHierarchy 
			, New_Country
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_InternationalExperienceId UNIQUEIDENTIFIER
			, New_InternationalExperiencesAId UNIQUEIDENTIFIER
			, New_Experience INT
			, Plus_Emeritus BIT   
			, Plus_StudyAbroad BIT   
			, New_Source UNIQUEIDENTIFIER 
			, New_StartDate DATETIME
			, New_EndDate  DATETIME
			, Plus_Interest UNIQUEIDENTIFIER 
			, Plus_LdsPosition INT 
			, Plus_InstitutionalHierarchy UNIQUEIDENTIFIER 
			, New_Country UNIQUEIDENTIFIER
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			, Percent_Byu_Percent NVARCHAR(10) DEFAULT ''%BYU%''
			, Percent_Byui_Percent NVARCHAR(10) DEFAULT ''%BYUI%''
			, Percent_Byuh_Percent NVARCHAR(10) DEFAULT ''%BYUH%''
			, Ldsbc_Dash_General NVARCHAR(20) DEFAULT ''LDSBC - GENERAL''
			' -- Ext_Create_Fields
		, 'New_InternationalExperienceId
			, New_InternationalExperiencesAId
			, New_Experience
			, Plus_Emeritus   
			, Plus_StudyAbroad   
			, New_Source 
			, New_StartDate
			, New_EndDate
			, Plus_Interest 
			, Plus_LdsPosition 
			, Plus_InstitutionalHierarchy 
			, New_Country
			' -- Ext_Insert_Fields
		, 'New_InternationalExperienceId
			, New_InternationalExperiencesAId
			, New_Experience
			, Plus_Emeritus   
			, Plus_StudyAbroad   
			, New_Source 
			, CASE WHEN DATENAME(dy,A.New_StartDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_StartDate)
					ELSE DATEADD(hh,-7,A.New_StartDate) END AS New_StartDate
			, CASE WHEN DATENAME(dy,A.New_EndDate) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_EndDate)
					ELSE DATEADD(hh,-7,A.New_EndDate) END AS New_EndDate
			, Plus_Interest 
			, Plus_LdsPosition 
			, Plus_InstitutionalHierarchy 
			, New_Country
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_InternationalExperienceBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.New_StartDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.New_EndDate) = C.Date_Year
			' -- Ext_From_Statement
		, 'CREATE NONCLUSTERED INDEX IX_New_Experience 
				ON Ext_International_Experience(New_Experience ASC)
				INCLUDE (
				New_InternationalExperiencesAId
				, New_StartDate
				, Plus_InstitutionalHierarchy
				);
			UPDATE STATISTICS dbo.Ext_International_Experience 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- New_JobCodeBase (Ext_Job_Code)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_JobCodeBase' -- Source_Table
		, 'Oa_Extract.New_JobCodeBase' -- Destination_Table
		, 'Ext_Job_Code' -- Ext_Table
		, 'New_JobCodeId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_JobCodeId
			, New_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_JobCodeId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'New_JobCodeId
			, New_Name
			' -- Ext_Insert_Fields
		, 'New_JobCodeId
			, New_Name
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_JobCodeBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_LanguageSpecialAffiliationBase (Ext_Language)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_LanguageSpecialAffiliationBase' -- Source_Table
		, 'Oa_Extract.New_LanguageSpecialAffiliationBase' -- Destination_Table
		, 'Ext_Language' -- Ext_Table
		, 'New_LanguageSpecialAffiliationId  UNIQUEIDENTIFIER
			, New_LanguageSAId  UNIQUEIDENTIFIER
			, New_Language INT
			, New_Missionary BIT
			, New_ReadLevel INT
			, New_Speech INT
			, New_Teacher BIT
			, New_Translator BIT
			, New_WriteLevel INT
			, New_BusinessPerson BIT
			, Plus_I5CreatedBy NVARCHAR(75)
			, Plus_I5CreatedOn NVARCHAR(15)
			, Plus_Notes NVARCHAR(MAX)
			, New_Source UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'New_LanguageSpecialAffiliationId
			, New_LanguageSAId
			, New_Language
			, New_Missionary
			, New_ReadLevel
			, New_Speech
			, New_Teacher
			, New_Translator
			, New_WriteLevel
			, New_BusinessPerson
			, Plus_I5CreatedBy
			, Plus_I5CreatedOn
			, Plus_Notes
			, New_Source
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_LanguageSpecialAffiliationId  UNIQUEIDENTIFIER
			, New_LanguageSAId  UNIQUEIDENTIFIER
			, New_Language INT
			, New_Missionary BIT
			, New_ReadLevel INT
			, New_Speech INT
			, New_Teacher BIT
			, New_Translator BIT
			, New_WriteLevel INT
			, New_BusinessPerson BIT
			, Plus_I5CreatedBy NVARCHAR(75)
			, Plus_I5CreatedOn NVARCHAR(15)
			, Plus_Notes NVARCHAR(4000)
			, New_Source UNIQUEIDENTIFIER
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			' -- Ext_Create_Fields
		, 'New_LanguageSpecialAffiliationId
			, New_LanguageSAId
			, New_Language
			, New_Missionary
			, New_ReadLevel
			, New_Speech
			, New_Teacher
			, New_Translator
			, New_WriteLevel
			, New_BusinessPerson
			, Plus_I5CreatedBy
			, Plus_I5CreatedOn
			, Plus_Notes
			, New_Source
			' -- Ext_Insert_Fields
		, 'New_LanguageSpecialAffiliationId
			, New_LanguageSAId
			, New_Language
			, New_Missionary
			, New_ReadLevel
			, New_Speech
			, New_Teacher
			, New_Translator
			, New_WriteLevel
			, New_BusinessPerson
			, Plus_I5CreatedBy
			, Plus_I5CreatedOn
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_Notes,1,4000)) AS Plus_Notes
			, New_Source
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_LanguageSpecialAffiliationBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_MajorBase (Ext_Major)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_MajorBase' -- Source_Table
		, 'Oa_Extract.New_MajorBase' -- Destination_Table
		, 'Ext_Major' -- Ext_Table
		, 'New_College UNIQUEIDENTIFIER
			, New_University UNIQUEIDENTIFIER
			, New_MajorId UNIQUEIDENTIFIER
			, New_Major NVARCHAR(100)
			, New_MajorName NVARCHAR(100)
			, New_MajorCode NVARCHAR(10)
			' -- Dest_Create_Fields
		, 'New_College
			, New_University
			, New_MajorId
			, New_Major
			, New_MajorName
			, New_MajorCode
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_College UNIQUEIDENTIFIER
			, New_University UNIQUEIDENTIFIER
			, New_MajorId UNIQUEIDENTIFIER
			, New_Major NVARCHAR(100)
			, New_MajorName NVARCHAR(100)
			, New_MajorCode NVARCHAR(10)
			' -- Ext_Create_Fields
		, 'New_College
			, New_University
			, New_MajorId
			, New_Major
			, New_MajorName
			, New_MajorCode
			' -- Ext_Insert_Fields
		, 'New_College
			, New_University
			, New_MajorId
			, New_Major
			, New_MajorName
			, New_MajorCode
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_MajorBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_OtherIdentifiersBase (Ext_Other_Identifiers)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_OtherIdentifiersBase' -- Source_Table
		, 'Oa_Extract.New_OtherIdentifiersBase' -- Destination_Table
		, 'Ext_Other_Identifiers' -- Ext_Table
		, 'New_OtherIdentifiersId UNIQUEIDENTIFIER
			, StateCode INT
			, New_Type INT
			, New_InstitutionalHierarchy UNIQUEIDENTIFIER
			, ModifiedOn DATETIME
			, New_EmploymentId UNIQUEIDENTIFIER
			, New_Id NVARCHAR(100)
			, Plus_Id NVARCHAR(100)
			, New_OtherIdentifiers UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'New_OtherIdentifiersId
			, StateCode
			, New_Type
			, New_InstitutionalHierarchy
			, ModifiedOn
			, New_EmploymentId
			, New_Id
			, Plus_Id
			, New_OtherIdentifiers
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_OtherIdentifiersId UNIQUEIDENTIFIER
			, StateCode INT
			, New_Type INT
			, New_InstitutionalHierarchy UNIQUEIDENTIFIER
			, ModifiedOn DATETIME
			, New_EmploymentId UNIQUEIDENTIFIER
			, New_Id NVARCHAR(100)
			, Plus_Id NVARCHAR(100)
			, New_OtherIdentifiers UNIQUEIDENTIFIER
			' -- Ext_Create_Fields
		, 'New_OtherIdentifiersId
			, StateCode
			, New_Type
			, New_InstitutionalHierarchy
			, ModifiedOn
			, New_EmploymentId
			, New_Id
			, Plus_Id
			, New_OtherIdentifiers
			' -- Ext_Insert_Fields
		, 'New_OtherIdentifiersId
			, StateCode
			, New_Type
			, New_InstitutionalHierarchy
			, CASE WHEN DATENAME(dy,A.ModifiedOn) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ModifiedOn)
					ELSE DATEADD(hh,-7,A.ModifiedOn) END AS ModifiedOn
			, New_EmploymentId
			, New_Id
			, Plus_Id
			, New_OtherIdentifiers
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_OtherIdentifiersBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.ModifiedOn) = B.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_PhoneBase (Ext_Phone)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_PhoneBase' -- Source_Table
		, 'Oa_Extract.New_PhoneBase' -- Destination_Table
		, 'Ext_Phone' -- Ext_Table
		, 'New_PhoneId UNIQUEIDENTIFIER
			, New_NumberId UNIQUEIDENTIFIER
			, New_PhonesId UNIQUEIDENTIFIER
			, Plus_PhoneNumberUnformatted NVARCHAR(100)
			, New_PhoneNumber NVARCHAR(100)
			, New_CountryCode NVARCHAR(100)
			, New_Ext NVARCHAR(100)
			, StateCode INT
			, New_Primary BIT
			, New_ReceiveText BIT
			, New_Confidential BIT
			, New_Type INT
			, Plus_LineType INT
			, New_PreferredTime INT
			, StatusCode INT
			, ModifiedOn DATETIME
			, New_ConfirmationDate DATETIME
			' -- Dest_Create_Fields
		, 'New_PhoneId
			, New_NumberId
			, New_PhonesId
			, Plus_PhoneNumberUnformatted
			, New_PhoneNumber
			, New_CountryCode
			, New_Ext
			, StateCode
			, New_Primary
			, New_ReceiveText
			, New_Confidential
			, New_Type
			, Plus_LineType
			, New_PreferredTime
			, StatusCode
			, ModifiedOn
			, New_ConfirmationDate
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_PhoneId UNIQUEIDENTIFIER
			, New_NumberId UNIQUEIDENTIFIER
			, Plus_PhoneNumberUnformatted NVARCHAR(100)
			, New_PhoneNumber NVARCHAR(100)
			, New_CountryCode NVARCHAR(100)
			, New_Ext NVARCHAR(100)
			, StateCode INT
			, New_Primary BIT
			, New_ReceiveText BIT
			, New_Confidential BIT
			, New_Type INT
			, Plus_LineType INT
			, New_PreferredTime INT
			, StatusCode INT
			, ModifiedOn DATETIME
			, New_ConfirmationDate DATETIME
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			, Dash NVARCHAR(1) DEFAULT ''-''
			' -- Ext_Create_Fields
		, 'New_PhoneId
			, New_NumberId
			, Plus_PhoneNumberUnformatted
			, New_PhoneNumber
			, New_CountryCode
			, New_Ext
			, StateCode
			, New_Primary
			, New_ReceiveText
			, New_Confidential
			, New_Type
			, Plus_LineType
			, New_PreferredTime
			, StatusCode
			, ModifiedOn
			, New_ConfirmationDate
			' -- Ext_Insert_Fields
		, 'New_PhoneId
			, COALESCE(New_NumberId,New_PhonesId) AS New_NumberId
			, Plus_PhoneNumberUnformatted
			, New_PhoneNumber
			, New_CountryCode
			, New_Ext
			, StateCode
			, New_Primary
			, New_ReceiveText
			, New_Confidential
			, New_Type
			, Plus_LineType
			, New_PreferredTime
			, StatusCode
			, CASE WHEN DATENAME(dy,A.ModifiedOn) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ModifiedOn)
					ELSE DATEADD(hh,-7,A.ModifiedOn) END AS ModifiedOn
			, New_ConfirmationDate
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_PhoneBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.ModifiedOn) = B.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_PledgeBase (Ext_Pledge)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_PledgeBase' -- Source_Table
		, 'Oa_Extract.New_PledgeBase' -- Destination_Table
		, 'Ext_Pledge' -- Ext_Table
		, 'New_PledgeId UNIQUEIDENTIFIER
			, New_TotalPledged MONEY
			, New_BeginDate DATETIME
			, New_EndDate DATETIME
			, Plus_Kind INT
			, Plus_TenderType INT
			, Plus_GiftSource INT
			, Plus_PlannedGift BIT
			, Plus_CheckNumber NVARCHAR(50)
			, New_Confidential BIT
			, Plus_AcknowledgementInstructions NVARCHAR(MAX)
			, Plus_NewAccountInstructions NVARCHAR(MAX)
			, Plus_SpecialGiftInstructions NVARCHAR(MAX)
			, Plus_TelefundRep UNIQUEIDENTIFIER
			, New_BalanceDue_Base MONEY
			, New_TotalPaid_Base MONEY
			, New_PaymentsToMake INT
			, New_PaymentsReceived INT
			, Plus_PlannedGivingPaymentFrequency INT
			, New_InstallmentAmount_Base MONEY
			, Plus_InstallmentDate DATETIME
			, New_Bookable BIT
			, Plus_MatchExpected BIT
			, Plus_ParentGift UNIQUEIDENTIFIER
			, OwnerId UNIQUEIDENTIFIER
			, Plus_GiftRevocability INT
			, Plus_RemainderBeneficiary INT
			, Plus_FairMarketValue_Base MONEY
			, Plus_PresentValue_Base MONEY
			, New_SignatureDate DATETIME
			, New_Documentation BIT
			, New_NotificationDate DATETIME
			, Plus_FundingDate DATETIME
			, Plus_EstimatedMaturityDate DATETIME
			, Plus_Designation NVARCHAR(MAX)
			, Plus_NameOfTrust NVARCHAR(200)
			, plus_PlannedGivingType INT
			, Plus_VehicleType INT
			, Plus_VehicleSubType INT
			, Plus_PayoutRate DECIMAL
			, Plus_PaymentAmount_Base MONEY
			, Plus_AnnualAmount_Base MONEY
			, Plus_Duration INT
			, Plus_LivesType INT
			, Plus_Years INT
			, Plus_Lives DECIMAL
			, Plus_TermBeneficiaryLives DECIMAL
			, Plus_TermBeneficiaryYears INT
			, Plus_Cri DECIMAL
			, Plus_PaymentStartDate DATETIME
			, Plus_GpsNotes NVARCHAR(MAX)
			, Plus_Appeal UNIQUEIDENTIFIER
			, New_FundAccount UNIQUEIDENTIFIER
			, New_InstitutionalHierarchy UNIQUEIDENTIFIER
			, New_ConstituentDonor UNIQUEIDENTIFIER
			, New_OrganizationDonor UNIQUEIDENTIFIER
			, New_Opportunity UNIQUEIDENTIFIER
			, New_BalanceDue  MONEY
			, New_InstallmentAmount MONEY
			, New_TotalPaid MONEY
			, Plus_RecurringGiftRules UNIQUEIDENTIFIER
			, New_PledgeNumber NVARCHAR(100)
			, StatusCode INT
			, Lds_ExpectancyType INT
			' -- Dest_Create_Fields
		, 'New_PledgeId
			, New_TotalPledged
			, New_BeginDate
			, New_EndDate
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
			, New_BalanceDue_Base
			, New_TotalPaid_Base
			, New_PaymentsToMake
			, New_PaymentsReceived
			, Plus_PlannedGivingPaymentFrequency
			, New_InstallmentAmount_Base
			, Plus_InstallmentDate
			, New_Bookable
			, Plus_MatchExpected
			, Plus_ParentGift
			, OwnerId
			, Plus_GiftRevocability
			, Plus_RemainderBeneficiary
			, Plus_FairMarketValue_Base
			, Plus_PresentValue_Base
			, New_SignatureDate
			, New_Documentation
			, New_NotificationDate
			, Plus_FundingDate
			, Plus_EstimatedMaturityDate
			, Plus_Designation
			, Plus_NameOfTrust
			, plus_PlannedGivingType
			, Plus_VehicleType
			, Plus_VehicleSubType
			, Plus_PayoutRate
			, Plus_PaymentAmount_Base
			, Plus_AnnualAmount_Base
			, Plus_Duration
			, Plus_LivesType
			, Plus_Years
			, Plus_Lives
			, Plus_TermBeneficiaryLives
			, Plus_TermBeneficiaryYears
			, Plus_Cri
			, Plus_PaymentStartDate
			, Plus_GpsNotes
			, Plus_Appeal
			, New_FundAccount
			, New_InstitutionalHierarchy
			, New_ConstituentDonor
			, New_OrganizationDonor
			, New_Opportunity
			, New_BalanceDue
			, New_InstallmentAmount
			, New_TotalPaid
			, Plus_RecurringGiftRules
			, New_PledgeNumber
			, StatusCode
			, Lds_ExpectancyType
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_PledgeId UNIQUEIDENTIFIER
			, New_TotalPledged MONEY
			, New_BeginDate DATETIME
			, New_EndDate DATETIME
			, Plus_Kind INT
			, Plus_TenderType INT
			, Plus_GiftSource INT
			, Plus_PlannedGift BIT
			, Plus_CheckNumber NVARCHAR(50)
			, New_Confidential BIT
			, Plus_AcknowledgementInstructions NVARCHAR(4000)
			, Plus_NewAccountInstructions NVARCHAR(4000)
			, Plus_SpecialGiftInstructions NVARCHAR(4000)
			, Plus_TelefundRep UNIQUEIDENTIFIER
			, New_BalanceDue_Base MONEY
			, New_TotalPaid_Base MONEY
			, New_PaymentsToMake INT
			, New_PaymentsReceived INT
			, Plus_PlannedGivingPaymentFrequency INT
			, New_InstallmentAmount_Base MONEY
			, Plus_InstallmentDate DATETIME
			, New_Bookable BIT
			, Plus_MatchExpected BIT
			, Plus_ParentGift UNIQUEIDENTIFIER
			, OwnerId UNIQUEIDENTIFIER
			, Plus_GiftRevocability INT
			, Plus_RemainderBeneficiary INT
			, Plus_FairMarketValue_Base MONEY
			, Plus_PresentValue_Base MONEY
			, New_SignatureDate DATETIME
			, New_Documentation BIT
			, New_NotificationDate DATETIME
			, Plus_FundingDate DATETIME
			, Plus_EstimatedMaturityDate DATETIME
			, Plus_Designation NVARCHAR(4000)
			, Plus_NameOfTrust NVARCHAR(200)
			, plus_PlannedGivingType INT
			, Plus_VehicleType INT
			, Plus_VehicleSubType INT
			, Plus_PayoutRate DECIMAL
			, Plus_PaymentAmount_Base MONEY
			, Plus_AnnualAmount_Base MONEY
			, Plus_Duration INT
			, Plus_LivesType INT
			, Plus_Years INT
			, Plus_Lives DECIMAL
			, Plus_TermBeneficiaryLives DECIMAL
			, Plus_TermBeneficiaryYears INT
			, Plus_Cri DECIMAL
			, Plus_PaymentStartDate DATETIME
			, Plus_GpsNotes NVARCHAR(4000)
			, Plus_Appeal UNIQUEIDENTIFIER
			, New_FundAccount UNIQUEIDENTIFIER
			, New_InstitutionalHierarchy UNIQUEIDENTIFIER
			, New_ConstituentDonor UNIQUEIDENTIFIER
			, New_OrganizationDonor UNIQUEIDENTIFIER
			, New_Opportunity UNIQUEIDENTIFIER
			, New_BalanceDue  MONEY
			, New_InstallmentAmount MONEY
			, New_TotalPaid MONEY
			, Plus_RecurringGiftRules UNIQUEIDENTIFIER
			, New_PledgeNumber NVARCHAR(100)
			, StatusCode INT
			, Lds_ExpectancyType INT
			, Zero NVARCHAR(5) DEFAULT ''0''
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			' -- Ext_Create_Fields
		, 'New_PledgeId
			, New_TotalPledged
			, New_BeginDate
			, New_EndDate
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
			, New_BalanceDue_Base
			, New_TotalPaid_Base
			, New_PaymentsToMake
			, New_PaymentsReceived
			, Plus_PlannedGivingPaymentFrequency
			, New_InstallmentAmount_Base
			, Plus_InstallmentDate
			, New_Bookable
			, Plus_MatchExpected
			, Plus_ParentGift
			, OwnerId
			, Plus_GiftRevocability
			, Plus_RemainderBeneficiary
			, Plus_FairMarketValue_Base
			, Plus_PresentValue_Base
			, New_SignatureDate
			, New_Documentation
			, New_NotificationDate
			, Plus_FundingDate
			, Plus_EstimatedMaturityDate
			, Plus_Designation
			, Plus_NameOfTrust
			, plus_PlannedGivingType
			, Plus_VehicleType
			, Plus_VehicleSubType
			, Plus_PayoutRate
			, Plus_PaymentAmount_Base
			, Plus_AnnualAmount_Base
			, Plus_Duration
			, Plus_LivesType
			, Plus_Years
			, Plus_Lives
			, Plus_TermBeneficiaryLives
			, Plus_TermBeneficiaryYears
			, Plus_Cri
			, Plus_PaymentStartDate
			, Plus_GpsNotes
			, Plus_Appeal
			, New_FundAccount
			, New_InstitutionalHierarchy
			, New_ConstituentDonor
			, New_OrganizationDonor
			, New_Opportunity
			, New_BalanceDue
			, New_InstallmentAmount
			, New_TotalPaid
			, Plus_RecurringGiftRules
			, New_PledgeNumber
			, StatusCode
			, Lds_ExpectancyType
			' -- Ext_Insert_Fields
		, 'New_PledgeId
			, New_TotalPledged
			, CASE WHEN DATENAME(dy,A.New_BeginDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_BeginDate)
					ELSE DATEADD(hh,-7,A.New_BeginDate) END AS New_BeginDate
			, CASE WHEN DATENAME(dy,A.New_EndDate) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_EndDate)
					ELSE DATEADD(hh,-7,A.New_EndDate) END AS New_EndDate
			, Plus_Kind
			, Plus_TenderType
			, Plus_GiftSource
			, Plus_PlannedGift
			, Plus_CheckNumber
			, New_Confidential
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_AcknowledgementInstructions,1,4000)) AS Plus_AcknowledgementInstructions
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_NewAccountInstructions,1,4000)) AS Plus_NewAccountInstructions
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_SpecialGiftInstructions,1,4000)) AS Plus_SpecialGiftInstructions
			, Plus_TelefundRep
			, New_BalanceDue_Base
			, New_TotalPaid_Base
			, New_PaymentsToMake
			, New_PaymentsReceived
			, Plus_PlannedGivingPaymentFrequency
			, New_InstallmentAmount_Base
			, CASE WHEN DATENAME(dy,A.Plus_InstallmentDate) BETWEEN D.Mdt_Begin_Date_Number AND D.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_InstallmentDate)
					ELSE DATEADD(hh,-7,A.Plus_InstallmentDate) END AS Plus_InstallmentDate
			, New_Bookable
			, Plus_MatchExpected
			, Plus_ParentGift
			, OwnerId
			, Plus_GiftRevocability
			, Plus_RemainderBeneficiary
			, Plus_FairMarketValue_Base
			, Plus_PresentValue_Base
			, CASE WHEN DATENAME(dy,A.New_SignatureDate) BETWEEN E.Mdt_Begin_Date_Number AND E.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_SignatureDate)
					ELSE DATEADD(hh,-7,A.New_SignatureDate) END AS New_SignatureDate
			, New_Documentation
			, CASE WHEN DATENAME(dy,A.New_NotificationDate) BETWEEN F.Mdt_Begin_Date_Number AND F.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_NotificationDate)
					ELSE DATEADD(hh,-7,A.New_NotificationDate) END AS New_NotificationDate
			, CASE WHEN DATENAME(dy,A.Plus_FundingDate) BETWEEN G.Mdt_Begin_Date_Number AND G.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_FundingDate)
					ELSE DATEADD(hh,-7,A.Plus_FundingDate) END AS Plus_FundingDate
			, CASE WHEN DATENAME(dy,A.Plus_EstimatedMaturityDate) BETWEEN H.Mdt_Begin_Date_Number AND H.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_EstimatedMaturityDate)
					ELSE DATEADD(hh,-7,A.Plus_EstimatedMaturityDate) END AS Plus_EstimatedMaturityDate
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_Designation,1,4000)) AS Plus_Designation
			, Plus_NameOfTrust
			, plus_PlannedGivingType
			, Plus_VehicleType
			, Plus_VehicleSubType
			, Plus_PayoutRate
			, Plus_PaymentAmount_Base
			, Plus_AnnualAmount_Base
			, Plus_Duration
			, Plus_LivesType
			, Plus_Years
			, Plus_Lives
			, Plus_TermBeneficiaryLives
			, Plus_TermBeneficiaryYears
			, Plus_Cri
			, CASE WHEN DATENAME(dy,A.Plus_PaymentStartDate) BETWEEN I.Mdt_Begin_Date_Number AND I.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_PaymentStartDate)
					ELSE DATEADD(hh,-7,A.Plus_PaymentStartDate) END AS Plus_PaymentStartDate
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_GpsNotes,1,4000)) AS Plus_GpsNotes
			, Plus_Appeal
			, New_FundAccount
			, New_InstitutionalHierarchy
			, New_ConstituentDonor
			, New_OrganizationDonor
			, New_Opportunity
			, New_BalanceDue
			, New_InstallmentAmount
			, New_TotalPaid
			, Plus_RecurringGiftRules
			, New_PledgeNumber
			, StatusCode
			, Lds_ExpectancyType
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_PledgeBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.New_BeginDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.New_EndDate) = C.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim D ON YEAR(A.Plus_InstallmentDate) = D.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim E ON YEAR(A.New_SignatureDate) = E.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim F ON YEAR(A.New_NotificationDate) = F.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim G ON YEAR(A.Plus_FundingDate) = G.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim H ON YEAR(A.Plus_EstimatedMaturityDate) = H.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim I ON YEAR(A.Plus_PaymentStartDate) = I.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_PostalCodeBase (Ext_Postal)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_PostalCodeBase' -- Source_Table
		, 'Oa_Extract.New_PostalCodeBase' -- Destination_Table
		, 'Ext_Postal' -- Ext_Table
		, 'New_PostalcodeId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_PostalcodeId
			, New_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_PostalcodeId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'New_PostalcodeId
			, New_Name
			' -- Ext_Insert_Fields
		, 'New_PostalcodeId
			, New_Name
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_PostalCodeBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_ProfessionalSuffixBase (Ext_Professional_Suffix)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_ProfessionalSuffixBase' -- Source_Table
		, 'Oa_Extract.New_ProfessionalSuffixBase' -- Destination_Table
		, 'Ext_Professional_Suffix' -- Ext_Table
		, 'New_ProfessionalSuffixId UNIQUEIDENTIFIER
			, New_ProfessionalSuffix NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_ProfessionalSuffixId
			, New_ProfessionalSuffix
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_ProfessionalSuffixId UNIQUEIDENTIFIER
			, New_ProfessionalSuffix NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'New_ProfessionalSuffixId
			, New_ProfessionalSuffix
			' -- Ext_Insert_Fields
		, 'New_ProfessionalSuffixId
			, New_ProfessionalSuffix
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_ProfessionalSuffixBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_RecognitionAssociationBase (Ext_Recognition_Association)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_RecognitionAssociationBase' -- Source_Table
		, 'Oa_Extract.New_RecognitionAssociationBase' -- Destination_Table
		, 'Ext_Recognition_Association' -- Ext_Table
		, 'New_RecognitionAssociationId UNIQUEIDENTIFIER
			, New_Constituent UNIQUEIDENTIFIER
			, New_EndDate DATETIME
			, New_StartDate DATETIME
			, Plus_ScholarshipOfferedAmount MONEY
			, Plus_ScholarshipAwardTerm NVARCHAR(15)
			, Plus_ScholarshipGrantingOffice NVARCHAR(25)
			, Plus_ScholarshipAwardDate DATETIME
			, Plus_ScholarshipCode NVARCHAR(100)
			, New_Recognition UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'New_RecognitionAssociationId
			, New_Constituent
			, New_EndDate
			, New_StartDate
			, Plus_ScholarshipOfferedAmount
			, Plus_ScholarshipAwardTerm
			, Plus_ScholarshipGrantingOffice
			, Plus_ScholarshipAwardDate
			, Plus_ScholarshipCode
			, New_Recognition
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_RecognitionAssociationId UNIQUEIDENTIFIER
			, New_Constituent UNIQUEIDENTIFIER
			, New_EndDate DATETIME
			, New_StartDate DATETIME
			, Plus_ScholarshipOfferedAmount MONEY
			, Plus_ScholarshipAwardTerm NVARCHAR(15)
			, Plus_ScholarshipGrantingOffice NVARCHAR(25)
			, Plus_ScholarshipAwardDate DATETIME
			, Plus_ScholarshipCode NVARCHAR(100)
			, New_Recognition UNIQUEIDENTIFIER
			' -- Ext_Create_Fields
		, 'New_RecognitionAssociationId
			, New_Constituent
			, New_EndDate
			, New_StartDate
			, Plus_ScholarshipOfferedAmount
			, Plus_ScholarshipAwardTerm
			, Plus_ScholarshipGrantingOffice
			, Plus_ScholarshipAwardDate
			, Plus_ScholarshipCode
			, New_Recognition
			' -- Ext_Insert_Fields
		, 'New_RecognitionAssociationId
			, New_Constituent
			, CASE WHEN DATENAME(dy,A.New_EndDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_EndDate)
					ELSE DATEADD(hh,-7,A.New_EndDate) END AS New_EndDate
			, CASE WHEN DATENAME(dy,A.New_StartDate) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_StartDate)
					ELSE DATEADD(hh,-7,A.New_StartDate) END AS New_StartDate
			, Plus_ScholarshipOfferedAmount
			, Plus_ScholarshipAwardTerm
			, Plus_ScholarshipGrantingOffice
			, CASE WHEN DATENAME(dy,A.Plus_ScholarshipAwardDate) BETWEEN D.Mdt_Begin_Date_Number AND D.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_ScholarshipAwardDate)
					ELSE DATEADD(hh,-7,A.Plus_ScholarshipAwardDate) END AS Plus_ScholarshipAwardDate
			, Plus_ScholarshipCode
			, New_Recognition
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_RecognitionAssociationBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.New_EndDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.New_StartDate) = C.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim D ON YEAR(A.Plus_ScholarshipAwardDate) = D.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_RecognitionBase (Ext_Recognition)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_RecognitionBase' -- Source_Table
		, 'Oa_Extract.New_RecognitionBase' -- Destination_Table
		, 'Ext_Recognition' -- Ext_Table
		, 'New_RecognitionId UNIQUEIDENTIFIER
			, StateCode INT
			, StatusCode INT
			, New_EndDate DATETIME
			, New_ShortName NVARCHAR(100)
			, New_InstitutionId UNIQUEIDENTIFIER
			, New_Description NVARCHAR(MAX)
			, New_Affiliate INT
			, New_AssociationId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, New_StartDate DATETIME
			, New_Type INT
			' -- Dest_Create_Fields
		, 'New_RecognitionId
			, StateCode
			, StatusCode
			, New_EndDate
			, New_ShortName
			, New_InstitutionId
			, New_Description
			, New_Affiliate
			, New_AssociationId
			, New_Name
			, New_StartDate
			, New_Type
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_RecognitionId UNIQUEIDENTIFIER
			, StateCode INT
			, StatusCode INT
			, New_EndDate DATETIME
			, New_ShortName NVARCHAR(100)
			, New_InstitutionId UNIQUEIDENTIFIER
			, New_Description NVARCHAR(500)
			, New_Affiliate INT
			, New_AssociationId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, New_StartDate DATETIME
			, New_Type INT
			' -- Ext_Create_Fields
		, 'New_RecognitionId
			, StateCode
			, StatusCode
			, New_EndDate
			, New_ShortName
			, New_InstitutionId
			, New_Description
			, New_Affiliate
			, New_AssociationId
			, New_Name
			, New_StartDate
			, New_Type
			' -- Ext_Insert_Fields
		, 'New_RecognitionId
			, StateCode
			, StatusCode
			, CASE WHEN DATENAME(dy,A.New_EndDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_EndDate)
					ELSE DATEADD(hh,-7,A.New_EndDate) END AS New_EndDate
			, New_ShortName
			, New_InstitutionId
			, CONVERT(NVARCHAR(500),SUBSTRING(New_Description,1,500)) AS New_Description			
			, New_Affiliate
			, New_AssociationId
			, New_Name
			, CASE WHEN DATENAME(dy,A.New_StartDate) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_StartDate)
					ELSE DATEADD(hh,-7,A.New_StartDate) END AS New_StartDate
			, New_Type
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_RecognitionBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.New_EndDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.New_StartDate) = C.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_RecognitionCreditBase (Ext_Recognition_Credit)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_RecognitionCreditBase' -- Source_Table
		, 'Oa_Extract.New_RecognitionCreditBase' -- Destination_Table
		, 'Ext_Recognition_Credit' -- Ext_Table
		, 'New_RecognitionCreditId UNIQUEIDENTIFIER
			, New_RelatedConstituent UNIQUEIDENTIFIER
			, New_OrganizationId UNIQUEIDENTIFIER
			, New_RelatedGift UNIQUEIDENTIFIER
			, New_CreditAmount MONEY
			, Plus_Type INT
			, Plus_OriginatingConstituent UNIQUEIDENTIFIER
			, Plus_SubType INT
			, New_ReceiptDate DATETIME
			, Plus_InstitutionalHieararchy UNIQUEIDENTIFIER
			, StatusCode INT
			' -- Dest_Create_Fields
		, 'New_RecognitionCreditId
			, New_RelatedConstituent
			, New_OrganizationId
			, New_RelatedGift
			, New_CreditAmount
			, Plus_Type
			, Plus_OriginatingConstituent
			, Plus_SubType
			, New_ReceiptDate
			, Plus_InstitutionalHieararchy
			, StatusCode
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_RecognitionCreditId UNIQUEIDENTIFIER
			, New_RelatedConstituent UNIQUEIDENTIFIER
			, New_OrganizationId UNIQUEIDENTIFIER
			, New_RelatedGift UNIQUEIDENTIFIER
			, New_CreditAmount MONEY
			, Plus_Type INT
			, Plus_OriginatingConstituent UNIQUEIDENTIFIER
			, Plus_SubType INT
			, New_ReceiptDate DATETIME
			, Plus_InstitutionalHieararchy UNIQUEIDENTIFIER
			, StatusCode INT
			' -- Ext_Create_Fields
		, 'New_RecognitionCreditId
			, New_RelatedConstituent
			, New_OrganizationId
			, New_RelatedGift
			, New_CreditAmount
			, Plus_Type
			, Plus_OriginatingConstituent
			, Plus_SubType
			, New_ReceiptDate
			, Plus_InstitutionalHieararchy
			, StatusCode
			' -- Ext_Insert_Fields
		, 'New_RecognitionCreditId
			, New_RelatedConstituent
			, New_OrganizationId
			, New_RelatedGift
			, New_CreditAmount
			, Plus_Type
			, Plus_OriginatingConstituent
			, CASE WHEN Plus_SubType IS NULL THEN 100000003 ELSE Plus_SubType END AS Plus_SubType
			, CASE WHEN DATENAME(dy,A.New_ReceiptDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_ReceiptDate)
					ELSE DATEADD(hh,-7,A.New_ReceiptDate) END AS New_ReceiptDate
			, Plus_InstitutionalHieararchy
			, StatusCode
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_RecognitionCreditBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.New_ReceiptDate) = B.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL	
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- New_SourceBase (Ext_Source)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_SourceBase' -- Source_Table
		, 'Oa_Extract.New_SourceBase' -- Destination_Table
		, 'Ext_Source' -- Ext_Table
		, 'New_SourceId UNIQUEIDENTIFIER
			, New_Source NVARCHAR(100)
			, New_LongDescription NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_SourceId
			, New_Source
			, New_LongDescription
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_SourceId UNIQUEIDENTIFIER
			, New_Source NVARCHAR(100)
			, New_LongDescription NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'New_SourceId
			, New_Source
			, New_LongDescription
			' -- Ext_Insert_Fields
		, 'New_SourceId
			, New_Source
			, New_LongDescription
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_SourceBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_StateBase (Ext_State)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_StateBase' -- Source_Table
		, 'Oa_Extract.New_StateBase' -- Destination_Table
		, 'Ext_State' -- Ext_Table
		, 'New_StateId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, Plus_Abbreviation NVARCHAR(50)
			' -- Dest_Create_Fields
		, 'New_StateId
			, New_Name
			, Plus_Abbreviation
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_StateId UNIQUEIDENTIFIER
			, New_Name NVARCHAR(100)
			, Plus_Abbreviation NVARCHAR(50)
			' -- Ext_Create_Fields
		, 'New_StateId
			, New_Name
			, Plus_Abbreviation
			' -- Ext_Insert_Fields
		, 'New_StateId
			, New_Name
			, Plus_Abbreviation
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_StateBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_StudentAttendanceBase (Ext_Student)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_StudentAttendanceBase' -- Source_Table
		, 'Oa_Extract.New_StudentAttendanceBase' -- Destination_Table
		, 'Ext_Student' -- Ext_Table
		, 'New_StudentAttendanceId UNIQUEIDENTIFIER
			, New_Term NVARCHAR(100)
			, New_Year NVARCHAR(100)
			, New_HoursCompleted INT
			, New_ExpectedGraduationDate DATETIME
			, Plus_Year NVARCHAR(10)
			, New_StudentsAttendanceId UNIQUEIDENTIFIER
			, New_Source UNIQUEIDENTIFIER
			, New_College UNIQUEIDENTIFIER
			, New_University UNIQUEIDENTIFIER
			, New_Major UNIQUEIDENTIFIER
			, Plus_Emphasis UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'New_StudentAttendanceId
			, New_Term
			, New_Year
			, New_HoursCompleted
			, New_ExpectedGraduationDate
			, Plus_Year
			, New_StudentsAttendanceId
			, New_Source
			, New_College
			, New_University
			, New_Major
			, Plus_Emphasis
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_StudentAttendanceId UNIQUEIDENTIFIER
			, New_Term NVARCHAR(100)
			, New_Year NVARCHAR(100)
			, New_HoursCompleted INT
			, New_ExpectedGraduationDate DATETIME
			, Plus_Year NVARCHAR(10)
			, New_StudentsAttendanceId UNIQUEIDENTIFIER
			, New_Source UNIQUEIDENTIFIER
			, New_College UNIQUEIDENTIFIER
			, New_University UNIQUEIDENTIFIER
			, New_Major UNIQUEIDENTIFIER
			, Plus_Emphasis UNIQUEIDENTIFIER
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			, Dash NVARCHAR(1) DEFAULT ''-''
			, N01 NVARCHAR(2) DEFAULT ''01''
			, N04 NVARCHAR(2) DEFAULT ''04''
			, N06 NVARCHAR(2) DEFAULT ''06''
			, N09 NVARCHAR(2) DEFAULT ''09''
			, Fall NVARCHAR(10) DEFAULT ''Fall''
			, Winter NVARCHAR(10) DEFAULT ''Winter''
			, Spring NVARCHAR(10) DEFAULT ''Spring''
			, Summer NVARCHAR(10) DEFAULT ''Summer''
			, Byu NVARCHAR(5) DEFAULT ''BYU''
			, Byui NVARCHAR(5) DEFAULT ''BYUI''
			, Byuh NVARCHAR(5) DEFAULT ''BYUH''
			, Ldsbc NVARCHAR(5) DEFAULT ''LDSBC''
			, N1 NVARCHAR(1) DEFAULT ''1''
			, N2 NVARCHAR(1) DEFAULT ''2''
			, Fall_Percent NVARCHAR(10) DEFAULT ''Fall%''
			, Winter_Percent NVARCHAR(10) DEFAULT ''Winter%''
			, Spring_Percent NVARCHAR(10) DEFAULT ''Spring%''
			, Summer_Percent NVARCHAR(10) DEFAULT ''Summer%''
			, Slash_1_Slash NVARCHAR(3) DEFAULT ''/1/''
			' -- Ext_Create_Fields
		, 'New_StudentAttendanceId
			, New_Term
			, New_Year
			, New_HoursCompleted
			, New_ExpectedGraduationDate
			, Plus_Year
			, New_StudentsAttendanceId
			, New_Source
			, New_College
			, New_University
			, New_Major
			, Plus_Emphasis
			' -- Ext_Insert_Fields
		, 'New_StudentAttendanceId
			, New_Term
			, New_Year
			, New_HoursCompleted
			, CASE WHEN DATENAME(dy,A.New_ExpectedGraduationDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.New_ExpectedGraduationDate)
					ELSE DATEADD(hh,-7,A.New_ExpectedGraduationDate) END AS New_ExpectedGraduationDate
			, Plus_Year
			, New_StudentsAttendanceId
			, New_Source
			, New_College
			, New_University
			, New_Major
			, Plus_Emphasis
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_StudentAttendanceBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.New_ExpectedGraduationDate) = B.Date_Year
			' -- Ext_From_Statement
		, 'CREATE NONCLUSTERED INDEX IX_Ext_Student_1 
					ON Ext_Student(Plus_Year)
					INCLUDE (
					New_StudentsAttendanceId
					, New_University
					); 
			UPDATE STATISTICS dbo.Ext_Student
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- New_TitleBase (Ext_Title)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_TitleBase' -- Source_Table
		, 'Oa_Extract.New_TitleBase' -- Destination_Table
		, 'Ext_Title' -- Ext_Table
		, 'New_TitleId UNIQUEIDENTIFIER
			, New_Title NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_TitleId
			, New_Title
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_TitleId UNIQUEIDENTIFIER
			, New_Title NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'New_TitleId
			, New_Title
			' -- Ext_Insert_Fields
		, 'New_TitleId
			, New_Title
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_TitleBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- New_UniversityBase (Ext_University)
-- --------------------------
	( 1 -- Tier
		, 'dbo.New_UniversityBase' -- Source_Table
		, 'Oa_Extract.New_UniversityBase' -- Destination_Table
		, 'Ext_University' -- Ext_Table
		, 'New_UniversityId UNIQUEIDENTIFIER
			, New_University NVARCHAR(100)
			, New_UniversityCode NVARCHAR(10)
			, Plus_UniversityAcronym NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'New_UniversityId
			, New_University
			, New_UniversityCode
			, Plus_UniversityAcronym
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_UniversityId UNIQUEIDENTIFIER
			, New_University NVARCHAR(100)
			, New_UniversityCode NVARCHAR(10)
			, Plus_UniversityAcronym NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'New_UniversityId
			, New_University
			, New_UniversityCode
			, Plus_UniversityAcronym
			' -- Ext_Insert_Fields
		, 'New_UniversityId
			, New_University
			, New_UniversityCode
			, Plus_UniversityAcronym
			' -- Ext_Select_Statement
		, 'Oa_Extract.New_UniversityBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- OpportunityBase (Ext_Opportunity)
-- --------------------------
	( 1 -- Tier
		, 'dbo.OpportunityBase' -- Source_Table
		, 'Oa_Extract.OpportunityBase' -- Destination_Table
		, 'Ext_Opportunity' -- Ext_Table
		, 'OpportunityId UNIQUEIDENTIFIER
			, Plus_TotalAskAmount MONEY
			, Plus_TotalCommittedAmount MONEY
			, Plus_TotalGiven MONEY
			, Name NVARCHAR(300)
			, StepName NVARCHAR(200)
			, StateCode INT
			, StatusCode INT
			, CustomerId UNIQUEIDENTIFIER
			, CustomerIdType INT
			, Plus_ProposalStatus INT
			, Plus_ProposalDate DATETIME
			, Plus_TargetedCommitment DATETIME
			, Plus_CommittedDate DATETIME
			, Plus_FundAccount UNIQUEIDENTIFIER
			, Plus_CultivationProcessStage1Date DATETIME
			, Plus_CultivationProcessStage2Date DATETIME
			, Plus_CultivationProcessStage3Date DATETIME
			, Plus_CultivationProcessStage4Date DATETIME
			, Plus_GiftNoticeCreatedOn DATETIME
			, Plus_ProposalStatusChangeDate DATETIME
			, Plus_NewAccount BIT
			, Plus_CoordinatingLiaisonId UNIQUEIDENTIFIER
			, OwnerId UNIQUEIDENTIFIER
			, Lds_PrimaryInitiative BIT
			, Plus_ParentInitiative UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'OpportunityId
			, Plus_TotalAskAmount
			, Plus_TotalCommittedAmount
			, Plus_TotalGiven
			, Name
			, StepName
			, StateCode
			, StatusCode
			, CustomerId
			, CustomerIdType
			, Plus_ProposalStatus
			, Plus_ProposalDate
			, Plus_TargetedCommitment
			, Plus_CommittedDate
			, Plus_FundAccount
			, Plus_CultivationProcessStage1Date
			, Plus_CultivationProcessStage2Date
			, Plus_CultivationProcessStage3Date
			, Plus_CultivationProcessStage4Date
			, Plus_GiftNoticeCreatedOn
			, Plus_ProposalStatusChangeDate
			, Plus_NewAccount
			, Plus_CoordinatingLiaisonId
			, OwnerId
			, Lds_PrimaryInitiative
			, Plus_ParentInitiative
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'OpportunityId UNIQUEIDENTIFIER
			, Plus_TotalAskAmount MONEY
			, Plus_TotalCommittedAmount MONEY
			, Plus_TotalGiven MONEY
			, Name NVARCHAR(300)
			, StepName NVARCHAR(200)
			, StateCode INT
			, StatusCode INT
			, CustomerId UNIQUEIDENTIFIER
			, CustomerIdType INT
			, Plus_ProposalStatus INT
			, Plus_ProposalDate DATETIME
			, Plus_TargetedCommitment DATETIME
			, Plus_CommittedDate DATETIME
			, Plus_FundAccount UNIQUEIDENTIFIER
			, Plus_CultivationProcessStage1Date DATETIME
			, Plus_CultivationProcessStage2Date DATETIME
			, Plus_CultivationProcessStage3Date DATETIME
			, Plus_CultivationProcessStage4Date DATETIME
			, Plus_GiftNoticeCreatedOn DATETIME
			, Plus_ProposalStatusChangeDate DATETIME
			, Plus_NewAccount BIT
			, Plus_CoordinatingLiaisonId UNIQUEIDENTIFIER
			, OwnerId UNIQUEIDENTIFIER
			, Lds_PrimaryInitiative BIT
			, Plus_ParentInitiative UNIQUEIDENTIFIER
			, Zero NVARCHAR(1) DEFAULT ''0''
			, Posted NVARCHAR(10) DEFAULT ''Posted''
			, Y NVARCHAR(1) DEFAULT ''Y''
			' -- Ext_Create_Fields
		, 'OpportunityId
			, Plus_TotalAskAmount
			, Plus_TotalCommittedAmount
			, Plus_TotalGiven
			, Name
			, StepName
			, StateCode
			, StatusCode
			, CustomerId
			, CustomerIdType
			, Plus_ProposalStatus
			, Plus_ProposalDate
			, Plus_TargetedCommitment
			, Plus_CommittedDate
			, Plus_FundAccount
			, Plus_CultivationProcessStage1Date
			, Plus_CultivationProcessStage2Date
			, Plus_CultivationProcessStage3Date
			, Plus_CultivationProcessStage4Date
			, Plus_GiftNoticeCreatedOn
			, Plus_ProposalStatusChangeDate
			, Plus_NewAccount
			, Plus_CoordinatingLiaisonId
			, OwnerId
			, Lds_PrimaryInitiative
			, Plus_ParentInitiative
			' -- Ext_Insert_Fields
		, 'OpportunityId
			, Plus_TotalAskAmount
			, Plus_TotalCommittedAmount
			, Plus_TotalGiven
			, Name
			, StepName
			, StateCode
			, StatusCode
			, CustomerId
			, CustomerIdType
			, Plus_ProposalStatus
			, CASE WHEN DATENAME(dy,A.Plus_ProposalDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_ProposalDate)
					ELSE DATEADD(hh,-7,A.Plus_ProposalDate) END AS Plus_ProposalDate
			, CASE WHEN DATENAME(dy,A.Plus_TargetedCommitment) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_TargetedCommitment)
					ELSE DATEADD(hh,-7,A.Plus_TargetedCommitment) END AS Plus_TargetedCommitment
			, CASE WHEN DATENAME(dy,A.Plus_CommittedDate) BETWEEN D.Mdt_Begin_Date_Number AND D.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_CommittedDate)
					ELSE DATEADD(hh,-7,A.Plus_CommittedDate) END AS Plus_CommittedDate
			, Plus_FundAccount
			, CASE WHEN DATENAME(dy,A.Plus_CultivationProcessStage1Date) BETWEEN E.Mdt_Begin_Date_Number AND E.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_CultivationProcessStage1Date)
					ELSE DATEADD(hh,-7,A.Plus_CultivationProcessStage1Date) END AS Plus_CultivationProcessStage1Date
			, CASE WHEN DATENAME(dy,A.Plus_CultivationProcessStage2Date) BETWEEN F.Mdt_Begin_Date_Number AND F.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_CultivationProcessStage2Date)
					ELSE DATEADD(hh,-7,A.Plus_CultivationProcessStage2Date) END AS Plus_CultivationProcessStage2Date
			, CASE WHEN DATENAME(dy,A.Plus_CultivationProcessStage3Date) BETWEEN G.Mdt_Begin_Date_Number AND G.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_CultivationProcessStage3Date)
					ELSE DATEADD(hh,-7,A.Plus_CultivationProcessStage3Date) END AS Plus_CultivationProcessStage3Date
			, CASE WHEN DATENAME(dy,A.Plus_CultivationProcessStage4Date) BETWEEN H.Mdt_Begin_Date_Number AND H.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_CultivationProcessStage4Date)
					ELSE DATEADD(hh,-7,A.Plus_CultivationProcessStage4Date) END AS Plus_CultivationProcessStage4Date
			, CASE WHEN DATENAME(dy,A.Plus_GiftNoticeCreatedOn) BETWEEN I.Mdt_Begin_Date_Number AND I.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_GiftNoticeCreatedOn)
					ELSE DATEADD(hh,-7,A.Plus_GiftNoticeCreatedOn) END AS Plus_GiftNoticeCreatedOn
			, CASE WHEN DATENAME(dy,A.Plus_ProposalStatusChangeDate) BETWEEN J.Mdt_Begin_Date_Number AND J.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_ProposalStatusChangeDate)
					ELSE DATEADD(hh,-7,A.Plus_ProposalStatusChangeDate) END AS Plus_ProposalStatusChangeDate
			, Plus_NewAccount
			, Plus_CoordinatingLiaisonId
			, OwnerId
			, Lds_PrimaryInitiative
			, Plus_ParentInitiative
			' -- Ext_Select_Statement
		, 'Oa_Extract.OpportunityBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.Plus_ProposalDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.Plus_TargetedCommitment) = C.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim D ON YEAR(A.Plus_CommittedDate) = D.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim E ON YEAR(A.Plus_CultivationProcessStage1Date) = E.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim F ON YEAR(A.Plus_CultivationProcessStage2Date) = F.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim G ON YEAR(A.Plus_CultivationProcessStage3Date) = G.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim H ON YEAR(A.Plus_CultivationProcessStage4Date) = H.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim I ON YEAR(A.Plus_GiftNoticeCreatedOn) = I.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim J ON YEAR(A.Plus_ProposalStatusChangeDate) = J.Date_Year				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- Plus_AddressFormatBase (Ext_Address_Format)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Plus_AddressFormatBase' -- Source_Table
		, 'Oa_Extract.Plus_AddressFormatBase' -- Destination_Table
		, 'Ext_Address_Format' -- Ext_Table
		, 'Plus_AddressFormatId UNIQUEIDENTIFIER
			, New_UseStateAbreviation BIT
			' -- Dest_Create_Fields
		, 'Plus_AddressFormatId
			, New_UseStateAbreviation
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Plus_AddressFormatId UNIQUEIDENTIFIER
			, New_UseStateAbreviation BIT
			' -- Ext_Create_Fields
		, 'Plus_AddressFormatId
			, New_UseStateAbreviation
			' -- Ext_Insert_Fields
		, 'Plus_AddressFormatId
			, New_UseStateAbreviation
			' -- Ext_Select_Statement
		, 'Oa_Extract.Plus_AddressFormatBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- Plus_AlumniBase (Ext_Alumni)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Plus_AlumniBase' -- Source_Table
		, 'Oa_Extract.Plus_AlumniBase' -- Destination_Table
		, 'Ext_Alumni' -- Ext_Table
		, 'Plus_AlumniId UNIQUEIDENTIFIER
			, Plus_Name NVARCHAR(100)
			, Plus_ActualGraduationDate DATETIME
			, Plus_AlumniStatus INT
			, Plus_DgId INT
			, Plus_HoursCredits NVARCHAR(100)
			, Plus_PreferredGraduationDate DATETIME
			, Plus_Constituent UNIQUEIDENTIFIER
			, Plus_College UNIQUEIDENTIFIER
			, Plus_Degree UNIQUEIDENTIFIER
			, Plus_University UNIQUEIDENTIFIER
			, Plus_Source UNIQUEIDENTIFIER
			, Plus_Program UNIQUEIDENTIFIER
			, Plus_Emphasis UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'Plus_AlumniId 
			, Plus_Name
			, Plus_ActualGraduationDate
			, Plus_AlumniStatus
			, Plus_DgId
			, Plus_HoursCredits
			, Plus_PreferredGraduationDate
			, Plus_Constituent
			, Plus_College
			, Plus_Degree
			, Plus_University
			, Plus_Source
			, Plus_Program
			, Plus_Emphasis
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Plus_AlumniId UNIQUEIDENTIFIER
			, Plus_Name NVARCHAR(100)
			, Plus_ActualGraduationDate DATETIME
			, Plus_AlumniStatus INT
			, Plus_DgId INT
			, Plus_HoursCredits NVARCHAR(100)
			, Plus_PreferredGraduationDate DATETIME
			, Plus_Constituent UNIQUEIDENTIFIER
			, Plus_College UNIQUEIDENTIFIER
			, Plus_Degree UNIQUEIDENTIFIER
			, Plus_University UNIQUEIDENTIFIER
			, Plus_Source UNIQUEIDENTIFIER
			, Plus_Program UNIQUEIDENTIFIER
			, Plus_Emphasis UNIQUEIDENTIFIER
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			, Byu NVARCHAR(5) DEFAULT ''BYU''
			, Byui NVARCHAR(5) DEFAULT ''BYUI''
			, Byuh NVARCHAR(5) DEFAULT ''BYUH''
			, Ldsbc NVARCHAR(5) DEFAULT ''LDSBC''
			, Byu_Code NVARCHAR(50) DEFAULT ''4229C3E3-2A45-4CD9-AD1E-AED5844676B0''
			, Business_School_Code NVARCHAR(50) DEFAULT ''97CA0DC5-4B98-476B-B85D-32A65CF46CD0''
			, Business_Code NVARCHAR(50) DEFAULT ''9F5570ED-4C24-48D1-A1A9-7D8AD4EBBF''
			' -- Ext_Create_Fields
		, 'Plus_AlumniId 
			, Plus_Name
			, Plus_ActualGraduationDate
			, Plus_AlumniStatus
			, Plus_DgId
			, Plus_HoursCredits
			, Plus_PreferredGraduationDate
			, Plus_Constituent
			, Plus_College
			, Plus_Degree
			, Plus_University
			, Plus_Source
			, Plus_Program
			, Plus_Emphasis
			' -- Ext_Insert_Fields
		, 'Plus_AlumniId 
			, Plus_Name
			, CASE WHEN DATENAME(dy,A.Plus_ActualGraduationDate) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_ActualGraduationDate)
					ELSE DATEADD(hh,-7,A.Plus_ActualGraduationDate) END AS Plus_ActualGraduationDate
			, Plus_AlumniStatus
			, Plus_DgId
			, Plus_HoursCredits
			, CASE WHEN DATENAME(dy,A.Plus_PreferredGraduationDate) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_PreferredGraduationDate)
					ELSE DATEADD(hh,-7,A.Plus_PreferredGraduationDate) END AS Plus_PreferredGraduationDate
			, Plus_Constituent
			, Plus_College
			, Plus_Degree
			, Plus_University
			, Plus_Source
			, Plus_Program
			, Plus_Emphasis
			' -- Ext_Select_Statement
		, 'Oa_Extract.Plus_AlumniBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.Plus_ActualGraduationDate) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.Plus_PreferredGraduationDate) = C.Date_Year
			' -- Ext_From_Statement
		, 'CREATE NONCLUSTERED INDEX IX_Plus_Name 
				ON Ext_Alumni(Plus_Name ASC)
				INCLUDE (
				Plus_Constituent
				, Plus_ActualGraduationDate
				);
			UPDATE STATISTICS dbo.Ext_Alumni 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- Plus_ConstituentNoteBase (Ext_Constituent_Note)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Plus_ConstituentNoteBase' -- Source_Table
		, 'Oa_Extract.Plus_ConstituentNoteBase' -- Destination_Table
		, 'Ext_Constituent_Note' -- Ext_Table
		, 'Plus_ConstituentNoteId UNIQUEIDENTIFIER
			, Plus_RelatedConstituent UNIQUEIDENTIFIER
			, Plus_RelatedOrganization UNIQUEIDENTIFIER
			, Plus_Type INT
			, Plus_ReasonForDrop INT
			, Plus_CoordinatingLiaisonNeeded BIT
			, Plus_Subject NVARCHAR(200)
			, Plus_Date DATETIME
			, Plus_Note NVARCHAR(MAX)
			, CreatedOn DATETIME
			, CreatedBy UNIQUEIDENTIFIER
			, ModifiedOn DATETIME
			, ModifiedBy UNIQUEIDENTIFIER
		' -- Dest_Create_Fields
		, 'Plus_ConstituentNoteId
			, Plus_RelatedConstituent
			, Plus_RelatedOrganization
			, Plus_Type
			, Plus_ReasonForDrop
			, Plus_CoordinatingLiaisonNeeded
			, Plus_Subject
			, Plus_Date
			, Plus_Note
			, CreatedOn
			, CreatedBy
			, ModifiedOn
			, ModifiedBy
		' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Plus_ConstituentNoteId UNIQUEIDENTIFIER
			, Plus_RelatedConstituent UNIQUEIDENTIFIER
			, Plus_RelatedOrganization UNIQUEIDENTIFIER
			, Plus_Type INT
			, Plus_ReasonForDrop INT
			, Plus_CoordinatingLiaisonNeeded INT
			, Plus_Subject NVARCHAR(200)
			, Plus_Date DATETIME
			, Plus_Note NVARCHAR(4000)
			, CreatedOn DATETIME
			, CreatedBy UNIQUEIDENTIFIER
			, ModifiedOn DATETIME
			, ModifiedBy UNIQUEIDENTIFIER
		' -- Ext_Create_Fields
		, 'Plus_ConstituentNoteId
			, Plus_RelatedConstituent
			, Plus_RelatedOrganization
			, Plus_Type
			, Plus_ReasonForDrop
			, Plus_CoordinatingLiaisonNeeded
			, Plus_Subject
			, Plus_Date
			, Plus_Note
			, CreatedOn
			, CreatedBy
			, ModifiedOn
			, ModifiedBy
		' -- Ext_Insert_Fields
		, 'Plus_ConstituentNoteId
			, Plus_RelatedConstituent
			, Plus_RelatedOrganization
			, Plus_Type
			, Plus_ReasonForDrop
			, CONVERT(INT,Plus_CoordinatingLiaisonNeeded) AS Plus_CoordinatingLiaisonNeeded
			, Plus_Subject
			, CASE WHEN DATENAME(dy,A.Plus_Date) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_Date)
					ELSE DATEADD(hh,-7,A.Plus_Date) END AS Plus_Date
			, CONVERT(NVARCHAR(4000),SUBSTRING(Plus_Note,1,4000)) AS Plus_Note
			, CASE WHEN DATENAME(dy,A.CreatedOn) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.CreatedOn)
					ELSE DATEADD(hh,-7,A.CreatedOn) END AS CreatedOn
			, CreatedBy
			, CASE WHEN DATENAME(dy,A.ModifiedOn) BETWEEN D.Mdt_Begin_Date_Number AND D.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ModifiedOn)
					ELSE DATEADD(hh,-7,A.ModifiedOn) END AS ModifiedOn
			, ModifiedBy
			' -- Ext_Select_Statement
		, 'Oa_Extract.Plus_ConstituentNoteBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.Plus_Date) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.CreatedOn) = C.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim D ON YEAR(A.ModifiedOn) = D.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- Plus_EnvelopeNamesAndSalutationsBase (Ext_Envelope_Names_And_Salutations)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Plus_EnvelopeNamesAndSalutationsBase' -- Source_Table
		, 'Oa_Extract.Plus_EnvelopeNamesAndSalutationsBase' -- Destination_Table
		, 'Ext_Envelope_Names_And_Salutations' -- Ext_Table
		, 'Plus_Etiquette INT
			, Plus_EnvelopeSalutationConstituent UNIQUEIDENTIFIER
			, Plus_SalutationEnvelopeName NVARCHAR(300)
			, Plus_Household INT
			, StateCode INT
			, Plus_NameType INT
			, Plus_EnvelopeNamesAndSalutationsId UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'Plus_Etiquette
			, Plus_EnvelopeSalutationConstituent
			, Plus_SalutationEnvelopeName
			, Plus_Household
			, StateCode
			, Plus_NameType
			, Plus_EnvelopeNamesAndSalutationsId
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Plus_Etiquette INT
			, Plus_EnvelopeSalutationConstituent UNIQUEIDENTIFIER
			, Plus_SalutationEnvelopeName NVARCHAR(300)
			, Plus_Household INT
			, StateCode INT
			, Plus_NameType INT
			, Plus_EnvelopeNamesAndSalutationsId UNIQUEIDENTIFIER
			' -- Ext_Create_Fields
		, 'Plus_Etiquette
			, Plus_EnvelopeSalutationConstituent
			, Plus_SalutationEnvelopeName
			, Plus_Household
			, StateCode
			, Plus_NameType
			, Plus_EnvelopeNamesAndSalutationsId
			' -- Ext_Insert_Fields
		, 'Plus_Etiquette
			, Plus_EnvelopeSalutationConstituent
			, Plus_SalutationEnvelopeName
			, Plus_Household
			, StateCode
			, Plus_NameType
			, Plus_EnvelopeNamesAndSalutationsId
			' -- Ext_Select_Statement
		, 'Oa_Extract.Plus_EnvelopeNamesAndSalutationsBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- Plus_InterestBase (Ext_Interest)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Plus_InterestBase' -- Source_Table
		, 'Oa_Extract.Plus_InterestBase' -- Destination_Table
		, 'Ext_Interest' -- Ext_Table
		, 'Plus_InterestId UNIQUEIDENTIFIER
			, Plus_Name NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Plus_InterestId
			, Plus_Name
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Plus_InterestId UNIQUEIDENTIFIER
			, Plus_Name NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'Plus_InterestId
			, Plus_Name
			' -- Ext_Insert_Fields
		, 'Plus_InterestId
			, Plus_Name
			' -- Ext_Select_Statement
		, 'Oa_Extract.Plus_InterestBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- Plus_LegacyM11Base (Ext_Plus_LegacyM11Base)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Plus_LegacyM11Base' -- Source_Table
		, 'Oa_Extract.Plus_LegacyM11Base' -- Destination_Table
		, 'Ext_Plus_LegacyM11Base' -- Ext_Table
		, 'ActivityId UNIQUEIDENTIFIER
			, Plus_Source UNIQUEIDENTIFIER
			, Plus_M11ActivityType INT
			, Plus_M11MessageType INT
			' -- Dest_Create_Fields
		, 'ActivityId
			, Plus_Source
			, Plus_M11ActivityType
			, Plus_M11MessageType
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ActivityId UNIQUEIDENTIFIER
			, Plus_Source UNIQUEIDENTIFIER
			, Plus_M11ActivityType INT
			, Plus_M11MessageType INT
			' -- Ext_Create_Fields
		, 'ActivityId
			, Plus_Source
			, Plus_M11ActivityType
			, Plus_M11MessageType
			' -- Ext_Insert_Fields
		, 'ActivityId
			, Plus_Source
			, Plus_M11ActivityType
			, Plus_M11MessageType
			' -- Ext_Select_Statement
		, 'Oa_Extract.Plus_LegacyM11Base
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- Plus_LegacyPsaCodeBase (Ext_Psa)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Plus_LegacyPsaCodeBase' -- Source_Table
		, 'Oa_Extract.Plus_LegacyPsaCodeBase' -- Destination_Table
		, 'Ext_Psa' -- Ext_Table
		, 'Plus_Constituent UNIQUEIDENTIFIER
			, Plus_LegacyPsaCodeId UNIQUEIDENTIFIER
			, Plus_PsaCode NVARCHAR(100)
			, Plus_EffectiveFrom DATETIME
			, Plus_EffectiveTo DATETIME
			, Plus_Source NVARCHAR(10)
			, CreatedOn DATETIME
			, ModifiedOn DATETIME
			, Plus_Category NVARCHAR(100)
			, Plus_CodeDescription NVARCHAR(MAX)
			' -- Dest_Create_Fields
		, 'Plus_Constituent
			, Plus_LegacyPsaCodeId
			, Plus_PsaCode
			, Plus_EffectiveFrom
			, Plus_EffectiveTo
			, Plus_Source
			, CreatedOn
			, ModifiedOn
			, Plus_Category
			, Plus_CodeDescription
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId UNIQUEIDENTIFIER
			, Psa_Key UNIQUEIDENTIFIER
			, Psa_Code NVARCHAR(50)
			, Psa_Eff_From DATETIME
			, Psa_Eff_Thru DATETIME
			, Psa_Act_Src NVARCHAR(100)
			, Psa_Entered_Dt DATETIME
			, Psa_Change_Dt DATETIME
			, Psa_Type NVARCHAR(100)
			, Psa_Text_Line NVARCHAR(500)
			, Y NVARCHAR(1) DEFAULT ''Y''
			, C2DL01 NVARCHAR(10) DEFAULT ''2DL01''
			, C2DL02 NVARCHAR(10) DEFAULT ''2DL02''
			, C2DL03 NVARCHAR(10) DEFAULT ''2DL03''
			, C2DL04 NVARCHAR(10) DEFAULT ''2DL04''
			, C2DL05 NVARCHAR(10) DEFAULT ''2DL05''
			, C2DL06 NVARCHAR(10) DEFAULT ''2DL06''
			, C1MV05 NVARCHAR(10) DEFAULT ''1MV05''
			, C1MV26 NVARCHAR(10) DEFAULT ''1MV26''
			, C1MV07 NVARCHAR(10) DEFAULT ''1MV07''
			, CJK003 NVARCHAR(10) DEFAULT ''JK003''
			, C6LS01 NVARCHAR(10) DEFAULT ''6LS01''
			, C1DC01 NVARCHAR(10) DEFAULT ''1DC01''
			, CFXMBR NVARCHAR(10) DEFAULT ''FXMBR''
			' -- Ext_Create_Fields
		, 'ContactId
			, Psa_Key
			, Psa_Code
			, Psa_Eff_From
			, Psa_Eff_Thru
			, Psa_Act_Src
			, Psa_Entered_Dt
			, Psa_Change_Dt
			, Psa_Type
			, Psa_Text_Line
			' -- Ext_Insert_Fields
		, 'DISTINCT Plus_Constituent AS ContactId 
			, Plus_LegacyPsaCodeId AS Psa_Key
			, CONVERT(NVARCHAR(50),SUBSTRING(Plus_PsaCode,1,50)) AS Psa_Code
			, CASE WHEN DATENAME(dy,A.Plus_EffectiveFrom) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_EffectiveFrom)
					ELSE DATEADD(hh,-7,A.Plus_EffectiveFrom) END AS Psa_Eff_From
			, CASE WHEN DATENAME(dy,A.Plus_EffectiveTo) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_EffectiveTo)
					ELSE DATEADD(hh,-7,A.Plus_EffectiveTo) END AS Psa_Eff_Thru
			, Plus_Source AS Psa_Act_Src
			, CASE WHEN DATENAME(dy,A.CreatedOn) BETWEEN D.Mdt_Begin_Date_Number AND D.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.CreatedOn)
					ELSE DATEADD(hh,-7,A.CreatedOn) END AS Psa_Entered_Dt
			, CASE WHEN DATENAME(dy,A.ModifiedOn) BETWEEN E.Mdt_Begin_Date_Number AND E.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.ModifiedOn)
					ELSE DATEADD(hh,-7,A.ModifiedOn) END AS Psa_Change_Dt
			, Plus_Category AS Psa_Type
			, CONVERT(NVARCHAR(500),SUBSTRING(Plus_CodeDescription,1,500)) AS Psa_Text_Line
			' -- Ext_Select_Statement
		, 'Oa_Extract.Plus_LegacyPsaCodeBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.Plus_EffectiveFrom) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.Plus_EffectiveTo) = C.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim D ON YEAR(A.CreatedOn) = D.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim E ON YEAR(A.ModifiedOn) = E.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- Plus_PayrollGroupBase (Ext_Payroll_Group)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Plus_PayrollGroupBase' -- Source_Table
		, 'Oa_Extract.Plus_PayrollGroupBase' -- Destination_Table
		, 'Ext_Payroll_Group' -- Ext_Table
		, 'Plus_PayrollGroupId UNIQUEIDENTIFIER
			, Plus_Name NVARCHAR(100)
			, Plus_Code NVARCHAR(100)
			' -- Dest_Create_Fields
		, 'Plus_PayrollGroupId
			, Plus_Name
			, Plus_Code
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Plus_PayrollGroupId UNIQUEIDENTIFIER
			, Plus_Name NVARCHAR(100)
			, Plus_Code NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'Plus_PayrollGroupId
			, Plus_Name
			, Plus_Code
			' -- Ext_Insert_Fields
		, 'Plus_PayrollGroupId
			, Plus_Name
			, Plus_Code
			' -- Ext_Select_Statement
		, 'Oa_Extract.Plus_PayrollGroupBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,	
-- --------------------------
-- Plus_RecurringGiftRulesBase (Ext_Recurring_Gift_Rules)
-- --------------------------
	( 1 -- Tier
		, 'dbo.Plus_RecurringGiftRulesBase' -- Source_Table
		, 'Oa_Extract.Plus_RecurringGiftRulesBase' -- Destination_Table
		, 'Ext_Recurring_Gift_Rules' -- Ext_Table
		, 'Plus_RecurringGiftRulesId UNIQUEIDENTIFIER
			, Plus_Constituent UNIQUEIDENTIFIER
			, Plus_FundAccount UNIQUEIDENTIFIER
			, Plus_InstitutionalHiearchy UNIQUEIDENTIFIER
			, Plus_CampaignAppeal UNIQUEIDENTIFIER
			, StatusCode INT
			, StateCode INT
			, Plus_Frequency INT
			, Plus_PaymentStart DATETIME
			, Plus_PaymentStop DATETIME
			, Plus_Amount MONEY
			, Plus_Group UNIQUEIDENTIFIER
			, Plus_Type INT
			, Plus_Organization UNIQUEIDENTIFIER
			, CreatedOn DATETIME
			' -- Dest_Create_Fields
		, 'Plus_RecurringGiftRulesId
			, Plus_Constituent
			, Plus_FundAccount
			, Plus_InstitutionalHiearchy
			, Plus_CampaignAppeal
			, StatusCode
			, StateCode
			, Plus_Frequency
			, Plus_PaymentStart
			, Plus_PaymentStop
			, Plus_Amount
			, Plus_Group
			, Plus_Type
			, Plus_Organization
			, CreatedOn
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Plus_RecurringGiftRulesId UNIQUEIDENTIFIER
			, Plus_Constituent UNIQUEIDENTIFIER
			, Plus_FundAccount UNIQUEIDENTIFIER
			, Plus_InstitutionalHiearchy UNIQUEIDENTIFIER
			, Plus_CampaignAppeal UNIQUEIDENTIFIER
			, StatusCode INT
			, StateCode INT
			, Plus_Frequency INT
			, Plus_PaymentStart DATETIME
			, Plus_PaymentStop DATETIME
			, Plus_Amount MONEY
			, Plus_Group UNIQUEIDENTIFIER
			, Plus_Type INT
			, Plus_Organization UNIQUEIDENTIFIER
			, CreatedOn DATETIME
			, Zero NVARCHAR(5) DEFAULT ''0''
			' -- Ext_Create_Fields
		, 'Plus_RecurringGiftRulesId
			, Plus_Constituent
			, Plus_FundAccount
			, Plus_InstitutionalHiearchy
			, Plus_CampaignAppeal
			, StatusCode
			, StateCode
			, Plus_Frequency
			, Plus_PaymentStart
			, Plus_PaymentStop
			, Plus_Amount
			, Plus_Group
			, Plus_Type
			, Plus_Organization
			, CreatedOn
			' -- Ext_Insert_Fields
		, 'Plus_RecurringGiftRulesId
			, Plus_Constituent
			, Plus_FundAccount
			, Plus_InstitutionalHiearchy
			, Plus_CampaignAppeal
			, StatusCode
			, StateCode
			, Plus_Frequency
			, CASE WHEN DATENAME(dy,A.Plus_PaymentStart) BETWEEN B.Mdt_Begin_Date_Number AND B.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_PaymentStart)
					ELSE DATEADD(hh,-7,A.Plus_PaymentStart) END AS Plus_PaymentStart
			, CASE WHEN DATENAME(dy,A.Plus_PaymentStop) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.Plus_PaymentStop)
					ELSE DATEADD(hh,-7,A.Plus_PaymentStop) END AS Plus_PaymentStop 
			, Plus_Amount
			, Plus_Group
			, Plus_Type
			, Plus_Organization
			, CASE WHEN DATENAME(dy,A.CreatedOn) BETWEEN C.Mdt_Begin_Date_Number AND C.Mdt_End_Date_Number THEN DATEADD(hh,-6,A.CreatedOn)
					ELSE DATEADD(hh,-7,A.CreatedOn) END AS CreatedOn
			' -- Ext_Select_Statement
		, 'Oa_Extract.Plus_RecurringGiftRulesBase A
				LEFT JOIN dbo._MDT_Conversion_Dim B ON YEAR(A.Plus_PaymentStart) = B.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim C ON YEAR(A.Plus_PaymentStop) = C.Date_Year
				LEFT JOIN dbo._MDT_Conversion_Dim D ON YEAR(A.CreatedOn) = D.Date_Year
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- StringMapBase (Ext_String_Map)
-- --------------------------
	( 1 -- Tier
		, 'dbo.StringMapBase' -- Source_Table
		, 'Oa_Extract.StringMapBase' -- Destination_Table
		, 'Ext_String_Map' -- Ext_Table
		, 'ObjectTypeCode INT
			, AttributeName NVARCHAR(100)
			, AttributeValue INT
			, LangId INT
			, OrganizationId UNIQUEIDENTIFIER
			, Value NVARCHAR(4000)
			, DisplayOrder INT
			, StringMapId UNIQUEIDENTIFIER
			' -- Dest_Create_Fields
		, 'ObjectTypeCode
			, AttributeName
			, AttributeValue
			, LangId
			, OrganizationId
			, Value
			, DisplayOrder
			, StringMapId
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ObjectTypeCode INT
			, AttributeName NVARCHAR(100)
			, AttributeValue INT
			, LangId INT
			, OrganizationId UNIQUEIDENTIFIER
			, Value NVARCHAR(4000)
			, DisplayOrder INT
			, StringMapId UNIQUEIDENTIFIER
			' -- Ext_Create_Fields
		, 'ObjectTypeCode
			, AttributeName
			, AttributeValue
			, LangId
			, OrganizationId
			, Value
			, DisplayOrder
			, StringMapId
			' -- Ext_Insert_Fields
		, 'ObjectTypeCode
			, AttributeName
			, AttributeValue
			, LangId
			, OrganizationId
			, Value
			, DisplayOrder
			, StringMapId
			' -- Ext_Select_Statement
		, 'Oa_Extract.StringMapBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,	
-- --------------------------
-- SystemUserBase (Ext_System_User)
-- --------------------------
	( 1 -- Tier
		, 'dbo.SystemUserBase' -- Source_Table
		, 'Oa_Extract.SystemUserBase' -- Destination_Table
		, 'Ext_System_User' -- Ext_Table
		, 'SystemUserId UNIQUEIDENTIFIER
			, FullName NVARCHAR(200)
			, FirstName NVARCHAR(64)
			, LastName NVARCHAR(64)
			, PersonalEmailAddress NVARCHAR(100)
			, Title NVARCHAR(128)
			, InternalEmailAddress NVARCHAR(100)
			, MobilePhone NVARCHAR(64)
			, DomainName NVARCHAR(1024)
			' -- Dest_Create_Fields
		, 'SystemUserId
			, FullName
			, FirstName
			, LastName
			, PersonalEmailAddress
			, Title
			, InternalEmailAddress
			, MobilePhone
			, DomainName
			' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'SystemUserId UNIQUEIDENTIFIER
			, FullName NVARCHAR(200)
			, FirstName NVARCHAR(64)
			, LastName NVARCHAR(64)
			, PersonalEmailAddress NVARCHAR(100)
			, Title NVARCHAR(128)
			, InternalEmailAddress NVARCHAR(100)
			, MobilePhone NVARCHAR(64)
			, DomainName NVARCHAR(1024)
			, Coordinating_Liaison NVARCHAR(30) DEFAULT ''Coordinating_Liaison''
			, Connected_Liaison NVARCHAR(30) DEFAULT ''Connected_Liaison''
			, Pending_Liaison NVARCHAR(30) DEFAULT ''Pending_Liaison''
			' -- Ext_Create_Fields
		, 'SystemUserId
			, FullName
			, FirstName
			, LastName
			, PersonalEmailAddress
			, Title
			, InternalEmailAddress
			, MobilePhone
			, DomainName
			' -- Ext_Insert_Fields
		, 'SystemUserId
			, FullName
			, FirstName
			, LastName
			, PersonalEmailAddress
			, Title
			, InternalEmailAddress
			, MobilePhone
			, DomainName
			' -- Ext_Select_Statement
		, 'Oa_Extract.SystemUserBase
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- Picklist Table 1
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Picklist_1' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Physical_Table_Name NVARCHAR(64)
			, Column_Name NVARCHAR(100)
			, Column_Label NVARCHAR(400)
			, Column_Value INT
			, New_Phone NVARCHAR(100) DEFAULT ''New_Phone''
			, New_Type NVARCHAR(100) DEFAULT ''New_Type''
			, Plus_LineType NVARCHAR(100) DEFAULT ''Plus_LineType''
			, New_PreferredTime NVARCHAR(100) DEFAULT ''New_PreferredTime''
			, Plus_ConfidentialInstruction NVARCHAR(100) DEFAULT ''Plus_ConfidentialInstruction''
			, New_Recognition NVARCHAR(100) DEFAULT ''New_Recognition''
			, New_Affiliate NVARCHAR(100) DEFAULT ''New_Affiliate''
			, New_Address NVARCHAR(100) DEFAULT ''New_Address''
			, Plus_OneAccordQuality NVARCHAR(100) DEFAULT ''Plus_OneAccordQuality''
			, New_AddressType NVARCHAR(100) DEFAULT ''New_AddressType''
			, New_Email NVARCHAR(100) DEFAULT ''New_Email''
			, New_EmailType NVARCHAR(100) DEFAULT ''New_EmailType''
			, New_DropInclude NVARCHAR(100) DEFAULT ''New_DropInclude''
			, New_Interaction NVARCHAR(100) DEFAULT ''New_Interaction''
			, New_CommType NVARCHAR(100) DEFAULT ''New_CommType''
			, New_Reason NVARCHAR(100) DEFAULT ''New_Reason''
			, New_LanguageSpecialAffiliation NVARCHAR(100) DEFAULT ''New_LanguageSpecialAffiliation''
			, New_Language NVARCHAR(100) DEFAULT ''New_Language''
			, New_Speech NVARCHAR(100) DEFAULT ''New_Speech''
			, New_ReadLevel NVARCHAR(100) DEFAULT ''New_ReadLevel''
			, New_WriteLevel NVARCHAR(100) DEFAULT ''New_WriteLevel''
			, New_Association NVARCHAR(100) DEFAULT ''New_Association''
			, New_Sponsor NVARCHAR(100) DEFAULT ''New_Sponsor''
			, Contact NVARCHAR(100) DEFAULT ''Contact''
			, GenderCode NVARCHAR(100) DEFAULT ''GenderCode''
			, FamilyStatusCode NVARCHAR(100) DEFAULT ''FamilyStatusCode''
			, New_Ethnicity NVARCHAR(100) DEFAULT ''New_Ethnicity''
			, Plus_ChurchMember NVARCHAR(100) DEFAULT ''Plus_ChurchMember''
			, New_PersonalSuffix NVARCHAR(100) DEFAULT ''New_PersonalSuffix''
			, New_MajorGiftPropensity1 NVARCHAR(100) DEFAULT ''New_MajorGiftPropensity1''
			, Plus_AnnualGift1 NVARCHAR(100) DEFAULT ''Plus_AnnualGift1''
			, Plus_PlannedGift NVARCHAR(100) DEFAULT ''Plus_PlannedGift''
			, Plus_GiftCapacityEnp NVARCHAR(100) DEFAULT ''Plus_GiftCapacityEnp''
			, Plus_GiftCapacityEn NVARCHAR(100) DEFAULT ''Plus_GiftCapacityEn''
			, PhilanthropicCapacityRatingPcr NVARCHAR(100) DEFAULT ''PhilanthropicCapacityRatingPcr''
			, Plus_EstimatedHouseholdIncome NVARCHAR(100) DEFAULT ''Plus_EstimatedHouseholdIncome''
			, Plus_EstimatedHomeMarketValue NVARCHAR(100) DEFAULT ''Plus_EstimatedHomeMarketValue''
			, Plus_BlockClusters NVARCHAR(100) DEFAULT ''Plus_BlockClusters''
			, Account NVARCHAR(100) DEFAULT ''Account''
			, AccountClassificationCode NVARCHAR(100) DEFAULT ''AccountClassificationCode''
			, New_RetireeRatio NVARCHAR(100) DEFAULT ''New_RetireeRatio''
			, New_SplitRatio NVARCHAR(100) DEFAULT ''New_SplitRatio''
			, New_MatchingRatio NVARCHAR(100) DEFAULT ''New_MatchingRatio''
			, PreferredContactMethodCode NVARCHAR(100) DEFAULT ''PreferredContactMethodCode''
			, Plus_EnvelopeNamesAndSalutations NVARCHAR(100) DEFAULT ''Plus_EnvelopeNamesAndSalutations''
			, Plus_Etiquette NVARCHAR(100) DEFAULT ''Plus_Etiquette''
			, New_Gift NVARCHAR(100) DEFAULT ''New_Gift''
			, StatusCode NVARCHAR(100) DEFAULT ''StatusCode''
			, Plus_GiftSource NVARCHAR(100) DEFAULT ''Plus_GiftSource''
			, Plus_Kind NVARCHAR(100) DEFAULT ''Plus_Kind''
			, New_TenderType NVARCHAR(100) DEFAULT ''New_TenderType''
			, Plus_ReceiptDeliveryMethod NVARCHAR(100) DEFAULT ''Plus_ReceiptDeliveryMethod''
			, Plus_ContactRole NVARCHAR(100) DEFAULT ''Plus_ContactRole''
			, Plus_Salutation NVARCHAR(100) DEFAULT ''Plus_Salutation''
			, Plus_ConstituentNote NVARCHAR(100) DEFAULT ''Plus_ConstituentNote''
			, Plus_CoordinatingLiaisonNeeded NVARCHAR(100) DEFAULT ''Plus_CoordinatingLiaisonNeeded''
			, Plus_ReasonForDrop NVARCHAR(100) DEFAULT ''Plus_ReasonForDrop''
			, Plus_Type NVARCHAR(100) DEFAULT ''Plus_Type''
			' -- Ext_Create_Fields
		, 'Physical_Table_Name
			, Column_Name
			, Column_Label
			, Column_Value
			' -- Ext_Insert_Fields
		, ' DISTINCT  UPPER(B.PhysicalName) AS Physical_Table_Name
			, UPPER(A.AttributeName) AS Column_Name
			, CONVERT(NVARCHAR(400),A.Value) AS Column_Label
			, A.AttributeValue AS Column_Value
			' -- Ext_Select_Statement
		, ' Ext_String_Map A
				INNER JOIN Ext_Entity B ON A.ObjectTypeCode = B.ObjectTypeCode
			' -- Ext_From_Statement
		, 'AND LangId = 1033
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- Picklist Table 2
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Picklist_2' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Physical_Table_Name NVARCHAR(64)
			, Column_Name NVARCHAR(100)
			, Column_Label NVARCHAR(400)
			, Column_Value INT
			, New_Type NVARCHAR(100) DEFAULT ''New_Type''
			, Plus_Kind NVARCHAR(100) DEFAULT ''Plus_Kind''
			, Plus_GiftSource NVARCHAR(100) DEFAULT ''Plus_GiftSource''
			, Contact NVARCHAR(100) DEFAULT ''Contact''
			, Plus_GiftCapacityEn NVARCHAR(100) DEFAULT ''Plus_GiftCapacityEn''
			, StatusCode NVARCHAR(100) DEFAULT ''StatusCode''
			, New_FundAccount NVARCHAR(100) DEFAULT ''New_FundAccount''
			, Plus_GiftPurposeType NVARCHAR(100) DEFAULT ''Plus_GiftPurposeType''
			, Plus_GiftPurposeSubtype NVARCHAR(100) DEFAULT ''Plus_GiftPurposeSubtype''
			, New_CaePurpose NVARCHAR(100) DEFAULT ''New_CaePurpose''
			, Plus_AwardRestrictionGender NVARCHAR(100) DEFAULT ''Plus_AwardRestrictionGender''
			, Plus_AwardRestrictionClassYear NVARCHAR(100) DEFAULT ''Plus_AwardRestrictionClassYear''
			, Plus_AwardRestrictionEthnicity NVARCHAR(100) DEFAULT ''Plus_AwardRestrictionEthnicity''
			, New_RecognitionCredit NVARCHAR(100) DEFAULT ''New_RecognitionCredit''
			, Plus_Type NVARCHAR(100) DEFAULT ''Plus_Type''
			, New_Employment NVARCHAR(100) DEFAULT ''New_Employment''
			, Plus_ChurchEmploymentStatus NVARCHAR(100) DEFAULT ''Plus_ChurchEmploymentStatus''
			, New_OtherIdentifiers NVARCHAR(100) DEFAULT ''New_OtherIdentifiers''
			, Plus_Alumni NVARCHAR(100) DEFAULT ''Plus_Alumni''
			, Plus_AlumniStatus NVARCHAR(100) DEFAULT ''Plus_AlumniStatus''
			, New_Degree NVARCHAR(100) DEFAULT ''New_Degree''
			, Plus_DegreeLevel NVARCHAR(100) DEFAULT ''Plus_DegreeLevel''
			, CampaignActivity NVARCHAR(100) DEFAULT ''CampaignActivity''
			, Plus_CommunicationType NVARCHAR(100) DEFAULT ''Plus_CommunicationType''
			, Plus_Affiliate NVARCHAR(100) DEFAULT ''Plus_Affiliate''
			, Plus_DepartmentFunction NVARCHAR(100) DEFAULT ''Plus_DepartmentFunction''
			, New_InternationalExperience NVARCHAR(100) DEFAULT ''New_InternationalExperience''
			, New_Experience NVARCHAR(100) DEFAULT ''New_Experience''
			, Plus_LdsPosition NVARCHAR(100) DEFAULT ''Plus_LdsPosition''
			, Plus_LegacyM11 NVARCHAR(100) DEFAULT ''Plus_LegacyM11''
			, Plus_M11MessageType NVARCHAR(100) DEFAULT ''Plus_M11MessageType''
			, Plus_M11ActivityType NVARCHAR(100) DEFAULT ''Plus_M11ActivityType''
			, Plus_ConstituentNote NVARCHAR(100) DEFAULT ''Plus_ConstituentNote''
			, Plus_CoordinatingLiaisonNeeded NVARCHAR(100) DEFAULT ''Plus_CoordinatingLiaisonNeeded''
			, Plus_ReasonForDrop NVARCHAR(100) DEFAULT ''Plus_ReasonForDrop''
			' -- Ext_Create_Fields
		, 'Physical_Table_Name
			, Column_Name
			, Column_Label
			, Column_Value
			' -- Ext_Insert_Fields
		, ' DISTINCT  UPPER(B.PhysicalName) AS Physical_Table_Name
			, UPPER(A.AttributeName) AS Column_Name
			, CONVERT(NVARCHAR(400),A.Value) AS Column_Label
			, A.AttributeValue AS Column_Value
			' -- Ext_Select_Statement
		, ' Ext_String_Map A
				INNER JOIN Ext_Entity B ON A.ObjectTypeCode = B.ObjectTypeCode
			' -- Ext_From_Statement
		, 'AND LangId = 1033
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- Picklist Table 3
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Picklist_3' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Physical_Table_Name NVARCHAR(64)
			, Column_Name NVARCHAR(100)
			, Column_Label NVARCHAR(400)
			, Column_Value INT
			, New_Type NVARCHAR(100) DEFAULT ''New_Type''
			, Plus_Kind NVARCHAR(100) DEFAULT ''Plus_Kind''
			, Plus_GiftSource NVARCHAR(100) DEFAULT ''Plus_GiftSource''
			, Contact NVARCHAR(100) DEFAULT ''Contact''
			, Plus_GiftCapacityEn NVARCHAR(100) DEFAULT ''Plus_GiftCapacityEn''
			, StatusCode NVARCHAR(100) DEFAULT ''StatusCode''	
			, New_Employment NVARCHAR(100) DEFAULT ''New_Employment''
			, New_FundAccount NVARCHAR(100) DEFAULT ''New_FundAccount''
			, CampaignActivity NVARCHAR(100) DEFAULT ''CampaignActivity''
			, New_RecognitionCredit NVARCHAR(100) DEFAULT ''New_RecognitionCredit''
			, Plus_Type NVARCHAR(100) DEFAULT ''Plus_Type''
			, New_Pledge NVARCHAR(100) DEFAULT ''New_Pledge''
			, Plus_TenderType NVARCHAR(100) DEFAULT ''Plus_TenderType''
			, Plus_PlannedGift NVARCHAR(100) DEFAULT ''Plus_PlannedGift''
			, New_Confidential NVARCHAR(100) DEFAULT ''New_Confidential''
			, Plus_PlannedGivingPaymentFrequency NVARCHAR(100) DEFAULT ''Plus_PlannedGivingPaymentFrequency''
			, New_Bookable NVARCHAR(100) DEFAULT ''New_Bookable''
			, Plus_MatchExpected NVARCHAR(100) DEFAULT ''Plus_MatchExpected''
			, Plus_GiftRevocability NVARCHAR(100) DEFAULT ''Plus_GiftRevocability''
			, Plus_RemainderBeneficiary NVARCHAR(100) DEFAULT ''Plus_RemainderBeneficiary''
			, New_Documentation NVARCHAR(100) DEFAULT ''New_Documentation''
			, Plus_PlannedGivingType NVARCHAR(100) DEFAULT ''Plus_PlannedGivingType''
			, Plus_VehicleType NVARCHAR(100) DEFAULT ''Plus_VehicleType''
			, Plus_VehicleSubtype NVARCHAR(100) DEFAULT ''Plus_VehicleSubtype''
			, Plus_Duration NVARCHAR(100) DEFAULT ''Plus_Duration''
			, Plus_LivesType NVARCHAR(100) DEFAULT ''Plus_LivesType''
			, Plus_DonorScore NVARCHAR(100) DEFAULT ''Plus_DonorScore''
			, Plus_GiftType NVARCHAR(100) DEFAULT ''Plus_GiftType''
			, Plus_StatusCode NVARCHAR(100) DEFAULT ''Plus_StatusCode''
			, Plus_PlannedGiftTier NVARCHAR(100) DEFAULT ''Plus_PlannedGiftTier''
			, Plus_ReportFrequency NVARCHAR(100) DEFAULT ''Plus_ReportFrequency''
			, Plus_ProposedEndowment NVARCHAR(100) DEFAULT ''Plus_ProposedEndowment''
			, ChannelTypeCode NVARCHAR(100) DEFAULT ''ChannelTypeCode''
			, Plus_Subtype NVARCHAR(100) DEFAULT ''Plus_Subtype''
			, Opportunity NVARCHAR(100) DEFAULT ''Opportunity''
			, StateCode NVARCHAR(100) DEFAULT ''StateCode''
			, Plus_ProposalStatus NVARCHAR(100) DEFAULT ''Plus_ProposalStatus''
			, Plus_NewAccount NVARCHAR(100) DEFAULT ''Plus_NewAccount''
			, ActivityPointer NVARCHAR(100) DEFAULT ''ActivityPointer''
			, New_AssociationMembership NVARCHAR(100) DEFAULT ''New_AssociationMembership''
			, Lds_ExpectancyType NVARCHAR(100) DEFAULT ''Lds_ExpectancyType''
			, Plus_RecurringGiftRules NVARCHAR(100) DEFAULT ''Plus_RecurringGiftRules''
			, Plus_Frequency NVARCHAR(100) DEFAULT ''Plus_Frequency''
			, New_Batches NVARCHAR(100) DEFAULT ''New_Batches''
			, Lds_BatchType NVARCHAR(100) DEFAULT ''Lds_BatchType''
			, Plus_ConstituentNote NVARCHAR(100) DEFAULT ''Plus_ConstituentNote''
			, Plus_CoordinatingLiaisonNeeded NVARCHAR(100) DEFAULT ''Plus_CoordinatingLiaisonNeeded''
			, Plus_ReasonForDrop NVARCHAR(100) DEFAULT ''Plus_ReasonForDrop''
			' -- Ext_Create_Fields
		, 'Physical_Table_Name
			, Column_Name
			, Column_Label
			, Column_Value
			' -- Ext_Insert_Fields
		, ' DISTINCT  UPPER(B.PhysicalName) AS Physical_Table_Name
			, UPPER(A.AttributeName) AS Column_Name
			, CONVERT(NVARCHAR(400),A.Value) AS Column_Label
			, A.AttributeValue AS Column_Value
			' -- Ext_Select_Statement
		, ' Ext_String_Map A
				INNER JOIN Ext_Entity B ON A.ObjectTypeCode = B.ObjectTypeCode
			' -- Ext_From_Statement
		, 'AND LangId = 1033
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL  
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10		
	)
	,
-- --------------------------
-- Gift Rules - _Gift_Credit_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Gift_Credit_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_RecognitionCreditId UNIQUEIDENTIFIER
			, New_RelatedConstituent UNIQUEIDENTIFIER
			, New_OrganizationId UNIQUEIDENTIFIER
			, New_RelatedGift UNIQUEIDENTIFIER
			, New_CreditAmount MONEY
			, Plus_Type INT
			, Plus_OriginatingConstituent UNIQUEIDENTIFIER
			, Plus_SubType INT
			, New_ReceiptDate DATETIME
			, Plus_InstitutionalHieararchy UNIQUEIDENTIFIER
			, StatusCode INT
			, Dollar_Sign NVARCHAR(1) DEFAULT ''$''
			, I_Colon NVARCHAR(5) DEFAULT ''(I):''
			, M_Colon NVARCHAR(5) DEFAULT ''(M):''
			, O_Colon NVARCHAR(5) DEFAULT ''(O):''
			, H_Colon NVARCHAR(5) DEFAULT ''(H):''
			, S_Colon NVARCHAR(5) DEFAULT ''(S):''
			, Zero NVARCHAR(1) DEFAULT ''0''
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			' -- Ext_Create_Fields
		, 'New_RecognitionCreditId
			, New_RelatedConstituent
			, New_OrganizationId
			, New_RelatedGift
			, New_CreditAmount
			, Plus_Type
			, Plus_OriginatingConstituent
			, Plus_SubType
			, New_ReceiptDate
			, Plus_InstitutionalHieararchy
			, StatusCode
			' -- Ext_Insert_Fields
		, 'New_RecognitionCreditId
			, New_RelatedConstituent
			, CASE WHEN New_RelatedConstituent IS NOT NULL 
					AND New_OrganizationId IS NOT NULL THEN NULL 
				ELSE A.New_OrganizationId END AS New_OrganizationId
			, New_RelatedGift
			, New_CreditAmount
			, CASE WHEN B.New_GiftId = A.New_RelatedGift 
					AND A.Plus_Type =  100000000 
					AND  COALESCE(B.New_ConstituentDonor, B.New_OrganizationDonor) != COALESCE(New_RelatedConstituent, New_OrganizationId) THEN 100000002 
				WHEN B.New_GiftId = A.New_RelatedGift 
					AND A.Plus_Type =  100000002 
					AND  COALESCE(B.New_ConstituentDonor, B.New_OrganizationDonor) = COALESCE(New_RelatedConstituent, New_OrganizationId) THEN 100000000
				ELSE A.Plus_Type END AS Plus_Type
			, Plus_OriginatingConstituent
			, Plus_SubType
			, A.New_ReceiptDate
			, A.Plus_InstitutionalHieararchy
			, A.StatusCode    				
			' -- Ext_Select_Statement
		, 'Ext_Recognition_Credit A
				INNER JOIN Ext_Gift B ON A.New_RelatedGift = B.New_GiftId
			' -- Ext_From_Statement
		, '		AND New_RelatedGift NOT IN
					(
					SELECT DISTINCT New_GiftId AS GiftId
						FROM Ext_Gift
						WHERE 1 = 1
							AND StatusCode = 100000003
					UNION
					SELECT DISTINCT New_RelatedGift AS GiftId
						FROM Ext_Recognition_Credit
						WHERE 1 = 1
							AND StatusCode = 100000001
					UNION
					SELECT DISTINCT New_RelatedGift AS GiftId
						FROM Ext_Gift_Hist
						WHERE 1 = 1
							AND StatusCode = 100000001
					)
				AND COALESCE(A.New_RelatedConstituent,A.New_OrganizationId) IS NOT NULL
				AND COALESCE(B.New_ConstituentDonor,B.New_OrganizationDonor) IS NOT NULL
				AND A.Plus_Type IN (100000002,100000000)
				AND EXISTS 
						(SELECT New_RecognitionCreditId
							FROM
								(SELECT ROW_NUMBER() OVER(PARTITION BY COALESCE(A.New_RelatedConstituent,A.New_OrganizationId)
																		, A.New_RelatedGift
											ORDER BY A.Plus_Type) AS Row_Num
									, A.New_RecognitionCreditId
									, A.New_RelatedGift
									FROM Ext_Recognition_Credit A
								) Z
							WHERE 1 = 1
								AND Row_Num = 1
								AND A.New_RecognitionCreditId = Z.New_RecognitionCreditId
						)
				CREATE NONCLUSTERED INDEX IX_Recogn_Crdt_1 
					ON _Gift_Credit_(Plus_Type,Plus_SubType,New_ReceiptDate)
					INCLUDE (
					New_RelatedConstituent
					, New_OrganizationId
					, New_CreditAmount
					, Plus_InstitutionalHieararchy
					);
				UPDATE STATISTICS dbo._Gift_Credit_;
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- _All_Donors_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_All_Donors_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Donor_Key NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'Donor_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
			' -- Ext_Select_Statement
		, '(SELECT DISTINCT AccountId AS ContactId
				FROM Ext_Account
			UNION
			SELECT DISTINCT Plus_Constituent AS ContactId
				FROM Ext_Donor_Score
			UNION
			SELECT DISTINCT Record1Id AS ContactId
				FROM Ext_Connection
			UNION
			SELECT DISTINCT Record2Id AS ContactId
				FROM Ext_Connection
			UNION
			SELECT DISTINCT ContactId
				FROM Ext_Contact
			UNION
			SELECT DISTINCT Plus_RelatedContact AS ContactId
				FROM Ext_Address
			UNION
			SELECT DISTINCT New_DropIncludesId AS ContactId
				FROM Ext_Drop_Include
			UNION
			SELECT DISTINCT New_ConstituentId AS ContactId
				FROM Ext_Email
			UNION
			SELECT DISTINCT New_EmploymentsId AS ContactId
				FROM Ext_Employment
			UNION
			SELECT DISTINCT New_ConstituentDonor AS ContactId
				FROM Ext_Gift
			UNION
			SELECT DISTINCT New_OrganizationDonor AS ContactId
				FROM Ext_Gift
			UNION
			SELECT DISTINCT New_LanguageSAId AS ContactId
				FROM Ext_Language
			UNION
			SELECT DISTINCT New_Constituent AS ContactId
				FROM Ext_Recognition_Association
			UNION
			SELECT DISTINCT New_RelatedConstituent AS ContactId
				FROM Ext_Recognition_Credit
			UNION
			SELECT DISTINCT New_OrganizationId AS ContactId
				FROM Ext_Recognition_Credit
			UNION
			SELECT DISTINCT New_StudentsAttendanceId AS ContactId
				FROM Ext_Student
			UNION
			SELECT DISTINCT Plus_Constituent AS ContactId
				FROM Ext_Alumni
			UNION
			SELECT DISTINCT Plus_Constituent AS ContactId
				FROM Ext_Recurring_Gift_Rules
			UNION
			SELECT DISTINCT Plus_Organization AS ContactId
				FROM Ext_Recurring_Gift_Rules
			) A
			' -- Ext_From_Statement
		, '	' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL  
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- _Phone_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Phone_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PHONE] AND Column_Name = [NEW_TYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL  
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- _Phone_Line_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Phone_Line_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PHONE] AND Column_Name = [PLUS_LINETYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Phone_Preferred_Time_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Phone_Preferred_Time_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PHONE] AND Column_Name = [NEW_PREFERREDTIME]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Phone_Confidential_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Phone_Confidential_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PHONE] AND Column_Name = [NEW_PREFERREDTIME]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Award_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Award_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_RECOGNITION] AND Column_Name = [NEW_TYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 	
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- _Award_Affiliate_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Award_Affiliate_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_RECOGNITION] AND Column_Name = [NEW_AFFILIATE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Address_Quality_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Address_Quality_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_ADDRESS] AND Column_Name = [PLUS_ONEACCORDQUALITY]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Address_Confidential_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Address_Confidential_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_ADDRESS] AND Column_Name = [PLUS_CONFIDENTIALINSTRUCTION]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Address_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Address_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_ADDRESS] AND Column_Name = [NEW_ADDRESSTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Email_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Email_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_EMAIL] AND Column_Name = [NEW_EMAILTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Email_Confidential_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Email_Confidential_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_EMAIL] AND Column_Name = [PLUS_CONFIDENTIALINSTRUCTION]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Drop_Include_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Drop_Include_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_DROPINCLUDE] AND Column_Name = [NEW_TYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Drop_Include_Scope_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Drop_Include_Scope_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_DROPINCLUDE] AND Column_Name = [NEW_INTERACTION]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Drop_Include_CommType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Drop_Include_CommType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_DROPINCLUDE] AND Column_Name = [NEW_COMMTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Drop_Include_Reason_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Drop_Include_Reason_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_DROPINCLUDE] AND Column_Name = [NEW_REASON]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Language_Lang_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Language_Lang_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_LANGUAGESPECIALAFFILIATION] AND Column_Name = [NEW_LANGUAGE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Language_Speech_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Language_Speech_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_LANGUAGESPECIALAFFILIATION] AND Column_Name = [NEW_SPEECH]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Language_Read_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Language_Read_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_LANGUAGESPECIALAFFILIATION] AND Column_Name = [NEW_READLEVEL]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Language_Write_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Language_Write_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_LANGUAGESPECIALAFFILIATION] AND Column_Name = [NEW_WRITELEVEL]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Association_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Association_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_ASSOCIATION] AND Column_Name = [NEW_TYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Association_Sponsor_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Association_Sponsor_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_ASSOCIATION] AND Column_Name = [NEW_SPONSOR]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Gender_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Gender_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [GENDERCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Family_Status_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Family_Status_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [FAMILYSTATUSCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Ethnicity_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Ethnicity_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [NEW_ETHNICITY]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Church_Member_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Church_Member_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PLUS_CHURCHMEMBER]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Personal_Suffix_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Personal_Suffix_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [NEW_PERSONALSUFFIX]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Major_Gift_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Major_Gift_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [NEW_MAJORGIFTPROPENSITY1]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Annual_Gift_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Annual_Gift_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PLUS_ANNUALGIFT1]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Planned_Gift_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Planned_Gift_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PLUS_PLANNEDGIFT]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Gift_Cap_Enp_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Gift_Cap_Enp_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PLUS_GIFTCAPACITYENP]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10		
	)
	,
-- --------------------------
-- _Donor_Gift_Cap_En_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Gift_Cap_En_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PLUS_GIFTCAPACITYEN]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Phil_Cap_Rate_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Phil_Cap_Rate_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PHILANTHROPICCAPACITYRATINGPCR]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Est_House_Income_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Est_House_Income_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PLUS_ESTIMATEDHOUSEHOLDINCOME]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Est_House_Value_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Est_House_Value_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PLUS_ESTIMATEDHOMEMARKETVALUE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Blockclusters_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Blockclusters_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PLUS_BLOCKCLUSTERS]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Act_Class_Code_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Act_Class_Code_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [ACCOUNT] AND Column_Name = [ACCOUNTCLASSIFICATIONCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Retiree_Ratio_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Retiree_Ratio_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [ACCOUNT] AND Column_Name = [NEW_RETIREERATIO]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL  
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Split_Ratio_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Split_Ratio_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [ACCOUNT] AND Column_Name = [NEW_SPLITRATIO]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Matching_Ratio_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Matching_Ratio_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [ACCOUNT] AND Column_Name = [NEW_MATCHINGRATIO]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL  
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Pref_Contact_Method_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Pref_Contact_Method_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [ACCOUNT] AND Column_Name = [PREFERREDCONTACTMETHODCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Etiquette_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Etiquette_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [PLUS_ENVELOPENAMESANDSALUTATIONS] AND Column_Name = [PLUS_ETIQUETTE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL  
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donation_StatusCode_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donation_StatusCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_GIFT] AND Column_Name = [STATUSCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donation_GiftSource_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donation_GiftSource_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_GIFT] AND Column_Name = [PLUS_GIFTSOURCE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)             
	,
-- --------------------------
-- _Donation_Kind_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donation_Kind_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_GIFT] AND Column_Name = [PLUS_KIND]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)             
	,
-- --------------------------
-- _Donation_TenderType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donation_TenderType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_GIFT] AND Column_Name = [NEW_TENDERTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)             
	,
-- --------------------------
-- _Donation_ReceiptDeliveryMethod_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donation_ReceiptDeliveryMethod_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_GIFT] AND Column_Name = [PLUS_RECEIPTDELIVERYMETHOD]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donation_ContactRole_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donation_ContactRole_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_GIFT] AND Column_Name = [PLUS_CONTACTROLE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donation_Salutation_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donation_Salutation_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_1
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_GIFT] AND Column_Name = [PLUS_SALUTATION]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Fund_GiftPurposeType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Fund_GiftPurposeType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_FUNDACCOUNT] AND Column_Name = [PLUS_GIFTPURPOSETYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Fund_GiftPurposeSubType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Fund_GiftPurposeSubType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_FUNDACCOUNT] AND Column_Name = [PLUS_GIFTPURPOSESUBTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Fund_CaePurpose_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Fund_CaePurpose_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_FUNDACCOUNT] AND Column_Name = [NEW_CAEPURPOSE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Fund_AwardRestrictionGender_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Fund_AwardRestrictionGender_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_FUNDACCOUNT] AND Column_Name = [PLUS_AWARDRESTRICTIONGENDER]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Fund_AwardRestrictionClassYear_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Fund_AwardRestrictionClassYear_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_FUNDACCOUNT] AND Column_Name = [PLUS_AWARDRESTRICTIONCLASSYEAR]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Fund_AwardRestrictionEthnicity_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Fund_AwardRestrictionEthnicity_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_FUNDACCOUNT] AND Column_Name = [PLUS_AWARDRESTRICTIONETHNICITY]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Recog_Credit_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Recog_Credit_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_RECOGNITIONCREDIT] AND Column_Name = [PLUS_TYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_Church_Employment_Status_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_Church_Employment_Status_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_EMPLOYMENT] AND Column_Name = [PLUS_CHURCHEMPLOYMENTSTATUS]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _New_OtherIdentifiers_New_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_New_OtherIdentifiers_New_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_OTHERIDENTIFIERS] AND Column_Name = [NEW_TYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_AlumniStatus_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_AlumniStatus_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [PLUS_ALUMNI] AND Column_Name = [PLUS_ALUMNISTATUS]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)             
	,
-- --------------------------
-- _Plus_DegreeLevel_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_DegreeLevel_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_DEGREE] AND Column_Name = [PLUS_DEGREELEVEL]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Campaign_Activity_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Campaign_Activity_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CAMPAIGNACTIVITY] AND Column_Name = [PLUS_COMMUNICATIONTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Affiliate_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Affiliate_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CAMPAIGNACTIVITY] AND Column_Name = [PLUS_AFFILIATE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Department_Function_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Department_Function_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CAMPAIGNACTIVITY] AND Column_Name = [PLUS_DEPARTMENTFUNCTION]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)             
	,
-- --------------------------
-- _New_Experience_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_New_Experience_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_INTERNATIONALEXPERIENCE] AND Column_Name = [NEW_EXPERIENCE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_LdsPosition_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_LdsPosition_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_INTERNATIONALEXPERIENCE] AND Column_Name = [PLUS_LDSPOSITION]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,             
-- --------------------------
-- _Plus_M11MessageType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_M11MessageType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [PLUS_LEGACYM11] AND Column_Name = [PLUS_M11MESSAGETYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,             
-- --------------------------
-- _Plus_M11ActivityType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_M11ActivityType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_2
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [PLUS_LEGACYM11] AND Column_Name = [PLUS_M11ACTIVITYTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_Kind_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_Kind_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_KIND]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_Tender_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_Tender_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_TENDERTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_Gift_Source_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_Gift_Source_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_GIFTSOURCE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_Planned_Gift_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_Planned_Gift_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_PLANNEDGIFT]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _New_Confidential_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_New_Confidential_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [NEW_CONFIDENTIAL]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_PlannedGivingPaymentFrequency_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_PlannedGivingPaymentFrequency_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_PLANNEDGIVINGPAYMENTFREQUENCY]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _New_Bookable_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_New_Bookable_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [NEW_BOOKABLE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_MatchExpected_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_MatchExpected_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_MATCHEXPECTED]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_GiftRevocability_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_GiftRevocability_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_GIFTREVOCABILITY]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_RemainderBeneficiary_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_RemainderBeneficiary_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_REMAINDERBENEFICIARY]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _New_Documentation_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_New_Documentation_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [NEW_DOCUMENTATION]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL 
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_PlannedGivingType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_PlannedGivingType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_PLANNEDGIVINGTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL  
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_VehicleType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_VehicleType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_VEHICLETYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_VehicleSubType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_VehicleSubType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_VEHICLESUBTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_Duration_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_Duration_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_DURATION]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Plus_LivesType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_LivesType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [PLUS_LIVESTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _PLUS_GIFTTYPE_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_GiftType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [PLUS_DONORSCORE] AND Column_Name = [PLUS_GIFTTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _PLUS_STATUSCODE_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_StatusCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [PLUS_DONORSCORE] AND Column_Name = [PLUS_STATUSCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _PLUS_PLANNEDGIFTTIER_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_PlannedGiftTier_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PLUS_PLANNEDGIFTTIER]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _PLUS_GIFTCAPACITYEN_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_GiftCapacityEn_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CONTACT] AND Column_Name = [PLUS_GIFTCAPACITYEN]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _EMPLOYMENT_STATUSCODE_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Employment_StatusCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_EMPLOYMENT] AND Column_Name = [STATUSCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _FUNDACCOUNT_STATUSCODE_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_FundAccount_StatusCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_FUNDACCOUNT] AND Column_Name = [STATUSCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _FUNDACCOUNT_PLUS_REPORTFREQUENCY_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_FundAccount_Plus_ReportFrequency_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_FUNDACCOUNT] AND Column_Name = [PLUS_REPORTFREQUENCY]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _FUNDACCOUNT_PLUS_PROPOSEDENDOWMENT_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_FundAccount_Plus_ProposedEndowment_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_FUNDACCOUNT] AND Column_Name = [PLUS_PROPOSEDENDOWMENT]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _CHANNEL_TYPE_CODE_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Channel_Type_Code_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [CAMPAIGNACTIVITY] AND Column_Name = [CHANNELTYPECODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _PLUS_SUBTYPE_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_SubType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_RECOGNITIONCREDIT] AND Column_Name = [PLUS_SUBTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _PLEDGE_STATUS_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Pledge_Status_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [STATUSCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _OPPORTUNITY_STATECODE_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Opportunity_StateCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [OPPORTUNITY] AND Column_Name = [STATECODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _OPPORTUNITY_STATUSCODE_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Opportunity_StatusCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [OPPORTUNITY] AND Column_Name = [STATUSCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _OPPORTUNITY_PROPOSALSTATUS_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Opportunity_ProposalStatus_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [OPPORTUNITY] AND Column_Name = [PLUS_PROPOSALSTATUS]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _OPPORTUNITY_PLUS_NEWACCOUNT_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Opportunity_Plus_NewAccount_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [OPPORTUNITY] AND Column_Name = [PLUS_NEWACCOUNT]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _ActivityPointer_StateCode_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_ActivityPointer_StateCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [ACTIVITYPOINTER] AND Column_Name = [STATECODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _ActivityPointer_StatusCode_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_ActivityPointer_StatusCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [ACTIVITYPOINTER] AND Column_Name = [STATUSCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _New_AssociationMembership_StatusCode_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_New_AssociationMembership_StatusCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_ASSOCIATIONMEMBERSHIP] AND Column_Name = [STATUSCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Lds_ExpectancyType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Lds_ExpectancyType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_PLEDGE] AND Column_Name = [LDS_EXPECTANCYTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Recurring_Gift_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Recurring_Gift_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [PLUS_RECURRINGGIFTRULES] AND Column_Name = [PLUS_TYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Recurring_Frequency_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Recurring_Frequency_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [PLUS_RECURRINGGIFTRULES] AND Column_Name = [PLUS_FREQUENCY]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Recurring_StateCode_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Recurring_StateCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [PLUS_RECURRINGGIFTRULES] AND Column_Name = [STATECODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Recurring_StatusCode_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Recurring_StatusCode_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [PLUS_RECURRINGGIFTRULES] AND Column_Name = [STATUSCODE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Lds_BatchType_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Lds_BatchType_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '_Picklist_3
			' -- Ext_From_Statement
		, 'AND Physical_Table_Name = [NEW_BATCHES] AND Column_Name = [LDS_BATCHTYPE]
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Coordinating_Liaison_Needed_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Coordinating_Liaison_Needed_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '
		(SELECT DISTINCT Physical_Table_Name	
			, Column_Name
			, Column_Label
			, Column_Value
			FROM
				(SELECT Physical_Table_Name	
					, Column_Name
					, Column_Label
					, Column_Value
					, Plus_ConstituentNote
					, Plus_CoordinatingLiaisonNeeded
					FROM _Picklist_1
				UNION ALL 
				SELECT Physical_Table_Name	
					, Column_Name
					, Column_Label
					, Column_Value
					, Plus_ConstituentNote
					, Plus_CoordinatingLiaisonNeeded
					FROM _Picklist_2
				UNION ALL 
				SELECT Physical_Table_Name	
					, Column_Name
					, Column_Label
					, Column_Value
					, Plus_ConstituentNote
					, Plus_CoordinatingLiaisonNeeded
					FROM _Picklist_3
				) A
			WHERE 1 = 1
				AND Physical_Table_Name = [Plus_ConstituentNote]
				AND Column_Name = [Plus_CoordinatingLiaisonNeeded]
		) A
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Reason_For_Drop_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Reason_For_Drop_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '
		(SELECT DISTINCT Physical_Table_Name	
			, Column_Name
			, Column_Label
			, Column_Value
			FROM
				(SELECT Physical_Table_Name	
					, Column_Name
					, Column_Label
					, Column_Value
					, Plus_ConstituentNote
					, Plus_ReasonForDrop
					FROM _Picklist_1
				UNION ALL 
				SELECT Physical_Table_Name	
					, Column_Name
					, Column_Label
					, Column_Value
					, Plus_ConstituentNote
					, Plus_ReasonForDrop
					FROM _Picklist_2
				UNION ALL 
				SELECT Physical_Table_Name	
					, Column_Name
					, Column_Label
					, Column_Value
					, Plus_ConstituentNote
					, Plus_ReasonForDrop
					FROM _Picklist_3
				) A
			WHERE 1 = 1
				AND Physical_Table_Name = [Plus_ConstituentNote]
				AND Column_Name = [Plus_ReasonForDrop] 
		) A
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Plus_Type_
-- --------------------------
	( 2 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Plus_Type_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Column_Value INT
			, Column_Label  NVARCHAR(400)
			' -- Ext_Create_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Insert_Fields
		, 'Column_Value
			, Column_Label
			' -- Ext_Select_Statement
		, '
		(SELECT DISTINCT Physical_Table_Name	
			, Column_Name
			, Column_Label
			, Column_Value
			FROM
				(SELECT Physical_Table_Name	
					, Column_Name
					, Column_Label
					, Column_Value
					, Plus_ConstituentNote
					, Plus_Type
					FROM _Picklist_1
				UNION ALL 
				SELECT Physical_Table_Name	
					, Column_Name
					, Column_Label
					, Column_Value
					, Plus_ConstituentNote
					, Plus_Type
					FROM _Picklist_2
				UNION ALL 
				SELECT Physical_Table_Name	
					, Column_Name
					, Column_Label
					, Column_Value
					, Plus_ConstituentNote
					, Plus_Type
					FROM _Picklist_3
				) A
			WHERE 1 = 1
				AND Physical_Table_Name = [Plus_ConstituentNote]
				AND Column_Name = [Plus_Type] 
		) A
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- Gift Rules - _Gift_
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Gift_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_ConstituentDonor UNIQUEIDENTIFIER
			, New_OrganizationDonor UNIQUEIDENTIFIER
			, New_FundAccount UNIQUEIDENTIFIER
			, New_InstitutionalHierarchyId UNIQUEIDENTIFIER
			, New_AssociatedPledge UNIQUEIDENTIFIER
			, OpportunityId UNIQUEIDENTIFIER
			, New_GiftAmount MONEY
			, New_BatchNumber NVARCHAR(50)
			, New_GiftId UNIQUEIDENTIFIER
			, OwnerId UNIQUEIDENTIFIER			
			, New_GiftNumber NVARCHAR(50)
			, StatusCode INT
			, Plus_ReceiptText NVARCHAR(4000)
			, Plus_SpecialGiftInstructions NVARCHAR(4000)
			, Plus_CheckNumber NVARCHAR(50)
			, Plus_GiftSource INT
			, Plus_Kind INT
			, New_TenderType INT
			, New_AccountingDate DATETIME
			, New_ReceiptDate DATETIME
			, New_PostDate DATETIME
			, Plus_PlannedGift BIT
			, New_Transmitted BIT
			, Plus_AnonymousGift BIT
			, Plus_ReceiptDeliveryMethod INT
			, Plus_GiftInstructions NVARCHAR(4000)
			, Plus_AcknowledgementInstructions NVARCHAR(4000)
			, Plus_ExcludeFromReport BIT
			, Plus_IncludeOnYearEndReceipt BIT
			, Plus_GoodsServicesProvided BIT
			, Plus_EntitledBenefitValue MONEY
			, Plus_AcknowledgeContact NVARCHAR(100)
			, Plus_ContactRole INT
			, Plus_Salutation INT
			, Plus_Signer UNIQUEIDENTIFIER
			, Plus_NoAcknowledgement BIT
			, Match_Gift_Number NVARCHAR(50)
			, Plus_Appeal UNIQUEIDENTIFIER
			, Plus_MatchExpected BIT
			, New_Batch UNIQUEIDENTIFIER
			, Plus_Description NVARCHAR(4000)
			, Lds_RecurringGiftRule UNIQUEIDENTIFIER
			, Lds_RecurringGiftGroup UNIQUEIDENTIFIER
			, Percent_Byu_Percent NVARCHAR(10) DEFAULT ''%BYU%''
			, Percent_Byui_Percent NVARCHAR(10) DEFAULT ''%BYUI%''
			, Percent_Byuh_Percent NVARCHAR(10) DEFAULT ''%BYUH%''
			, Ldsbc_Dash_General NVARCHAR(20) DEFAULT ''LDSBC - GENERAL''
			, Zero NVARCHAR(1) DEFAULT ''0''
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			' -- Ext_Create_Fields
		, 'New_ConstituentDonor
			, New_OrganizationDonor
			, New_FundAccount
			, New_InstitutionalHierarchyId
			, New_AssociatedPledge
			, OpportunityId
			, New_GiftAmount
			, New_BatchNumber
			, New_GiftId
			, OwnerId			
			, New_GiftNumber
			, StatusCode
			, Plus_ReceiptText
			, Plus_SpecialGiftInstructions
			, Plus_CheckNumber
			, Plus_GiftSource
			, Plus_Kind
			, New_TenderType
			, New_AccountingDate
			, New_ReceiptDate
			, New_PostDate
			, Plus_PlannedGift
			, New_Transmitted
			, Plus_AnonymousGift
			, Plus_ReceiptDeliveryMethod
			, Plus_GiftInstructions
			, Plus_AcknowledgementInstructions
			, Plus_ExcludeFromReport
			, Plus_IncludeOnYearEndReceipt
			, Plus_GoodsServicesProvided
			, Plus_EntitledBenefitValue
			, Plus_AcknowledgeContact
			, Plus_ContactRole
			, Plus_Salutation
			, Plus_Signer
			, Plus_NoAcknowledgement
			, Match_Gift_Number
			, Plus_Appeal
			, Plus_MatchExpected
			, New_Batch
			, Plus_Description
			, Lds_RecurringGiftRule
			, Lds_RecurringGiftGroup
			' -- Ext_Insert_Fields
		, 'A.New_ConstituentDonor
			, CASE WHEN A.New_ConstituentDonor IS NOT NULL
					AND A.New_OrganizationDonor IS NOT NULL THEN NULL 
				ELSE A.New_OrganizationDonor END AS New_OrganizationDonor
			, A.New_FundAccount
			, A.New_InstitutionalHierarchyId
			, A.New_AssociatedPledge
			, C.OpportunityId
			, A.New_GiftAmount
			, A.New_BatchNumber
			, A.New_GiftId
			, A.OwnerId			
			, A.New_GiftNumber
			, A.StatusCode
			, A.Plus_ReceiptText
			, A.Plus_SpecialGiftInstructions
			, A.Plus_CheckNumber
			, A.Plus_GiftSource
			, A.Plus_Kind
			, A.New_TenderType
			, A.New_AccountingDate
			, A.New_ReceiptDate
			, A.New_PostDate
			, A.Plus_PlannedGift
			, A.New_Transmitted
			, A.Plus_AnonymousGift
			, A.Plus_ReceiptDeliveryMethod
			, A.Plus_GiftInstructions
			, A.Plus_AcknowledgementInstructions
			, A.Plus_ExcludeFromReport
			, A.Plus_IncludeOnYearEndReceipt
			, A.Plus_GoodsServicesProvided
			, A.Plus_EntitledBenefitValue
			, A.Plus_AcknowledgeContact
			, A.Plus_ContactRole
			, A.Plus_Salutation
			, A.Plus_Signer
			, A.Plus_NoAcknowledgement
			, A.Match_Gift_Number
			, A.Plus_Appeal
			, A.Plus_MatchExpected
			, A.New_Batch
			, A.Plus_Description
			, A.Lds_RecurringGiftRule
			, A.Lds_RecurringGiftGroup    				
			' -- Ext_Select_Statement
		, 'Ext_Gift A
				LEFT JOIN Ext_Pledge B ON A.New_AssociatedPledge = B.New_PledgeId
				LEFT JOIN Ext_Opportunity C ON B.New_Opportunity = C.OpportunityId
			' -- Ext_From_Statement
		, 'AND A.New_GiftId NOT IN
				(
				SELECT DISTINCT New_GiftId AS GiftId
					FROM Ext_Gift
					WHERE 1 = 1
						AND StatusCode = 100000003
				UNION
				SELECT DISTINCT New_RelatedGift AS GiftId
					FROM Ext_Recognition_Credit
					WHERE 1 = 1
						AND StatusCode = 100000001
				UNION
				SELECT DISTINCT New_RelatedGift AS GiftId
					FROM Ext_Gift_Hist
					WHERE 1 = 1
						AND StatusCode = 100000001
				)
			AND COALESCE(A.New_ConstituentDonor,A.New_OrganizationDonor) IS NOT NULL
			AND A.New_GiftId NOT IN
				(SELECT A.New_GiftId
					FROM dbo._Gift_ A
						INNER JOIN 
							(SELECT New_GiftId
									FROM dbo._Gift_
							EXCEPT
							SELECT New_RelatedGift AS New_GiftId
									FROM _Gift_Credit_
							) B ON A.New_GiftId = B.New_GiftId				
				)
			CREATE NONCLUSTERED INDEX IX_Gift_C_O_F_I_G_P_G_O_E_A 
					ON dbo._Gift_(StatusCode)
					INCLUDE (
						New_ConstituentDonor
						, New_OrganizationDonor
						, New_FundAccount
						, New_InstitutionalHierarchyId
						, New_GiftAmount
						, New_GiftId
						, OwnerId
						, Plus_EntitledBenefitValue
						, Plus_Appeal
					);
			UPDATE STATISTICS dbo._Gift_;
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- Gift Rules - _Gift_Hist_
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Gift_Hist_' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_RelatedGift UNIQUEIDENTIFIER
			, Plus_Constituent UNIQUEIDENTIFIER
			, Plus_Organization UNIQUEIDENTIFIER
			, Plus_FundAccount UNIQUEIDENTIFIER
			, OwnerId UNIQUEIDENTIFIER
			, Plus_AccountingDate DATETIME
			, StatusCode INT
			, New_Amount MONEY
			, New_ReceiptDate DATETIME
			, New_TenderType INT
			, Plus_Kind INT
			, Plus_Transmitted BIT
			, Plus_Description NVARCHAR(4000)
			, Plus_ReceiptText NVARCHAR(4000)
			, New_Name NVARCHAR(100)
			, Plus_GiftAdjustmentNote NVARCHAR(4000)
			, New_GiftHistoryId UNIQUEIDENTIFIER
			, Plus_GiftNumber NVARCHAR(50)
			, Plus_PostDate DATETIME
			' -- Ext_Create_Fields
		, 'New_RelatedGift
			, Plus_Constituent
			, Plus_Organization
			, Plus_FundAccount
			, OwnerId
			, Plus_AccountingDate
			, StatusCode
			, New_Amount
			, New_ReceiptDate
			, New_TenderType
			, Plus_Kind
			, Plus_Transmitted
			, Plus_Description
			, Plus_ReceiptText
			, New_Name
			, Plus_GiftAdjustmentNote
			, New_GiftHistoryId
			, Plus_GiftNumber
			, Plus_PostDate
			' -- Ext_Insert_Fields
		, 'A.New_RelatedGift
			, A.Plus_Constituent
			, A.Plus_Organization
			, A.Plus_FundAccount
			, A.OwnerId
			, A.Plus_AccountingDate
			, A.StatusCode
			, A.New_Amount
			, A.New_ReceiptDate
			, A.New_TenderType
			, A.Plus_Kind
			, A.Plus_Transmitted
			, A.Plus_Description
			, A.Plus_ReceiptText
			, A.New_Name
			, A.Plus_GiftAdjustmentNote
			, A.New_GiftHistoryId
			, A.Plus_GiftNumber
			, A.Plus_PostDate    				
			' -- Ext_Select_Statement
		, 'Ext_Gift_Hist A
				INNER JOIN Ext_Gift B ON A.New_RelatedGift = B.New_GiftId
			' -- Ext_From_Statement
		, 'AND A.New_RelatedGift IS NOT NULL
			AND A.New_RelatedGift NOT IN
				(
				SELECT DISTINCT New_GiftId AS GiftId
					FROM Ext_Gift
					WHERE 1 = 1
						AND StatusCode = 100000003
				UNION
				SELECT DISTINCT New_RelatedGift AS GiftId
					FROM Ext_Recognition_Credit
					WHERE 1 = 1
						AND StatusCode = 100000001
				UNION
				SELECT DISTINCT New_RelatedGift AS GiftId
					FROM Ext_Gift_Hist
					WHERE 1 = 1
						AND StatusCode = 100000001
				)
			AND COALESCE(A.Plus_Constituent,A.Plus_Organization) IS NOT NULL
			AND COALESCE(B.New_ConstituentDonor,B.New_OrganizationDonor) IS NOT NULL
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- _Email_Dim
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Email_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId NVARCHAR(100) 
			, Email_Key  INT  PRIMARY KEY
			, Email_Group_Key  INT 
			, Email_Address  NVARCHAR(150) 
			, Email_Primary_Yn  NVARCHAR(1) 
			, Email_Type  NVARCHAR(400) 
			, Email_Type_Value  INT 
			, Email_Active_Yn  NVARCHAR(1) 
			, Email_Confirmed_Yn  NVARCHAR(1)
			, Email_Confidential_Yn  NVARCHAR(1)
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'A.New_ConstituentId AS ContactId  
			, ROW_NUMBER() OVER(ORDER BY A.New_EmailId) AS Email_Key 
			, C.Email_Group_Key
			, A.New_Emails AS Email_Address
			, CASE WHEN A.New_Primary = 0 THEN [N] ELSE [Y] END AS Email_Primary_Yn 
			, B.Column_Label AS Email_Type
			, B.Column_Value AS Email_Type_Value 
			, CASE WHEN A.StateCode = 1 THEN [N] ELSE [Y] END AS Email_Active_Yn
			, CASE WHEN A.New_ConfirmationDate IS NULL THEN [N] ELSE [Y] END AS Email_Confirmed_Yn
			, CASE WHEN A.New_Confidential = 0 THEN [N] ELSE [Y] END AS Email_Confidential_Yn    				
			' -- Ext_Select_Statement
		, 'Ext_Email A
				LEFT JOIN _Email_Type_ B ON A.New_EmailType = B.Column_Value
				LEFT JOIN 
						(SELECT New_ConstituentID
							, ROW_NUMBER() OVER(ORDER BY New_ConstituentID) AS Email_Group_Key
							FROM
								(SELECT DISTINCT New_ConstituentID   
									FROM Ext_Email A
										LEFT JOIN _Email_Type_ B ON A.New_EmailType = B.Column_Value										
								) A
						) C ON A.New_ConstituentID = C.New_ConstituentID
			' -- Ext_From_Statement
		, 'AND A.StateCode != 1
			INSERT INTO _Email_Dim
				VALUES(NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			CREATE NONCLUSTERED INDEX IX_Email_Primary_Yn 
					ON _Email_Dim(Email_Primary_Yn ASC)
						INCLUDE (
							ContactId
							, Email_Address
							, Email_Type
							, Email_Type_Value
							, Email_Active_Yn
							, Email_Confirmed_Yn
							, Email_Confidential_Yn
						);
			UPDATE STATISTICS dbo._Email_Dim;
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
	,
-- --------------------------
-- _Hier_Dim
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Hier_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Hier_Key  NVARCHAR(100)  PRIMARY KEY
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),A.New_InstitutionId) AS Hier_Key
			, A.New_Name AS Hier_Name
			, CONVERT(NVARCHAR(100),A.Plus_ParentInstitutionalHieararchy) AS Hier_Parent
			, A.New_Level1 AS Hier_Level_1
			, A.New_Level2 AS Hier_Level_2
			, A.New_Level3 AS Hier_Level_3
			, CASE WHEN A.New_AvailableToAlumni = 0 THEN [N]
				WHEN A.New_AvailableToAlumni = 1 THEN [Y]
				ELSE NULL END AS Hier_Avail_To_Alumni_Yn
			, CASE WHEN A.New_AvailableToStudent = 0 THEN [N]
				WHEN A.New_AvailableToStudent = 1 THEN [Y]
				ELSE NULL END AS Hier_Avail_To_Student_Yn
			, CASE WHEN A.New_IsEndNode = 0 THEN [N]
				WHEN A.New_IsEndNode = 1 THEN [Y]
				ELSE NULL END AS Hier_End_Node_Yn
			, CASE WHEN A.New_EducationUsage = 0 THEN [N]
				WHEN A.New_EducationUsage = 1 THEN [Y]
				ELSE NULL END AS Hier_Education_Usage_Yn
			, CASE WHEN A.New_AssociationUsage = 0 THEN [N]
				WHEN A.New_AssociationUsage = 1 THEN [Y]
				ELSE NULL END AS Hier_Association_Usage_Yn
			, CASE WHEN A.New_DonationUsage = 0 THEN [N]
				WHEN A.New_DonationUsage = 1 THEN [Y]
				ELSE NULL END AS Hier_Donation_Usage_Yn           
			, A.New_Inst   				
			' -- Ext_Select_Statement
		, 'Ext_Institution A 
			' -- Ext_From_Statement
		, 'INSERT INTO _Hier_Dim
			VALUES(0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
,
-- --------------------------
-- _User_Dim
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_User_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'User_Key NVARCHAR(100) PRIMARY KEY
			, User_Full_Name NVARCHAR(200)
			, User_First_Name NVARCHAR(64)
			, User_Last_Name NVARCHAR(64)
			, User_Personal_Email NVARCHAR(100)
			, User_Title NVARCHAR(128)
			, User_Internal_Email NVARCHAR(100)
			, User_Mobile_Phone NVARCHAR(64)
			, User_Domain_Name NVARCHAR(1024)
			' -- Ext_Create_Fields
		, 'User_Key
			, User_Full_Name
			, User_First_Name
			, User_Last_Name
			, User_Personal_Email
			, User_Title
			, User_Internal_Email
			, User_Mobile_Phone
			, User_Domain_Name
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),SystemUserId) AS User_Key
			, FullName AS User_Full_Name
			, FirstName AS User_First_Name
			, LastName AS User_Last_Name
			, PersonalEmailAddress AS User_Personal_Email
			, Title AS User_Title
			, InternalEmailAddress AS User_Internal_Email
			, MobilePhone AS User_Mobile_Phone
			, DomainName AS User_Domain_Name   				
			' -- Ext_Select_Statement
		, 'Ext_System_User
			' -- Ext_From_Statement
		, 'Exec dbo.usp_User_Dim_Zero_Key
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _User_Initiative_Liaison_Dim
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_User_Initiative_Liaison_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'User_Initiative_Liaison_Key NVARCHAR(100) PRIMARY KEY
			, User_Full_Name NVARCHAR(200)
			, User_First_Name NVARCHAR(64)
			, User_Last_Name NVARCHAR(64)
			, User_Personal_Email NVARCHAR(100)
			, User_Title NVARCHAR(128)
			, User_Internal_Email NVARCHAR(100)
			, User_Mobile_Phone NVARCHAR(64)
			, User_Domain_Name NVARCHAR(1024)
			' -- Ext_Create_Fields
		, 'User_Initiative_Liaison_Key
			, User_Full_Name
			, User_First_Name
			, User_Last_Name
			, User_Personal_Email
			, User_Title
			, User_Internal_Email
			, User_Mobile_Phone
			, User_Domain_Name
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),SystemUserId) AS User_Initiative_Liaison_Key
			, FullName AS User_Full_Name
			, FirstName AS User_First_Name
			, LastName AS User_Last_Name
			, PersonalEmailAddress AS User_Personal_Email
			, Title AS User_Title
			, InternalEmailAddress AS User_Internal_Email
			, MobilePhone AS User_Mobile_Phone
			, DomainName AS User_Domain_Name  				
			' -- Ext_Select_Statement
		, 'Ext_System_User
			' -- Ext_From_Statement
		, '
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Expectancy_Fact
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Expectancy_Fact' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Expectancy_Key NVARCHAR(100)
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, ' DISTINCT CONVERT(NVARCHAR(100),A.New_PledgeId) AS Expectancy_Key
			, A.New_TotalPledged
			, CONVERT(VARCHAR(10),A.New_BeginDate,101) AS New_BeginDate
			, COALESCE(CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.New_BeginDate,112)),0) AS Begin_Date_Key
			, CONVERT(VARCHAR(10),A.New_EndDate,101) AS New_EndDate
			, COALESCE(CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.New_EndDate,112)),0) AS End_Date_Key
			, A.New_BalanceDue_Base
			, A.New_TotalPaid_Base
			, A.New_PaymentsToMake
			, A.New_PaymentsReceived
			, A.New_InstallmentAmount_Base
			, CONVERT(VARCHAR(10),A.Plus_InstallmentDate,101) AS Plus_InstallmentDate
			, COALESCE(CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.Plus_InstallmentDate,112)),0) AS Installment_Date_Key
			, COALESCE(CONVERT(VARCHAR(100),A.Plus_ParentGift),Zero) AS Donation_Key
			, COALESCE(CONVERT(NVARCHAR(102),A.OwnerId),Zero) AS User_Key
			, A.Plus_FairMarketValue_Base
			, A.Plus_PresentValue_Base
			, CONVERT(VARCHAR(10),A.New_SignatureDate,101) AS New_SignatureDate
			, COALESCE(CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.New_SignatureDate,112)),0) AS Signature_Date_Key
			, CONVERT(VARCHAR(10),A.New_NotificationDate,101) AS New_NotificationDate
			, COALESCE(CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.New_NotificationDate,112)),0) AS Notification_Date_Key
			, CONVERT(VARCHAR(10),A.Plus_FundingDate,101) AS Plus_FundingDate
			, COALESCE(CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.Plus_FundingDate,112)),0) AS Funding_Date_Key
			, CONVERT(VARCHAR(10),A.Plus_EstimatedMaturityDate,101) AS Plus_EstimatedMaturityDate
			, COALESCE(CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.Plus_EstimatedMaturityDate,112)),0) AS Estimated_Maturity_Date_Key
			, A.Plus_PaymentAmount_Base
			, A.Plus_AnnualAmount_Base
			, CONVERT(VARCHAR(10),A.Plus_PaymentStartDate,101) AS Plus_PaymentStartDate
			, COALESCE(CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.Plus_PaymentStartDate,112)),0) AS Payment_Start_Date_Key
			, COALESCE(CONVERT(NVARCHAR(100),A.Plus_Appeal),Zero) AS Appeal_Key
			, COALESCE(CONVERT(NVARCHAR(100),A.New_FundAccount),Zero) AS Fund_Key
			, COALESCE(CONVERT(NVARCHAR(100),A.New_InstitutionalHierarchy),Zero) AS Hier_Key
			, COALESCE(COALESCE(CONVERT(NVARCHAR(100),A.New_ConstituentDonor), CONVERT(NVARCHAR(100),A.New_OrganizationDonor)),Zero) AS Donor_Key
			, COALESCE(CONVERT(NVARCHAR(100),A.New_Opportunity),Zero) AS Initiative_Key 				
			' -- Ext_Select_Statement
		, 'Ext_Pledge A
			' -- Ext_From_Statement
		, '
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Recurring_Gift_Fact
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Recurring_Gift_Fact' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Recurring_Gift_Key NVARCHAR(100) NOT NULL
			, Donor_Key NVARCHAR(100)
			, Fund_Key NVARCHAR(100)
			, Hier_Key NVARCHAR(100)
			, Appeal_Key NVARCHAR(100)
			, Recurring_Gift_Amt MONEY
			' -- Ext_Create_Fields
		, 'Recurring_Gift_Key
			, Donor_Key
			, Fund_Key
			, Hier_Key
			, Appeal_Key
			, Recurring_Gift_Amt
			' -- Ext_Insert_Fields
		, 'CONVERT(NVARCHAR(100),A.Plus_RecurringGiftRulesId) AS Recurring_Gift_Key
			, COALESCE(CONVERT(NVARCHAR(100),A.Plus_Constituent),A.Zero) AS Donor_Key
			, COALESCE(CONVERT(NVARCHAR(100),A.Plus_FundAccount),A.Zero) AS Fund_Key
			, COALESCE(CONVERT(NVARCHAR(100),A.Plus_InstitutionalHiearchy),A.Zero) AS Hier_Key
			, COALESCE(CONVERT(NVARCHAR(100),A.Plus_CampaignAppeal),A.Zero) AS Appeal_Key
			, A.Plus_Amount AS Recurring_Gift_Amt				
			' -- Ext_Select_Statement
		, 'Ext_Recurring_Gift_Rules A
			' -- Ext_From_Statement
		, '
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Bio_Strat_Plan_Fact
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Bio_Strat_Plan_Fact' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Bio_Strat_Plan_Key INT IDENTITY(1,1)
			, Donor_Key NVARCHAR(100) 
			, Plus_ConstituentNoteId NVARCHAR(100)
			, CreatedOn DATE
			, CreatedBy NVARCHAR(100)
			, ModifiedOn DATE
			, ModifiedBy NVARCHAR(100)
		' -- Ext_Create_Fields
		, 'Donor_Key
			, Plus_ConstituentNoteId 
			, CreatedOn
			, CreatedBy
			, ModifiedOn
			, ModifiedBy
		' -- Ext_Insert_Fields
		, 'COALESCE(CONVERT(NVARCHAR(100),A.Plus_RelatedConstituent), CONVERT(NVARCHAR(100),A.Plus_RelatedOrganization)) AS Donor_Key
			, CONVERT(NVARCHAR(100),A.Plus_ConstituentNoteId) AS Plus_ConstituentNoteId
			, CONVERT(VARCHAR(10),A.CreatedOn,101) AS CreatedOn	
			, CONVERT(NVARCHAR(100),A.CreatedBy) AS CreatedBy
			, CONVERT(VARCHAR(10),A.ModifiedOn,101) AS ModifiedOn
			, CONVERT(NVARCHAR(100),A.ModifiedBy) AS ModifiedBy
			' -- Ext_Select_Statement
		, 'Ext_Constituent_Note A
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Recurring_Gift_Dim
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Recurring_Gift_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	Recurring_Gift_Key NVARCHAR(100) NOT NULL
			, Recurring_Gift_Status_Code NVARCHAR(400)
			, Recurring_Gift_State_Code NVARCHAR(400)
			, Recurring_Gift_Type NVARCHAR(400)
			, Recurring_Gift_Amt MONEY
			, Recurring_Gift_Frequency NVARCHAR(400)
			, Recurring_Gift_Payment_Start_Date DATE
			, Recurring_Gift_Payment_Stop_Date DATE
			, Recurring_Gift_Group NVARCHAR(100)
			, Active NVARCHAR(10) DEFAULT ''Active''
			, Payroll_Deduction NVARCHAR(20) DEFAULT ''Payroll Deduction''
		' -- Ext_Create_Fields
		, 'Recurring_Gift_Key
			, Recurring_Gift_Status_Code
			, Recurring_Gift_State_Code
			, Recurring_Gift_Type
			, Recurring_Gift_Amt
			, Recurring_Gift_Frequency
			, Recurring_Gift_Payment_Start_Date
			, Recurring_Gift_Payment_Stop_Date
			, Recurring_Gift_Group
		' -- Ext_Insert_Fields
		, 'CONVERT(NVARCHAR(100),A.Plus_RecurringGiftRulesId) AS Recurring_Gift_Key
			, E.Column_Label AS Recurring_Gift_Status_Code
			, F.Column_Label AS Recurring_Gift_State_Code
			, C.Column_Label AS Recurring_Gift_Type
			, A.Plus_Amount AS Recurring_Gift_Amt
			, D.Column_Label AS Recurring_Gift_Frequency
			, CONVERT(NVARCHAR(10),A.Plus_PaymentStart,110) AS Recurring_Gift_Payment_Start_Date
			, CONVERT(NVARCHAR(10),A.Plus_PaymentStop,110) AS Recurring_Gift_Payment_Stop_Date
			, B.Plus_Name AS Recurring_Gift_Group
			' -- Ext_Select_Statement
		, 'Ext_Recurring_Gift_Rules A
			LEFT JOIN Ext_Payroll_Group B ON A.Plus_Group = B.Plus_PayrollGroupId
			LEFT JOIN _Recurring_Gift_Type_ C ON A.Plus_Type = C.Column_Value
			LEFT JOIN _Recurring_Frequency_ D ON A.Plus_Frequency = D.Column_Value
			LEFT JOIN _Recurring_StateCode_ E ON A.StateCode = E.Column_Value
			LEFT JOIN _Recurring_StatusCode_ F ON A.StatusCode = F.Column_Value
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Employment_Dim
-- --------------------------
	( 3 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Employment_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId  NVARCHAR(100) 
			, Employment_Key  INT  PRIMARY KEY
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
			, Y NVARCHAR(1) DEFAULT ''Y''
			, N NVARCHAR(1) DEFAULT ''N''
			, BYU NVARCHAR(3) DEFAULT ''BYU''
			, [Current] NVARCHAR(10) DEFAULT ''Current''
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),E.New_EmploymentsId) AS ContactId  
			, ROW_NUMBER() OVER(ORDER BY E.New_EmploymentId) AS Employment_Key
			, B.Employment_Group_Key
			, CASE WHEN E.New_PaymentFrequency IS NULL THEN E.[N] ELSE E.[Y] END AS Employment_Donor_Yn 
			, CASE WHEN E.StateCode = 0 THEN E.[Y] ELSE E.[N] END AS Employment_Active_Yn 
			, E.New_Department AS Employment_Church_Affil_Dept
			, CASE WHEN E.New_ChurchAff = 1 THEN NI.New_Name 
				WHEN E.New_ChurchAff = 0 THEN COALESCE(REPLACE(E.New_Department,[Emp_Dash],[Blank]),A.Name,E.Plus_AlternateOrganizationName)
				ELSE NULL END AS Employer
			, E.New_Title AS Job_Title
			, NJ.New_Name AS Job_Code
			, NIB.New_Name AS Industry
			, NS.New_Source AS Source
			, CASE WHEN E.New_ChurchAff = 1 THEN E.[Y] 
				WHEN E.New_ChurchAff = 0 THEN E.[N] 
				ELSE NULL END AS Church_Affiliated
			, CONVERT(VARCHAR(10),E.New_DateStarted,101) AS Start_Date
			, CONVERT(VARCHAR(10),E.New_DateEnded,101) AS End_Date           
			, CASE WHEN E.New_Internship = 1 THEN E.[Y]
				WHEN E.New_Internship = 0 THEN E.[N] 
				ELSE NULL END AS Internship
			, P.Column_Label AS Church_Employment_Status 
			, NI.New_Name AS Employment_Institutional_Hierarchy
			, CONVERT(NVARCHAR(100),E.New_InstitutionalHierarchyId) AS New_InstitutionalHierarchyId
			, A.New_LdspId AS Employer_Ldsp_Id
			, S.Column_Label AS StatusCode
			, E.ModifiedOn AS Employment_Modified_On_Date
			, E.Lds_CampusAddress AS Employment_Lds_CampusAddress										
			' -- Ext_Select_Statement
		, 'Ext_Employment E
				LEFT JOIN Ext_Source NS ON E.New_Source = NS.New_SourceId
				LEFT JOIN Ext_Institution NI ON E.New_InstitutionalHierarchyId = NI.New_InstitutionId
				LEFT JOIN Ext_Industry NIB ON E.New_IndustryCategory = NIB.New_IndustryId
				LEFT JOIN Ext_Job_Code NJ ON E.New_JobCode = NJ.New_JobCodeId
				LEFT JOIN Ext_Account A ON E.New_Company = A.AccountId
				LEFT JOIN _Plus_Church_Employment_Status_ P ON E.Plus_ChurchEmploymentStatus = P.Column_Value
				LEFT JOIN _Employment_StatusCode_ S ON E.StatusCode = S.Column_Value	
				LEFT JOIN 
					(
					SELECT New_EmploymentsId AS ContactId
						, ROW_NUMBER() OVER(ORDER BY New_EmploymentsId) AS Employment_Group_Key
						FROM
							(SELECT DISTINCT New_EmploymentsId    
								FROM Ext_Employment) A
					) B ON E.New_EmploymentsId = B.ContactId
			' -- Ext_From_Statement
		, 'Exec dbo.usp_Employment_Dim_Zero_Key
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Address_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Address_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId NVARCHAR(100)
			, Address_Key BIGINT  PRIMARY KEY
			, Address_Group_Key BIGINT
			, Address_Primary_Yn NVARCHAR(1)
			, Address_Street_1 NVARCHAR(100)
			, Address_Street_2 NVARCHAR(100)
			, Address_Street_3 NVARCHAR(100)
			, Address_City NVARCHAR(100)
			, Address_County NVARCHAR(100)
			, Address_County_Code NVARCHAR(10)
			, Address_County_Id NVARCHAR(100)
			, Address_State_Province NVARCHAR(100)
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
		' -- Ext_Create_Fields
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
		' -- Ext_Insert_Fields
		, 'CONVERT(NVARCHAR(100),F.ContactId) AS ContactId
			, ROW_NUMBER() OVER(ORDER BY F.New_AddressId) AS Address_Key
			, F.Address_Group_Key
			, F.Address_Primary_Yn
			, F.Address_Street_1
			, F.Address_Street_2
			, F.Address_Street_3
			, F.Address_City
			, F.Address_County
			, F.Address_County_Code
			, CONVERT(NVARCHAR(100),F.Address_County_Id) AS Address_County_Id
			, F.Address_State_Province
			, F.Address_State_Code
			, F.Address_Country
			, F.Address_Post_Code_Full
			, F.Address_Post_Code_Last_4
			, F.Address_Printing_Line_1
			, F.Address_Printing_Line_2
			, F.Address_Display
			, F.Address_Quality_Status
			, F.Address_Quality_Status_Value			
			, F.Address_Longitude
			, F.Address_Latitude
			, F.Address_Active_Yn
			, F.Address_Confirmed_Yn
			, F.Address_Confidential_Yn
			, F.Address_Type
			, F.Address_Type_Value
			, F.Address_Printing_Line_3
			, F.Address_Printing_Line_4
			' -- Ext_Select_Statement
		, '(SELECT A.ContactId
				, A.New_AddressId
				, F.Address_Group_Key
				, B.Address_Primary_Yn
				, A.Address_Street_1
				, A.Address_Street_2
				, A.Address_Street_3
				, C.Address_City
				, C.Address_County
				, C.Address_County_Code
				, C.Address_County_Id
				, C.Address_State_Province
				, C.Address_State_Code
				, C.Address_Country
				, C.Address_Post_Code_Full
				, B.Address_Printing_Line_1
				, D.Address_Printing_Line_2
				, A.Address_Display
				, E.Address_Quality_Status
				, E.Address_Quality_Status_Value
				, A.Address_Post_Code_Last_4
				, A.Address_Longitude
				, A.Address_Latitude
				, B.Address_Active_Yn
				, B.Address_Confirmed_Yn
				, B.Address_Confidential_Yn
				, E.Address_Type
				, E.Address_Type_Value
				, C.Address_Printing_Line_3
				, C.Address_Printing_Line_4
				FROM
					(SELECT DISTINCT OA.Plus_RelatedContact AS ContactId
						, OA.New_AddressId
						, OA.New_Street1 AS Address_Street_1
						, OA.New_Street2 AS Address_Street_2
						, OA.New_Street3 AS Address_Street_3
						, OA.New_Zip4 AS Address_Post_Code_Last_4
						, CONVERT(NVARCHAR(300),OA.Plus_AddressDisplay) AS Address_Display
						, OA.Plus_Longitude AS Address_Longitude
						, OA.Plus_Latitude AS Address_Latitude
						FROM Ext_Address OA
					) A LEFT JOIN
					(SELECT DISTINCT OA.New_AddressId
						, CASE WHEN OA.New_Primary = 1 THEN [Y] 
							WHEN OA.New_Primary = 0 THEN [N]
							ELSE [Dash] END AS Address_Primary_Yn
						, COALESCE(OA.New_Street1,[Space]) + COALESCE(OA.New_Street2,[Space]) + COALESCE(OA.New_Street3,[Space]) AS Address_Printing_Line_1 
						, CASE WHEN OA.StateCode = 0 THEN [Y] ELSE [N] END AS Address_Active_Yn
						, CASE WHEN OA.New_ConfirmedDate IS NULL THEN [N] ELSE [Y] END AS Address_Confirmed_Yn
						, CASE WHEN OA.New_Confidential = 0 THEN [N] ELSE [Y] END AS Address_Confidential_Yn
						, [Y]
						FROM Ext_Address OA
					) B ON A.New_AddressId = B.New_AddressId LEFT JOIN
					(SELECT DISTINCT OA.New_AddressId
						, CITY.Address_City
						, OA.Lds_County AS Address_County
						, NCTY.Plus_CountyCode AS Address_County_Code
						, NCTY.New_CountyId AS Address_County_Id
						, OA.Lds_StateProvince AS Address_State_Province
						, OA.Lds_StateProvince AS Address_State_Code
						, NCRY.New_Name AS Address_Country
						, OA.Lds_PostalCode AS Address_Post_Code_Full
						, OA.Lds_PostalCode AS Address_Printing_Line_3
						, NCRY.New_Name AS Address_Printing_Line_4
						FROM LDSPhilanthropiesDW.dbo.Ext_Address OA
							LEFT JOIN Ext_City NC ON OA.New_CityLookUp = NC.New_CityId
							LEFT JOIN Ext_County NCTY ON OA.New_CountyId = NCTY.New_CountyId 
							LEFT JOIN Ext_State NST ON OA.New_StatesProvinces = NST.New_StateId
							LEFT JOIN Ext_Country NCRY ON OA.New_CountryRegions = NCRY.New_CountryId
							LEFT JOIN Ext_Postal PC ON OA.New_PostalCodes = PC.New_PostalCodeId
							LEFT JOIN Uf_Address_City() CITY ON OA.New_AddressId = CITY.New_AddressId
					) C ON A.New_AddressId = C.New_AddressId LEFT JOIN
			' -- Ext_From_Statement
		, 'INSERT INTO _Address_Dim
			VALUES(NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			CREATE NONCLUSTERED INDEX IX_Address_Primary_Yn 
					ON _Address_Dim(Address_Primary_Yn ASC)
						INCLUDE (
							ContactId
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
						);
			UPDATE STATISTICS dbo._Address_Dim;
			'-- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, NULL -- Ext_Select_Statement_2
		, '			(SELECT DISTINCT OA.New_AddressId
						, CASE WHEN AF.New_UseStateAbreviation = 1 THEN COALESCE(OA.Lds_City,[Space]) + [Comma_Space] + COALESCE(OA.Lds_StateProvince,[Space]) 
							ELSE COALESCE(OA.Lds_City,[Space]) + [Comma_Space] + COALESCE(OA.Lds_StateProvince,[Space]) END AS Address_Printing_Line_2
						FROM LDSPhilanthropiesDW.dbo.Ext_Address OA
							LEFT JOIN Ext_City NC ON OA.New_CityLookUp = NC.New_CityId
							LEFT JOIN Ext_County NCTY ON OA.New_CountyId = NCTY.New_CountyId 
							LEFT JOIN Ext_State NST ON OA.New_StatesProvinces = NST.New_StateId
							LEFT JOIN Ext_Country NCRY ON OA.New_CountryRegions = NCRY.New_CountryId
							LEFT JOIN Ext_Postal PC ON OA.New_PostalCodes = PC.New_PostalCodeId 
							LEFT JOIN Ext_Address_Format AF ON NCRY.Plus_AdderessFormat = AF.Plus_AddressFormatId
					) D ON A.New_AddressId = D.New_AddressId LEFT JOIN
					(SELECT DISTINCT OA.New_AddressId
						, Q.Column_Label AS Address_Quality_Status
						, Q.Column_Value AS Address_Quality_Status_Value
						, A.Column_Label AS Address_Type
						, A.Column_Value AS Address_Type_Value
						FROM LDSPhilanthropiesDW.dbo.Ext_Address OA
							LEFT JOIN _Address_Quality_ Q ON OA.Plus_OneAccordQuality = Q.Column_Value 
							LEFT JOIN _Address_Type_ A ON OA.New_AddressType = A.Column_Value
					) E ON A.New_AddressId = E.New_AddressId
					LEFT JOIN
						(
						SELECT Plus_RelatedContact AS ContactId
							, ROW_NUMBER() OVER(ORDER BY Plus_RelatedContact) AS Address_Group_Key
							FROM
								(SELECT DISTINCT Plus_RelatedContact   
									FROM Ext_Address) A
						) F ON A.ContactId = F.ContactId
				WHERE 1 = 1
					AND B.Address_Active_Yn = B.[Y]
			) F
			' -- Ext_From_Statement_2
		, NULL -- Ext_Create_Fields_2
		, NULL -- Ext_Create_Fields_3
		, NULL -- Ext_Where_Statement_2
		, NULL -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Award_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Award_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId NVARCHAR(100)
			, Award_Key INT  PRIMARY KEY
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),RA.New_Constituent) AS ContactId
			, ROW_NUMBER() OVER(ORDER BY RA.New_RecognitionAssociationId) AS Award_Key
			, A.Award_Group_Key 
			, AWD.Column_Label AS Award_Type
			, AA.Column_Label AS Award_Affiliate_Type
			, CONVERT(VARCHAR(10),RA.New_StartDate,101) AS Award_Start_Dt
			, CONVERT(VARCHAR(10),RA.New_EndDate,101)  AS Award_End_Dt
			, RA.Plus_ScholarshipGrantingOffice AS Award_Scholarship_Granting_Office
			, RA.Plus_ScholarshipAwardTerm AS Award_Scholarship_Term
			, RA.Plus_ScholarshipCode AS Award_Scholarship_Code
			, RA.Plus_ScholarshipOfferedAmount AS Award_Scholarship_Amount
			, CONVERT(VARCHAR(10),RA.Plus_ScholarshipAwardDate,101) AS Award_Scholarship_Dt
			, R.New_Name AS Award_Name				
			' -- Ext_Select_Statement
		, 'Ext_Recognition_Association RA
				LEFT JOIN Ext_Recognition R ON RA.New_Recognition = R.New_RecognitionId
				LEFT JOIN _Award_Type_ AWD ON R.New_Type = AWD.Column_Value
				LEFT JOIN _Award_Affiliate_ AA ON R.New_Affiliate = AA.Column_Value
				LEFT JOIN 
					(
					SELECT New_Constituent
						, ROW_NUMBER() OVER(ORDER BY New_Constituent) AS Award_Group_Key
						FROM
							(SELECT DISTINCT New_Constituent    
								FROM Ext_Recognition_Association) A
					) A ON RA.New_Constituent = A.New_Constituent
			' -- Ext_From_Statement
		, 'INSERT INTO _Award_Dim
			VALUES(NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Phone_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Phone_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId NVARCHAR(100)
			, Phone_Key INT  PRIMARY KEY
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),A.New_NumberId) AS ContactId
			, ROW_NUMBER() OVER(ORDER BY New_PhoneId) AS Phone_Key
			, E.Phone_Group_Key
			, A.New_PhoneNumber AS Phone_Number
			, A.New_CountryCode AS Phone_Country_Code
			, A.New_Ext AS Phone_Extension
			, CASE WHEN A.StatusCode = 100000002 THEN [Y]
				ELSE [N] END AS Phone_Active_Yn
			, CASE WHEN A.New_ConfirmationDate IS NOT NULL THEN [Y]
				ELSE [N] END AS Phone_Confirmed_Yn
			, CASE WHEN A.New_Primary = 1 THEN [Y]
				WHEN A.New_Primary = 0 THEN [N]
				ELSE [Dash] END AS Phone_Primary_Yn
			, CASE WHEN A.New_ReceiveText = 1 THEN [Y]
				WHEN A.New_ReceiveText = 0 THEN [N]
				ELSE [Dash] END AS Phone_Recieve_Text_Yn
			, CASE WHEN A.New_Confidential = 1 THEN [Y]
				WHEN A.New_Confidential = 0 THEN [N]
				ELSE [Dash] END AS Phone_Confidential_Yn
			, B.Column_Label AS Phone_Type
			, C.Column_Label AS Phone_Line_Type
			, D.Column_Label AS Phone_Preferred_Time
			, B.Column_Value AS Phone_Type_Value
			, C.Column_Value AS Phone_Line_Type_Value
			, D.Column_Value AS Phone_Preferred_Time_Value				
			' -- Ext_Select_Statement
		, 'Ext_Phone A
				LEFT JOIN _Phone_Type_ B ON A.New_Type = B.Column_Value
				LEFT JOIN _Phone_Line_Type_ C ON A.Plus_LineType = C.Column_Value
				LEFT JOIN _Phone_Preferred_Time_ D ON A.New_PreferredTime = D.Column_Value
				LEFT JOIN 
					(
					SELECT New_NumberId
						, ROW_NUMBER() OVER(ORDER BY A.New_NumberId) AS Phone_Group_Key
						FROM
							(SELECT DISTINCT New_NumberId    
								FROM Ext_Phone) A
					) E ON A.New_NumberId = E.New_NumberId
			' -- Ext_From_Statement
		, 'AND A.StatusCode = 100000002
			INSERT INTO _Phone_Dim
				VALUES(NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			CREATE NONCLUSTERED INDEX IX_Phone_Primary_Yn 
					ON _Phone_Dim(Phone_Primary_Yn ASC)
						INCLUDE (
							ContactId
							, Phone_Number
							, Phone_Country_Code
							, Phone_Extension
							, Phone_Active_Yn
							, Phone_Confirmed_Yn
							, Phone_Recieve_Text_Yn
							, Phone_Confidential_Yn
							, Phone_Type
							, Phone_Line_Type
							, Phone_Preferred_Time
							, Phone_Type_Value
							, Phone_Line_Type_Value
							, Phone_Preferred_Time_Value
						);
			UPDATE STATISTICS dbo._Phone_Dim;
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Drop_Include_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Drop_Include_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Drop_Include_Key INT PRIMARY KEY
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
			, ContactId NVARCHAR(100)
			' -- Ext_Create_Fields
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
			, ContactId
			' -- Ext_Insert_Fields
		, 'ROW_NUMBER() OVER(ORDER BY A.New_DropIncludeId) AS Drop_Include_Key 
			, CONVERT(NVARCHAR(100),A.New_InstitutionalHierarchy) AS Drop_Include_Instit_Hierarchy
			, B.Column_Label AS Drop_Include_Type 
			, CASE WHEN A.New_VisitDeliveryType = 1 THEN A.[Y] ELSE A.[N] END AS Drop_Include_Visit_Yn
			, CASE WHEN A.New_WebDeliveryType = 1 THEN A.[Y] ELSE A.[N] END AS Drop_Include_Web_Yn 
			, CASE WHEN A.New_PhoneDeliveryType = 1 THEN A.[Y] ELSE A.[N] END AS Drop_Include_Phone_Yn  
			, CASE WHEN A.New_EmailDeliveryType = 1 THEN A.[Y] ELSE A.[N] END AS Drop_Include_Email_Yn
			, C.Column_Label AS Drop_Include_Scope 
			, D.Column_Label AS Drop_Include_Comm_Type 
			, B.Column_Value AS Drop_Include_Type_Value
			, C.Column_Value AS Drop_Include_Scope_Value
			, D.Column_Value AS Drop_Include_Comm_Type_Value 
			, E.Column_Value AS Drop_Include_Reason_Value 
			, I.Drop_Include_Group_Key
			, CASE WHEN A.New_MailDeliveryType = 1 THEN A.[Y] ELSE A.[N] END AS Drop_Include_Mail_Yn
			, CASE WHEN A.New_TextDeliveryType = 1 THEN A.[Y] ELSE A.[N] END AS Drop_Include_Text_Yn
			, CONVERT(VARCHAR(10),A.New_StartDate,101) AS New_StartDate
			, CONVERT(VARCHAR(10),A.New_EndDate,101) AS New_EndDate
			, F.New_ShortName AS Association
			, G.Name AS Campaign
			, H.New_Inst
			, H.New_Name AS Hier_Name
			, CONVERT(NVARCHAR(100),A.New_DropIncludesId) AS ContactId
			' -- Ext_Select_Statement
		, 'Ext_Drop_Include A
				LEFT JOIN _Drop_Include_Type_ B ON A.New_Type = B.Column_Value
				LEFT JOIN _Drop_Include_Scope_ C ON A.New_Interaction = C.Column_Value
				LEFT JOIN _Drop_Include_CommType_ D ON A.New_CommType = D.Column_Value
				LEFT JOIN _Drop_Include_Reason_ E ON A.New_Reason = E.Column_Value
				LEFT JOIN Ext_Association F ON A.New_Association = F.New_AssociationId
				LEFT JOIN Ext_Campaign G ON A.Plus_CampaignId = G.CampaignId
				LEFT JOIN Ext_Institution H ON A.New_InstitutionalHierarchy = H.New_InstitutionId
				LEFT JOIN 
					(
					SELECT New_DropIncludesId
						, ROW_NUMBER() OVER(ORDER BY A.New_DropIncludesId) AS Drop_Include_Group_Key
						FROM
							(SELECT DISTINCT New_DropIncludesId    
								FROM Ext_Drop_Include) A
					) I ON A.New_DropIncludesId = I.New_DropIncludesId
			' -- Ext_From_Statement
		, 'INSERT INTO _Drop_Include_Dim
				VALUES(0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)	
,
-- --------------------------
-- _Language_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Language_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId  NVARCHAR(100) 
			, Language_Key  INT  PRIMARY KEY
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),A.New_LanguageSAId) AS ContactId
			, ROW_NUMBER() OVER(ORDER BY A.New_LanguageSpecialAffiliationId) AS Language_Key
			, F.Drop_Include_Group_Key
			, B.Column_Label AS Language_Name 
			, C.Column_Label AS Language_Speech_Level 
			, D.Column_Label AS Language_Read_Level 
			, E.Column_Label AS Language_Write_Level 
			, B.Column_Value AS Language_Name_Value 
			, C.Column_Value AS Language_Speech_Level_Value 
			, D.Column_Value AS Language_Read_Level_Value 
			, E.Column_Value AS Language_Write_Level_Value 
			, CASE WHEN A.New_Teacher = 0 THEN [N] ELSE [Y] END AS Language_Teacher_Yn 
			, CASE WHEN A.New_Missionary = 0 THEN [N] ELSE [Y] END AS Language_Mission_Yn 
			, CASE WHEN A.New_BusinessPerson = 0 THEN [N] ELSE [Y] END AS Language_Business_Yn 
			, CASE WHEN A.New_Translator = 0 THEN [N] ELSE [Y] END AS Language_Translator_Yn 
			, NS.New_Source AS Source										
			' -- Ext_Select_Statement
		, 'Ext_Language A
				LEFT JOIN Ext_Source NS ON A.New_Source = NS.New_SourceId
				LEFT JOIN _Language_Lang_ B ON A.New_Language = B.Column_Value
				LEFT JOIN _Language_Speech_ C ON A.New_Speech = C.Column_Value
				LEFT JOIN _Language_Read_ D ON A.New_ReadLevel = D.Column_Value
				LEFT JOIN _Language_Write_ E ON A.New_WriteLevel = E.Column_Value
				LEFT JOIN 
					(
					SELECT New_LanguageSAId
						, ROW_NUMBER() OVER(ORDER BY A.New_LanguageSAId) AS Drop_Include_Group_Key
						FROM
							(SELECT DISTINCT New_LanguageSAId    
								FROM Ext_Language) A
					) F ON A.New_LanguageSAId = F.New_LanguageSAId
			' -- Ext_From_Statement
		, 'INSERT INTO _Language_Dim
			VALUES(NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Association_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Association_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId  NVARCHAR(100) 
			, Association_Key  INT  PRIMARY KEY
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
			, Y NVARCHAR(1) DEFAULT ''Y''
			, Presidents_Leadership_Council NVARCHAR(50) DEFAULT ''President''''s Leadership Council''
			, [Current] NVARCHAR(10) DEFAULT ''Current''
			, David_O_McKay_Circle NVARCHAR(50) DEFAULT ''David O McKay Circle''
			, Genuine_Gold_Society NVARCHAR(50) DEFAULT ''Genuine Gold Society''
			, National_Advisory_Council NVARCHAR(50) DEFAULT ''National Advisory Council''
			, BYU_Knight_Society NVARCHAR(50) DEFAULT ''BYU Knight Society''
			, BYUI_Legacy_Society NVARCHAR(50) DEFAULT ''BYUI Legacy Society''
			, BYUH_Cowley_Society NVARCHAR(50) DEFAULT ''BYUH Cowley Society''
			, LDSBC_Fox_Society NVARCHAR(50) DEFAULT ''LDSBC Fox Society''
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),COALESCE(A.New_ConstituentId, A.New_RelatedOrganization)) AS ContactId
			, ROW_NUMBER() OVER(ORDER BY A.New_AssociationMembershipId) AS Association_Key
			, F.Association_Group_Key
			, B.New_Name AS Association_Name 
			, B.New_Acronym AS Association_Acronym 
			, B.New_Region AS Association_Region
			, B.New_ChapterLevel AS Association_Chapter_Level 
			, C.Column_Label AS Association_Type
			, C.Column_Value AS Association_Type_Value 
			, D.Column_Label AS Association_Sponsor
			, D.Column_Value AS Association_Sponsor_Value 
			, CASE WHEN B.StateCode = 0 THEN [Y] ELSE [N] END AS Association_Active_Yn
			, CONVERT(VARCHAR(10),A.New_StartDate,101) AS New_StartDate
			, CONVERT(VARCHAR(10),A.New_EndDate,101) AS New_EndDate
			, E.Column_Label AS StatusCode										
			' -- Ext_Select_Statement
		, 'Ext_Association_Membership A
				LEFT JOIN Ext_Association B ON A.New_Association = B.New_AssociationId
				LEFT JOIN _Association_Type_ C ON B.New_Type = C.Column_Value
				LEFT JOIN _Association_Sponsor_ D ON B.New_Sponsor = D.Column_Value
				LEFT JOIN _New_AssociationMembership_StatusCode_ E ON A.StatusCode = E.Column_Value	
				LEFT JOIN 
					(
					SELECT ContactId
						, ROW_NUMBER() OVER(ORDER BY ContactId) AS Association_Group_Key
						FROM
							(SELECT DISTINCT COALESCE(New_ConstituentId, New_RelatedOrganization) AS ContactId  
								FROM Ext_Association_Membership) A
					) F ON COALESCE(A.New_ConstituentId, A.New_RelatedOrganization) = F.ContactId
			' -- Ext_From_Statement
		, 'INSERT INTO _Association_Dim
			VALUES(NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Connection_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Connection_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId NVARCHAR(100)
			, Connection_Key INT PRIMARY KEY
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
			, Spouse NVARCHAR(10) DEFAULT ''Spouse''
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),A.ContactId) AS ContactId
			, ROW_NUMBER() OVER(ORDER BY A.ContactId,A.Contact_Name,A.Relationship,A.Relationship_ContactId,A.Relationship_Ldspid,A.Relationship_Name,B.New_Emails) AS Connection_Key
			, E.Connection_Group_Key
			, A.Contact_Name
			, A.Relationship
			, CONVERT(NVARCHAR(100),A.Relationship_ContactId) AS Relationship_ContactId
			, A.Relationship_LdspId
			, A.Relationship_Name
			, C.New_PhoneNumber AS Relationship_Phone_Number
			, B.New_Emails AS Relationship_Email
			, A.Relationship_First_Name
			, A.Relationship_Last_Name
			, CASE WHEN SUBSTRING(Relationship_Birth_Date,1,2) IN ([N01],[N02],[N03],[N04],[N05],[N06],[N07],[N08],[N09],[N10],[N11],[N12])
						AND SUBSTRING(Relationship_Birth_Date,4,2) IN ([N01],[N02],[N03],[N04],[N05],[N06],[N07],[N08],[N09],[N10],
							[N11],[N12],[N13],[N14],[N15],[N16],[N17],[N18],[N19],[N20],
							[N21],[N22],[N23],[N24],[N25],[N26],[N27],[N28],[N29],[N30],[N31]) 
						AND SUBSTRING(Relationship_Birth_Date,7,2) IN ([N19],[N20])
						THEN CONVERT(VARCHAR(10),A.Relationship_Birth_Date,101) ELSE NULL END AS Relationship_Birth_Date
			, D.Relationship_Age
			, A.Relationship_Middle_Name
			, A.Relationship_Birth_Name										
			' -- Ext_Select_Statement
		, '(SELECT DISTINCT              
					A.Record1Id AS ContactId
					, COALESCE(D.fullname, F.Name,A.Plus_AlternateName) AS Contact_Name
					, B.Name AS Relationship
					, A.Record2Id AS Relationship_ContactId
					, COALESCE(E.New_LdspId, G.New_LdspId) AS Relationship_LdspId
					, COALESCE(E.FullName, G.Name,A.Plus_AlternateName) AS Relationship_Name
					, E.FirstName AS Relationship_First_Name
					, E.LastName AS Relationship_Last_Name
					, E.New_BirthDate AS Relationship_Birth_Date
					, NULL AS Relationship_Age
					, E.MiddleName AS Relationship_Middle_Name
					, E.New_BirthName AS Relationship_Birth_Name
					FROM Ext_Connection A
						INNER JOIN Ext_Connection_Role B ON A.Record2RoleId = B.ConnectionRoleId 
						LEFT JOIN Ext_Contact D ON A.Record1Id = D.ContactId 
						LEFT JOIN Ext_Contact E ON  A.Record2Id = E.ContactId
						LEFT JOIN Ext_Account F ON  A.Record1Id = F.AccountId
						LEFT JOIN Ext_Account G ON  A.Record2Id = G.AccountId
					WHERE 1 = 1 
						AND EXISTS
							(SELECT *
								FROM Ext_Connection H
								WHERE 1 = 1 
									AND A.ConnectionId = H.ConnectionId
									AND (H.Record2ObjectTypeCode = 1 OR H.Record2ObjectTypeCode = 2)
							)
				UNION
				SELECT DISTINCT              
					A.Record2Id AS ContactId
					, COALESCE(E.FullName, G.Name,A.Plus_AlternateName) AS Contact_Name
					, C.Name AS Relationship
					, A.Record1Id AS Relationship_ContactId
					, COALESCE(D.New_LdspId, F.New_LdspId) AS Relationship_LdspId
					, COALESCE(D.fullname, F.Name,A.Plus_AlternateName) AS Relationship_Name
					, D.FirstName AS Relationship_First_Name
					, D.LastName AS Relationship_Last_Name
					, D.New_BirthDate AS Relationship_Birth_Date
					, NULL AS Relationship_Age
					, D.MiddleName AS Relationship_Middle_Name
					, D.New_BirthName AS Relationship_Birth_Name
					FROM Ext_Connection A
						INNER JOIN Ext_Connection_Role C ON A.Record1RoleId = C.ConnectionRoleId
						LEFT JOIN Ext_Contact D ON A.Record1Id = D.ContactId 
						LEFT JOIN Ext_Contact E ON  A.Record2Id = E.ContactId
						LEFT JOIN Ext_Account F ON  A.Record1Id = F.AccountId
						LEFT JOIN Ext_Account G ON  A.Record2Id = G.AccountId
					WHERE 1 = 1 
						AND EXISTS
							(SELECT *
								FROM Ext_Connection H
								WHERE 1 = 1 
									AND A.ConnectionId = H.ConnectionId
									AND (Record1ObjectTypeCode = 1 OR Record1ObjectTypeCode = 2)
							)
				) A LEFT JOIN 
				(
				SELECT New_ConstituentId
					, New_Emails 
					FROM Ext_Email
					WHERE 1 = 1
						AND New_Primary = 1
				) B ON A.Relationship_ContactId = B.New_ConstituentId LEFT JOIN
				(
				SELECT New_NumberId
					, New_PhoneNumber
					FROM Ext_Phone
					WHERE 1 = 1
						AND New_Primary = 1
				) C ON A.Relationship_ContactId = C.New_NumberId LEFT JOIN
				(SELECT Donor_Key
					, CASE WHEN DATEADD(YEAR, DATEDIFF (YEAR, New_BirthDate, GETDATE()), New_BirthDate) > GETDATE()
						THEN DATEDIFF(YEAR, New_BirthDate, GETDATE()) - 1
						ELSE DATEDIFF(YEAR, New_BirthDate, GETDATE()) END AS Relationship_Age
					FROM
						(SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
							, CASE WHEN SUBSTRING(New_BirthDate,1,2) IN ([N01],[N02],[N03],[N04],[N05],[N06],[N07],[N08],[N09],[N10],[N11],[N12])
									AND SUBSTRING(New_BirthDate,4,2) IN ([N01],[N02],[N03],[N04],[N05],[N06],[N07],[N08],[N09],[N10],
										[N11],[N12],[N13],[N14],[N15],[N16],[N17],[N18],[N19],[N20],
										[N21],[N22],[N23],[N24],[N25],[N26],[N27],[N28],[N29],[N30],[N31]) 
									AND SUBSTRING(New_BirthDate,7,2) IN ([N19],[N20])
								THEN CONVERT(VARCHAR(10),New_BirthDate,101) ELSE NULL END AS New_BirthDate
							FROM Ext_Contact
						) A
				) D ON A.Relationship_ContactId = D.Donor_Key
			' -- Ext_From_Statement
		, 'INSERT INTO _Connection_Dim
			VALUES(NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	
			LEFT JOIN 
				(
				SELECT Record1Id AS ContactId
					, ROW_NUMBER() OVER(ORDER BY Record1Id) AS Connection_Group_Key
					FROM
						(SELECT DISTINCT Record1Id    
							FROM Ext_Connection) A
				) E ON A.ContactId = E.ContactId 
			LEFT JOIN 
				(SELECT DISTINCT ContactId	
					, Number_Signs
					, N00
					, N01
					, N02
					, N03
					, N04
					, N05
					, N06
					, N07
					, N08
					, N09
					, N10
					, N11
					, N12
					, N13
					, N14
					, N15
					, N16
					, N17
					, N18
					, N19
					, N20
					, N21
					, N22
					, N23
					, N24
					, N25
					, N26
					, N27
					, N28
					, N29
					, N30
					, N31
					FROM 
						(SELECT DISTINCT              
							A.Record1Id AS ContactId
							, D.Number_Signs
							, D.N00
							, D.N01
							, D.N02
							, D.N03
							, D.N04
							, D.N05
							, D.N06
							, D.N07
							, D.N08
							, D.N09
							, D.N10
							, D.N11
							, D.N12
							, D.N13
							, D.N14
							, D.N15
							, D.N16
							, D.N17
							, D.N18
							, D.N19
							, D.N20
							, D.N21
							, D.N22
							, D.N23
							, D.N24
							, D.N25
							, D.N26
							, D.N27
							, D.N28
							, D.N29
							, D.N30
							, D.N31
							FROM Ext_Connection A
								INNER JOIN Ext_Connection_Role B ON A.Record2RoleId = B.ConnectionRoleId 
								LEFT JOIN Ext_Contact D ON A.Record1Id = D.ContactId 
								LEFT JOIN Ext_Contact E ON  A.Record2Id = E.ContactId
								LEFT JOIN Ext_Account F ON  A.Record1Id = F.AccountId
								LEFT JOIN Ext_Account G ON  A.Record2Id = G.AccountId
							WHERE 1 = 1 
								AND EXISTS
									(SELECT *
										FROM Ext_Connection H
										WHERE 1 = 1 
											AND A.ConnectionId = H.ConnectionId
											AND (H.Record2ObjectTypeCode = 1 OR H.Record2ObjectTypeCode = 2)
									)
						UNION
						SELECT DISTINCT              
							A.Record2Id AS ContactId
							, D.Number_Signs
							, D.N00
							, D.N01
							, D.N02
							, D.N03
							, D.N04
							, D.N05
							, D.N06
							, D.N07
							, D.N08
							, D.N09
							, D.N10
							, D.N11
							, D.N12
							, D.N13
							, D.N14
							, D.N15
							, D.N16
							, D.N17
							, D.N18
							, D.N19
							, D.N20
							, D.N21
							, D.N22
							, D.N23
							, D.N24
							, D.N25
							, D.N26
							, D.N27
							, D.N28
							, D.N29
							, D.N30
							, D.N31
							FROM Ext_Connection A
								INNER JOIN Ext_Connection_Role C ON A.Record1RoleId = C.ConnectionRoleId
								LEFT JOIN Ext_Contact D ON A.Record1Id = D.ContactId 
								LEFT JOIN Ext_Contact E ON  A.Record2Id = E.ContactId
								LEFT JOIN Ext_Account F ON  A.Record1Id = F.AccountId
								LEFT JOIN Ext_Account G ON  A.Record2Id = G.AccountId
							WHERE 1 = 1 
								AND EXISTS
									(SELECT *
										FROM Ext_Connection H
										WHERE 1 = 1 
											AND A.ConnectionId = H.ConnectionId
											AND (Record1ObjectTypeCode = 1 OR Record1ObjectTypeCode = 2)
									)
						) A
					WHERE 1 = 1
						AND Number_Signs IS NOT NULL
				) F ON A.ContactId = F.ContactId
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Id_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Id_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId NVARCHAR(100)
			, Id_Key INT  PRIMARY KEY
			, Id_Group_Key INT
			, New_Type NVARCHAR(400)
			, Plus_Id NVARCHAR(100)
			, ConstituentId NVARCHAR(100)
			, AccountId NVARCHAR(100)
			, New_Id NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'ContactId 
			, Id_Key 
			, Id_Group_Key 
			, New_Type
			, Plus_Id
			, ConstituentId
			, AccountId
			, New_Id
			' -- Ext_Insert_Fields
		, 'C.ContactId
			, ROW_NUMBER() OVER(ORDER BY C.Id_Key) AS Id_Key
			, D.Id_Group_Key
			, C.New_Type
			, C.Plus_Id
			, CONVERT(NVARCHAR(100),C.ConstituentId) AS ConstituentId
			, CONVERT(NVARCHAR(100),C.AccountId) AS AccountId
			, C.New_Id						
			' -- Ext_Select_Statement
		, '(SELECT CONVERT(NVARCHAR(100),B.ContactId) AS ContactId
					, B.Id_Key
					, B.New_Type
					, B.Plus_Id
					, B.ConstituentId
					, B.AccountId
					, B.New_Id
					, ROW_NUMBER() OVER(PARTITION BY B.ContactId, B.New_Type ORDER BY B.New_Type) AS RowNumber
					FROM
						(SELECT A.ContactId
							, A.Id_Key
							, A.New_Type
							, MAX(A.Plus_Id) as Plus_Id
							, A.ConstituentId
							, A.AccountId
							, A.New_Id
							FROM
								(SELECT COALESCE(C.ContactId,A.AccountId) AS ContactId
									, O.New_OtherIdentifiersId AS Id_Key           
									, T.Column_Label AS New_Type -- Picklist
									, O.Plus_Id  -- Number   
									, C.ContactId AS ConstituentId
									, A.AccountId
									, O.New_Id  -- Type
									, MAX(ModifiedOn) AS ModifiedOn
									FROM Ext_Other_Identifiers O
										LEFT JOIN Ext_Contact C ON O.New_EmploymentId = C.ContactId
										LEFT JOIN Ext_Account A ON O.New_OtherIdentifiers = A.AccountId
										LEFT JOIN _New_OtherIdentifiers_New_Type_ T ON O.New_Type = T.Column_Value
									GROUP BY COALESCE(C.ContactId,A.AccountId)
										, O.New_OtherIdentifiersId        
										, T.Column_Label
										, O.Plus_Id
										, C.ContactId
										, A.AccountId
										, O.New_Id
								) A
							GROUP BY A.ContactId
								, A.Id_Key
								, A.New_Type
								, A.ConstituentId
								, A.AccountId
								, A.New_Id         
						) B
				) C 
				LEFT JOIN 
						(
						SELECT ContactId
							, ROW_NUMBER() OVER(ORDER BY ContactId) AS Id_Group_Key
							FROM
								(SELECT DISTINCT COALESCE(C.ContactId,A.AccountId) AS ContactId    
									FROM Ext_Other_Identifiers O
										LEFT JOIN Ext_Contact C ON O.New_EmploymentId = C.ContactId
										LEFT JOIN Ext_Account A ON O.New_OtherIdentifiers = A.AccountId
								) A
						) D ON C.ContactId = D.ContactId
			' -- Ext_From_Statement
		, 'AND C.RowNumber = 1
			INSERT INTO _Id_Dim
				VALUES(NULL,0,0,NULL,NULL,NULL,NULL,NULL);
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Interest_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Interest_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Interest_Key INT PRIMARY KEY
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'ROW_NUMBER() OVER(ORDER BY A.New_InternationalExperienceId) AS Interest_Key
			, C.Interest_Group_Key
			, CONVERT(NVARCHAR(100),A.New_InternationalExperiencesAId) AS ContactId
			, NE.Column_Label AS Experience
			, CASE WHEN A.Plus_Emeritus = 1 THEN A.[Y]
				WHEN A.Plus_Emeritus = 0 THEN A.[N] 
				ELSE NULL END AS Emeritus
			, CASE WHEN A.Plus_StudyAbroad = 1 THEN A.[Y]
				WHEN A.Plus_StudyAbroad = 0 THEN A.[N] 
				ELSE NULL END AS Study_Abroad
			, NS.New_Source AS Source
			, CONVERT(VARCHAR(10),A.New_StartDate,101) AS New_StartDate
			, CONVERT(VARCHAR(10),A.New_EndDate,101) AS New_EndDate
			, B.Plus_Name AS Interest  
			, PL.Column_Label AS Lds_Position
			, NI.New_Name AS Institutional_Hierarchy
			, NCRY.New_Name AS Country  					
			' -- Ext_Select_Statement
		, 'Ext_International_Experience A 
				LEFT JOIN Ext_Institution NI ON A.Plus_InstitutionalHierarchy = NI.New_InstitutionId
				LEFT JOIN Ext_Source NS ON A.New_Source = NS.New_SourceId  
				LEFT JOIN Ext_Interest B ON A.Plus_Interest = B.Plus_InterestId
				LEFT JOIN Ext_Country NCRY ON A.New_Country = NCRY.New_CountryId
				LEFT JOIN _New_Experience_ NE ON A.New_Experience = NE.Column_Value
				LEFT JOIN _Plus_LdsPosition_ PL ON A.Plus_LdsPosition = PL.Column_Value
				LEFT JOIN 
						(
						SELECT ContactId
							, ROW_NUMBER() OVER(ORDER BY ContactId) AS Interest_Group_Key
							FROM
								(SELECT DISTINCT New_InternationalExperiencesAId AS ContactId    
									FROM Ext_International_Experience 
								) A
						) C ON A.New_InternationalExperiencesAId = C.ContactId
			' -- Ext_From_Statement
		, 'INSERT INTO _Interest_Dim
			VALUES(0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL); 
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Student_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Student_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Student_Key INT PRIMARY KEY
			, Student_Group_Key INT
			, ContactId NVARCHAR(100)
			, New_StudentAttendanceId UNIQUEIDENTIFIER
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
			' -- Ext_Create_Fields
		, 'Student_Key
			, Student_Group_Key
			, ContactId
			, New_StudentAttendanceId
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
			' -- Ext_Insert_Fields
		, 'ROW_NUMBER() OVER(ORDER BY A.New_StudentAttendanceId) AS Student_Key
			, B.Student_Group_Key
			, CONVERT(NVARCHAR(100),A.New_StudentsAttendanceId) AS ContactId
			, A.New_StudentAttendanceId
			, U.New_University AS New_University
			, A.Plus_Year
			, A.New_Term
			, A.New_HoursCompleted
			, CONVERT(VARCHAR(10),A.New_ExpectedGraduationDate,101) AS New_ExpectedGraduationDate
			, P.New_MajorName AS New_Major
			, E.New_MajorName AS Plus_Emphasis
			, C.New_Name AS New_College
			, C.New_Name AS Plus_Department	
			, D.Academic_Term_Date
			, D.Academic_Year
			, D.Current_Academic_Year
			, CASE WHEN F.Graduated_In_Current_Academic_Year IS NULL THEN A.[N] ELSE F.Graduated_In_Current_Academic_Year END AS Graduated_In_Current_Academic_Year
			, CASE WHEN G.Current_Year_Plus_4_Student IS NULL THEN A.[N] ELSE G.Current_Year_Plus_4_Student END AS Current_Year_Plus_4_Student
			, CASE WHEN H.Current_Year_Plus_4_Graduate IS NULL THEN A.[N] ELSE H.Current_Year_Plus_4_Graduate END AS Current_Year_Plus_4_Graduate
			' -- Ext_Select_Statement
		, 'Ext_Student A 
				LEFT JOIN Ext_College C ON A.New_College = C.New_CollegeId
				LEFT JOIN Ext_University U ON A.New_University = U.New_UniversityId
				LEFT JOIN Ext_Major P ON A.New_Major = P.New_MajorId
				LEFT JOIN Ext_Major E ON A.Plus_Emphasis = E.New_MajorId
				LEFT JOIN 
					(
					SELECT ContactId
						, ROW_NUMBER() OVER(ORDER BY ContactId) AS Student_Group_Key
						FROM
							(SELECT DISTINCT New_StudentsAttendanceId AS ContactId    
								FROM Ext_Student 
							) A
					) B ON A.New_StudentsAttendanceId = B.ContactId
				LEFT JOIN
					(SELECT New_StudentAttendanceId
						, Academic_Date AS Academic_Term_Date
						, Academic_Year
						, CASE WHEN MONTH(GETDATE()) >= 9 AND Academic_Year >= (YEAR(GETDATE())+1) THEN [Y] 
							WHEN MONTH(GETDATE()) < 9 AND Academic_Year = YEAR(GETDATE()) THEN [Y]
							ELSE [N] END AS Current_Academic_Year
						FROM 
							(SELECT New_StudentAttendanceId
								, Academic_Date
								, CASE WHEN MONTH(Academic_Date) >= 9 THEN YEAR(DATEADD(YEAR,1,Academic_Date))
									ELSE YEAR(Academic_Date) END AS Academic_Year
								, [Y]
								, [N]
								FROM
									(SELECT New_StudentAttendanceId
										, CONVERT(DATE,CONCAT(Academic_Year,[Dash],Academic_Month,[Dash],Academic_Day)) AS Academic_Date
										, [Y]
										, [N]
										FROM
											(SELECT New_StudentAttendanceId
												, New_StudentsAttendanceId AS ContactId 
												, Plus_Year AS Academic_Year
												, CASE WHEN New_Term = [Fall] THEN [N09]
													WHEN New_Term = [Winter] THEN [N01]
													WHEN New_Term = [Spring] THEN [N04]
													WHEN New_Term = [Summer] THEN [N06]
													WHEN New_StudentAttendanceId IS NULL THEN NULL
													ELSE [N01] END AS Academic_Month
												, CASE WHEN New_StudentAttendanceId IS NULL THEN NULL
													ELSE [N01] END AS Academic_Day
												, [Y]
												, [N]
												, [Dash]
												FROM Ext_Student
												WHERE 1 = 1
													AND New_StudentAttendanceId IS NOT NULL
													AND LEN(Plus_Year) = 4
											) A
									) B
							) C
					) D ON A.New_StudentAttendanceId = D.New_StudentAttendanceId
				LEFT JOIN
					(SELECT DISTINCT Plus_Constituent AS ContactId
						, New_University
						, [Y] AS Graduated_In_Current_Academic_Year
						FROM
							(SELECT Plus_Constituent
								, New_University
								, Plus_ActualGraduationDate
								, Academic_Year
								, Current_Academic_Year
								, C.[Y]
								, C.[N]
								FROM
									(SELECT Plus_Constituent
										, New_University
										, Plus_ActualGraduationDate
										, Academic_Year
										, CASE WHEN MONTH(GETDATE()) >= 9 AND Academic_Year >= (YEAR(GETDATE())+1) THEN [Y] 
												WHEN MONTH(GETDATE()) < 9 AND Academic_Year = YEAR(GETDATE()) THEN [Y]
												ELSE [N] END AS Current_Academic_Year
										, B.[Y]
										, B.[N]
										FROM
											(SELECT Plus_Constituent
												, New_University
												, Plus_ActualGraduationDate
												, CASE WHEN MONTH(Plus_ActualGraduationDate) >= 9 THEN YEAR(DATEADD(YEAR,1,Plus_ActualGraduationDate))
														ELSE YEAR(Plus_ActualGraduationDate) END AS Academic_Year
												, A.[Y]
												, A.[N]
												
			' -- Ext_From_Statement
		, 'INSERT INTO _Student_Dim
			VALUES(0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL); 
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '										FROM
													(SELECT DISTINCT A.Plus_Constituent
														, B.New_University
														, A.Plus_ActualGraduationDate
														, A.[Y]
														, A.[N]
														FROM Ext_Alumni A
															LEFT JOIN Ext_University B ON A.Plus_University = B.New_UniversityId
														WHERE 1 = 1
															AND A.Plus_AlumniStatus = 100000000 --Graduated
															AND A.Plus_ActualGraduationDate IS NOT NULL
													) A
											) B
									) C
								WHERE 1 = 1
									AND Current_Academic_Year = [Y]
							) A					
					) F ON A.New_StudentsAttendanceId = F.ContactId  AND U.New_University = F.New_University
			LEFT JOIN
				(SELECT DISTINCT D.New_StudentAttendanceId
					, D.[Y] AS Current_Year_Plus_4_Student
					FROM Ext_Student A
						LEFT JOIN
							(SELECT New_StudentAttendanceId
								, Academic_Date AS Academic_Term_Date
								, Academic_Year
								, CASE WHEN MONTH(GETDATE()) >= 9 AND Academic_Year >= (YEAR(GETDATE())+1) THEN [Y] 
									WHEN MONTH(GETDATE()) < 9 AND Academic_Year = YEAR(GETDATE()) THEN [Y]
									ELSE [N] END AS Current_Academic_Year
								, [Y]
								, [N]
								FROM 
									(SELECT New_StudentAttendanceId
										, Academic_Date
										, CASE WHEN MONTH(Academic_Date) >= 9 THEN YEAR(DATEADD(YEAR,1,Academic_Date))
											ELSE YEAR(Academic_Date) END AS Academic_Year
										, [Y]
										, [N]
										FROM
											(SELECT New_StudentAttendanceId
												, CONVERT(DATE,CONCAT(Academic_Year,[Dash],Academic_Month,[Dash],Academic_Day)) AS Academic_Date
												, [Y]
												, [N]
												FROM
													(SELECT New_StudentAttendanceId
														, New_StudentsAttendanceId AS ContactId 
														, Plus_Year AS Academic_Year
														, CASE WHEN New_Term = [Fall] THEN [N09]
															WHEN New_Term = [Winter] THEN [N01]
															WHEN New_Term = [Spring] THEN [N04]
															WHEN New_Term = [Summer] THEN [N06]
															WHEN New_StudentAttendanceId IS NULL THEN NULL
															ELSE [N01] END AS Academic_Month
														, CASE WHEN New_StudentAttendanceId IS NULL THEN NULL
															ELSE [N01] END AS Academic_Day
														, [Y]
														, [N]
														, [Dash]
														FROM Ext_Student
														WHERE 1 = 1
															AND New_StudentAttendanceId IS NOT NULL
															AND LEN(Plus_Year) = 4
													) A
											) B
									) C
							) D ON A.New_StudentAttendanceId = D.New_StudentAttendanceId
					WHERE 1 = 1
						AND D.Academic_Term_Date >= DATEADD(MONTH,-16,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1)) + 1 					
				) G ON A.New_StudentAttendanceId = G.New_StudentAttendanceId
			LEFT JOIN
				(SELECT DISTINCT A.Plus_Constituent AS ContactId
					, B.New_University
					, A.[Y] AS Current_Year_Plus_4_Graduate
					FROM Ext_Alumni A
						LEFT JOIN Ext_University B ON A.Plus_University = B.New_UniversityId
					WHERE 1 = 1
						AND A.Plus_AlumniStatus = 100000000 --Graduated
						AND A.Plus_ActualGraduationDate >= DATEADD(MONTH,-16,DATEADD(yy, DATEDIFF(yy, 0, GETDATE()) + 1, -1)) + 1
				) H  ON A.New_StudentsAttendanceId = H.ContactId  AND U.New_University = H.New_University	
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _All_Employment
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_All_Employment' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'All_Employment_Key INT PRIMARY KEY
			, All_Employment_Group_Key INT
			, ContactId NVARCHAR(100)
			, StatusCode NVARCHAR(1)
			, Organization_Name NVARCHAR(160)
			, Institutional_Hierarchy NVARCHAR(100)
			, New_Title NVARCHAR(100)
			, New_JobCode NVARCHAR(100)
			, New_DateStarted DATE
			, Plus_AlternateOrganizationName NVARCHAR(100)
			' -- Ext_Create_Fields
		, 'All_Employment_Key
			, All_Employment_Group_Key
			, ContactId
			, StatusCode
			, Organization_Name
			, Institutional_Hierarchy
			, New_Title
			, New_JobCode
			, New_DateStarted
			, Plus_AlternateOrganizationName
			' -- Ext_Insert_Fields
		, 'ROW_NUMBER() OVER(ORDER BY A.New_EmploymentsId,A.StatusCode) AS All_Employment_Key
			, E.All_Employment_Group_Key
			, CONVERT(NVARCHAR(100),A.New_EmploymentsId) AS ContactId
			, CASE WHEN A.StatusCode = 100000002 THEN A.[C]
				WHEN A.StatusCode = 100000003 THEN A.[F]
				WHEN A.StatusCode = 100000004 THEN A.[R]
				ELSE NULL END AS StatusCode 
			, B.Name AS Organization_Name
			, C.New_Name AS Institutional_Hierarchy
			, A.New_Title
			, D.New_Name AS New_JobCode
			, CONVERT(VARCHAR(10),A.New_DateStarted,101) AS New_DateStarted
			, A.Plus_AlternateOrganizationName
			' -- Ext_Select_Statement
		, 'Ext_Employment A
				LEFT JOIN Ext_Account B ON A.New_Company = B.AccountId
				LEFT JOIN Ext_Institution C ON A.New_InstitutionalHierarchyId = C.New_InstitutionId
				LEFT JOIN Ext_Job_Code D ON A.New_JobCode = D.New_JobCodeId
				LEFT JOIN 
					(
					SELECT ContactId
						, ROW_NUMBER() OVER(ORDER BY ContactId) AS All_Employment_Group_Key
						FROM
							(SELECT DISTINCT New_EmploymentsId AS ContactId    
								FROM Ext_Employment 
							) A
					) E ON A.New_EmploymentsId = E.ContactId
			' -- Ext_From_Statement
		, 'AND A.New_Type = 100000000 
			CREATE NONCLUSTERED INDEX ContactId 
				ON _All_Employment(ContactId,StatusCode DESC)
					INCLUDE (
						Organization_Name
						, Institutional_Hierarchy
						, New_Title
						, New_JobCode
						, New_DateStarted
						, Plus_AlternateOrganizationName
					);
			UPDATE STATISTICS dbo._All_Employment;
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Soft_Credit
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Soft_Credit' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'New_RelatedGift NVARCHAR(100)
			, New_CreditAmount MONEY
			, Plus_Type INT
			, Plus_SharedCreditType NVARCHAR(10)
			, FullName NVARCHAR(160)
			, New_LdspId NVARCHAR(100)
			, Row_Num INT
			' -- Ext_Create_Fields
		, 'New_RelatedGift
			, New_CreditAmount
			, Plus_Type
			, Plus_SharedCreditType
			, FullName
			, New_LdspId
			, Row_Num
			' -- Ext_Insert_Fields
		, 'CONVERT(NVARCHAR(100),New_RelatedGift) AS New_RelatedGift
			, New_CreditAmount
			, Plus_Type
			, Plus_SharedCreditType
			, FullName
			, New_LdspId
			, ROW_NUMBER() OVER(ORDER BY New_RelatedGift) AS Row_Num
			' -- Ext_Select_Statement
		, '(SELECT A.New_RelatedGift
				, CONCAT(A.[Dollar_Sign],CONVERT(NVARCHAR(50),A.New_CreditAmount)) AS New_CreditAmount
				, A.Plus_Type     
				, CASE WHEN A.Plus_SubType = 100000004 THEN A.[I_Colon]
				WHEN A.Plus_SubType = 100000007 THEN A.[I_Colon]
				WHEN A.Plus_SubType = 100000002 THEN A.[M_Colon]
				WHEN A.Plus_SubType = 100000003 THEN A.[O_Colon]
				WHEN A.Plus_SubType = 100000005 THEN A.[I_Colon]
				WHEN A.Plus_SubType = 100000006 THEN A.[I_Colon]
				WHEN A.Plus_SubType = 100000000 THEN A.[H_Colon]
				WHEN A.Plus_SubType = 100000001 THEN A.[S_Colon]
				ELSE NULL END AS Plus_SharedCreditType 
				, B.FullName
				, B.New_LdspId
				FROM dbo._Gift_Credit_ A
					LEFT JOIN Ext_Contact B ON A.New_RelatedConstituent = B.ContactId
				WHERE 1 = 1
					AND B.New_LdspId IS NOT NULL
					AND A.Plus_Type = 100000002
			) A
			' -- Ext_From_Statement
		, '
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Fund_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Fund_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Fund_Key  NVARCHAR(100)  PRIMARY KEY
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),A.New_FundAccountId) AS Fund_Key
			, A.New_Name AS Fund_Name
			, A.New_FundName AS Fund_Institution_Name
			, A.New_AccountNumber AS Fund_Account_Number
			, C.Column_Label AS Plus_GiftPurposeSubtype
			, B.Column_Label AS Plus_GiftPurposeType
			, A.Plus_LdspAccountNumberInt
			, A.New_FormalAccountName
			, CONVERT(NVARCHAR(100),A.New_InstitutionalHierarchy) AS New_InstitutionalHierarchy
			, A.New_InstitutionAccountNumber
			, CASE WHEN A.Plus_Unrestricted = 0 THEN A.[N] 
				WHEN A.Plus_Unrestricted = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_Unrestricted
			, CASE WHEN A.Plus_Scholarship = 0 THEN A.[N] 
				WHEN A.Plus_Scholarship = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_Scholarship
			, CASE WHEN A.New_Endowment = 0 THEN A.[N] 
				WHEN A.New_Endowment = 1 THEN A.[Y] 
				ELSE NULL END AS New_Endowment
			, CONVERT(VARCHAR(10),A.Plus_EffectiveFrom,101) AS Plus_EffectiveFrom
			, CONVERT(VARCHAR(10),A.Plus_EffectiveTo,101) AS Plus_EffectiveTo
			, D.Column_Label AS New_CaePurpose
			, A.Plus_SubClassAccountNumber
			, A.New_Description
			, A.Plus_Notes
			, E.Column_Label AS Plus_AwardRestrictionGender
			, F.Column_Label AS Plus_AwardRestrictionClassYear
			, CONVERT(NVARCHAR(100),A.Plus_AwardRestrictionCollege) AS Plus_AwardRestrictionCollege
			, G.Column_Label AS Plus_AwardRestrictionEthnicity
			, A.Plus_AwardRestrictionGPA
			, CONVERT(NVARCHAR(100),A.Plus_AwardRestrictionMajor) AS Plus_AwardRestrictionMajor
			, CONVERT(NVARCHAR(100),A.Plus_GeographicArea) AS Plus_GeographicArea
			, CASE WHEN A.Plus_AwardRestrictionSeminaryGraduate = 0 THEN A.[N] 
				WHEN A.Plus_AwardRestrictionSeminaryGraduate = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_AwardRestrictionSeminaryGraduate
			, CASE WHEN A.Plus_NeedBased = 0 THEN A.[N]
				WHEN A.Plus_NeedBased = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_NeedBased
			, CASE WHEN A.Plus_AwardRestrictionSingleParent = 0 THEN A.[N] 
				WHEN A.Plus_AwardRestrictionSingleParent = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_AwardRestrictionSingleParent
			, CASE WHEN A.Plus_AwardRestrictionReturnedMissionary = 0 THEN A.[N] 
				WHEN A.Plus_AwardRestrictionReturnedMissionary = 1 THEN A.[Y]
				ELSE NULL END AS Plus_AwardRestrictionReturnedMissionary
			, CASE WHEN A.Plus_PayItForward = 0 THEN A.[N] 
				WHEN A.Plus_PayItForward = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_PayItForward
			, A.Plus_AwardRestrictionNotes
			, CASE WHEN A.Plus_Athletics = 0 THEN A.[N] 
				WHEN A.Plus_Athletics = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_Athletics
			, CASE WHEN A.Plus_FourYear = 0 THEN A.[N] 
				WHEN A.Plus_FourYear = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_FourYear
			, CASE WHEN A.Plus_GraduateProfessional = 0 THEN A.[N]
				WHEN A.Plus_GraduateProfessional = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_GraduateProfessional
			, CASE WHEN A.Plus_TvRadio = 0 THEN A.[N] 
				WHEN A.Plus_TvRadio = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_TvRadio
			, CASE WHEN A.Plus_TechnologySpec = 0 THEN A.[N]
				WHEN A.Plus_TechnologySpec = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_TechnologySpec
			, CASE WHEN A.Plus_AlumniAssociation = 0 THEN A.[N] 
				WHEN A.Plus_AlumniAssociation = 1 THEN A.[Y] 
				ELSE NULL END AS Plus_AlumniAssociation
			, A.Plus_MatchingGiftText
			, A.Plus_PrincipalAccountNumber
			, A.Plus_Spendable
			, H.Column_Label AS Plus_ProposedEndowment
			, I.Column_Label AS Plus_ReportFrequency
			, J.Column_Label AS StatusCode
			, NULL AS Hier_New_Inst
			, CASE WHEN A.New_AllowGifts = 0 THEN A.[N] 
				WHEN A.New_AllowGifts = 1 THEN A.[Y]
				ELSE NULL END AS New_AllowGifts
			' -- Ext_Select_Statement
		, 'Ext_Fund_Account A
			LEFT JOIN _Fund_GiftPurposeType_ B ON A.Plus_GiftPurposeType = B.Column_Value
			LEFT JOIN _Fund_GiftPurposeSubType_ C ON A.Plus_GiftPurposeSubtype = C.Column_Value
			LEFT JOIN _Fund_CaePurpose_ D ON A.New_CaePurpose = D.Column_Value
			LEFT JOIN _Fund_AwardRestrictionGender_ E ON A.Plus_AwardRestrictionGender = E.Column_Value
			LEFT JOIN _Fund_AwardRestrictionClassYear_ F ON A.Plus_AwardRestrictionClassYear = F.Column_Value
			LEFT JOIN _Fund_AwardRestrictionEthnicity_ G ON A.Plus_AwardRestrictionEthnicity = G.Column_Value
			LEFT JOIN _FundAccount_Plus_ProposedEndowment_ H ON A.Plus_ProposedEndowment = H.Column_Value
			LEFT JOIN _FundAccount_Plus_ReportFrequency_ I ON A.Plus_ReportFrequency = I.Column_Value
			LEFT JOIN _FundAccount_StatusCode_ J ON A.StatusCode = J.Column_Value
			' -- Ext_From_Statement
		, 'Exec dbo.usp_Fund_Dim_Zero_Key
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _User_Coordinating_Liaison_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_User_Coordinating_Liaison_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'User_Coordinating_Liaison_Key NVARCHAR(100) PRIMARY KEY
			, User_Full_Name NVARCHAR(200)
			, User_First_Name NVARCHAR(64)
			, User_Last_Name NVARCHAR(64)
			, User_Personal_Email NVARCHAR(100)
			, User_Title NVARCHAR(128)
			, User_Internal_Email NVARCHAR(100)
			, User_Mobile_Phone NVARCHAR(64)
			, User_Domain_Name NVARCHAR(1024)
			' -- Ext_Create_Fields
		, 'User_Coordinating_Liaison_Key
			, User_Full_Name
			, User_First_Name
			, User_Last_Name
			, User_Personal_Email
			, User_Title
			, User_Internal_Email
			, User_Mobile_Phone
			, User_Domain_Name
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),A.SystemUserId) AS User_Coordinating_Liaison_Key
			, A.FullName AS User_Full_Name
			, A.FirstName AS User_First_Name
			, A.LastName AS User_Last_Name
			, A.PersonalEmailAddress AS User_Personal_Email
			, A.Title AS User_Title
			, A.InternalEmailAddress AS User_Internal_Email
			, A.MobilePhone AS User_Mobile_Phone
			, A.DomainName AS User_Domain_Name
			' -- Ext_Select_Statement
		, 'LDSPhilanthropiesDW.dbo.Ext_System_User A  
				INNER JOIN 
						(SELECT ContactId AS Donor_Key
							, COALESCE(CONVERT(NVARCHAR(100),Plus_CoordinatingLiaison),[Zero]) AS User_Coordinating_Liaison_Key
							FROM Ext_Contact
							WHERE 1 = 1
								AND Plus_CoordinatingLiaison IS NOT NULL
						UNION
						SELECT AccountId AS Donor_Key
							, COALESCE(CONVERT(NVARCHAR(100),Plus_CoordinatingLiaison),[Zero]) AS User_Coordinating_Liaison_Key
							FROM Ext_Account
							WHERE 1 = 1
								AND Plus_CoordinatingLiaison IS NOT NULL										
						) B ON A.SystemUserId = B.User_Coordinating_Liaison_Key
			' -- Ext_From_Statement
		, '
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _User_Pending_Liaison_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_User_Pending_Liaison_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'User_Pending_Liaison_Key NVARCHAR(100) PRIMARY KEY
			, User_Full_Name NVARCHAR(200)
			, User_First_Name NVARCHAR(64)
			, User_Last_Name NVARCHAR(64)
			, User_Personal_Email NVARCHAR(100)
			, User_Title NVARCHAR(128)
			, User_Internal_Email NVARCHAR(100)
			, User_Mobile_Phone NVARCHAR(64)
			, User_Domain_Name NVARCHAR(1024)
			' -- Ext_Create_Fields
		, 'User_Pending_Liaison_Key
			, User_Full_Name
			, User_First_Name
			, User_Last_Name
			, User_Personal_Email
			, User_Title
			, User_Internal_Email
			, User_Mobile_Phone
			, User_Domain_Name
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),A.SystemUserId) AS User_Pending_Liaison_Key
			, A.FullName AS User_Full_Name
			, A.FirstName AS User_First_Name
			, A.LastName AS User_Last_Name
			, A.PersonalEmailAddress AS User_Personal_Email
			, A.Title AS User_Title
			, A.InternalEmailAddress AS User_Internal_Email
			, A.MobilePhone AS User_Mobile_Phone
			, A.DomainName AS User_Domain_Name
			' -- Ext_Select_Statement
		, 'LDSPhilanthropiesDW.dbo.Ext_System_User A 
				INNER JOIN
						(SELECT ContactId AS Donor_Key
							, COALESCE(CONVERT(NVARCHAR(100),Plus_PendingLiaison),[Zero]) AS User_Pending_Liaison_Key
							FROM Ext_Contact
							WHERE 1 = 1
								AND Plus_PendingLiaison IS NOT NULL
						UNION
						SELECT AccountId AS Donor_Key
							, COALESCE(CONVERT(NVARCHAR(100),Plus_PendingLiaison),[Zero]) AS User_Pending_Liaison_Key
							FROM Ext_Account
							WHERE 1 = 1
								AND Plus_PendingLiaison IS NOT NULL										
						) B ON A.SystemUserId = B.User_Pending_Liaison_Key
			' -- Ext_From_Statement
		, 'Exec dbo.usp_User_Pending_Liaison_Dim_Zero_Key
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _User_Connected_Liaison_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_User_Connected_Liaison_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'User_Connected_Liaison_Key NVARCHAR(100) PRIMARY KEY
			, User_Full_Name NVARCHAR(200)
			, User_First_Name NVARCHAR(64)
			, User_Last_Name NVARCHAR(64)
			, User_Personal_Email NVARCHAR(100)
			, User_Title NVARCHAR(128)
			, User_Internal_Email NVARCHAR(100)
			, User_Mobile_Phone NVARCHAR(64)
			, User_Domain_Name NVARCHAR(1024)
			' -- Ext_Create_Fields
		, 'User_Connected_Liaison_Key
			, User_Full_Name
			, User_First_Name
			, User_Last_Name
			, User_Personal_Email
			, User_Title
			, User_Internal_Email
			, User_Mobile_Phone
			, User_Domain_Name
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),A.SystemUserId) AS User_Connected_Liaison_Key
			, A.FullName AS User_Full_Name
			, A.FirstName AS User_First_Name
			, A.LastName AS User_Last_Name
			, A.PersonalEmailAddress AS User_Personal_Email
			, A.Title AS User_Title
			, A.InternalEmailAddress AS User_Internal_Email
			, A.MobilePhone AS User_Mobile_Phone
			, A.DomainName AS User_Domain_Name
			' -- Ext_Select_Statement
		, 'LDSPhilanthropiesDW.dbo.Ext_System_User A 
				INNER JOIN
						(SELECT ContactId AS Donor_Key
							, COALESCE(CONVERT(NVARCHAR(100),Plus_ConnectedLiaison),[Zero]) AS User_Connected_Liaison_Key
							FROM Ext_Contact
							WHERE 1 = 1
								AND Plus_ConnectedLiaison IS NOT NULL
						UNION
						SELECT AccountId AS Donor_Key
							, COALESCE(CONVERT(NVARCHAR(100),Plus_ConnectedLiaison),[Zero]) AS User_Connected_Liaison_Key
							FROM Ext_Account
							WHERE 1 = 1
								AND Plus_ConnectedLiaison IS NOT NULL
						) B ON A.SystemUserId = B.User_Connected_Liaison_Key
			' -- Ext_From_Statement
		, 'Exec dbo.usp_User_Connected_Liaison_Dim_Zero_Key
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Appeal_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Appeal_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Appeal_Key NVARCHAR(100) PRIMARY KEY
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),A.ActivityId) AS Appeal_Key
			, A.Subject AS Appeal_Name
			, B.Plus_AppealCode AS Appeal_Code
			, C.New_Name AS Campaign_Institutional_Hierarchy
			, D.Name AS Campaign_Name
			, CASE WHEN H.Column_Label = A.[Other] THEN A.[General]
					WHEN H.Column_Label = A.[In_Person] THEN A.[Face_To_Face] 
					WHEN H.Column_Label = A.[Mail] THEN A.[Direct_Mail]
					WHEN H.Column_Label = A.[Phone] THEN A.[Telefund]
					ELSE H.Column_Label END AS Delivery_Type
			, E.Column_Label AS Communication_Type
			, CONVERT(VARCHAR(10),A.ScheduledStart,101) AS Scheduled_Start
			, CONVERT(VARCHAR(10),A.ScheduledEnd,101) AS Scheduled_End
			, CONVERT(VARCHAR(10),A.ActualStart,101) AS Actual_Start
			, CONVERT(VARCHAR(10),A.ActualEnd,101) AS Actual_End
			, B.Plus_Format AS Appeal_Format                                                     
			, H.Column_Label AS Campaign_Type
			, D.StatusCode AS Campaign_Status
			, F.Column_Label AS Scope
			, NULL AS Requester
			, CASE WHEN CONVERT(NVARCHAR(100),D.Plus_Affiliate) = A.[N100000000] THEN CONVERT(NVARCHAR(100),I.New_Name)
				WHEN CONVERT(NVARCHAR(100),D.Plus_Affiliate) = A.[N100000001] THEN CONVERT(NVARCHAR(100),C.New_Name) END AS Representing
			, G.Column_Label AS Department_Owner             
			, D.Plus_Cause AS Cause                            
			, D.Description AS Campaign_Notes
			, D.BudgetedCost_Base AS Budget_Allocated
			, D.ExpectedRevenue AS Estimated_Revenue
			, D.OtherCost AS Miscellaneous_Cost
			, D.TotalCampaignActivityActualCost AS Total_Cost_Of_Campaign_Activity
			, D.TotalActualCost AS Total_Cost_Of_Campaign
			, D.Plus_CostToRaise1_Base AS Cost_To_Raise_1_Dollar
			, D.Plus_TotalGiftRevenueFromCampaign AS Total_Gift_Revenue_From_Campaign
			, D.Plus_CampaignProfit_Base AS Campaign_Profit  
			, CASE WHEN H.Column_Label = A.[Mail] THEN 1
					WHEN H.Column_Label = A.[Email] THEN 2
					WHEN H.Column_Label = A.[In_Person] THEN 3
					WHEN H.Column_Label = A.[Phone] THEN 4
					WHEN H.Column_Label = A.[Other] THEN 5
					WHEN H.Column_Label = A.[Web] THEN 6
					ELSE 7 END AS Appeal_Delivery_Type_Sort_Value
			, J.Appeal_Name AS Appeal_Long_Name
			, J.Keep_Remove_Delete AS Appeal_Reporting_Status			
			' -- Ext_Select_Statement
		, 'Ext_Activity_Pointer A
				INNER JOIN 
						(SELECT DISTINCT C.ActivityId AS Appeal_Key
								FROM dbo._Gift_ A
									LEFT JOIN dbo._Gift_Hist_ B ON A.New_GiftId = B.New_RelatedGift
									LEFT JOIN Ext_Campaign_Activity C ON A.Plus_Appeal = C.ActivityId
						) K ON A.ActivityId = K.Appeal_Key 
				LEFT JOIN Ext_Campaign_Activity B ON A.ActivityId = B.ActivityId
				LEFT JOIN Ext_Institution C ON B.Plus_InstitutionalHierarchy = C.New_InstitutionId
				LEFT JOIN Ext_Campaign D ON A.RegardingObjectId = D.CampaignId
				LEFT JOIN _Campaign_Activity_ E ON B.Plus_CommunicationType = E.Column_Value                               
				LEFT JOIN _Affiliate_ F ON B.Plus_CommunicationType = F.Column_Value
				LEFT JOIN _Department_Function_ G ON B.Plus_CommunicationType = G.Column_Value
				LEFT JOIN _Channel_Type_Code_ H ON A.CampactChannelTypeCode = H.Column_Value
				LEFT JOIN Ext_Association I ON D.Plus_Association = I.New_AssociationId
				LEFT JOIN 
					(SELECT A.Appeal_Code
						, A.Appeal_Name
						, B.Keep_Remove_Delete
						FROM 
							(SELECT DISTINCT Appeal_Code
								, Appeal_Name
								FROM LDSP_All_Appeals 
							)A
							LEFT JOIN 
								(SELECT DISTINCT Appeal_Code
									, Keep_Remove_Delete
									FROM LDSP_All_Appeals
									WHERE 1 = 1
										AND Keep_Remove_Delete IS NOT NULL
								) B ON A.Appeal_Code = B.Appeal_Code
					) J ON B.Plus_AppealCode = J.Appeal_Code
			' -- Ext_From_Statement
		, 'AND A.RegardingObjectTypeCode = 4400
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Expectancy_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Expectancy_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Expectancy_Key NVARCHAR(100) PRIMARY KEY
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),A.New_PledgeId) AS Expectancy_Key
			, B.Column_Label AS Plus_Kind
			, C.Column_Label AS Plus_TenderType
			, D.Column_Label AS Plus_GiftSource
			, E.Column_Label AS Plus_PlannedGift
			, A.Plus_CheckNumber
			, F.Column_Label AS New_Confidential
			, A.Plus_AcknowledgementInstructions
			, A.Plus_NewAccountInstructions
			, A.Plus_SpecialGiftInstructions
			, CONVERT(NVARCHAR(100),A.Plus_TelefundRep) AS Plus_TelefundRep
			, G.Column_Label AS Plus_PlannedGivingPaymentFrequency
			, H.Column_Label AS New_Bookable
			, I.Column_Label AS Plus_MatchExpected
			, J.Column_Label AS Plus_GiftRevocability
			, K.Column_Label AS Plus_RemainderBeneficiary
			, L.Column_Label AS New_Documentation
			, A.Plus_Designation
			, A.Plus_NameOfTrust
			, M.Column_Label AS plus_PlannedGivingType
			, N.Column_Label AS Plus_VehicleType
			, O.Column_Label AS Plus_VehicleSubType
			, A.Plus_PayoutRate
			, P.Column_Label AS Plus_Duration
			, Q.Column_Label AS Plus_LivesType
			, A.Plus_Years
			, A.Plus_Lives
			, A.Plus_TermBeneficiaryLives
			, A.Plus_TermBeneficiaryYears
			, A.Plus_Cri
			, A.Plus_GpsNotes
			, A.New_PledgeNumber
			, R.Column_Value AS Status
			, R.Column_Label AS Status_Reason
			, A.New_TotalPledged
			, A.New_BalanceDue_Base
			, A.New_TotalPaid_Base
			, A.New_PaymentsToMake
			, A.New_PaymentsReceived
			, A.New_InstallmentAmount_Base
			, A.Plus_FairMarketValue_Base
			, A.Plus_PresentValue_Base
			, A.Plus_PaymentAmount_Base
			, A.Plus_AnnualAmount_Base
			, CONVERT(VARCHAR(10),A.New_BeginDate,101) AS New_BeginDate
			, CONVERT(VARCHAR(10),A.New_EndDate,101) AS New_EndDate
			, CONVERT(VARCHAR(10),A.Plus_InstallmentDate,101) AS Plus_InstallmentDate
			, CONVERT(VARCHAR(10),A.New_SignatureDate,101) AS New_SignatureDate
			, CONVERT(VARCHAR(10),A.New_NotificationDate,101) AS New_NotificationDate
			, CONVERT(VARCHAR(10),A.Plus_FundingDate,101) AS Plus_FundingDate
			, CONVERT(VARCHAR(10),A.Plus_EstimatedMaturityDate,101) AS Plus_EstimatedMaturityDate
			, CONVERT(VARCHAR(10),A.Plus_PaymentStartDate,101) AS Plus_PaymentStartDate
			, S.Column_Label AS Lds_ExpectancyType										
			' -- Ext_Select_Statement
		, 'Ext_Pledge A
			LEFT JOIN _Plus_Kind_ B ON A.Plus_Kind = B.Column_Value
			LEFT JOIN _Plus_Tender_Type_ C ON A.Plus_TenderType = C.Column_Value
			LEFT JOIN _Plus_Gift_Source_ D ON A.Plus_GiftSource = D.Column_Value
			LEFT JOIN _Plus_Planned_Gift_ E ON A.Plus_PlannedGift = E.Column_Value
			LEFT JOIN _New_Confidential_ F ON A.New_Confidential = F.Column_Value
			LEFT JOIN _Plus_PlannedGivingPaymentFrequency_ G ON A.Plus_PlannedGivingPaymentFrequency = G.Column_Value
			LEFT JOIN _New_Bookable_ H ON A.New_Bookable = H.Column_Value
			LEFT JOIN _Plus_MatchExpected_ I ON A.Plus_MatchExpected = I.Column_Value
			LEFT JOIN _Plus_GiftRevocability_ J ON A.Plus_GiftRevocability = J.Column_Value
			LEFT JOIN _Plus_RemainderBeneficiary_ K ON A.Plus_RemainderBeneficiary = K.Column_Value
			LEFT JOIN _New_Documentation_ L ON A.New_Documentation = L.Column_Value
			LEFT JOIN _Plus_PlannedGivingType_ M ON A.plus_PlannedGivingType = M.Column_Value
			LEFT JOIN _Plus_VehicleType_ N ON A.Plus_VehicleType = N.Column_Value
			LEFT JOIN _Plus_VehicleSubType_ O ON A.Plus_VehicleSubType = O.Column_Value
			LEFT JOIN _Plus_Duration_ P ON A.Plus_Duration = P.Column_Value
			LEFT JOIN _Plus_LivesType_ Q ON A.Plus_LivesType = Q.Column_Value
			LEFT JOIN _Pledge_Status_ R ON A.StatusCode = R.Column_Value
			LEFT JOIN _Lds_ExpectancyType_ S ON A.Lds_ExpectancyType = S.Column_Value
			' -- Ext_From_Statement
		, '
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '	
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Bio_Strat_Plan_CreatedBy_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Bio_Strat_Plan_CreatedBy_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Bio_Strat_Plan_CreatedBy_Key NVARCHAR(100) PRIMARY KEY
			, Bio_Strat_Plan_CreatedBy_Full_Name NVARCHAR(200)
			, Bio_Strat_Plan_CreatedBy_First_Name NVARCHAR(64)
			, Bio_Strat_Plan_CreatedBy_Last_Name NVARCHAR(64)
			, Bio_Strat_Plan_CreatedBy_Domain_Name NVARCHAR(1024)
			' -- Ext_Create_Fields
		, 'Bio_Strat_Plan_CreatedBy_Key
			, Bio_Strat_Plan_CreatedBy_Full_Name
			, Bio_Strat_Plan_CreatedBy_First_Name
			, Bio_Strat_Plan_CreatedBy_Last_Name
			, Bio_Strat_Plan_CreatedBy_Domain_Name
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),SystemUserId) AS Bio_Strat_Plan_CreatedBy_Key
			, FullName AS Bio_Strat_Plan_CreatedBy_Full_Name
			, FirstName AS Bio_Strat_Plan_CreatedBy_First_Name
			, LastName AS Bio_Strat_Plan_CreatedBy_Last_Name
			, DomainName AS Bio_Strat_Plan_CreatedBy_Domain_Name   				
			' -- Ext_Select_Statement
		, 'Ext_System_User
			' -- Ext_From_Statement
		, 'Exec dbo.usp_Bio_Strat_Plan_CreatedBy_Dim_Zero_Key
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Bio_Strat_Plan_ModifiedBy_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Bio_Strat_Plan_ModifiedBy_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Bio_Strat_Plan_ModifiedBy_Key NVARCHAR(100) PRIMARY KEY
			, Bio_Strat_Plan_ModifiedBy_Full_Name NVARCHAR(200)
			, Bio_Strat_Plan_ModifiedBy_First_Name NVARCHAR(64)
			, Bio_Strat_Plan_ModifiedBy_Last_Name NVARCHAR(64)
			, Bio_Strat_Plan_ModifiedBy_Domain_Name NVARCHAR(1024)
			' -- Ext_Create_Fields
		, 'Bio_Strat_Plan_ModifiedBy_Key
			, Bio_Strat_Plan_ModifiedBy_Full_Name
			, Bio_Strat_Plan_ModifiedBy_First_Name
			, Bio_Strat_Plan_ModifiedBy_Last_Name
			, Bio_Strat_Plan_ModifiedBy_Domain_Name
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),SystemUserId) AS Bio_Strat_Plan_ModifiedBy_Key
			, FullName AS Bio_Strat_Plan_ModifiedBy_Full_Name
			, FirstName AS Bio_Strat_Plan_ModifiedBy_First_Name
			, LastName AS Bio_Strat_Plan_ModifiedBy_Last_Name
			, DomainName AS Bio_Strat_Plan_ModifiedBy_Domain_Name   				
			' -- Ext_Select_Statement
		, 'Ext_System_User
			' -- Ext_From_Statement
		, 'Exec dbo.usp_Bio_Strat_Plan_ModifiedBy_Dim_Zero_Key
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Bio_Strat_Plan_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Bio_Strat_Plan_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Bio_Strat_Plan_Key INT 
			, Donor_Key NVARCHAR(100) 
			, Plus_ConstituentNoteId NVARCHAR(100)
			, Plus_Type NVARCHAR(400)
			, Plus_ReasonForDrop NVARCHAR(400)
			, Plus_CoordinatingLiaisonNeeded NVARCHAR(400)
			, Plus_Subject NVARCHAR(200)
			, Plus_Date DATE
			, Plus_Note NVARCHAR(4000)
		' -- Ext_Create_Fields
		, 'Bio_Strat_Plan_Key
			, Donor_Key
			, Plus_ConstituentNoteId 
			, Plus_Type 
			, Plus_ReasonForDrop 
			, Plus_CoordinatingLiaisonNeeded 
			, Plus_Subject 
			, Plus_Date
			, Plus_Note 
		' -- Ext_Insert_Fields
		, 'A.Bio_Strat_Plan_Key
			, COALESCE(CONVERT(NVARCHAR(100),B.Plus_RelatedConstituent), CONVERT(NVARCHAR(100),B.Plus_RelatedOrganization)) AS Donor_Key
			, CONVERT(NVARCHAR(100),B.Plus_ConstituentNoteId) AS Plus_ConstituentNoteId
			, E.Column_Label AS Plus_Type 
			, D.Column_Label AS Plus_ReasonForDrop 
			, C.Column_Label AS Plus_CoordinatingLiaisonNeeded 
			, B.Plus_Subject 
			, CONVERT(VARCHAR(10),B.Plus_Date,101) AS Plus_Date
			, B.Plus_Note 
			' -- Ext_Select_Statement
		, '_Bio_Strat_Plan_Fact A
			INNER JOIN Ext_Constituent_Note B ON A.Plus_ConstituentNoteId = CONVERT(NVARCHAR(100),B.Plus_ConstituentNoteId)
			LEFT JOIN _Coordinating_Liaison_Needed_ C ON B.Plus_CoordinatingLiaisonNeeded = C.Column_Value
			LEFT JOIN _Reason_For_Drop_ D ON B.Plus_ReasonForDrop = D.Column_Value
			LEFT JOIN _Plus_Type_ E ON B.Plus_Type = E.Column_Value
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Byu_Employee_Giving_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Byu_Employee_Giving_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	Donor_Key NVARCHAR(100)
			, Month_Before_Last_Month_Gift_Total MONEY
			, Last_Month_Gift_Total MONEY
			, Byu_Employee_Giving_Upgrade NVARCHAR(1)
			, Byu_Employee_Giving_New NVARCHAR(1)
			, Byu_Employee_Giving_Campus_Address NVARCHAR(100)
		' -- Ext_Create_Fields
		, 'Donor_Key 
			, Month_Before_Last_Month_Gift_Total
			, Last_Month_Gift_Total
			, Byu_Employee_Giving_Upgrade
			, Byu_Employee_Giving_New 
			, Byu_Employee_Giving_Campus_Address
		' -- Ext_Insert_Fields
		, 'A.Donor_Key
			, A.Month_Before_Last_Month_Gift_Total
			, A.Last_Month_Gift_Total
			, CASE WHEN A.Last_Month_Gift_Total > A.Month_Before_Last_Month_Gift_Total
				AND A.Month_Before_Last_Month_Gift_Total IS NOT NULL THEN [Y] ELSE [N] END AS Byu_Employee_Giving_Upgrade
			, CASE WHEN A.Month_Before_Last_Month_Gift_Total IS NULL THEN [Y] ELSE [N] END AS Byu_Employee_Giving_New 
			, B.Byu_Employee_Giving_Campus_Address
			' -- Ext_Select_Statement
		, '	(SELECT Donor_Key
				, Month_Before_Last_Month_Gift_Total
				, Last_Month_Gift_Total
				, Y
				, N
				FROM
					(SELECT A.Donor_Key
						, A.Month_Before_Last_Month_Gift_Total
						, A.Last_Month_Gift_Total
						, Y
						, N
						FROM
							(SELECT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key
									, B.Month_Before_Last_Month_Gift_Total
									, A.Last_Month_Gift_Total
									FROM
										(SELECT New_ConstituentDonor
											, SUM(New_GiftAmount) AS Last_Month_Gift_Total
											FROM _Gift_
											WHERE 1 = 1
												AND (Lds_RecurringGiftRule IS NOT NULL
														OR Lds_RecurringGiftGroup IS NOT NULL)
												AND CONVERT(DATE,New_ReceiptDate) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 1, 0)) 
																						AND CONVERT(DATE,DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())-0,0))) --Last Month
											GROUP BY New_ConstituentDonor
										) A
										LEFT JOIN
										(SELECT New_ConstituentDonor
											, SUM(New_GiftAmount) AS Month_Before_Last_Month_Gift_Total
											FROM _Gift_
											WHERE 1 = 1
												AND (Lds_RecurringGiftRule IS NOT NULL
														OR Lds_RecurringGiftGroup IS NOT NULL)
												AND CONVERT(DATE,New_ReceiptDate) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 2, 0)) 
																						AND CONVERT(DATE,DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())-1,0))) --Month Before Last Month
											GROUP BY New_ConstituentDonor
										) B ON A.New_ConstituentDonor = B.New_ConstituentDonor
									WHERE 1 = 1
										AND B.Month_Before_Last_Month_Gift_Total IS NOT NULL
										AND A.Last_Month_Gift_Total > B.Month_Before_Last_Month_Gift_Total
							) A
							INNER JOIN
							(SELECT DISTINCT Donor_Key
								, Y
								, N
								FROM
									(SELECT B.Donor_Key
										, A.Recurring_Gift_Key
										, A.Recurring_Gift_Status_Code
										, A.Recurring_Gift_Type
										, A.Recurring_Gift_Amt
										, C.Employer
										, C.Employment_Active_Yn
										, C.Y
										, C.N
										FROM _Recurring_Gift_Dim A
											INNER JOIN _Recurring_Gift_Fact B ON A.Recurring_Gift_Key = B.Recurring_Gift_Key
											INNER JOIN 
												(SELECT ContactId
													, Employment_Donor_Yn
													, Employment_Active_Yn
													, Employer
													, [Start_Date]
													, End_Date
													, StatusCode
													, Y
													, N
													FROM _Employment_Dim
													WHERE 1 = 1
														AND Employer = [BYU]
														AND Employment_Active_Yn = [Y]
														AND StatusCode = [Current]
												) C ON B.Donor_Key = C.ContactId
										WHERE 1 = 1
											AND A.Recurring_Gift_Status_Code = [Active]
									) A
							) B ON A.Donor_Key = B.Donor_Key
					UNION
					SELECT A.Donor_Key
						, A.Month_Before_Last_Month_Gift_Total
						, A.Last_Month_Gift_Total
						, Y
						, N
						FROM
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' 		
							(SELECT CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS Donor_Key
									, B.Month_Before_Last_Month_Gift_Total
									, A.Last_Month_Gift_Total
									FROM
										(SELECT New_ConstituentDonor
											, SUM(New_GiftAmount) AS Last_Month_Gift_Total
											FROM _Gift_
											WHERE 1 = 1
												AND (Lds_RecurringGiftRule IS NOT NULL
														OR Lds_RecurringGiftGroup IS NOT NULL)
												AND CONVERT(DATE,New_ReceiptDate) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 1, 0)) 
																						AND CONVERT(DATE,DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())-0,0))) --Last Month
											GROUP BY New_ConstituentDonor
										) A
										LEFT JOIN
										(SELECT New_ConstituentDonor
											, SUM(New_GiftAmount) AS Month_Before_Last_Month_Gift_Total
											FROM _Gift_
											WHERE 1 = 1
												AND (Lds_RecurringGiftRule IS NOT NULL
														OR Lds_RecurringGiftGroup IS NOT NULL)
												AND CONVERT(DATE,New_ReceiptDate) BETWEEN CONVERT(DATE,DATEADD(MONTH, DATEDIFF(MONTH, 0, GETDATE()) - 2, 0)) 
																						AND CONVERT(DATE,DATEADD(s,-1,DATEADD(mm, DATEDIFF(m,0,GETDATE())-1,0))) --Month Before Last Month
											GROUP BY New_ConstituentDonor
										) B ON A.New_ConstituentDonor = B.New_ConstituentDonor
									WHERE 1 = 1
										AND B.Month_Before_Last_Month_Gift_Total IS NULL
							) A
							INNER JOIN
							(SELECT DISTINCT Donor_Key
								, Y
								, N
								FROM
									(SELECT B.Donor_Key
										, A.Recurring_Gift_Key
										, A.Recurring_Gift_Status_Code
										, A.Recurring_Gift_Type
										, A.Recurring_Gift_Amt
										, C.Employer
										, C.Employment_Active_Yn
										, Y
										, N
										FROM _Recurring_Gift_Dim A
											INNER JOIN _Recurring_Gift_Fact B ON A.Recurring_Gift_Key = B.Recurring_Gift_Key
											INNER JOIN 
												(SELECT ContactId
													, Employment_Donor_Yn
													, Employment_Active_Yn
													, Employer
													, [Start_Date]
													, End_Date
													, StatusCode
													, Y
													, N
													FROM _Employment_Dim
													WHERE 1 = 1
														AND Employer = [BYU]
														AND Employment_Active_Yn = [Y]
														AND StatusCode = [Current]
												) C ON B.Donor_Key = C.ContactId
										WHERE 1 = 1
											AND A.Recurring_Gift_Status_Code = [Active]
									) A
							) B ON A.Donor_Key = B.Donor_Key
						WHERE 1 = 1
					) A
			) A
			LEFT JOIN
				(SELECT CONVERT(NVARCHAR(100),A.New_EmploymentsId) AS Donor_Key
					, B.Lds_CampusAddress AS Byu_Employee_Giving_Campus_Address -- NVARCHAR(100)
					FROM
						(SELECT ROW_NUMBER() OVER(PARTITION BY B.New_EmploymentsId ORDER BY B.New_EmploymentId) AS Duplicate_Id 
							, B.New_EmploymentId
							, B.New_EmploymentsId
								FROM 
								(SELECT New_EmploymentsId
									, StatusCode
									, MAX(ModifiedOn) AS Max_Modified
									FROM Ext_Employment
									WHERE 1 = 1
										AND StatusCode = 100000002 --Current
										AND Lds_CampusAddress IS NOT NULL
									GROUP BY New_EmploymentsId
										, StatusCode
								) A 
								INNER JOIN
								(SELECT New_EmploymentsId
									, New_EmploymentId
									, StatusCode
									, ModifiedOn
									FROM Ext_Employment
									WHERE 1 = 1
										AND StatusCode = 100000002 --Current
										AND Lds_CampusAddress IS NOT NULL
								) B ON A.New_EmploymentsId = B.New_EmploymentsId
										AND A.Max_Modified = B.ModifiedOn
							WHERE 1 = 1
						) A
						LEFT JOIN Ext_Employment B ON A.New_EmploymentId = B.New_EmploymentId
					WHERE 1 = 1
						AND Duplicate_Id = 1 
				) B ON A.Donor_Key = B.Donor_Key
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Total_Giving_With_Matching_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Total_Giving_With_Matching_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Donor_Key NVARCHAR(100) PRIMARY KEY
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
		' -- Ext_Create_Fields
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
		' -- Ext_Insert_Fields
		, 'A.Donor_Key 
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) 
							AND B.Plus_Type != 100000001  
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112) 
							AND B.Plus_Type != 100000001  
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_1
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112) 
							AND B.Plus_Type != 100000001 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_2
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) 
							AND B.Plus_Type != 100000001  
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_3
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112) 
							AND B.Plus_Type != 100000001 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_4
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112) 
							AND B.Plus_Type != 100000001
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_5
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) 
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYU]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Byu
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112) 
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYU]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_1_Byu 
			' -- Ext_Select_Statement
		, '_All_Donors_ A
				LEFT JOIN _Gift_Credit_ B ON A.Donor_Key = CONVERT(NVARCHAR(100),COALESCE(B.New_RelatedConstituent, B.New_OrganizationId))
				LEFT JOIN _Gift_ C ON B.New_RelatedGift = C.New_GiftId
				LEFT JOIN Ext_Institution D ON C.New_InstitutionalHierarchyId = D.New_InstitutionId
			' -- Ext_From_Statement
		, 'AND A.Donor_Key IS NOT NULL
			GROUP BY A.Donor_Key 
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ', SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112) 
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYU] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_2_Byu
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) 
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYU] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_3_Byu
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112)
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYU] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_4_Byu
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112)
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [BYU]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_5_Byu
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) 
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [BYUI]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Byui
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112) 
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYUI]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_1_Byui
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112)
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYUI] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_2_Byui
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) 
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYUI] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_3_Byui 
			' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, ', SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112)
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYUI] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_4_Byui
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112)
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [BYUI]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_5_Byui
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112)
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [BYUH]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Byuh
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112)
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [BYUH]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_1_Byuh
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112)
							AND Plus_Type != 100000001 
							AND D.New_Inst = [BYUH] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_2_Byuh
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112)
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYUH] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_3_Byuh
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112)
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [BYUH] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_4_Byuh
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112)
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [BYUH]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_5_Byuh
			' -- Ext_Select_Statement_3
		, ', SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112)
															AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112)
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [LDSBC]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112)
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [LDSBC]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_1_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112)
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [LDSBC] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_2_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) 
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [LDSBC] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_3_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112)
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [LDSBC] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_4_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112)
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [LDSBC]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_5_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) 
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [Church]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Church
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112)
							AND B.Plus_Type != 100000001  
							AND D.New_Inst = [Church]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_1_Church
			' -- Ext_Select_Statement_4
		, ', SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112)
															AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112) 
							AND B.Plus_Type != 100000001
							AND D.New_Inst = [Church] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_2_Church
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) 
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [Church] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_3_Church
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112)
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [Church] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_4_Church
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112) 
							AND B.Plus_Type != 100000001 
							AND D.New_Inst = [Church]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_5_Church
			' -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Total_Giving_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Total_Giving_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Donor_Key NVARCHAR(100) PRIMARY KEY
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
		' -- Ext_Create_Fields
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
		' -- Ext_Insert_Fields
		, 'A.Donor_Key 
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_1
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_2
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_3
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_4
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_5
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYU]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Byu
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYU]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_1_Byu 
			' -- Ext_Select_Statement
		, '_All_Donors_ A
				LEFT JOIN _Gift_Credit_ B ON A.Donor_Key = CONVERT(NVARCHAR(100),COALESCE(B.New_RelatedConstituent, B.New_OrganizationId))
				LEFT JOIN _Gift_ C ON B.New_RelatedGift = C.New_GiftId
				LEFT JOIN Ext_Institution D ON C.New_InstitutionalHierarchyId = D.New_InstitutionId
			' -- Ext_From_Statement
		, 'AND A.Donor_Key IS NOT NULL 
			GROUP BY A.Donor_Key 
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ', SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYU] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_2_Byu
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYU] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_3_Byu
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYU] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_4_Byu
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							AND D.New_Inst = [BYU]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_5_Byu
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							AND D.New_Inst = [BYUI]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Byui
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYUI]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_1_Byui
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYUI] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_2_Byui
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYUI] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_With_Matching_Current_Year_Minus_3_Byui 
			' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, ', SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYUI] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_4_Byui
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							AND D.New_Inst = [BYUI]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_5_Byui
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYUH]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Byuh
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							AND D.New_Inst = [BYUH]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_1_Byuh
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYUH] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_2_Byuh
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYUH] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_3_Byuh
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [BYUH] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_4_Byuh
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							AND D.New_Inst = [BYUH]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_5_Byuh
			' -- Ext_Select_Statement_3
		, ', SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112)
															AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							AND D.New_Inst = [LDSBC]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							AND D.New_Inst = [LDSBC]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_1_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [LDSBC] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_2_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [LDSBC] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_3_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [LDSBC] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_4_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							AND D.New_Inst = [LDSBC]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_5_Ldsbc
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-0,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							AND D.New_Inst = [Church]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Church
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-1,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002  
							AND D.New_Inst = [Church]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_1_Church
			' -- Ext_Select_Statement_4
		, ', SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,0),112)
															AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-2,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002
							AND D.New_Inst = [Church] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_2_Church
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-3,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [Church] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_3_Church
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,0),112) 
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-4,-1),112)
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [Church] 
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_4_Church
			, SUM(CASE WHEN CONVERT(DATE,C.New_ReceiptDate,112) BETWEEN CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-6,0),112)
																	AND CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, -2, GETDATE()-1)-5,-1),112) 
							AND B.Plus_Type != 100000001 
							AND B.Plus_SubType != 100000002 
							AND D.New_Inst = [Church]
							THEN New_CreditAmount
						ELSE NULL END) AS Total_Giving_Current_Year_Minus_5_Church
			' -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Donor_Employment_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Employment_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Donor_Key NVARCHAR(100) PRIMARY KEY
			, Byu_Employee_Giving_Campus_Address NVARCHAR(100)
		' -- Ext_Create_Fields
		, 'Donor_Key
			, Byu_Employee_Giving_Campus_Address
		' -- Ext_Insert_Fields
		, 'A.Donor_Key
			,  B.Byu_Employee_Giving_Campus_Address
			' -- Ext_Select_Statement
		, '_All_Donors_ A
			LEFT JOIN
				(SELECT CONVERT(NVARCHAR(100),A.New_EmploymentsId) AS Donor_Key
					, B.Lds_CampusAddress AS Byu_Employee_Giving_Campus_Address -- NVARCHAR(100)
					FROM
						(SELECT ROW_NUMBER() OVER(PARTITION BY B.New_EmploymentsId ORDER BY B.New_EmploymentId) AS Duplicate_Id 
							, B.New_EmploymentId
							, B.New_EmploymentsId
								FROM 
								(SELECT New_EmploymentsId
									, StatusCode
									, MAX(ModifiedOn) AS Max_Modified
									FROM Ext_Employment
									WHERE 1 = 1
										AND StatusCode = 100000002 --Current
										AND Lds_CampusAddress IS NOT NULL
									GROUP BY New_EmploymentsId
										, StatusCode
								) A 
								INNER JOIN
								(SELECT New_EmploymentsId
									, New_EmploymentId
									, StatusCode
									, ModifiedOn
									FROM Ext_Employment
									WHERE 1 = 1
										AND StatusCode = 100000002 --Current
										AND Lds_CampusAddress IS NOT NULL
								) B ON A.New_EmploymentsId = B.New_EmploymentsId
										AND A.Max_Modified = B.ModifiedOn
							WHERE 1 = 1
						) A
						LEFT JOIN Ext_Employment B ON A.New_EmploymentId = B.New_EmploymentId
					WHERE 1 = 1
						AND Duplicate_Id = 1 
			) B ON A.Donor_Key = B.Donor_Key
			' -- Ext_From_Statement
		, 'AND A.Donor_Key IS NOT NULL
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, NULL -- Ext_Select_Statement_2
		, NULL -- Ext_From_Statement_2
		, NULL -- Ext_Create_Fields_2
		, NULL -- Ext_Create_Fields_3
		, NULL -- Ext_Where_Statement_2
		, NULL -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Activity_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Activity_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'Activity_Key INT PRIMARY KEY
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
		' -- Ext_Create_Fields
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
		' -- Ext_Insert_Fields
		, 'ROW_NUMBER() OVER(ORDER BY Activity_Key) AS Activity_Key
			, E.Activity_Group_Key
			, CONVERT(NVARCHAR(100),A.Activity_Id) AS Activity_Id
			, CONVERT(NVARCHAR(100),A.ContactId) AS ContactId
			, ContactName
			, Party_Object_Type
			, Participation_Type
			, Type    
			, Subject
			, Regarding
			, Face_To_Face
			, CONVERT(VARCHAR(10),A.Scheduled_Start,101) AS Scheduled_Start
			, CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.Scheduled_Start,112)) AS Scheduled_Start_Date_Key
			, CONVERT(VARCHAR(10),A.Scheduled_End,101) AS Scheduled_End 
			, CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.Scheduled_End,112)) AS Scheduled_End_Date_Key
			, CONVERT(VARCHAR(10),A.Completed,101) AS Completed
			, CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.Completed,112)) AS Completed_Date_Key 
			, Description
			, Attendees
			, Owner
			, CONVERT(NVARCHAR(100),A.Owner_Id) AS Owner_Id         
			, Source
			, Plus_M11ActivityType
			, Plus_MllMessageType
			, StateCode
			, StatusCode
			, CONVERT(VARCHAR(10),A.CreatedOn,101) AS CreatedOn
			, CONVERT(VARCHAR(10),A.ModifiedOn,101) AS ModifiedOn
			, DomainName
			, Regarding_Type
			' -- Ext_Select_Statement
		, '	(SELECT DISTINCT A.Activity_Key		
			, A.ActivityId AS Activity_Id
			, A.ContactId
			, A.ContactName
			, A.Party_Object_Type
			, A.Participation_Type
			, A.Type              
			, A.Subject
			, A.Regarding
			, A.Face_To_Face
			, A.Scheduled_Start
			, A.Scheduled_End 
			, A.Completed 
			, A.Description
			, A.Attendees
			, A.Owner
			, A.Owner_Id     
			, S.New_Source AS Source
			, MT.Column_Label AS Plus_MllMessageType
			, MAT.Column_Label AS Plus_M11ActivityType
			, STATE.Column_Label AS StateCode
			, STATUS.Column_Label AS StatusCode
			, A.CreatedOn
			, A.ModifiedOn
			, A.DomainName
			, A.Regarding_Type
			FROM
				(SELECT  A.ActivityPartyId AS Activity_Key -- (Unique to all records)
					, A.ActivityId -- Distinct Activity
					, CASE WHEN A.PartyObjectTypeCode IN (1,2) THEN A.PartyId 
						ELSE NULL END AS ContactId -- (ContactId[2]\AccountId[1]\UserId[8])
					, CASE WHEN A.PartyObjectTypeCode IN (1,2) THEN A.PartyIdName 
						ELSE NULL END AS ContactName
					, CASE WHEN A.PartyObjectTypeCode = 1 THEN A.[Organization]
						WHEN A.PartyObjectTypeCode = 2 THEN A.[Constituent]
						ELSE NULL END AS Party_Object_Type
					, F.Participation_Type
					, G.[Type] 
					, CASE WHEN A.PartyObjectTypeCode IN (1,2) THEN B.Subject 
						ELSE NULL END AS Subject
					, CASE WHEN A.PartyObjectTypeCode IN (1,2) THEN B.RegardingObjectIdName 
						ELSE NULL END AS Regarding -- AS Regarding (Campaign type name)
					, CASE WHEN C.Plus_FaceToFace = 0 THEN A.[N]
						WHEN C.Plus_FaceToFace = 1 THEN A.[Y]
						ELSE NULL END AS Face_To_Face
					, B.ScheduledStart AS Scheduled_Start -- Date/Time
					, B.ScheduledEnd AS Scheduled_End -- Date/Time
					, B.ActualEnd AS Completed -- Date/Time (Best for a date)
					, CASE WHEN A.PartyObjectTypeCode IN (1,2) THEN B.Description 
						ELSE NULL END AS Description
					, E.Attendees AS Attendees
					, D.FullName AS Owner
					, D.SystemUserId AS Owner_Id
					, B.StateCode
					, B.StatusCode
					, B.CreatedOn
					, B.ModifiedOn
					, D.DomainName
					, CASE WHEN B.RegardingObjectTypeCode = 1 THEN B.[Organization]
						WHEN B.RegardingObjectTypeCode = 2 THEN B.[Constituent]
						WHEN B.RegardingObjectTypeCode = 3 THEN B.[Initiative] 
							ELSE NULL END AS Regarding_Type
					FROM Ext_Activity A -- People
						LEFT JOIN Ext_Activity_Pointer B ON A.ActivityId = B.ActivityId  -- Activities
						LEFT JOIN Ext_Appointment C ON A.ActivityId = C.ActivityId
						LEFT JOIN Ext_System_User D ON B.OwnerId = D.SystemUserId
						LEFT JOIN Uf_Activity_Attendees() E ON A.ActivityId = E.ActivityId
						LEFT JOIN Uf_Activity_Participation_Type() F ON A.ActivityPartyId = F.ActivityPartyId
						LEFT JOIN Uf_Activity_Pointer_Type() G ON B.ActivityId = G.ActivityId
				) A
				LEFT JOIN Ext_Plus_LegacyM11Base B ON A.ActivityId = B.ActivityId
				LEFT JOIN Ext_Source S ON B.Plus_Source = S.New_SourceId
				LEFT JOIN _Plus_M11MessageType_ MT ON B.Plus_M11MessageType = MT.Column_Value
				LEFT JOIN _Plus_M11ActivityType_ MAT ON B.Plus_M11ActivityType = MAT.Column_Value
				LEFT JOIN _ActivityPointer_StateCode_ STATE ON A.StateCode = STATE.Column_Value
				LEFT JOIN _ActivityPointer_StatusCode_ STATUS ON A.StatusCode = STATUS.Column_Value
			) A
			LEFT JOIN 
				(
				SELECT A.ContactId
					, ROW_NUMBER() OVER(ORDER BY A.ContactId) AS Activity_Group_Key
					FROM
						(SELECT DISTINCT CASE WHEN PartyObjectTypeCode IN (1,2) THEN PartyId 
									ELSE NULL END AS ContactId    
							FROM Ext_Activity) A
				) E ON A.ContactId = E.ContactId
			' -- Ext_From_Statement
		, 'INSERT INTO _Activity_Dim
			VALUES(0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, NULL -- Ext_Select_Statement_2
		, NULL -- Ext_From_Statement_2
		, NULL -- Ext_Create_Fields_2
		, NULL -- Ext_Create_Fields_3
		, NULL -- Ext_Where_Statement_2
		, NULL -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Alumni_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Alumni_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, 'ContactId NVARCHAR(100)
			, Alumni_Key INT  PRIMARY KEY
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
			, Y NVARCHAR(1) DEFAULT ''Y''
			, Byu NVARCHAR(5) DEFAULT ''BYU''
			, Law_School NVARCHAR(50) DEFAULT ''Law School, J. Reuben Clark''
			, Graduated NVARCHAR(50) DEFAULT ''Graduated''
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'DISTINCT CONVERT(NVARCHAR(100),COALESCE(New_StudentsAttendanceId, Plus_Constituent)) AS ContactId
			, ROW_NUMBER() OVER(ORDER BY COALESCE(New_StudentAttendanceId, Plus_AlumniId)) AS Alumni_Key
			, Alumni_Group_Key
			, CONVERT(NVARCHAR(100),A.New_StudentAttendanceId) AS New_StudentAttendanceId
			, New_Term
			, New_Year
			, New_HoursCompleted
			, CONVERT(VARCHAR(10),A.New_ExpectedGraduationDate,101) AS New_ExpectedGraduationDate
			, Plus_Year
			, CONVERT(VARCHAR(100),A.Plus_AlumniId) AS Plus_AlumniId
			, Plus_Name
			, CONVERT(VARCHAR(10),A.Plus_ActualGraduationDate,101) AS Plus_ActualGraduationDate
			, CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.Plus_ActualGraduationDate,112)) AS Actual_Graduation_Date_Key
			, Plus_AlumniStatus
			, Plus_DgId
			, CONVERT(DECIMAL(20,2), A.Plus_HoursCredits) AS Plus_HoursCredits
			, CONVERT(VARCHAR(10),A.Plus_PreferredGraduationDate,101) AS Plus_PreferredGraduationDate
			, CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.Plus_PreferredGraduationDate,112)) AS Preferred_Graduation_Date_Key
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
			' -- Ext_Select_Statement
		, '(SELECT DISTINCT New_StudentAttendanceId
			, New_Term
			, New_Year
			, New_HoursCompleted
			, New_ExpectedGraduationDate
			, Plus_Year
			, New_StudentsAttendanceId
			, Plus_AlumniId
			, Plus_Name
			, Plus_ActualGraduationDate
			, Plus_AlumniStatus
			, Plus_DgId
			, Plus_HoursCredits
			, Plus_PreferredGraduationDate
			, Plus_Constituent
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
			FROM
				(
				SELECT New_StudentAttendanceId
					, New_Term
					, New_Year
					, New_HoursCompleted
					, New_ExpectedGraduationDate
					, Plus_Year
					, New_StudentsAttendanceId
					, NULL AS Plus_AlumniId
					, NULL AS Plus_Name
					, NULL AS Plus_ActualGraduationDate
					, NULL AS Plus_AlumniStatus
					, NULL AS Plus_DgId
					, NULL AS Plus_HoursCredits
					, NULL AS Plus_PreferredGraduationDate
					, NULL AS Plus_Constituent
					, College_Name
					, New_CollegeCode
					, Department
					, NULL AS New_Degree
					, NULL AS New_DegreeCode
					, NULL AS Plus_DegreeLevel
					, New_University
					, New_UniversityCode
					, Plus_UniversityAcronym
					, New_Major
					, New_MajorName 
					, New_MajorCode
					, Program_Code
					, New_Source
					, New_LongDescription
					, NULL AS Program
					, Emphasis         
					FROM
						(SELECT DISTINCT New_StudentAttendanceId
							, New_Term
							, New_Year
							, New_HoursCompleted
							, New_ExpectedGraduationDate
							, Plus_Year
							, New_StudentsAttendanceId
							, College_Name
							, New_CollegeCode
							, Department
							, New_University
							, New_UniversityCode
							, Plus_UniversityAcronym
							, New_Major
							, New_MajorName 
							, New_MajorCode
							, Program_Code
							, New_Source
							, New_LongDescription
							, Emphasis
							FROM 
								(
								SELECT A.New_StudentAttendanceId
									, A.New_Term
									, A.New_Year
									, A.New_HoursCompleted
									, A.New_ExpectedGraduationDate
									, A.Plus_Year
									, A.New_StudentsAttendanceId
									, A.College_Name
									, A.New_CollegeCode
									, A.Department
									, A.New_University
									, A.New_UniversityCode
									, A.Plus_UniversityAcronym
									, A.New_Major
									, A.New_MajorName 
									, A.New_MajorCode
									, A.Program_Code
									, B.New_Source
									, B.New_LongDescription
									, B.Emphasis      
									FROM                  
										(
										SELECT SA.New_StudentAttendanceId
										, SA.New_Term
										, SA.New_Year
										, SA.New_HoursCompleted
										, SA.New_ExpectedGraduationDate
										, SA.Plus_Year
										, SA.New_StudentsAttendanceId
										, C.New_Name AS College_Name
										, C.New_CollegeCode
										, C.New_Name AS Department
										, U.New_University
										, U.New_UniversityCode
										, U.Plus_UniversityAcronym
										, M.New_Major
										, M.New_MajorName 
										, M.New_MajorCode       
										, M.New_MajorCode AS Program_Code
										FROM Ext_Student SA
											LEFT JOIN Ext_College C ON SA.New_College = C.New_CollegeId
											LEFT JOIN Ext_University U ON SA.New_University = U.New_UniversityId       
											LEFT JOIN Ext_Major M ON SA.New_Major = M.New_MajorId
										) A LEFT JOIN
										(
										SELECT SA.New_StudentAttendanceId
											, S.New_Source
											, S.New_LongDescription
											, E.New_MajorName AS Emphasis             											
			' -- Ext_From_Statement
		, 'INSERT INTO _Alumni_Dim
			VALUES(NULL,0,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			CREATE NONCLUSTERED INDEX IX_New_University 
				ON _Alumni_Dim(New_University ASC)
					INCLUDE (
						ContactId
						, Plus_AlumniStatus
						, Plus_ActualGraduationDate
						, New_DegreeCode
						, Program
					);
				CREATE NONCLUSTERED INDEX IX_Alumni_ContactId 
				ON _Alumni_Dim(ContactId ASC)
					INCLUDE (
					New_University 
						, Plus_AlumniStatus
						, Plus_ActualGraduationDate
						, New_DegreeCode
						, Program 
					)
					;
				CREATE NONCLUSTERED INDEX IX_Alumni_ContactId2 
				ON _Alumni_Dim(ContactId ASC)
					;
				UPDATE STATISTICS dbo._Alumni_Dim
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '									FROM Ext_Student SA
												LEFT JOIN Ext_Source S ON SA.New_Source = S.New_SourceId
												LEFT JOIN Ext_Major E ON SA.Plus_Emphasis = E.New_MajorId
										) B ON A.New_StudentAttendanceId = B.New_StudentAttendanceId
								) A 
						) A
				UNION
				SELECT NULL AS New_StudentAttendanceId
					, NULL AS New_Term
					, NULL AS New_Year
					, NULL AS New_HoursCompleted
					, NULL AS New_ExpectedGraduationDate
					, NULL AS Plus_Year
					, NULL AS New_StudentsAttendanceId
					, Plus_AlumniId
					, Plus_Name
					, Plus_ActualGraduationDate
					, Plus_AlumniStatus
					, Plus_DgId
					, Plus_HoursCredits
					, Plus_PreferredGraduationDate
					, Plus_Constituent
					, College_Name
					, New_CollegeCode
					, Department
					, New_Degree
					, New_DegreeCode
					, Plus_DegreeLevel
					, New_University
					, New_UniversityCode
					, Plus_UniversityAcronym
					, NULL AS New_Major
					, NULL AS New_MajorName 
					, NULL AS New_MajorCode
					, Program_Code
					, New_Source
					, New_LongDescription
					, Program
					, Emphasis
					FROM
						(SELECT DISTINCT A.Plus_AlumniId
							, A.Plus_Name
							, A.Plus_ActualGraduationDate
							, B.Plus_AlumniStatus
							, A.Plus_DgId
							, A.Plus_HoursCredits
							, A.Plus_PreferredGraduationDate
							, A.Plus_Constituent
							, A.College_Name
							, A.New_CollegeCode
							, A.Department
							, A.New_Degree
							, A.New_DegreeCode
							, B.Plus_DegreeLevel
							, A.New_University
							, A.New_UniversityCode
							, A.Plus_UniversityAcronym
							, B.Program_Code
							, B.New_Source
							, B.New_LongDescription
							, B.Program
							, B.Emphasis
							FROM                                               
								(SELECT A.Plus_AlumniId
									, A.Plus_Name
									, A.Plus_ActualGraduationDate
									, A.Plus_DgId
									, A.Plus_HoursCredits
									, A.Plus_PreferredGraduationDate
									, A.Plus_Constituent
									, C.New_Name AS College_Name
									, C.New_CollegeCode
									, C.New_Name AS Department
									, D.New_Degree
									, D.New_DegreeCode
									, U.New_University
									, U.New_UniversityCode
									, U.Plus_UniversityAcronym
									FROM Ext_Alumni A
										LEFT JOIN Ext_College C ON A.Plus_College = C.New_CollegeId
										LEFT JOIN Ext_Degree D ON A.Plus_Degree = D.New_DegreeId
										LEFT JOIN Ext_University U ON A.Plus_University = U.New_UniversityId                                                                
								) A  LEFT JOIN                                                                                   
								(SELECT  A.Plus_AlumniId
									, PA.Column_Label AS Plus_AlumniStatus
									, PD.Column_Label AS Plus_DegreeLevel
									, S.New_Source
									, S.New_LongDescription
									, P.New_MajorName AS Program
									, P.New_MajorCode AS Program_Code
									, E.New_MajorName AS Emphasis
									FROM Ext_Alumni A
										LEFT JOIN Ext_Degree D ON A.Plus_Degree = D.New_DegreeId
										LEFT JOIN Ext_Source S ON A.Plus_Source = S.New_SourceId
										LEFT JOIN Ext_Major P ON A.Plus_Program = P.New_MajorId
										LEFT JOIN Ext_Major E ON A.Plus_Emphasis = E.New_MajorId
										LEFT JOIN _Plus_AlumniStatus_ PA ON A.Plus_AlumniStatus = PA.Column_Value
										LEFT JOIN _Plus_DegreeLevel_ PD ON D.Plus_DegreeLevel = PD.Column_Value
								) B ON A.Plus_AlumniId = B.Plus_AlumniId
						) A
				) A
			) A
			LEFT JOIN 
				(
				SELECT A.ContactId
					, ROW_NUMBER() OVER(ORDER BY A.ContactId) AS Alumni_Group_Key
					FROM
						(SELECT DISTINCT New_StudentsAttendanceId AS ContactId 
							FROM Ext_Student
						UNION 
						SELECT DISTINCT Plus_Constituent AS ContactId
							FROM Ext_Alumni
						) A
				) B ON COALESCE(New_StudentsAttendanceId, Plus_Constituent) = B.ContactId 
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
,
-- --------------------------
-- _Affiliated_Dim
-- --------------------------
	( 4 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Affiliated_Dim' -- Ext_Table
		, ' ' -- Dest_Create_Fields
		, ' ' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId  NVARCHAR(100) 
			, Affiliated_Key  INT  PRIMARY KEY
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
		' -- Ext_Create_Fields
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
		' -- Ext_Insert_Fields
		, 'ContactId
			, ROW_NUMBER() OVER(ORDER BY ContactId) AS Affiliated_Key
			, CASE WHEN Byu_Donor_Min_Date IS NOT NULL AND Byu_Donor_Min_Date < COALESCE(Byu_Education_Min_Date,GETDATE()) AND Byu_Donor_Min_Date < COALESCE(Byu_Interest_Min_Date,GETDATE()) AND Byu_Donor_Min_Date < COALESCE(Byu_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byu_Donor_Min_Date,101)
					WHEN Byu_Education_Min_Date IS NOT NULL AND Byu_Education_Min_Date < COALESCE(Byu_Donor_Min_Date,GETDATE()) AND Byu_Education_Min_Date < COALESCE(Byu_Interest_Min_Date,GETDATE()) AND Byu_Education_Min_Date < COALESCE(Byu_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byu_Education_Min_Date,101)
					WHEN Byu_Interest_Min_Date IS NOT NULL AND Byu_Interest_Min_Date < COALESCE(Byu_Donor_Min_Date,GETDATE()) AND Byu_Interest_Min_Date < COALESCE(Byu_Education_Min_Date,GETDATE()) AND Byu_Interest_Min_Date < COALESCE(Byu_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byu_Interest_Min_Date,101)
					WHEN Byu_Employment_Min_Date IS NOT NULL AND Byu_Employment_Min_Date < COALESCE(Byu_Donor_Min_Date,GETDATE()) AND Byu_Employment_Min_Date < COALESCE(Byu_Education_Min_Date,GETDATE()) AND Byu_Employment_Min_Date < COALESCE(Byu_Interest_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byu_Employment_Min_Date,101)
					ELSE NULL END AS Byu_Affiliated_Date
			, CONVERT(VARCHAR(10),Byu_Donor_Min_Date,101) AS Byu_Donor_Affiliated_Date
			, CONVERT(VARCHAR(10),Byu_Education_Min_Date,101) AS Byu_Education_Affiliated_Date
			, CONVERT(VARCHAR(10),Byu_Interest_Min_Date,101) AS Byu_Interest_Affiliated_Date
			, CONVERT(VARCHAR(10),Byu_Employment_Min_Date,101) AS Byu_Employee_Affiliated_Date
			, CASE WHEN Byui_Donor_Min_Date IS NOT NULL AND Byui_Donor_Min_Date < COALESCE(Byui_Education_Min_Date,GETDATE()) AND Byui_Donor_Min_Date < COALESCE(Byui_Interest_Min_Date,GETDATE()) AND Byui_Donor_Min_Date < COALESCE(Byui_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byui_Donor_Min_Date,101)
					WHEN Byui_Education_Min_Date IS NOT NULL AND Byui_Education_Min_Date < COALESCE(Byui_Donor_Min_Date,GETDATE()) AND Byui_Education_Min_Date < COALESCE(Byui_Interest_Min_Date,GETDATE()) AND Byui_Education_Min_Date < COALESCE(Byui_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byui_Education_Min_Date,101)
					WHEN Byui_Interest_Min_Date IS NOT NULL AND Byui_Interest_Min_Date < COALESCE(Byui_Donor_Min_Date,GETDATE()) AND Byui_Interest_Min_Date < COALESCE(Byui_Education_Min_Date,GETDATE()) AND Byui_Interest_Min_Date < COALESCE(Byui_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byui_Interest_Min_Date,101)
					WHEN Byui_Employment_Min_Date IS NOT NULL AND Byui_Employment_Min_Date < COALESCE(Byui_Donor_Min_Date,GETDATE()) AND Byui_Employment_Min_Date < COALESCE(Byui_Education_Min_Date,GETDATE()) AND Byui_Employment_Min_Date < COALESCE(Byui_Interest_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byui_Employment_Min_Date,101)
					ELSE NULL END AS Byui_Affiliated_Date
			, CONVERT(VARCHAR(10),Byui_Donor_Min_Date,101) AS Byui_Donor_Affiliated_Date
			, CONVERT(VARCHAR(10),Byui_Education_Min_Date,101) AS Byui_Education_Affiliated_Date
			, CONVERT(VARCHAR(10),Byui_Interest_Min_Date,101) AS Byui_Interest_Affiliated_Date
			, CONVERT(VARCHAR(10),Byui_Employment_Min_Date,101) AS Byui_Employee_Affiliated_Date
			' -- Ext_Select_Statement
		, '(SELECT COALESCE(A.ContactId,D.ContactId) AS ContactId
				, Byu_Donor_Min_Date
				, Byui_Donor_Min_Date
				, Byuh_Donor_Min_Date
				, Ldsbc_Donor_Min_Date
				, Byu_Education_Min_Date
				, Byui_Education_Min_Date
				, Byuh_Education_Min_Date
				, Ldsbc_Education_Min_Date
				, Byu_Interest_Min_Date
				, Byui_Interest_Min_Date
				, Byuh_Interest_Min_Date
				, Ldsbc_Interest_Min_Date
				, Byu_Employment_Min_Date
				, Byui_Employment_Min_Date
				, Byuh_Employment_Min_Date
				, Ldsbc_Employment_Min_Date
				FROM 
					(SELECT COALESCE(A.ContactId,C.ContactId) AS ContactId
						, Byu_Donor_Min_Date
						, Byui_Donor_Min_Date
						, Byuh_Donor_Min_Date
						, Ldsbc_Donor_Min_Date
						, Byu_Education_Min_Date
						, Byui_Education_Min_Date
						, Byuh_Education_Min_Date
						, Ldsbc_Education_Min_Date
						, Byu_Interest_Min_Date
						, Byui_Interest_Min_Date
						, Byuh_Interest_Min_Date
						, Ldsbc_Interest_Min_Date
						FROM
							(SELECT COALESCE(A.ContactId,B.ContactId) AS ContactId
								, Byu_Donor_Min_Date
								, Byui_Donor_Min_Date
								, Byuh_Donor_Min_Date
								, Ldsbc_Donor_Min_Date
								, Byu_Education_Min_Date
								, Byui_Education_Min_Date
								, Byuh_Education_Min_Date
								, Ldsbc_Education_Min_Date
								FROM					
									(SELECT A.New_ConstituentDonor AS ContactId
										, MIN(CASE WHEN UPPER(B.New_Name) LIKE [Percent_Byu_Percent] AND UPPER(B.New_Name) NOT LIKE [Percent_Byui_Percent] AND UPPER(B.New_Name) NOT LIKE [Percent_Byuh_Percent]
												THEN A.New_ReceiptDate ELSE NULL END) AS Byu_Donor_Min_Date
										, MIN(CASE WHEN UPPER(B.New_Name) LIKE [Percent_Byui_Percent]
												THEN A.New_ReceiptDate ELSE NULL END) AS Byui_Donor_Min_Date
										, MIN(CASE WHEN UPPER(B.New_Name) LIKE [Percent_Byuh_Percent]
												THEN A.New_ReceiptDate ELSE NULL END) AS Byuh_Donor_Min_Date
										, MIN(CASE WHEN UPPER(B.New_Name) = [Ldsbc_Dash_General]
												THEN A.New_ReceiptDate ELSE NULL END) AS Ldsbc_Donor_Min_Date
										FROM _Gift_ A
											INNER JOIN Ext_Institution B ON A.New_InstitutionalHierarchyId = B.New_InstitutionId
										GROUP BY A.New_ConstituentDonor
									) A
									FULL OUTER JOIN
									(SELECT COALESCE(A.ContactId,B.ContactId) AS ContactId
										, CASE WHEN B.Byu_Student_Min_Date IS NULL THEN A.Byu_Alumni_Min_Date
												WHEN A.Byu_Alumni_Min_Date IS NULL THEN B.Byu_Student_Min_Date
												WHEN A.Byu_Alumni_Min_Date < B.Byu_Student_Min_Date THEN A.Byu_Alumni_Min_Date
												WHEN B.Byu_Student_Min_Date < A.Byu_Alumni_Min_Date THEN B.Byu_Student_Min_Date
												WHEN A.Byu_Alumni_Min_Date = B.Byu_Student_Min_Date THEN A.Byu_Alumni_Min_Date
												ELSE NULL END AS Byu_Education_Min_Date
										, CASE WHEN B.Byui_Student_Min_Date IS NULL THEN A.Byui_Alumni_Min_Date
												WHEN A.Byui_Alumni_Min_Date IS NULL THEN B.Byui_Student_Min_Date
												WHEN A.Byui_Alumni_Min_Date < B.Byui_Student_Min_Date THEN A.Byui_Alumni_Min_Date
												WHEN B.Byui_Student_Min_Date < A.Byui_Alumni_Min_Date THEN B.Byui_Student_Min_Date
												WHEN A.Byui_Alumni_Min_Date = B.Byui_Student_Min_Date THEN A.Byui_Alumni_Min_Date
												ELSE NULL END AS Byui_Education_Min_Date
										, CASE WHEN B.Byuh_Student_Min_Date IS NULL THEN A.Byuh_Alumni_Min_Date
												WHEN A.Byuh_Alumni_Min_Date IS NULL THEN B.Byuh_Student_Min_Date
												WHEN A.Byuh_Alumni_Min_Date < B.Byuh_Student_Min_Date THEN A.Byuh_Alumni_Min_Date
												WHEN B.Byuh_Student_Min_Date < A.Byuh_Alumni_Min_Date THEN B.Byuh_Student_Min_Date
												WHEN A.Byuh_Alumni_Min_Date = B.Byuh_Student_Min_Date THEN A.Byuh_Alumni_Min_Date
												ELSE NULL END AS Byuh_Education_Min_Date										 					
			' -- Ext_From_Statement
		, 'AND ContactId IS NOT NULL
			INSERT INTO _Affiliated_Dim
				VALUES(NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
			' -- Ext_Where_Statement	
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ', CASE WHEN Byuh_Donor_Min_Date IS NOT NULL AND Byuh_Donor_Min_Date < COALESCE(Byuh_Education_Min_Date,GETDATE()) AND Byuh_Donor_Min_Date < COALESCE(Byuh_Interest_Min_Date,GETDATE()) AND Byuh_Donor_Min_Date < COALESCE(Byuh_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byuh_Donor_Min_Date,101)
					WHEN Byuh_Education_Min_Date IS NOT NULL AND Byuh_Education_Min_Date < COALESCE(Byuh_Donor_Min_Date,GETDATE()) AND Byuh_Education_Min_Date < COALESCE(Byuh_Interest_Min_Date,GETDATE()) AND Byuh_Education_Min_Date < COALESCE(Byuh_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byuh_Education_Min_Date,101)
					WHEN Byuh_Interest_Min_Date IS NOT NULL AND Byuh_Interest_Min_Date < COALESCE(Byuh_Donor_Min_Date,GETDATE()) AND Byuh_Interest_Min_Date < COALESCE(Byuh_Education_Min_Date,GETDATE()) AND Byuh_Interest_Min_Date < COALESCE(Byuh_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byuh_Interest_Min_Date,101)
					WHEN Byuh_Employment_Min_Date IS NOT NULL AND Byuh_Employment_Min_Date < COALESCE(Byuh_Donor_Min_Date,GETDATE()) AND Byuh_Employment_Min_Date < COALESCE(Byuh_Education_Min_Date,GETDATE()) AND Byuh_Employment_Min_Date < COALESCE(Byuh_Interest_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Byuh_Employment_Min_Date,101)
					ELSE NULL END AS Byuh_Affiliated_Date
			, CONVERT(VARCHAR(10),Byuh_Donor_Min_Date,101) AS Byuh_Donor_Affiliated_Date
			, CONVERT(VARCHAR(10),Byuh_Education_Min_Date,101) AS Byuh_Education_Affiliated_Date
			, CONVERT(VARCHAR(10),Byuh_Interest_Min_Date,101) AS Byuh_Interest_Affiliated_Date
			, CONVERT(VARCHAR(10),Byuh_Employment_Min_Date,101) AS Byuh_Employee_Affiliated_Date
			, CASE WHEN Ldsbc_Donor_Min_Date IS NOT NULL AND Ldsbc_Donor_Min_Date < COALESCE(Ldsbc_Education_Min_Date,GETDATE()) AND Ldsbc_Donor_Min_Date < COALESCE(Ldsbc_Interest_Min_Date,GETDATE()) AND Ldsbc_Donor_Min_Date < COALESCE(Ldsbc_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Ldsbc_Donor_Min_Date,101)
					WHEN Ldsbc_Education_Min_Date IS NOT NULL AND Ldsbc_Education_Min_Date < COALESCE(Ldsbc_Donor_Min_Date,GETDATE()) AND Ldsbc_Education_Min_Date < COALESCE(Ldsbc_Interest_Min_Date,GETDATE()) AND Ldsbc_Education_Min_Date < COALESCE(Ldsbc_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Ldsbc_Education_Min_Date,101)
					WHEN Ldsbc_Interest_Min_Date IS NOT NULL AND Ldsbc_Interest_Min_Date < COALESCE(Ldsbc_Donor_Min_Date,GETDATE()) AND Ldsbc_Interest_Min_Date < COALESCE(Ldsbc_Education_Min_Date,GETDATE()) AND Ldsbc_Interest_Min_Date < COALESCE(Ldsbc_Employment_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Ldsbc_Interest_Min_Date,101)
					WHEN Ldsbc_Employment_Min_Date IS NOT NULL AND Ldsbc_Employment_Min_Date < COALESCE(Ldsbc_Donor_Min_Date,GETDATE()) AND Ldsbc_Employment_Min_Date < COALESCE(Ldsbc_Education_Min_Date,GETDATE()) AND Ldsbc_Employment_Min_Date < COALESCE(Ldsbc_Interest_Min_Date,GETDATE()) THEN CONVERT(VARCHAR(10),Ldsbc_Employment_Min_Date,101)
					ELSE NULL END AS Ldsbc_Affiliated_Date
			, CONVERT(VARCHAR(10),Ldsbc_Donor_Min_Date,101) AS Ldsbc_Donor_Affiliated_Date
			, CONVERT(VARCHAR(10),Ldsbc_Education_Min_Date,101) AS Ldsbc_Education_Affiliated_Date
			, CONVERT(VARCHAR(10),Ldsbc_Interest_Min_Date,101) AS Ldsbc_Interest_Affiliated_Date
			, CONVERT(VARCHAR(10),Ldsbc_Employment_Min_Date,101) AS Ldsbc_Employee_Affiliated_Date 
			' -- Ext_Select_Statement_2
		, '								, CASE WHEN B.Ldsbc_Student_Min_Date IS NULL THEN A.Ldsbc_Alumni_Min_Date
												WHEN A.Ldsbc_Alumni_Min_Date IS NULL THEN B.Ldsbc_Student_Min_Date
												WHEN A.Ldsbc_Alumni_Min_Date < B.Ldsbc_Student_Min_Date THEN A.Ldsbc_Alumni_Min_Date
												WHEN B.Ldsbc_Student_Min_Date < A.Ldsbc_Alumni_Min_Date THEN B.Ldsbc_Student_Min_Date
												WHEN A.Ldsbc_Alumni_Min_Date = B.Ldsbc_Student_Min_Date THEN A.Ldsbc_Alumni_Min_Date
												ELSE NULL END AS Ldsbc_Education_Min_Date
										FROM
											(SELECT A.Plus_Constituent AS ContactId
												, MIN(CASE WHEN A.Plus_AlumniStatus IN (100000000,100000001) AND B.New_University = [Byu]
													THEN CONVERT(DATE,COALESCE(A.Plus_PreferredGraduationDate,A.Plus_ActualGraduationDate),101) ELSE NULL END) AS Byu_Alumni_Min_Date
												, MIN(CASE WHEN A.Plus_AlumniStatus IN (100000000,100000001) AND B.New_University = [Byui]
													THEN CONVERT(DATE,COALESCE(A.Plus_PreferredGraduationDate,A.Plus_ActualGraduationDate),101) ELSE NULL END) AS Byui_Alumni_Min_Date
												, MIN(CASE WHEN A.Plus_AlumniStatus IN (100000000,100000001) AND B.New_University = [Byuh]
													THEN CONVERT(DATE,COALESCE(A.Plus_PreferredGraduationDate,A.Plus_ActualGraduationDate),101) ELSE NULL END) AS Byuh_Alumni_Min_Date
												, MIN(CASE WHEN A.Plus_AlumniStatus IN (100000000,100000001) AND B.New_University = [Ldsbc]
													THEN CONVERT(DATE,COALESCE(A.Plus_PreferredGraduationDate,A.Plus_ActualGraduationDate),101) ELSE NULL END) AS Ldsbc_Alumni_Min_Date
												FROM Ext_Alumni A
													INNER JOIN Ext_University B ON A.Plus_University = B.New_UniversityId
												GROUP BY A.Plus_Constituent
											) A 
											FULL OUTER JOIN
											(SELECT New_StudentsAttendanceId AS ContactId
												, MIN(CASE WHEN A.Attendance_Month IS NOT NULL AND A.Plus_Year IS NOT NULL AND A.New_University = [Byu] THEN
														CONVERT(DATE,CONCAT(Attendance_Month,[Slash_1_Slash],Plus_Year),101) ELSE NULL END) AS Byu_Student_Min_Date
												, MIN(CASE WHEN A.Attendance_Month IS NOT NULL AND A.Plus_Year IS NOT NULL AND A.New_University = [Byui] THEN
														CONVERT(DATE,CONCAT(Attendance_Month,[Slash_1_Slash],Plus_Year),101) ELSE NULL END) AS Byui_Student_Min_Date
												, MIN(CASE WHEN A.Attendance_Month IS NOT NULL AND A.Plus_Year IS NOT NULL AND A.New_University = [Byuh] THEN
														CONVERT(DATE,CONCAT(Attendance_Month,[Slash_1_Slash],Plus_Year),101) ELSE NULL END) AS Byuh_Student_Min_Date
												, MIN(CASE WHEN A.Attendance_Month IS NOT NULL AND A.Plus_Year IS NOT NULL AND A.New_University = [Ldsbc] THEN
														CONVERT(DATE,CONCAT(Attendance_Month,[Slash_1_Slash],Plus_Year),101) ELSE NULL END) AS Ldsbc_Student_Min_Date
												FROM

			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, '													(SELECT A.New_StudentsAttendanceId
														, A.New_Term
														, CASE WHEN SUBSTRING(CONVERT(NVARCHAR(4),A.Plus_Year),1,1) IN ([N1],[N2])  
																	AND LEN(A.Plus_Year) = 4 THEN A.Plus_Year
															ELSE NULL END AS Plus_Year 
														, B.New_University
														, [Byu]
														, [Byui]
														, [Byuh]
														, [Ldsbc]
														, [Slash_1_Slash]
														, CASE WHEN CONVERT(NVARCHAR(100),A.New_Term) LIKE [Winter_Percent] THEN 1
																WHEN CONVERT(NVARCHAR(100),A.New_Term) LIKE [Spring_Percent] THEN 4
																WHEN CONVERT(NVARCHAR(100),A.New_Term) LIKE [Summer_Percent] THEN 6
																WHEN CONVERT(NVARCHAR(100),A.New_Term) LIKE [Fall_Percent] THEN 8
																WHEN CONVERT(NVARCHAR(100),A.New_Term) IS NOT NULL THEN 1
																ELSE NULL END AS Attendance_Month
														FROM Ext_Student A
															INNER JOIN Ext_University B ON A.New_University = B.New_UniversityId
														WHERE 1 = 1
															AND A.New_Term IS NOT NULL
										
													) A
												GROUP BY A.New_StudentsAttendanceId
											) B ON A.ContactId = B.ContactId
									) B ON A.ContactId = B.ContactId
							) A				
							FULL OUTER JOIN
							(SELECT A.New_InternationalExperiencesAId AS ContactId
								, MIN(CASE WHEN A.New_Experience = 990260000 AND UPPER(B.New_Name) LIKE [Percent_Byu_Percent] AND UPPER(B.New_Name) NOT LIKE [Percent_Byui_Percent] AND UPPER(B.New_Name) NOT LIKE [Percent_Byuh_Percent]
										THEN A.New_StartDate ELSE NULL END) AS Byu_Interest_Min_Date
								, MIN(CASE WHEN A.New_Experience = 990260000 AND UPPER(B.New_Name) LIKE [Percent_Byui_Percent]
										THEN A.New_StartDate ELSE NULL END) AS Byui_Interest_Min_Date
								, MIN(CASE WHEN A.New_Experience = 990260000 AND UPPER(B.New_Name) LIKE [Percent_Byuh_Percent]
										THEN A.New_StartDate ELSE NULL END) AS Byuh_Interest_Min_Date
								, MIN(CASE WHEN A.New_Experience = 990260000 AND UPPER(B.New_Name)  = [Ldsbc_Dash_General]
										THEN A.New_StartDate ELSE NULL END) AS Ldsbc_Interest_Min_Date
								FROM Ext_International_Experience A
									INNER JOIN Ext_Institution B ON A.Plus_InstitutionalHierarchy = B.New_InstitutionId
								GROUP BY A.New_InternationalExperiencesAId
							) C ON A.ContactId = C.ContactId
					) A		
					FULL OUTER JOIN
					(SELECT A.New_EmploymentsId AS ContactId
						, MIN(CASE WHEN A.New_Type = 100000000 AND UPPER(B.New_Name) LIKE [Percent_Byu_Percent]  AND UPPER(B.New_Name) NOT LIKE [Percent_Byui_Percent]  AND UPPER(B.New_Name) NOT LIKE [Percent_Byuh_Percent] 
								THEN A.New_DateStarted ELSE NULL END) AS Byu_Employment_Min_Date
						, MIN(CASE WHEN A.New_Type = 100000000 AND UPPER(B.New_Name) LIKE [Percent_Byui_Percent] 
								THEN A.New_DateStarted ELSE NULL END) AS Byui_Employment_Min_Date
						, MIN(CASE WHEN A.New_Type = 100000000 AND UPPER(B.New_Name) LIKE [Percent_Byuh_Percent] 
								THEN A.New_DateStarted ELSE NULL END) AS Byuh_Employment_Min_Date
						, MIN(CASE WHEN A.New_Type = 100000000 AND UPPER(B.New_Name) = [Ldsbc_Dash_General]
								THEN A.New_DateStarted ELSE NULL END) AS Ldsbc_Employment_Min_Date
						FROM Ext_Employment A
							INNER JOIN Ext_Institution B ON A.New_InstitutionalHierarchyId = B.New_InstitutionId
						GROUP BY A.New_EmploymentsId
					) D  ON A.ContactId = D.ContactId
			) A
			'-- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Address_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Address_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Address_Key INT PRIMARY KEY
			, Address_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Address_Key
			, Address_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Address_Key
			, Address_Group_Key  
			' -- Ext_Select_Statement
		, '_Address_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Award_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Award_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Award_Key INT PRIMARY KEY
			, Award_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Award_Key
			, Award_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Award_Key
			, Award_Group_Key  
			' -- Ext_Select_Statement
		, '_Award_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Phone_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Phone_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Phone_Key INT PRIMARY KEY
			, Phone_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Phone_Key
			, Phone_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Phone_Key
			, Phone_Group_Key  
			' -- Ext_Select_Statement
		, '_Phone_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Email_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Email_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Email_Key INT PRIMARY KEY
			, Email_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Email_Key
			, Email_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Email_Key
			, Email_Group_Key  
			' -- Ext_Select_Statement
		, '_Email_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Activity_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Activity_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Activity_Key INT PRIMARY KEY
			, Activity_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Activity_Key
			, Activity_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Activity_Key
			, Activity_Group_Key  
			' -- Ext_Select_Statement
		, '_Activity_Dim				
			' -- Ext_From_Statement
		, ' 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Drop_Include_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Drop_Include_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Drop_Include_Key INT PRIMARY KEY
			, Drop_Include_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Drop_Include_Key
			, Drop_Include_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Drop_Include_Key
			, Drop_Include_Group_Key  
			' -- Ext_Select_Statement
		, '_Drop_Include_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Language_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Language_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Language_Key INT PRIMARY KEY
			, Language_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Language_Key
			, Language_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Language_Key
			, Language_Group_Key  
			' -- Ext_Select_Statement
		, '_Language_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Association_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Association_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Association_Key INT PRIMARY KEY
			, Association_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Association_Key
			, Association_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Association_Key
			, Association_Group_Key  
			' -- Ext_Select_Statement
		, '_Association_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Alumni_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Alumni_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Alumni_Key INT PRIMARY KEY
			, Alumni_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Alumni_Key
			, Alumni_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Alumni_Key
			, Alumni_Group_Key  
			' -- Ext_Select_Statement
		, '_Alumni_Dim				
			' -- Ext_From_Statement
		, ' 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Employment_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Employment_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Employment_Key INT PRIMARY KEY
			, Employment_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Employment_Key
			, Employment_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Employment_Key
			, Employment_Group_Key  
			' -- Ext_Select_Statement
		, '_Employment_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Connection_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Connection_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Connection_Key INT PRIMARY KEY
			, Connection_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Connection_Key
			, Connection_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Connection_Key
			, Connection_Group_Key  
			' -- Ext_Select_Statement
		, '_Connection_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Id_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Id_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Id_Key INT PRIMARY KEY
			, Id_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Id_Key
			, Id_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Id_Key
			, Id_Group_Key  
			' -- Ext_Select_Statement
		, '_Id_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Interest_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Interest_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Interest_Key INT PRIMARY KEY
			, Interest_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Interest_Key
			, Interest_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Interest_Key
			, Interest_Group_Key  
			' -- Ext_Select_Statement
		, '_Interest_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Student_Bridge
-- --------------------------
	( 5 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Student_Bridge' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	ContactId NVARCHAR(100)
			, Student_Key INT PRIMARY KEY
			, Student_Group_Key INT
			' -- Ext_Create_Fields
		, '	ContactId
			, Student_Key
			, Student_Group_Key
			' -- Ext_Insert_Fields
		, 'DISTINCT ContactId
			, Student_Key
			, Student_Group_Key  
			' -- Ext_Select_Statement
		, '_Student_Dim				
			' -- Ext_From_Statement
		, ' ' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, ' ' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donation_Dim
-- --------------------------
	( 6 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donation_Dim' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	Donation_Key NVARCHAR(100) PRIMARY KEY
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
			' -- Ext_Create_Fields
		, '	Donation_Key 
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
			' -- Ext_Insert_Fields
		, 'DISTINCT A.New_GiftId AS Donation_Key 
			, CONVERT(NVARCHAR(100),A.New_ConstituentDonor) AS New_ConstituentDonor
			, CONVERT(NVARCHAR(100),A.New_OrganizationDonor) AS New_OrganizationDonor
			, COALESCE(J.New_BatchNumber,A.New_BatchNumber) AS New_BatchNumber
			, A.New_GiftNumber
			, B.Column_Label AS StatusCode
			, A.Plus_ReceiptText
			, A.Plus_SpecialGiftInstructions
			, A.Plus_CheckNumber
			, C.Column_Label AS Plus_GiftSource
			, D.Column_Label AS Plus_Kind
			, E.Column_Label AS New_TenderType
			, CONVERT(VARCHAR(10),A.New_AccountingDate,101) AS New_AccountingDate
			, CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.New_AccountingDate,112)) AS Accounting_Date_Key
			, CONVERT(VARCHAR(10),A.New_ReceiptDate,101) AS New_ReceiptDate
			, CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.New_ReceiptDate,112)) AS Receipt_Date_Key
			, CONVERT(VARCHAR(10),A.New_PostDate,101) AS New_PostDate
			, CONVERT(NUMERIC(10,0),CONVERT(VARCHAR(10),A.New_PostDate,112)) AS Post_Date_Key
			, CASE WHEN A.Plus_PlannedGift = 0 THEN [N] 
				WHEN A.Plus_PlannedGift = 1 THEN [Y] 
				ELSE NULL END AS Plus_PlannedGift
			, CASE WHEN A.New_Transmitted = 0 THEN [N] 
				WHEN A.New_Transmitted = 1 THEN [Y] 
				ELSE NULL END AS New_Transmitted
			, CASE WHEN A.Plus_AnonymousGift = 0 THEN [N]
				WHEN A.Plus_AnonymousGift = 1 THEN [Y] 
				ELSE NULL END AS Plus_AnonymousGift
			, F.Column_Label AS Plus_ReceiptDeliveryMethod
			, A.Plus_GiftInstructions
			, A.Plus_AcknowledgementInstructions
			, CASE WHEN A.Plus_ExcludeFromReport = 0 THEN [N] 
				WHEN A.Plus_ExcludeFromReport = 1 THEN [Y] 
				ELSE NULL END AS Plus_ExcludeFromReport
			, CASE WHEN A.Plus_IncludeOnYearEndReceipt = 0 THEN [N] 
				WHEN A.Plus_IncludeOnYearEndReceipt = 1 THEN [Y] 
				ELSE NULL END AS Plus_IncludeOnYearEndReceipt
			, CASE WHEN A.Plus_GoodsServicesProvided = 0 THEN [N] 
				WHEN A.Plus_GoodsServicesProvided = 1 THEN [Y] 
				ELSE NULL END AS Plus_GoodsServicesProvided
			, A.Plus_AcknowledgeContact
			, G.Column_Label AS Plus_ContactRole
			, H.Column_Label AS Plus_Salutation
			, CONVERT(NVARCHAR(100),A.Plus_Signer) AS Plus_Signer
			, CASE WHEN A.Plus_NoAcknowledgement = 0 THEN [N] 
				WHEN A.Plus_NoAcknowledgement = 1 THEN [Y] 
				ELSE NULL END AS Plus_NoAcknowledgement         
			, A.Match_Gift_Number
			, CASE WHEN A.Plus_MatchExpected = 0 THEN [N] 
				WHEN A.Plus_MatchExpected = 1 THEN [Y] 
				ELSE NULL END AS Plus_MatchExpected
			, CASE WHEN L.New_GiftId IS NULL THEN [N] ELSE [Y] END AS Recurring_Gift
			, CASE WHEN M.New_GiftId IS NULL OR M.Recurring_Gift_Expectancy = [N] THEN [N] ELSE [Y] END AS Recurring_Gift_Expectancy
			, RCR.Recognition_Credit_Recipients
			, CASE WHEN CONVERT(DATE,New_ReceiptDate,112) BETWEEN CONVERT(DATE,DATEADD(yy,DATEDIFF(yy,0,GETDATE()),0),1) 
							AND CONVERT(DATE,CONVERT(NVARCHAR(10),DATEADD(dd, -(DATEPART(dw,GETDATE()-1)-0), GETDATE()-1),112)) THEN [Y]
					ELSE [N] END AS Donation_Receipt_Ytd_Last_Week
			, CASE WHEN CONVERT(DATE,New_ReceiptDate,112) BETWEEN CONVERT(DATE,CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()-1)-1,0),112)) 
							AND CONVERT(DATE,REPLACE(CONVERT(NVARCHAR(10),DATEADD(dd, -(DATEPART(dw,GETDATE()-1)-0), GETDATE()-1),112),CONVERT(NVARCHAR(4),YEAR(GETDATE()-1)),CONVERT(NVARCHAR(4),YEAR(GETDATE()-1))-1)) THEN [Y]
					ELSE [N] END AS Donation_Receipt_Ytd_Last_Week_Last_Year
			, CASE WHEN CONVERT(DATE,New_ReceiptDate,112) BETWEEN CONVERT(DATE,DATEADD(yy,DATEDIFF(yy,0,GETDATE()),0),1)
							AND CONVERT(DATE,CONVERT(NVARCHAR(10),DATEADD(dd, -(DATEPART(dw,GETDATE()-1)-0), GETDATE()-8),112))  THEN [Y]
					ELSE [N] END AS Donation_Receipt_Ytd_Two_Weeks_Ago
			, A.Plus_Description AS Donation_Description
			, K.Column_Label AS Lds_BatchType
			' -- Ext_Select_Statement
		, ' dbo._Gift_ A
			LEFT JOIN _Donation_StatusCode_ B ON A.StatusCode = B.Column_Value
			LEFT JOIN _Donation_GiftSource_ C ON A.Plus_GiftSource = C.Column_Value
			LEFT JOIN _Donation_Kind_ D ON A.Plus_Kind = D.Column_Value
			LEFT JOIN _Donation_TenderType_ E ON A.New_TenderType = E.Column_Value
			LEFT JOIN _Donation_ReceiptDeliveryMethod_ F ON A.Plus_ReceiptDeliveryMethod = F.Column_Value
			LEFT JOIN _Donation_ContactRole_ G ON A.Plus_ContactRole = G.Column_Value
			LEFT JOIN _Donation_Salutation_ H ON A.Plus_Salutation = H.Column_Value 
			LEFT JOIN Uf_Recognition_Credit_Recipients() RCR ON A.New_GiftId = RCR.New_RelatedGift
			LEFT JOIN Ext_Batch J ON A.New_Batch = J.New_BatchesId
			LEFT JOIN _Lds_BatchType_ K ON J.Lds_BatchType = K.Column_Value	
			LEFT JOIN
				(SELECT New_GiftId 
					, [Y] AS Recurring_Gift
					FROM dbo._Gift_
					WHERE 1 = 1
						AND (Lds_RecurringGiftRule IS NOT NULL
								OR Lds_RecurringGiftGroup IS NOT NULL)
				) L ON A.New_GiftId = L.New_GiftId
			LEFT JOIN
				(SELECT Plus_ParentGift AS New_GiftId
					, CASE WHEN Plus_RecurringGiftRules IS NOT NULL THEN [Y] ELSE [N] END AS Recurring_Gift_Expectancy
					FROM 
						(SELECT Plus_ParentGift
							, Plus_RecurringGiftRules
							, [Y]
							, [N]
							FROM Ext_Pledge
							WHERE 1 = 1
								AND Plus_ParentGift IS NOT NULL
						) A
				) M ON A.New_GiftId = M.New_GiftId
			' -- Ext_From_Statement
		, '
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '													
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, '															
			' -- Ext_From_Statement_3
		, '
			'-- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Key_Dim
-- --------------------------
	( 6 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Key_Dim' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	Donor_Key NVARCHAR(100) PRIMARY KEY      
			, Activity_Group_Key INT
			, Address_Group_Key INT 
			, Affiliated_Key INT
			, Alumni_Group_Key INT 
			, Association_Group_Key INT 
			, Award_Group_Key INT 
			, Connection_Group_Key INT
			, Drop_Include_Group_Key INT 
			, Email_Group_Key INT 
			, Employment_Group_Key INT 
			, Id_Group_Key INT
			, Interest_Group_Key INT
			, Language_Group_Key INT 
			, Phone_Group_Key  INT
			, Psa_Group_Key  INT
			, Student_Group_Key INT
			, Donor_Ldsp_Id NVARCHAR(100) 
			, Donor_Contact_Type NVARCHAR(100) 
			, Donor_Organization_Id NVARCHAR(100)
			, Zero NVARCHAR(1) DEFAULT ''0''
			' -- Ext_Create_Fields
		, '	Donor_Key      
			, Activity_Group_Key 
			, Address_Group_Key 
			, Affiliated_Key
			, Alumni_Group_Key 
			, Association_Group_Key 
			, Award_Group_Key 
			, Connection_Group_Key
			, Drop_Include_Group_Key 
			, Email_Group_Key 
			, Employment_Group_Key 
			, Id_Group_Key
			, Interest_Group_Key
			, Language_Group_Key 
			, Phone_Group_Key 
			, Psa_Group_Key 
			, Student_Group_Key
			, Donor_Ldsp_Id 
			, Donor_Contact_Type 
			, Donor_Organization_Id
			' -- Ext_Insert_Fields
		, 'A.Donor_Key
			, COALESCE(B.Activity_Group_Key,0) AS Activity_Group_Key
			, COALESCE(C.Address_Group_Key,0) AS Address_Group_Key
			, COALESCE(D.Affiliated_Key,0) AS Affiliated_Key
			, COALESCE(E.Alumni_Group_Key,0) AS Alumni_Group_Key
			, COALESCE(F.Association_Group_Key,0) AS Association_Group_Key
			, COALESCE(G.Award_Group_Key,0) AS Award_Group_Key
			, COALESCE(H.Connection_Group_Key,0) AS Connection_Group_Key 
			, COALESCE(I.Drop_Include_Group_Key,0) AS Drop_Include_Group_Key 
			, COALESCE(J.Email_Group_Key,0) AS Email_Group_Key
			, COALESCE(K.Employment_Group_Key,0) AS Employment_Group_Key
			, COALESCE(L.Id_Group_Key,0) AS Id_Group_Key  
			, COALESCE(M.Interest_Group_Key,0) AS Interest_Group_Key
			, COALESCE(N.Language_Group_Key,0) AS Language_Group_Key
			, COALESCE(O.Phone_Group_Key,0) AS Phone_Group_Key
			, COALESCE(P.Psa_Group_Key,0) AS Psa_Group_Key 
			, COALESCE(Q.Student_Group_Key,0) AS Student_Group_Key
			, R.Donor_Ldsp_Id
			, R.Donor_Contact_Type
			, R.Donor_Organization_Id  
			' -- Ext_Select_Statement
		, '_All_Donors_ A
				LEFT JOIN 
					(SELECT ContactId
						, Activity_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Activity_Group_Key
								FROM _Activity_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) B ON A.Donor_Key = B.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Address_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Address_Group_Key
								FROM _Address_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) C ON A.Donor_Key = C.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Affiliated_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Affiliated_Key
								FROM _Affiliated_Dim 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) D ON A.Donor_Key = D.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Alumni_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Alumni_Group_Key
								FROM _Alumni_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) E ON A.Donor_Key = E.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Association_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Association_Group_Key
								FROM _Association_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) F ON A.Donor_Key = F.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Award_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Award_Group_Key
								FROM _Award_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) G ON A.Donor_Key = G.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Connection_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Connection_Group_Key
								FROM _Connection_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) H ON A.Donor_Key = H.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Drop_Include_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Drop_Include_Group_Key
								FROM _Drop_Include_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) I ON A.Donor_Key = I.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Email_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Email_Group_Key
								FROM _Email_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) J ON A.Donor_Key = J.ContactId				
			' -- Ext_From_Statement
		, 'AND A.Donor_Key IS NOT NULL 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '		LEFT JOIN 
					(SELECT ContactId
						, Employment_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Employment_Group_Key
								FROM _Employment_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) K ON A.Donor_Key = K.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Id_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Id_Group_Key
								FROM _Id_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) L ON A.Donor_Key = L.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Interest_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Interest_Group_Key
								FROM _Interest_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) M ON A.Donor_Key = M.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Language_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Language_Group_Key
								FROM _Language_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) N ON A.Donor_Key = N.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Phone_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Phone_Group_Key
								FROM _Phone_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) O ON A.Donor_Key = O.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Psa_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Psa_Group_Key
								FROM _Psa_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) P ON A.Donor_Key = P.ContactId
				LEFT JOIN 
					(SELECT ContactId
						, Student_Group_Key
						FROM
							(SELECT ContactId
								, ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY ContactId) AS Row_Num
								, Student_Group_Key
								FROM _Student_Bridge 
								WHERE 1 = 1
									AND ContactId IS NOT NULL
							) A
						WHERE 1 = 1
							AND Row_Num = 1
					) Q ON A.Donor_Key = Q.ContactId			
				LEFT JOIN
					(SELECT DISTINCT CONVERT(NVARCHAR(100),ContactId) AS ContactId
						, COALESCE(New_LdspId,0) AS Donor_Ldsp_Id
						, Donor_Contact_Type
						, COALESCE(CONVERT(NVARCHAR(100),Donor_Organization_Id),[Zero]) AS Donor_Organization_Id
						FROM
							(SELECT A.ContactId
								, A.New_LdspId
								, [Constituent] AS Donor_Contact_Type
								, [Zero] AS Donor_Organization_Id
								, [Zero]
								FROM Ext_Contact A
							UNION
							SELECT B.AccountId AS ContactId
								, B.New_LdspId
								, [Organization] AS Donor_Contact_Type
								, CONVERT(NVARCHAR(100),B.AccountId) AS Donor_Organization_Id
								, [Zero]
								FROM Ext_Account B
							) A
					) R ON A.Donor_Key = R.ContactId 
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, NULL -- Ext_From_Statement_3
		, NULL -- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Detail_Dim
-- --------------------------
	( 6 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Detail_Dim' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	Donor_Key  NVARCHAR(100)  PRIMARY KEY      
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'A.Donor_Key
			, C.Column_Label AS Donor_Marriage_Status
			, D.Column_Label AS Donor_Gender
			, E.Column_Label AS Donor_Lds_Member
			, CASE WHEN ISDATE(B.New_BirthDate) = 1 THEN B.New_Birthdate ELSE NULL END AS Donor_Birth_Dt
			, B.New_BirthdateDay AS Donor_Birth_Dt_Day
			, B.New_BirthdateMonth AS Donor_Birth_Dt_Month
			, B.New_BirthdateYear AS Donor_Birth_Dt_Year
			, CASE WHEN ISDATE(B.New_DeceasedDate) = 1 THEN B.New_DeceasedDate ELSE NULL END AS Donor_Deceased_Dt
			, B.New_DeceasedDay AS Donor_Deceased_Dt_Day
			, B.New_DeceasedMonth AS Donor_Deceased_Dt_Month
			, B.New_DeceasedYear AS Donor_Deceased_Dt_Year
			, F.New_Name AS Donor_Country
			, CASE WHEN B.New_Deceased != 1 OR B.New_Deceased IS NULL THEN B.[N] ELSE B.[Y] END AS Donor_Deceased_Yn
			, G.Donor_Age
			, COALESCE(H.General_Authority,B.[N]) AS General_Authority
			, COALESCE(H.Emeritus_General_Authority,B.[N]) AS Emeritus_General_Authority
			, COALESCE(H.Mission_President,B.[N]) AS Mission_President
			, COALESCE(H.Temple_President,B.[N]) AS Temple_President
			, I.Cell_Phone
			, B.Plus_I5TextLinesLdsp AS Donor_Ldsp_Text_Lines
			, CASE WHEN COALESCE(B.Lds_IsQualified,J.Lds_IsQualified) IS NULL OR COALESCE(B.Lds_IsQualified,J.Lds_IsQualified) = 0 THEN COALESCE(B.[N],J.[N]) ELSE COALESCE(B.[Y],J.[Y])  END AS Donor_Qualified
			, COALESCE(K.FullName,L.FullName) AS Donor_Qualified_By
			, CONVERT(DATE,COALESCE(B.Lds_QualifiedOn,J.Lds_QualifiedOn)) AS Donor_Qualified_On 
			' -- Ext_Select_Statement
		, '_All_Donors_ A
				LEFT JOIN Ext_Contact B ON A.Donor_Key = CONVERT(NVARCHAR(100),B.ContactId)
				LEFT JOIN _Donor_Family_Status_ C ON B.FamilyStatusCode = C.Column_Value
				LEFT JOIN _Donor_Gender_ D ON B.GenderCode = D.Column_Value
				LEFT JOIN _Donor_Church_Member_ E ON B.Plus_ChurchMember = E.Column_Value
				LEFT JOIN Ext_Country F ON B.New_HomeCountry = F.New_CountryId
				LEFT JOIN
					(SELECT Donor_Key 
						, CASE WHEN DATEADD(YEAR, DATEDIFF (YEAR, Birthdate, GETDATE()), Birthdate) > GETDATE()
							THEN DATEDIFF(YEAR, Birthdate, GETDATE()) - 1
							ELSE DATEDIFF(YEAR, Birthdate, GETDATE()) END AS Donor_Age
						FROM
							(SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
								, CONVERT(NVARCHAR(20),CAST(New_Birthdate AS DATETIME),110) AS Birthdate
								FROM Ext_Contact 
								WHERE 1 = 1
									AND SUBSTRING(New_Birthdate,4,2) <> [N00]
									AND SUBSTRING(New_Birthdate,1,2) <> [N00]
									AND SUBSTRING(New_Birthdate,4,2) <> [Number_Signs]
									AND SUBSTRING(New_Birthdate,1,2) <> [Number_Signs]
							) A
					) G ON A.Donor_Key = G.Donor_Key
				LEFT JOIN Uf_General_Authority() H ON A.Donor_Key = H.Donor_Key
				LEFT JOIN 
					(SELECT CONVERT(NVARCHAR(100),A.New_NumberId) AS Donor_Key
						, A.New_PhoneNumber AS Cell_Phone
						FROM
							(SELECT A.New_NumberId
								, A.New_PhoneNumber
								, ROW_NUMBER() OVER(PARTITION BY A.New_NumberId ORDER BY A.New_NumberId) AS RowNumber
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
													AND Plus_LineType = 100000000
													AND StatusCode = 100000002 
											) A
											LEFT JOIN
											(SELECT New_PhoneId
												, New_NumberId
												, New_PhoneNumber
												, 7 AS Filter_Number
												FROM Ext_Phone
												WHERE 1 = 1
													AND Plus_LineType = 100000000
													AND StatusCode = 100000002
													AND New_Primary = 1
											) B ON A.New_PhoneId = B.New_PhoneId
											LEFT JOIN
											(SELECT New_PhoneId
												, New_NumberId
												, New_PhoneNumber
												, 3 AS Filter_Number
												FROM Ext_Phone
												WHERE 1 = 1
													AND Plus_LineType = 100000000
													AND New_Primary = 1
													AND StatusCode = 100000002
													AND New_Type = 100000000
											) C ON A.New_PhoneId = C.New_PhoneId
											LEFT JOIN
											(SELECT New_PhoneId
												, New_NumberId
												, New_PhoneNumber
												, 2 AS Filter_Number
												FROM Ext_Phone
												WHERE 1 = 1
													AND Plus_LineType = 100000000
													AND New_Primary = 1
													AND StatusCode = 100000002
													AND New_Type = 100000001
											) D ON A.New_PhoneId = D.New_PhoneId
											LEFT JOIN
											(SELECT New_PhoneId
												, New_NumberId
												, New_PhoneNumber
												, 1 AS Filter_Number
												FROM Ext_Phone
												WHERE 1 = 1
													AND Plus_LineType = 100000000
													AND New_Primary = 1
													AND StatusCode = 100000002
													AND New_Type = 100000003
											) E ON A.New_PhoneId = E.New_PhoneId
									) A														
			' -- Ext_From_Statement
		, 'AND A.Donor_Key IS NOT NULL 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '							INNER JOIN
										(SELECT New_NumberId
											, MAX(Filter_Number) AS Filter_Number
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
																AND Plus_LineType = 100000000
																AND StatusCode = 100000002
														) A
														LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 7 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000
																AND StatusCode = 100000002
																AND New_Primary = 1
														) B ON A.New_PhoneId = B.New_PhoneId
														LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 3 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000
																AND New_Primary = 1 
																AND StatusCode = 100000002
																AND New_Type = 100000000
														) C ON A.New_PhoneId = C.New_PhoneId
														LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 2 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000 
																AND New_Primary = 1
																AND StatusCode = 100000002
																AND New_Type = 100000001
														) D ON A.New_PhoneId = D.New_PhoneId
														LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 1 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000
																AND New_Primary = 1
																AND StatusCode = 100000002
																AND New_Type = 100000003
														) E ON A.New_PhoneId = E.New_PhoneId
												) A
											GROUP BY New_NumberId
										) B ON A.New_NumberId = B.New_NumberId AND A.Filter_Number = B.Filter_Number
									INNER JOIN
										(SELECT New_NumberId
											, MAX(ModifiedOn) AS ModifiedOn
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
																AND Plus_LineType = 100000000
																AND StatusCode = 100000002
														) A
														LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 7 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000
																AND StatusCode = 100000002
																AND New_Primary = 1
														) B ON A.New_PhoneId = B.New_PhoneId														
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, '											LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 3 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000
																AND New_Primary = 1
																AND StatusCode = 100000002
																AND New_Type = 100000000
														) C ON A.New_PhoneId = C.New_PhoneId
														LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 2 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000
																AND New_Primary = 1
																AND StatusCode = 100000002
																AND New_Type = 100000001
														) D ON A.New_PhoneId = D.New_PhoneId
														LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 1 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000
																AND New_Primary = 1
																AND StatusCode = 100000002
																AND New_Type = 100000003
														) E ON A.New_PhoneId = E.New_PhoneId
												) A
											GROUP BY New_NumberId
										) C ON A.New_NumberId = C.New_NumberId AND A.ModifiedOn = C.ModifiedOn
									INNER JOIN
										(SELECT New_NumberId
											, MAX(New_PhoneNumber) AS New_PhoneNumber
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
																AND Plus_LineType = 100000000
																AND StatusCode = 100000002
														) A
														LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 7 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000 
																AND StatusCode = 100000002
																AND New_Primary = 1
														) B ON A.New_PhoneId = B.New_PhoneId
														LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 3 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000
																AND New_Primary = 1
																AND StatusCode = 100000002
																AND New_Type = 100000000
														) C ON A.New_PhoneId = C.New_PhoneId
														LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 2 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000
																AND New_Primary = 1 
																AND StatusCode = 100000002
																AND New_Type = 100000001
														) D ON A.New_PhoneId = D.New_PhoneId														
			' -- Ext_From_Statement_3
		, '											LEFT JOIN
														(SELECT New_PhoneId
															, New_NumberId
															, New_PhoneNumber
															, 1 AS Filter_Number
															FROM Ext_Phone
															WHERE 1 = 1
																AND Plus_LineType = 100000000
																AND New_Primary = 1
																AND StatusCode = 100000002
																AND New_Type = 100000003
														) E ON A.New_PhoneId = E.New_PhoneId
												) A
											GROUP BY New_NumberId
										) D ON A.New_NumberId = D.New_NumberId AND A.New_PhoneNumber = D.New_PhoneNumber
							) A
						WHERE 1 = 1
							AND RowNumber = 1
					
					) I ON A.Donor_Key = I.Donor_Key
				LEFT JOIN Ext_Account J ON A.Donor_Key = CONVERT(NVARCHAR(100),J.AccountId)
				LEFT JOIN Ext_System_User K ON B.Lds_QualifiedBy = K.SystemUserId 
				LEFT JOIN Ext_System_User L ON J.Lds_QualifiedBy = L.SystemUserId
			'-- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Name_Dim
-- --------------------------
	( 6 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Name_Dim' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, ' Donor_Key NVARCHAR(100)
			, Donor_Name NVARCHAR(160)
			, Donor_First_Name NVARCHAR(50)
			, Donor_Middle_Name NVARCHAR(50)
			, Donor_Last_Name NVARCHAR(50)
			, Donor_Nick_Name NVARCHAR(50)
			, Donor_Middle_Name2 NVARCHAR(100)
			, Donor_Last_Name2 NVARCHAR(100)
			, Donor_Preferred_Name NVARCHAR(100)
			, Donor_Display_Name NVARCHAR(100)
			, Donor_Maiden_Name NVARCHAR(100)
			, Donor_Title NVARCHAR(100)
			, Donor_Professional_Suffix NVARCHAR(100)
			, Donor_Personal_Suffix NVARCHAR(400)
			, Plus_PreferredFirstName NVARCHAR(100)
			, Plus_PreferredMiddleName NVARCHAR(100)
			, Plus_PreferredLastName NVARCHAR(100)
			, Plus_PreferredFullName NVARCHAR(100)
			, Donor_Total_Name NVARCHAR(200)
			, Informal_Mailing_Name NVARCHAR(300)
			, Informal_Salutation NVARCHAR(200)
			, Donor_Individual_Infor_Envel NVARCHAR(300)
			, Donor_Individual_Form_Envel NVARCHAR(300)
			' -- Ext_Create_Fields
		, '	Donor_Key
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
			, Plus_PreferredFirstName
			, Plus_PreferredMiddleName
			, Plus_PreferredLastName
			, Plus_PreferredFullName
			, Donor_Total_Name
			, Informal_Mailing_Name
			, Informal_Salutation
			, Donor_Individual_Infor_Envel
			, Donor_Individual_Form_Envel
			' -- Ext_Insert_Fields
		, 'A.Donor_Key
				, COALESCE(B.FullName,C.Name) AS Donor_Name
				, B.FirstName AS Donor_First_Name
				, B.MiddleName AS Donor_Middle_Name
				, B.LastName AS Donor_Last_Name
				, B.NickName AS Donor_Nick_Name
				, B.New_MiddleName2 AS Donor_Middle_Name2
				, B.New_LastName2 AS Donor_Last_Name2
				, B.New_PreferredName AS Donor_Preferred_Name
				, B.Plus_DisplayName AS Donor_Display_Name
				, B.New_BirthName AS Donor_Maiden_Name
				, D.new_title AS Donor_Title
				, E.new_professionalsuffix As Donor_Professional_Suffix
				, F.Column_Label AS Donor_Personal_Suffix
				, B.Plus_PreferredFirstName
				, B.Plus_PreferredMiddleName
				, B.Plus_PreferredLastName
				, B.Plus_PreferredFullName
				, CASE WHEN K.Wifes_ContactId IS NOT NULL THEN K.Couples_Name
					WHEN J.Husbands_ContactId IS NOT NULL THEN J.Couples_Name
					WHEN CONCAT(COALESCE(Plus_PreferredFirstName,FirstName),[Space],COALESCE(Plus_PreferredLastName,LastName)) = [Space] THEN COALESCE(Plus_PreferredFullName,FullName)
						ELSE CONCAT(COALESCE(Plus_PreferredFirstName,FirstName),[Space],COALESCE(Plus_PreferredLastName,LastName)) END AS Donor_Total_Name
				, CASE WHEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) IS NOT NULL
							AND COALESCE(B.Plus_SpousePreferredFirstName,G.Spouse_First_Name) IS NOT NULL
							AND COALESCE(B.Plus_PreferredLastName,B.LastName) IS NOT NULL
							AND H.Column_Label = [Married]
							THEN CONCAT(COALESCE(B.Plus_PreferredFirstName,B.FirstName),[Space_Amp_Space],COALESCE(B.Plus_SpousePreferredFirstName,G.Spouse_First_Name),[Space],COALESCE(B.Plus_PreferredLastName,B.LastName)) 
						WHEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) IS NOT NULL
							AND COALESCE(B.Plus_SpousePreferredFirstName,G.Spouse_First_Name) IS NULL
							AND COALESCE(B.Plus_PreferredLastName,B.LastName) IS NOT NULL
							THEN CONCAT(COALESCE(B.Plus_PreferredFirstName,B.FirstName),[Space],COALESCE(B.Plus_PreferredLastName,B.LastName)) 	
						WHEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) IS NOT NULL
							AND COALESCE(B.Plus_SpousePreferredFirstName,G.Spouse_First_Name) IS NOT NULL
							AND COALESCE(B.Plus_PreferredLastName,B.LastName) IS NOT NULL
							AND H.Column_Label != [Married]
							THEN CONCAT(COALESCE(B.Plus_PreferredFirstName,B.FirstName),[Space],COALESCE(B.Plus_PreferredLastName,B.LastName))
						WHEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) IS NOT NULL
							AND COALESCE(B.Plus_SpousePreferredFirstName,G.Spouse_First_Name) IS NOT NULL
							AND COALESCE(B.Plus_PreferredLastName,B.LastName) IS NOT NULL
							AND H.Column_Label IS NULL
							THEN CONCAT(COALESCE(B.Plus_PreferredFirstName,B.FirstName),[Space],COALESCE(B.Plus_PreferredLastName,B.LastName))
						END AS Informal_Mailing_Name				
			' -- Ext_Select_Statement
		, ' _All_Donors_ A
				LEFT JOIN Ext_Contact B ON A.Donor_Key = CONVERT(NVARCHAR(100),B.ContactId)
				LEFT JOIN Ext_Account C ON A.Donor_Key = CONVERT(NVARCHAR(100),C.AccountId)
				LEFT JOIN Ext_Title D ON B.New_Title = D.New_TitleId
				LEFT JOIN Ext_Professional_Suffix E ON B.New_ProfessionalSuffix = E.New_ProfessionalSuffixId
				LEFT JOIN _Donor_Personal_Suffix_ F ON B.New_PersonalSuffix = F.Column_Value 
				LEFT JOIN
					(SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, MAX(CASE WHEN Relationship = [Spouse] THEN Relationship_First_Name ELSE NULL END) AS Spouse_First_Name
						FROM _Connection_Dim
						GROUP BY CONVERT(NVARCHAR(100),ContactId)
					) G ON A.Donor_Key = G.Donor_Key
				LEFT JOIN _Donor_Family_Status_ H ON B.FamilyStatusCode = H.Column_Value
				LEFT JOIN
					(SELECT CONVERT(NVARCHAR(100), ContactId) AS Donor_Key
						, MAX(Informal_Individual) AS Informal_Individual
						, MAX(Formal_Individual) AS Formal_Individual
						FROM
							(SELECT DISTINCT Y1.Plus_EnvelopeSalutationConstituent AS ContactId
								, CASE WHEN Y1.Plus_Etiquette = 100000000 AND Y1.Plus_Household = 100000000  THEN Y1.Plus_SalutationEnvelopeName ELSE NULL END AS Informal_Individual 
								, CASE WHEN Y1.Plus_Etiquette = 100000001 AND Y1.Plus_Household = 100000000  THEN Y1.Plus_SalutationEnvelopeName ELSE NULL END AS Formal_Individual
								FROM dbo.Ext_Envelope_Names_And_Salutations Y1
									INNER JOIN dbo._Donor_Etiquette_ Y2 ON Y1.Plus_Etiquette = Y2.Column_Value
								WHERE 1 = 1
									AND Y1.StateCode = 0
									AND Y1.Plus_NameType = 100000000
							) A 
						GROUP BY CONVERT(NVARCHAR(100), ContactId)
					) I ON A.Donor_Key = I.Donor_Key
				LEFT JOIN Uf_Couples_Name1() J ON A.Donor_Key = CONVERT(NVARCHAR(100),J.Husbands_ContactId)
				LEFT JOIN Uf_Couples_Name2() K ON A.Donor_Key = CONVERT(NVARCHAR(100),K.Wifes_ContactId)
			' -- Ext_From_Statement
		, 'AND A.Donor_Key IS NOT NULL 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' , CASE WHEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) IS NOT NULL
							AND COALESCE(B.Plus_SpousePreferredFirstName,G.Spouse_First_Name) IS NOT NULL
							AND H.Column_Label = [Married]
							THEN CONCAT(COALESCE(B.Plus_PreferredFirstName,B.FirstName),[Space_And_Space],COALESCE(B.Plus_SpousePreferredFirstName,G.Spouse_First_Name)) 
						WHEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) IS NOT NULL
							AND COALESCE(B.Plus_SpousePreferredFirstName,G.Spouse_First_Name) IS NULL
							THEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) 	
						WHEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) IS NOT NULL
							AND COALESCE(B.Plus_SpousePreferredFirstName,G.Spouse_First_Name) IS NOT NULL
							AND H.Column_Label != [Married]
							THEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) 
						WHEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) IS NOT NULL
							AND COALESCE(B.Plus_SpousePreferredFirstName,G.Spouse_First_Name) IS NOT NULL
							AND H.Column_Label IS NULL
							THEN COALESCE(B.Plus_PreferredFirstName,B.FirstName) 
						END AS Informal_Salutation
				, I.Informal_Individual AS Donor_Individual_Infor_Envel
				, I.Formal_Individual AS Donor_Individual_Form_Envel 
			' -- Ext_Select_Statement_2
		, '														
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, '														
			' -- Ext_From_Statement_3
		, '
			'-- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Association_Dim
-- --------------------------
	( 6 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Association_Dim' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, ' Donor_Key NVARCHAR(100)     
			, Plus_CoordinatingLiaison NVARCHAR(200)
			, Plus_ConnectedLiaison  NVARCHAR(200)
			, Plus_PendingLiaison NVARCHAR(200)
			, Donor_Byu_Plc NVARCHAR(1)
			, Donor_Byuh_Plc NVARCHAR(1)
			, Donor_Nac  NVARCHAR(1)
			, Donor_Byu_Law_Grads NVARCHAR(1)
			, Donor_Byu_Msm_Grads NVARCHAR(1)
			, Byu_Night_Society_Member NVARCHAR(1)
			, Byui_Legacy_Society_Member NVARCHAR(1)
			, Byuh_Cowley_Society_Member NVARCHAR(1)
			, Ldsbc_Fox_Society_Member NVARCHAR(1)
			, Plus_CoordinatingLiaison_DomainName NVARCHAR(1024)
			, Plus_PendingLiaison_DomainName NVARCHAR(1024)
			, Plus_ConnectedLiaison_DomainName NVARCHAR(1024)
			' -- Ext_Create_Fields
		, '	Donor_Key      
			, Plus_CoordinatingLiaison
			, Plus_ConnectedLiaison
			, Plus_PendingLiaison
			, Donor_Byu_Plc
			, Donor_Byuh_Plc
			, Donor_Nac
			, Donor_Byu_Law_Grads
			, Donor_Byu_Msm_Grads
			, Byu_Night_Society_Member
			, Byui_Legacy_Society_Member
			, Byuh_Cowley_Society_Member
			, Ldsbc_Fox_Society_Member
			, Plus_CoordinatingLiaison_DomainName
			, Plus_PendingLiaison_DomainName
			, Plus_ConnectedLiaison_DomainName
			' -- Ext_Insert_Fields
		, 'A.Donor_Key
			, C.Plus_CoordinatingLiaison
			, C.Plus_ConnectedLiaison
			, C.Plus_PendingLiaison
			, CASE WHEN D.Donor_Byu_Plc IS NULL OR D.Donor_Byu_Plc != B.[Y] THEN B.[N] ELSE B.[Y] END AS Donor_Byu_Plc
			, CASE WHEN E.Donor_Byuh_Plc IS NULL OR E.Donor_Byuh_Plc != B.[Y] THEN B.[N] ELSE B.[Y] END AS Donor_Byuh_Plc
			, CASE WHEN F.Donor_Nac IS NULL OR F.Donor_Nac != B.[Y] THEN B.[N] ELSE B.[Y] END AS Donor_Nac
			, CASE WHEN G.Donor_Byu_Law_Grads IS NULL OR G.Donor_Byu_Law_Grads != B.[Y] THEN B.[N] ELSE B.[Y] END AS Donor_Byu_Law_Grads
			, CASE WHEN H.Donor_Byu_Msm_Grads IS NULL OR H.Donor_Byu_Msm_Grads != B.[Y] THEN B.[N] ELSE B.[Y] END AS Donor_Byu_Msm_Grads
			, CASE WHEN I.Byu_Night_Society_Member IS NULL OR I.Byu_Night_Society_Member != B.[Y] THEN B.[N] ELSE B.[Y] END AS Byu_Night_Society_Member
			, CASE WHEN J.Byui_Legacy_Society_Member IS NULL OR J.Byui_Legacy_Society_Member != B.[Y] THEN B.[N] ELSE B.[Y] END AS Byui_Legacy_Society_Member
			, CASE WHEN K.Byuh_Cowley_Society_Member IS NULL OR K.Byuh_Cowley_Society_Member != B.[Y] THEN B.[N] ELSE B.[Y] END AS Byuh_Cowley_Society_Member
			, CASE WHEN L.Ldsbc_Fox_Society_Member IS NULL OR L.Ldsbc_Fox_Society_Member != B.[Y] THEN B.[N] ELSE B.[Y] END AS Ldsbc_Fox_Society_Member
			, C.Plus_CoordinatingLiaison_DomainName
			, C.Plus_ConnectedLiaison_DomainName
			, C.Plus_PendingLiaison_DomainName
			' -- Ext_Select_Statement
		, ' _All_Donors_ A
				LEFT JOIN Ext_Contact B ON A.Donor_Key = CONVERT(NVARCHAR(100),B.ContactId)
				LEFT JOIN 
					(
					SELECT Donor_Key
						, Plus_CoordinatingLiaison
						, Plus_ConnectedLiaison
						, Plus_PendingLiaison
						, Plus_CoordinatingLiaison_DomainName
						, Plus_ConnectedLiaison_DomainName
						, Plus_PendingLiaison_DomainName
						FROM 
							(SELECT ROW_NUMBER() OVER(PARTITION BY ContactId ORDER BY Liaison_Type) AS Row_Num
								, CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
								, CASE WHEN Liaison_Type = [Coordinating_Liaison] THEN Liaison ELSE NULL END AS Plus_CoordinatingLiaison
								, CASE WHEN Liaison_Type = [Connected_Liaison] THEN Liaison ELSE NULL END AS Plus_ConnectedLiaison
								, CASE WHEN Liaison_Type = [Pending_Liaison] THEN Liaison ELSE NULL END AS Plus_PendingLiaison
								, CASE WHEN Liaison_Type = [Coordinating_Liaison] THEN DomainName ELSE NULL END AS Plus_CoordinatingLiaison_DomainName
								, CASE WHEN Liaison_Type = [Connected_Liaison] THEN DomainName ELSE NULL END AS Plus_ConnectedLiaison_DomainName
								, CASE WHEN Liaison_Type = [Pending_Liaison] THEN DomainName ELSE NULL END AS Plus_PendingLiaison_DomainName
								
								FROM
									(SELECT DISTINCT [Coordinating_Liaison] AS Liaison_Type
										, A.FullName AS Liaison
										, B.ContactId
										, B.FullName
										, A.DomainName
										, [Coordinating_Liaison]
										, [Connected_Liaison]
										, [Pending_Liaison]
										FROM Ext_System_User A
											INNER JOIN Ext_Contact B ON A.SystemUserId = B.Plus_CoordinatingLiaison
									UNION
									SELECT DISTINCT [Coordinating_Liaison] AS Liaison_Type 
										, A.FullName AS Liaison
										, B.AccountId AS ContactId
										, B.Name AS FullName
										, A.DomainName
										, [Coordinating_Liaison]
										, [Connected_Liaison]
										, [Pending_Liaison]
										FROM Ext_System_User A
											INNER JOIN Ext_Account B ON A.SystemUserId = B.Plus_CoordinatingLiaison
									UNION
									SELECT DISTINCT [Connected_Liaison] AS Liaison_Type 
										, A.FullName AS Liaison
										, B.ContactId
										, B.FullName
										, A.DomainName
										, [Coordinating_Liaison]
										, [Connected_Liaison]
										, [Pending_Liaison]
										FROM Ext_System_User A
											INNER JOIN Ext_Contact B ON A.SystemUserId = B.Plus_ConnectedLiaison
									UNION
									SELECT DISTINCT [Connected_Liaison] AS Liaison_Type 
										, A.FullName AS Liaison
										, B.AccountId AS ContactId
										, B.Name AS FullName
										, A.DomainName
										, [Coordinating_Liaison]
										, [Connected_Liaison]
										, [Pending_Liaison]
										FROM Ext_System_User A
											INNER JOIN Ext_Account B ON A.SystemUserId = B.Plus_ConnectedLiaison
									UNION
									SELECT DISTINCT [Pending_Liaison] AS Liaison_Type 
										, A.FullName AS Liaison
										, B.ContactId
										, B.FullName
										, A.DomainName
										, [Coordinating_Liaison]
										, [Connected_Liaison]
										, [Pending_Liaison]
										FROM Ext_System_User A
											INNER JOIN Ext_Contact B ON A.SystemUserId = B.Plus_PendingLiaison
									UNION
									SELECT DISTINCT [Pending_Liaison] AS Liaison_Type 
										, A.FullName AS Liaison
										, B.AccountId AS ContactId
										, B.Name AS FullName
										, A.DomainName
										, [Coordinating_Liaison]
										, [Connected_Liaison]
										, [Pending_Liaison]
										FROM Ext_System_User A
											INNER JOIN Ext_Account B ON A.SystemUserId = B.Plus_PendingLiaison
									) A
							) A																				
			' -- Ext_From_Statement
		, 'AND A.Donor_Key IS NOT NULL 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '				WHERE 1 = 1
							AND Row_Num = 1
					) C ON A.Donor_Key = C.Donor_Key
				LEFT JOIN
					(SELECT ContactId AS Donor_Key
						, [Y] AS Donor_Byu_Plc
						FROM _Association_Dim
						WHERE 1 = 1
							AND Association_Name = [Presidents_Leadership_Council]
							AND StatusCode = [Current]
					) D ON A.Donor_Key = D.Donor_Key
				LEFT JOIN 
					(SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Donor_Byuh_Plc
						FROM Ext_Psa
						WHERE 1 = 1 
							AND Psa_Code IN ([C2DL01], [C2DL02],[C2DL03],[C2DL04],[C2DL05],[C2DL06])
							AND (Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) OR Psa_Eff_Thru IS NULL)
					UNION
					SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Donor_Byuh_Plc
						FROM _Association_Dim
						WHERE 1 = 1 
							AND Association_Name IN ([David_O_McKay_Circle],[Genuine_Gold_Society])
					) E ON A.Donor_Key = E.Donor_Key
				LEFT JOIN
					(SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Donor_Nac
						FROM Ext_Psa
						WHERE 1 = 1 
							AND Psa_Code IN ([C1MV05],[C1MV26],[C1MV07])
							AND Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) 
					UNION
					SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Donor_Nac
						FROM _Association_Dim
						WHERE 1 = 1 
							AND Association_Name IN ([National_Advisory_Council])
					) F ON A.Donor_Key = F.Donor_Key
				LEFT JOIN
					(SELECT DISTINCT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Donor_Byu_Law_Grads
						FROM _Alumni_Dim
						WHERE 1 = 1 
							AND New_University = [BYU]
							AND College_Name = [Law_School]
							AND Plus_AlumniStatus = [Graduated]
					) G ON A.Donor_Key = G.Donor_Key
				LEFT JOIN
					(SELECT DISTINCT CONVERT(NVARCHAR(100),A.Plus_Constituent) AS Donor_Key
						, [Y] AS Donor_Byu_Msm_Grads
						FROM Ext_Alumni A
							INNER JOIN Ext_Degree B ON A.Plus_Degree = B.New_DegreeId
						WHERE 1 = 1
							AND A.Plus_University = [Byu_Code]
							AND (CONVERT(NVARCHAR(100),A.Plus_College) = [Business_School_Code]
									OR CONVERT(NVARCHAR(100),A.Plus_College) = [Business_Code])
							AND A.Plus_AlumniStatus = 100000000
							AND B.Plus_DegreeLevel = 100000000
					) H ON A.Donor_Key = H.Donor_Key
				LEFT JOIN
					(SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Byu_Night_Society_Member
						FROM Ext_Psa
						WHERE 1 = 1 
							AND Psa_Code IN ([CJK003])
							AND (Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) OR Psa_Eff_Thru IS NULL)
					UNION
					SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Byu_Night_Society_Member 
						FROM _Association_Dim
						WHERE 1 = 1 
							AND Association_Name = [BYU_Knight_Society]
					) I ON A.Donor_Key = I.Donor_Key
				LEFT JOIN
					(SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Byui_Legacy_Society_Member
						FROM Ext_Psa
						WHERE 1 = 1 
							AND Psa_Code IN ([C6LS01])
							AND (Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) OR Psa_Eff_Thru IS NULL)
					UNION
					SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Byui_Legacy_Society_Member 
						FROM _Association_Dim
						WHERE 1 = 1 
							AND Association_Name = [BYUI_Legacy_Society]
					) J ON A.Donor_Key = J.Donor_Key													
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, '		LEFT JOIN
					(SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Byuh_Cowley_Society_Member
						FROM Ext_Psa
						WHERE 1 = 1 
							AND Psa_Code IN ([C1DC01])
							AND (Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) OR Psa_Eff_Thru IS NULL)
					UNION
					SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Byuh_Cowley_Society_Member
						FROM _Association_Dim
						WHERE 1 = 1 
							AND Association_Name = [BYUH_Cowley_Society]
					) K ON A.Donor_Key = K.Donor_Key
				LEFT JOIN
					(SELECT ContactId AS Donor_Key
						, [Y] AS Ldsbc_Fox_Society_Member
						FROM Ext_Psa
						WHERE 1 = 1 
							AND Psa_Code IN ([CFXMBR])
							AND (Psa_Eff_Thru > CONVERT(NVARCHAR(10), GETDATE() -1, 112) OR Psa_Eff_Thru IS NULL)
					UNION
					SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, [Y] AS Ldsbc_Fox_Society_Member
						FROM _Association_Dim
						WHERE 1 = 1 
							AND Association_Name = [LDSBC_Fox_Society]
					) L ON A.Donor_Key = L.Donor_Key															
			' -- Ext_From_Statement_3
		, '
			'-- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donor_Connection_Dim
-- --------------------------
	( 6 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donor_Connection_Dim' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, ' Donor_Key NVARCHAR(100)   
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
			' -- Ext_Create_Fields
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
			' -- Ext_Insert_Fields
		, 'A.Donor_Key
			, B.All_Personal_Connections
			, C.Spouse_Name
			, C.Spouse_LdspId
			, D.Plus_SpousePreferredFirstName
			, D.Plus_SpousePreferredMiddleName
			, D.Plus_SpousePreferredLastName
			, D.Plus_SpousePreferredFullName
			, C.Spouse_Phone_Number
			, C.Spouse_Email 
			, C.Spouse_First_Name
			, C.Spouse_Last_Name
			, C.Spouse_Birth_Date
			, C.Spouse_Age
			, C.Donor_Spouse_Middle_Name
			, C.Donor_Spouse_Birth_Name
			, E.Donor_Spouse_Coordinating_Liaison
			, E.Donor_Spouse_Coordinating_Liaison_Domain_Name
			, F.Donor_Liaison_Connections
			, G.Informal_Couple AS Donor_Couple_Infor_Envel 
			, G.Formal_Couple AS Donor_Couple_Form_Envel
			, D.SpousesName AS Donor_Spouses_Name
			, CASE WHEN I.Wifes_ContactId IS NOT NULL THEN I.Couples_Name
					WHEN H.Husbands_ContactId IS NOT NULL THEN H.Couples_Name
					WHEN CONCAT(COALESCE(Plus_PreferredLastName,LastName),[Comma_Space],COALESCE(Plus_PreferredFirstName,FirstName)) = [Comma_Space] THEN D.Plus_DisplayName
						ELSE CONCAT(COALESCE(Plus_PreferredLastName,LastName),[Comma_Space],COALESCE(Plus_PreferredFirstName,FirstName)) END AS Donor_Total_Name_Display
			' -- Ext_Select_Statement
		, ' _All_Donors_ A
				LEFT JOIN Uf_All_Personal_Connections () B ON A.Donor_Key = B.Donor_Key
				LEFT JOIN
					(SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
						, MAX(CASE WHEN _Connection_Dim.Relationship = [Spouse] THEN Relationship_Name ELSE NULL END) AS Spouse_Name
						, MAX(CASE WHEN _Connection_Dim.Relationship = [Spouse] THEN Relationship_LdspId ELSE NULL END) AS Spouse_LdspId
						, MAX(CASE WHEN _Connection_Dim.Relationship = [Spouse] THEN Relationship_Phone_Number ELSE NULL END) AS Spouse_Phone_Number
						, MAX(CASE WHEN _Connection_Dim.Relationship = [Spouse] THEN Relationship_Email ELSE NULL END) AS Spouse_Email 
						, MAX(CASE WHEN _Connection_Dim.Relationship = [Spouse] THEN Relationship_First_Name ELSE NULL END) AS Spouse_First_Name
						, MAX(CASE WHEN _Connection_Dim.Relationship = [Spouse] THEN Relationship_Last_Name ELSE NULL END) AS Spouse_Last_Name
						, MAX(CASE WHEN _Connection_Dim.Relationship = [Spouse] THEN Relationship_Birth_Date ELSE NULL END) AS Spouse_Birth_Date
						, MAX(CASE WHEN _Connection_Dim.Relationship = [Spouse] THEN Relationship_Age ELSE NULL END) AS Spouse_Age
						, MAX(CASE WHEN _Connection_Dim.Relationship = [Spouse] THEN Relationship_Middle_Name ELSE NULL END) AS Donor_Spouse_Middle_Name
						, MAX(CASE WHEN _Connection_Dim.Relationship = [Spouse] THEN Relationship_Birth_Name ELSE NULL END) AS Donor_Spouse_Birth_Name
						FROM LDSPhilanthropiesDW.dbo._Connection_Dim
						GROUP BY ContactId                          
					) C ON A.Donor_Key = C.Donor_Key
				LEFT JOIN Ext_Contact D ON A.Donor_Key = CONVERT(NVARCHAR(100),D.ContactId)
				LEFT JOIN
					 (SELECT B.ContactId
						, C.FullName AS Donor_Spouse_Coordinating_Liaison
						, C.DomainName AS Donor_Spouse_Coordinating_Liaison_Domain_Name
						, CONVERT(NVARCHAR(100),CD.Relationship_ContactId) AS Donor_Key
						FROM _Connection_Dim CD
							INNER JOIN Ext_Contact B ON CD.ContactId = B.ContactId 
							INNER JOIN Ext_System_User C ON B.Plus_CoordinatingLiaison = C.SystemUserId
						WHERE 1 = 1 
							AND EXISTS
								(SELECT *
									FROM Ext_Contact A
									WHERE 1 = 1
										AND Plus_CoordinatingLiaison IS NOT NULL
										AND CD.ContactId = A.ContactId
								) 
							AND Relationship = [Spouse]
							AND CD.Relationship_ContactId IS NOT NULL
					) E ON A.Donor_Key = E.Donor_Key
				LEFT JOIN Uf_Donor_Liaison_Connections() F ON A.Donor_Key = F.Donor_Key
				LEFT JOIN
					(SELECT CONVERT(NVARCHAR(100), ContactId) AS Donor_Key
						, MAX(Informal_Couple) AS Informal_Couple
						, MAX(Formal_Couple) AS Formal_Couple
						FROM
							(SELECT DISTINCT Y1.Plus_EnvelopeSalutationConstituent AS ContactId
								, CASE WHEN Y1.Plus_Etiquette = 100000000 AND Y1.Plus_Household = 100000001  THEN Y1.Plus_SalutationEnvelopeName ELSE NULL END AS Informal_Couple
								, CASE WHEN Y1.Plus_Etiquette = 100000001 AND Y1.Plus_Household = 100000001  THEN Y1.Plus_SalutationEnvelopeName ELSE NULL END AS Formal_Couple
								FROM dbo.Ext_Envelope_Names_And_Salutations Y1
									INNER JOIN dbo._Donor_Etiquette_ Y2 ON Y1.Plus_Etiquette = Y2.Column_Value
								WHERE 1 = 1
									AND Y1.StateCode = 0
									AND Y1.Plus_NameType = 100000000
							) A 
						GROUP BY CONVERT(NVARCHAR(100), ContactId)
					) G ON A.Donor_Key = G.Donor_Key
				LEFT JOIN Uf_Couples_Display_Name1() H ON A.Donor_Key = CONVERT(NVARCHAR(100),H.Husbands_ContactId)
				LEFT JOIN Uf_Couples_Display_Name2() I ON A.Donor_Key = CONVERT(NVARCHAR(100),I.Wifes_ContactId)														
			' -- Ext_From_Statement
		, 'AND A.Donor_Key IS NOT NULL 
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '													
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, '															
			' -- Ext_From_Statement_3
		, '
			'-- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Donation_Fact
-- --------------------------
	( 7 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Donation_Fact' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	Donor_Key  NVARCHAR(100) 
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
			, User_Coordinating_Liaison_Key NVARCHAR(100) DEFAULT ''0''
			, User_Pending_Liaison_Key NVARCHAR(100) DEFAULT ''0''
			, User_Connected_Liaison_Key NVARCHAR(100) DEFAULT ''0''
			' -- Ext_Create_Fields
		, '	Donor_Key
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
			' -- Ext_Insert_Fields
		, 'COALESCE(B.Donor_Key,A.[Zero]) AS Donor_Key
			, B.Activity_Group_Key
			, B.Address_Group_Key
			, B.Alumni_Group_Key
			, B.Association_Group_Key
			, B.Award_Group_Key
			, B.Drop_Include_Group_Key
			, B.Email_Group_Key
			, B.Employment_Group_Key
			, B.Language_Group_Key
			, B.Phone_Group_Key
			, B.Psa_Group_Key
			, B.Connection_Group_Key
			, B.Id_Group_Key
			, B.Interest_Group_Key
			, B.Student_Group_Key
			, COALESCE(CONVERT(NVARCHAR(100),A.Hier_Pre_Key),A.[Zero]) AS Hier_Key 
			, COALESCE(CONVERT(NVARCHAR(100),A.Fund_Pre_Key),A.[Zero]) AS Fund_Key
			, COALESCE(CONVERT(NVARCHAR(100),A.User_Pre_Key),A.[Zero]) AS User_Key
			, A.Donor_Primary_Yn 
			, A.Donation_Credit_Amt            
			, A.Donation_Primary_Amt 
			, A.Donation_Entitled_Benefit_Value AS Plus_EntitledBenefitValue
			, CONVERT(NVARCHAR(100),A.Donation_Key) AS Donation_Key
			, A.Plus_Type
			, A.Plus_SharedCreditType
			, COALESCE(CONVERT(NVARCHAR(100),A.Appeal_Key),A.[Zero]) AS Appeal_Key
			, D.Donation_Receipt_Ytd_Last_Week_Amt
			, D.Donation_Receipt_Ytd_Last_Week_Last_Year_Amt
			, D.Donation_Receipt_Ytd_Two_Weeks_Ago_Amt
			, NULL AS Inspired_Learning_Yearly_Goal
			, NULL AS Inspired_Learning_Yearly_Goal_by_Account
			, NULL AS Inspired_Learning_Total_Initiative_Goal
			, NULL AS Inspired_Learning_Total_Initiative_Goal_by_Account
			, COALESCE(CONVERT(NVARCHAR(100),Initiative_Key),A.[Zero]) AS Initiative_Key
			, COALESCE(CONVERT(NVARCHAR(100),Expectancy_Key),A.[Zero]) AS Expectancy_Key
			, COALESCE(C.User_Coordinating_Liaison_Key,A.[Zero]) AS User_Coordinating_Liaison_Key
			, COALESCE(C.User_Pending_Liaison_Key,A.[Zero]) AS User_Pending_Liaison_Key
			, COALESCE(C.User_Connected_Liaison_Key,A.[Zero]) AS User_Connected_Liaison_Key
			' -- Ext_Select_Statement
		, '	(SELECT A.OwnerId AS User_Pre_Key
				, COALESCE(A.Donation_Credit_Amt,A.New_GiftAmount) AS Donation_Credit_Amt
				, COALESCE(A.New_RelatedConstituent,A.New_OrganizationId,A.New_ConstituentDonor,A.New_OrganizationDonor) AS Donor_Pre_Key
				, CASE WHEN ((CONVERT(NVARCHAR(50),A.New_ConstituentDonor) = CONVERT(NVARCHAR(50),A.New_RelatedConstituent)
						OR CONVERT(NVARCHAR(50),A.New_OrganizationDonor) = CONVERT(NVARCHAR(50),A.New_OrganizationId))
						OR A.New_RelatedGift IS NULL)
					THEN [Y] 
					ELSE [N] END AS Donor_Primary_Yn
				, A.New_FundAccount AS Fund_Pre_Key
				, A.New_InstitutionalHierarchyId AS Hier_Pre_Key
				, CASE WHEN ((CONVERT(NVARCHAR(50),A.New_ConstituentDonor) = CONVERT(NVARCHAR(50),A.New_RelatedConstituent)
						OR CONVERT(NVARCHAR(50),A.New_OrganizationDonor) = CONVERT(NVARCHAR(50),A.New_OrganizationId))
						OR A.New_RelatedGift IS NULL) 
					THEN CONVERT(MONEY,A.New_GiftAmount)
					ELSE NULL END AS Donation_Primary_Amt
				, A.Plus_EntitledBenefitValue AS Donation_Entitled_Benefit_Value
				, A.New_GiftId AS Donation_Key
				, F.Column_Label AS Plus_Type
				, G.Column_Label AS Plus_SharedCreditType
				, A.Plus_Appeal AS Appeal_Key
				, A.OpportunityId AS Initiative_Key
				, A.New_AssociatedPledge AS Expectancy_Key
				, [Zero]
				FROM
					(SELECT A.ContactId
						, New_ConstituentDonor
						, New_OrganizationDonor
						, B.New_FundAccount
						, New_InstitutionalHierarchyId
						, New_AssociatedPledge
						, OpportunityId
						, New_GiftAmount
						, New_BatchNumber
						, New_GiftId
						, OwnerId
						, Plus_EntitledBenefitValue
						, New_RelatedConstituent
						, New_OrganizationId
						, New_RelatedGift
						, New_RecognitionCreditId
						, Donation_Credit_Amt
						, Plus_Type
						, Plus_SubType
						, Plus_Appeal
						, COALESCE(B.[Zero],C.[Zero]) AS [Zero]
						, COALESCE(B.[Y],C.[Y]) AS [Y]
						, COALESCE(B.[N],C.[N]) AS [N]
						FROM dbo._Numbered_ContactIds A
							LEFT JOIN 
								(SELECT CONVERT(NVARCHAR(100),COALESCE(New_ConstituentDonor,New_OrganizationDonor)) AS ContactId
									, New_ConstituentDonor
									, New_OrganizationDonor
									, New_FundAccount
									, New_InstitutionalHierarchyId
									, New_AssociatedPledge
									, OpportunityId
									, New_GiftAmount
									, New_BatchNumber
									, New_GiftId
									, OwnerId
									, Plus_EntitledBenefitValue
									, Plus_Appeal
									, [Zero]
									, [Y]
									, [N]
									FROM dbo._Gift_ A
									WHERE 1 = 1
										AND StatusCode != 100000003 -- i5 Deleted
								) B ON A.ContactId = B.ContactId
							LEFT JOIN 
								(SELECT New_RelatedConstituent
									, New_OrganizationId
									, New_RelatedGift
									, New_RecognitionCreditId
									, New_CreditAmount AS Donation_Credit_Amt
									, Plus_Type
									, Plus_SubType
									, [Zero]
									, [Y]
									, [N]
									FROM _Gift_Credit_												
								) C ON B.New_GiftId = C.New_RelatedGift
						WHERE 1 = 1
							AND B.ContactId IS NOT NULL
					) A
					LEFT JOIN _Recog_Credit_Type_ F ON A.Plus_Type = F.Column_Value
					LEFT JOIN _PLUS_SUBTYPE_ G ON A.Plus_SubType = G.Column_Value
				WHERE 1 = 1
			) A
		LEFT JOIN _Donor_Key_Dim B ON A.Donor_Pre_Key = B.Donor_Key																
			' -- Ext_From_Statement
		, '	CREATE NONCLUSTERED INDEX IX_Donor_Primary_Yn
				ON dbo._Donation_Fact (Donor_Primary_Yn)
				INCLUDE (Donation_Primary_Amt,Donation_Key,Initiative_Key,Expectancy_Key);
			CREATE NONCLUSTERED INDEX IX_Donor_Primary_Yn_Initiative
				ON dbo._Donation_Fact (Donor_Primary_Yn,Initiative_Key)
				INCLUDE (Donation_Primary_Amt,Donation_Key,Expectancy_Key);
			CREATE NONCLUSTERED INDEX IX_Don_Fact_Don_Key
				ON dbo._Donation_Fact (Donation_Key)
				INCLUDE (Donor_Key,Donor_Primary_Yn,Donation_Credit_Amt);
			UPDATE STATISTICS dbo._Donation_Fact;
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, 'LEFT JOIN 
				(SELECT CONVERT(NVARCHAR(100),ContactId) AS Donor_Key
					, COALESCE(CONVERT(NVARCHAR(100),Plus_CoordinatingLiaison),[Zero]) AS User_Coordinating_Liaison_Key
					, COALESCE(CONVERT(NVARCHAR(100),Plus_PendingLiaison),[Zero]) AS User_Pending_Liaison_Key
					, COALESCE(CONVERT(NVARCHAR(100),Plus_ConnectedLiaison),[Zero]) AS User_Connected_Liaison_Key
					FROM Ext_Contact
					WHERE 1 = 1
						AND (Plus_CoordinatingLiaison IS NOT NULL
								OR Plus_PendingLiaison IS NOT NULL
								OR Plus_ConnectedLiaison IS NOT NULL
							)
				UNION
				SELECT CONVERT(NVARCHAR(100),AccountId) AS Donor_Key
					, COALESCE(CONVERT(NVARCHAR(100),Plus_CoordinatingLiaison),[Zero]) AS User_Coordinating_Liaison_Key
					, COALESCE(CONVERT(NVARCHAR(100),Plus_PendingLiaison),[Zero]) AS User_Pending_Liaison_Key
					, COALESCE(CONVERT(NVARCHAR(100),Plus_ConnectedLiaison),[Zero]) AS User_Connected_Liaison_Key
					FROM Ext_Account
					WHERE 1 = 1
						AND (Plus_CoordinatingLiaison IS NOT NULL
								OR Plus_PendingLiaison IS NOT NULL
								OR Plus_ConnectedLiaison IS NOT NULL
							)
				) C ON B.Donor_Key = C.Donor_Key
			LEFT JOIN
				(SELECT DISTINCT A.New_GiftId	
					, B.Donor_Primary_Yn
					, CASE WHEN CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(DATE,DATEADD(yy,DATEDIFF(yy,0,GETDATE()),0),1)
										AND CONVERT(DATE,CONVERT(NVARCHAR(10),DATEADD(dd, -(DATEPART(dw,GETDATE()-1)-0), GETDATE()-1),112)) THEN B.Donation_Primary_Amt  END AS Donation_Receipt_Ytd_Last_Week_Amt 
					,  CASE WHEN CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(DATE,CONVERT(NVARCHAR(10),DATEADD(YEAR, DATEDIFF(YEAR, 0, GETDATE()-1)-1,0),112)) 
										AND CONVERT(DATE,REPLACE(CONVERT(NVARCHAR(10),DATEADD(dd, -(DATEPART(dw,GETDATE()-1)-0), GETDATE()-1),112),CONVERT(NVARCHAR(4),YEAR(GETDATE()-1)),CONVERT(NVARCHAR(4),YEAR(GETDATE()-1))-1)) THEN B.Donation_Primary_Amt  END AS Donation_Receipt_Ytd_Last_Week_Last_Year_Amt
					, CASE WHEN CONVERT(DATE,A.New_ReceiptDate,112) BETWEEN CONVERT(DATE,DATEADD(yy,DATEDIFF(yy,0,GETDATE()),0),1)
										AND CONVERT(DATE,CONVERT(NVARCHAR(10),DATEADD(dd, -(DATEPART(dw,GETDATE()-1)-0), GETDATE()-8),112)) THEN B.Donation_Primary_Amt  END AS Donation_Receipt_Ytd_Two_Weeks_Ago_Amt
					FROM _Gift_ A
						LEFT JOIN
							(SELECT A.New_GiftId
								, CASE WHEN ((CONVERT(NVARCHAR(50),A.New_ConstituentDonor) = CONVERT(NVARCHAR(50),B.New_RelatedConstituent)
										OR CONVERT(NVARCHAR(50),A.New_OrganizationDonor) = CONVERT(NVARCHAR(50),B.New_OrganizationId))
										OR B.New_RelatedGift IS NULL)
									THEN [Y] 
									ELSE [N] END AS Donor_Primary_Yn
								, CASE WHEN ((CONVERT(NVARCHAR(50),A.New_ConstituentDonor) = CONVERT(NVARCHAR(50),B.New_RelatedConstituent)
										OR CONVERT(NVARCHAR(50),A.New_OrganizationDonor) = CONVERT(NVARCHAR(50),B.New_OrganizationId))
										OR B.New_RelatedGift IS NULL) 
									THEN CONVERT(MONEY,A.New_GiftAmount)
									ELSE NULL END AS Donation_Primary_Amt
							FROM
								(SELECT CONVERT(NVARCHAR(100),COALESCE(New_ConstituentDonor,New_OrganizationDonor)) AS ContactId
									, New_ConstituentDonor
									, New_OrganizationDonor
									, New_GiftId
									, New_GiftAmount
									, [Y]
									, [N]
									FROM dbo._Gift_ A
									WHERE 1 = 1
										AND StatusCode != 100000003
								) A 
								LEFT JOIN 
									(SELECT New_RelatedConstituent
										, New_OrganizationId
										, New_RelatedGift
										FROM _Gift_Credit_												
									) B ON A.New_GiftId = B.New_RelatedGift
								
							) B ON A.New_GiftId = B.New_GiftId
					WHERE 1 = 1
						AND B.Donor_Primary_Yn = [Y]
				) D ON A.Donation_Key = D.New_GiftId
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, '															
			' -- Ext_From_Statement_3
		, '
			'-- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	,
-- --------------------------
-- _Initiative_Fact
-- --------------------------
	( 8 -- Tier
		, ' ' -- Source_Table
		, ' ' -- Destination_Table
		, '_Initiative_Fact' -- Ext_Table
		, '	' -- Dest_Create_Fields
		, '	' -- Dest_Insert_Fields
		, ' ' -- Dest_Where_Statement
		, '	Initiative_Fact_Key INT IDENTITY(10000,1) PRIMARY KEY
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
			, User_Initiative_Liaison_Key NVARCHAR(100) DEFAULT ''0''
			, User_Coordinating_Liaison_Key NVARCHAR(100) DEFAULT ''0''
			' -- Ext_Create_Fields
		, '	Initiative_Key
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
			' -- Ext_Insert_Fields
		, 'CONVERT(NVARCHAR(100),A.Initiative_Key) AS Initiative_Key
			, COALESCE(CONVERT(NVARCHAR(100),Donor_Key),A.[Zero]) AS Donor_Key
			, COALESCE(CONVERT(NVARCHAR(100),Fund_Account_Key),A.[Zero]) AS Fund_Account_Key
			, COALESCE(CONVERT(NVARCHAR(100),Expectancy_Key),A.[Zero]) AS Expectancy_Key
			, COALESCE(CONVERT(NVARCHAR(100),Donation_Key),A.[Zero]) AS Donation_Key
			, A.Plus_TotalAskAmount AS Initiative_Proposal_Amt
			, A.Plus_TotalGiven AS Initiative_Total_Given_Amt
			, CONVERT(VARCHAR(10),A.Plus_ProposalDate,101) AS Initiative_Proposal_Date
			, CONVERT(VARCHAR(10),A.Plus_TargetedCommitment,101) AS Initiative_Targeted_Commitment_Date
			, CONVERT(VARCHAR(10),A.Plus_CommittedDate,101) AS Initiative_Committed_Date
			, CONVERT(VARCHAR(10),A.Plus_CultivationProcessStage1Date,101) AS Initiative_Cultivation_Proc_Stg_1_Date
			, CONVERT(VARCHAR(10),A.Plus_CultivationProcessStage2Date,101) AS Initiative_Cultivation_Proc_Stg_2_Date
			, CONVERT(VARCHAR(10),A.Plus_CultivationProcessStage3Date,101) AS Initiative_Cultivation_Proc_Stg_3_Date
			, CONVERT(VARCHAR(10),A.Plus_CultivationProcessStage4Date,101) AS Initiative_Cultivation_Proc_Stg_4_Date
			, CONVERT(VARCHAR(10),A.Plus_GiftNoticeCreatedOn,101) AS Initiative_Gift_Notice_Created_Date
			, CONVERT(VARCHAR(10),A.Plus_ProposalStatusChangeDate,101) AS Initiative_Proposal_Status_Change_Date
			, New_TotalPledged AS Expectancy_Total_Pledged_Amt
			, New_BalanceDue_Base AS Expectancy_Balance_Due_Amt
			, New_TotalPaid_Base AS Expectancy_Total_Paid_Amt
			, New_InstallmentAmount_Base AS Expectancy_Installment_Amt
			, Plus_PaymentAmount_Base AS Expectancy_Payment_Amt
			, Plus_AnnualAmount_Base AS Expectancy_Annual_Amt
			, New_PaymentsToMake AS Expectancy_PaymentsToMake
			, New_PaymentsReceived AS Expectancy_PaymentsReceived
			, CONVERT(VARCHAR(10), New_BeginDate,101) AS Expectancy_BeginDate
			, CONVERT(VARCHAR(10), New_EndDate,101) AS Expectancy_EndDate
			, CONVERT(VARCHAR(10), Plus_InstallmentDate,101) AS Expectancy_InstallmentDate
			, CONVERT(VARCHAR(10), New_SignatureDate,101) AS Expectancy_SignatureDate
			, CONVERT(VARCHAR(10), New_NotificationDate,101) AS Expectancy_NotificationDate
			, CONVERT(VARCHAR(10), Plus_FundingDate,101) AS Expectancy_FundingDate
			, CONVERT(VARCHAR(10), Plus_EstimatedMaturityDate,101) AS Expectancy_EstimatedMaturityDate
			, CONVERT(VARCHAR(10), Plus_PaymentStartDate,101) AS Expectancy_PaymentStartDate
			, Donor_Primary_Yn AS Donation_Donor_Primary
			, Donation_Primary_Amt AS Donation_Primary_Amt
			, Donation_Credit_Amt AS Donation_Credit_Amt
			, New_ReceiptDate AS Donation_Receipt_Date
			, A.Plus_TotalCommittedAmount AS Initiative_Total_Committed_Amt
			, COALESCE(CONVERT(NVARCHAR(100),Hier_Key),A.[Zero]) AS Hier_Key
			, CASE WHEN Donor_Key IS NOT NULL THEN COALESCE(B.User_Initiative_Liaison_Key,A.[Zero]) ELSE A.[Zero] END AS User_Initiative_Liaison_Key
			, CASE WHEN Donor_Key IS NOT NULL THEN COALESCE(C.User_Coordinating_Liaison_Key,A.[Zero]) ELSE A.[Zero] END AS User_Coordinating_Liaison_Key
			' -- Ext_Select_Statement
		, '	(SELECT A.Initiative_Key
				, CASE WHEN A.OpportunityId_RowNum = 1 THEN A.Donor_Key ELSE NULL END AS Donor_Key
				, CASE WHEN A.OpportunityId_RowNum = 1 THEN A.Fund_Account_Key ELSE NULL END AS Fund_Account_Key
				, CASE WHEN A.OpportunityId_RowNum = 1 THEN A.Plus_TotalAskAmount ELSE NULL END AS Plus_TotalAskAmount
				, CASE WHEN A.OpportunityId_RowNum = 1 THEN A.Plus_TotalGiven ELSE NULL END AS Plus_TotalGiven
				, A.Plus_ProposalDate
				, A.Plus_TargetedCommitment
				, A.Plus_CommittedDate
				, A.Plus_CultivationProcessStage1Date
				, A.Plus_CultivationProcessStage2Date
				, A.Plus_CultivationProcessStage3Date
				, A.Plus_CultivationProcessStage4Date
				, A.Plus_GiftNoticeCreatedOn 
				, A.Plus_ProposalStatusChangeDate
				, A.Donation_Key
				, Expectancy_Key
				, CASE WHEN A.Donation_Key_RowNum = 1 THEN A.Donation_Primary_Amt ELSE NULL END AS Donation_Primary_Amt
				, Donor_Primary_Yn
				, CASE WHEN A.New_PledgeId_RowNum = 1 THEN A.New_TotalPledged ELSE NULL END AS New_TotalPledged
				, CASE WHEN A.New_PledgeId_RowNum = 1 THEN A.New_BalanceDue_Base ELSE NULL END AS New_BalanceDue_Base
				, CASE WHEN A.New_PledgeId_RowNum = 1 THEN A.New_TotalPaid_Base ELSE NULL END AS New_TotalPaid_Base
				, CASE WHEN A.New_PledgeId_RowNum = 1 THEN A.New_InstallmentAmount_Base ELSE NULL END AS New_InstallmentAmount_Base
				, CASE WHEN A.New_PledgeId_RowNum = 1 THEN A.Plus_PaymentAmount_Base ELSE NULL END AS Plus_PaymentAmount_Base
				, CASE WHEN A.New_PledgeId_RowNum = 1 THEN A.Plus_AnnualAmount_Base ELSE NULL END AS Plus_AnnualAmount_Base
				, CASE WHEN A.New_PledgeId_RowNum = 1 THEN A.New_PaymentsToMake ELSE NULL END AS New_PaymentsToMake
				, CASE WHEN A.New_PledgeId_RowNum = 1 THEN A.New_PaymentsReceived ELSE NULL END AS New_PaymentsReceived
				, A.New_BeginDate
				, A.New_EndDate
				, A.Plus_InstallmentDate 
				, A.New_SignatureDate
				, A.New_NotificationDate 
				, A.Plus_FundingDate
				, A.Plus_EstimatedMaturityDate
				, A.Plus_PaymentStartDate
				, A.New_PledgeId
				, A.Donation_Credit_Amt
				, A.New_ReceiptDate
				, CASE WHEN A.OpportunityId_RowNum = 1 THEN A.Plus_TotalCommittedAmount ELSE NULL END AS Plus_TotalCommittedAmount
				, CASE WHEN A.OpportunityId_RowNum = 1 THEN A.Hier_Key ELSE NULL END AS Hier_Key
				, [Zero]
				FROM
					(SELECT A.Initiative_Key
						, A.Donor_Key
						, A.Fund_Account_Key
						, A.Plus_TotalAskAmount
						, A.Plus_TotalGiven
						, A.Plus_ProposalDate
						, A.Plus_TargetedCommitment
						, A.Plus_CommittedDate
						, A.Plus_CultivationProcessStage1Date
						, A.Plus_CultivationProcessStage2Date
						, A.Plus_CultivationProcessStage3Date
						, A.Plus_CultivationProcessStage4Date
						, A.Plus_GiftNoticeCreatedOn 
						, A.Plus_ProposalStatusChangeDate
						, A.Donation_Key
						, COALESCE(CONVERT(NVARCHAR(100),A.New_PledgeId),A.Expectancy_Key) AS Expectancy_Key
						, A.Donation_Primary_Amt
						, CASE WHEN B.Donation_Credit_Amt IS NOT NULL THEN B.Donor_Primary_Yn ELSE A.Donor_Primary_Yn END AS Donor_Primary_Yn
						, A.New_TotalPledged
						, A.New_BalanceDue_Base
						, A.New_TotalPaid_Base
						, A.New_InstallmentAmount_Base
						, A.Plus_PaymentAmount_Base
						, A.Plus_AnnualAmount_Base
						, A.New_PaymentsToMake
						, A.New_PaymentsReceived
						, A.New_BeginDate
						, A.New_EndDate
						, A.Plus_InstallmentDate 
						, A.New_SignatureDate
						, A.New_NotificationDate 
						, A.Plus_FundingDate
						, A.Plus_EstimatedMaturityDate
						, A.Plus_PaymentStartDate
						, A.New_PledgeId
						, B.Donation_Credit_Amt
						, C.New_ReceiptDate																
			' -- Ext_From_Statement
		, '
			' -- Ext_Where_Statement
		, NULL -- Tier_3_Stage
		, NULL -- Tier_3_Stage_DateTime
		, NULL -- Tier_4_Stage
		, NULL -- Tier_4_Stage_DateTime
		, ' ' -- Ext_Select_Statement_2
		, '				, ROW_NUMBER() OVER(PARTITION BY A.Initiative_Key ORDER BY (SELECT NULL)) AS OpportunityId_RowNum
						, ROW_NUMBER() OVER(PARTITION BY A.New_PledgeId ORDER BY (SELECT NULL)) AS New_PledgeId_RowNum
						, ROW_NUMBER() OVER(PARTITION BY A.Donation_Key ORDER BY (SELECT NULL)) AS Donation_Key_RowNum
						, A.Plus_TotalCommittedAmount
						, A.Hier_Key
						, [Zero]
						FROM
							(SELECT A.OpportunityId AS Initiative_Key
								, A.CustomerId AS Donor_Key
								, A.Plus_FundAccount AS Fund_Account_Key
								, A.Plus_TotalAskAmount 
								, A.Plus_TotalGiven
								, A.Plus_ProposalDate
								, A.Plus_TargetedCommitment
								, A.Plus_CommittedDate
								, A.Plus_CultivationProcessStage1Date
								, A.Plus_CultivationProcessStage2Date
								, A.Plus_CultivationProcessStage3Date
								, A.Plus_CultivationProcessStage4Date
								, A.Plus_GiftNoticeCreatedOn 
								, A.Plus_ProposalStatusChangeDate
								, A.Donation_Key
								, A.Expectancy_Key
								, A.Donation_Primary_Amt
								, A.Donor_Primary_Yn
								, B.New_TotalPledged
								, B.New_BalanceDue_Base
								, B.New_TotalPaid_Base
								, B.New_InstallmentAmount_Base
								, B.Plus_PaymentAmount_Base
								, B.Plus_AnnualAmount_Base
								, B.New_PaymentsToMake
								, B.New_PaymentsReceived
								, B.New_BeginDate
								, B.New_EndDate
								, B.Plus_InstallmentDate 
								, B.New_SignatureDate
								, B.New_NotificationDate 
								, B.Plus_FundingDate
								, B.Plus_EstimatedMaturityDate
								, B.Plus_PaymentStartDate
								, B.New_PledgeId
								, ROW_NUMBER() OVER(PARTITION BY A.Donation_Key ORDER BY (SELECT NULL)) AS Donation_Key_RowNum
								, A.Plus_TotalCommittedAmount
								, A.Hier_Key
								, [Zero]
								FROM
									(SELECT OpportunityId
										, CustomerId
										, Plus_FundAccount
										, Plus_TotalAskAmount
										, Plus_TotalGiven
										, Plus_ProposalDate
										, Plus_TargetedCommitment
										, Plus_CommittedDate
										, Plus_CultivationProcessStage1Date
										, Plus_CultivationProcessStage2Date
										, Plus_CultivationProcessStage3Date
										, Plus_CultivationProcessStage4Date
										, Plus_GiftNoticeCreatedOn 
										, Plus_ProposalStatusChangeDate
										, Donation_Key
										, Expectancy_Key
										, Donation_Primary_Amt
										, Donor_Primary_Yn
										, ROW_NUMBER() OVER(PARTITION BY OpportunityId ORDER BY (SELECT NULL)) AS OpportunityId_RowNum
										, Plus_TotalCommittedAmount
										, Hier_Key
										, [Zero]
										FROM
											(SELECT OpportunityId
												, CustomerId
												, Plus_FundAccount
												, Plus_TotalAskAmount
												, COALESCE(Plus_TotalGiven,0) AS Plus_TotalGiven
												, Plus_ProposalDate
												, Plus_TargetedCommitment
												, Plus_CommittedDate
												, Plus_CultivationProcessStage1Date
												, Plus_CultivationProcessStage2Date
												, Plus_CultivationProcessStage3Date
												, Plus_CultivationProcessStage4Date
												, Plus_GiftNoticeCreatedOn 
												, Plus_ProposalStatusChangeDate
												, Donation_Key
												, Expectancy_Key
												, Donation_Primary_Amt
												, Donor_Primary_Yn
												, Plus_TotalCommittedAmount
												, Hier_Key
												, [Zero]
												FROM
													(SELECT A.OpportunityId
														, A.CustomerId
														, A.Plus_FundAccount
														, A.Plus_TotalAskAmount
														, D.Plus_TotalGiven
														, A.Plus_ProposalDate
														, A.Plus_TargetedCommitment
														, A.Plus_CommittedDate														
			' -- Ext_From_Statement_2
		, ' ' -- Ext_Create_Fields_2
		, ' ' -- Ext_Create_Fields_3
		, ' ' -- Ext_Where_Statement_2
		, ' ' -- Ext_Where_Statement_3
		, NULL -- Tier_5_Stage
		, NULL -- Tier_5_Stage_DateTime
		, NULL -- Tier_6_Stage
		, NULL -- Tier_6_Stage_DateTime
		, NULL -- Tier_7_Stage
		, NULL -- Tier_7_Stage_DateTime
		, NULL -- Tier_8_Stage
		, NULL -- Tier_8_Stage_DateTime
		, NULL -- Tier_9_Stage
		, NULL -- Tier_9_Stage_DateTime
		, 1
		, NULL -- Extract_Stage
		, NULL -- Extract_Stage_DateTime
		, NULL -- Coupler_Stage
		, NULL -- Coupler_Stage_DateTime
		, NULL -- Tier_2_Stage
		, NULL -- Tier_2_Stage_DateTime
		, GETDATE()
		, NULL
		, NULL -- Ext_Select_Statement_3
		, NULL -- Ext_Select_Statement_4
		, NULL -- Ext_Select_Statement_5
		, NULL -- Ext_Select_Statement_6
		, NULL -- Ext_Select_Statement_7
		, '												, A.Plus_CultivationProcessStage1Date
														, A.Plus_CultivationProcessStage2Date
														, A.Plus_CultivationProcessStage3Date
														, A.Plus_CultivationProcessStage4Date
														, A.Plus_GiftNoticeCreatedOn 
														, A.Plus_ProposalStatusChangeDate
														, B.Donation_Key
														, B.Expectancy_Key
														, B.Donation_Primary_Amt
														, B.Donor_Primary_Yn
														, A.Plus_TotalCommittedAmount
														, E.Hier_Key
														, A.[Zero]
														FROM Ext_Opportunity A
															LEFT JOIN Ext_Pledge C ON A.OpportunityId = C.New_Opportunity
															LEFT JOIN _Donation_Fact B ON CONVERT(NVARCHAR(100),C.New_PledgeId) = B.Expectancy_Key
															LEFT JOIN 
																(
																 SELECT A.OpportunityId
																	, SUM(B.Donation_Primary_Amt) AS Plus_TotalGiven
																	FROM Ext_Opportunity A
																		LEFT JOIN Ext_Pledge C ON A.OpportunityId = C.New_Opportunity
																		LEFT JOIN _Donation_Fact B ON CONVERT(NVARCHAR(100),C.New_PledgeId) = B.Expectancy_Key
																		LEFT JOIN _Donation_Dim D ON B.Donation_Key = D.Donation_Key
																	WHERE 1 = 1
																		AND D.StatusCode = [Posted]
																		AND B.Donation_Primary_Amt IS NOT NULL
																	GROUP BY A.OpportunityId
																) D ON A.OpportunityId = D.OpportunityId
															LEFT JOIN
																(SELECT A.OpportunityId
																	, C.Hier_Key
																	FROM Ext_Opportunity A
																		LEFT JOIN _Fund_Dim B ON CONVERT(NVARCHAR(100),A.Plus_FundAccount) = B.Fund_Key
																		LEFT JOIN _Hier_Dim C ON CONVERT(NVARCHAR(100),B.New_InstitutionalHierarchy) = C.Hier_Key														
																) E ON A.OpportunityId = E.OpportunityId
														WHERE 1 = 1
															AND B.Donor_Primary_Yn = A.[Y]
													) A
											UNION
											SELECT A.OpportunityId
												, A.CustomerId
												, A.Plus_FundAccount
												, A.Plus_TotalAskAmount
												, COALESCE(D.Plus_TotalGiven,0) AS Plus_TotalGiven
												, A.Plus_ProposalDate
												, A.Plus_TargetedCommitment
												, A.Plus_CommittedDate
												, A.Plus_CultivationProcessStage1Date
												, A.Plus_CultivationProcessStage2Date
												, A.Plus_CultivationProcessStage3Date
												, A.Plus_CultivationProcessStage4Date
												, A.Plus_GiftNoticeCreatedOn 
												, A.Plus_ProposalStatusChangeDate
												, NULL AS Donation_Key
												, NULL AS Expectancy_Key
												, NULL AS Donation_Primary_Amt
												, NULL AS Donor_Primary_Yn
												, A.Plus_TotalCommittedAmount
												, E.Hier_Key
												, A.[Zero]
												FROM Ext_Opportunity A
													LEFT JOIN 
														(
														 SELECT A.OpportunityId
															, SUM(B.Donation_Primary_Amt) AS Plus_TotalGiven
															FROM Ext_Opportunity A
																LEFT JOIN Ext_Pledge C ON A.OpportunityId = C.New_Opportunity
																LEFT JOIN _Donation_Fact B ON CONVERT(NVARCHAR(100),C.New_PledgeId) = B.Expectancy_Key
																LEFT JOIN _Donation_Dim D ON B.Donation_Key = D.Donation_Key
															WHERE 1 = 1
																AND D.StatusCode = [Posted]
																AND B.Donation_Primary_Amt IS NOT NULL
															GROUP BY A.OpportunityId
														) D ON A.OpportunityId = D.OpportunityId
													LEFT JOIN																											
			' -- Ext_From_Statement_3
		, '												(SELECT A.OpportunityId
															, C.Hier_Key
															FROM Ext_Opportunity A
																LEFT JOIN _Fund_Dim B ON CONVERT(NVARCHAR(100),A.Plus_FundAccount) = B.Fund_Key
																LEFT JOIN _Hier_Dim C ON CONVERT(NVARCHAR(100),B.New_InstitutionalHierarchy) = C.Hier_Key														
														) E ON A.OpportunityId = D.OpportunityId
												WHERE 1 = 1
													AND A.OpportunityId NOT IN 
														(
														SELECT DISTINCT A.OpportunityId
															FROM Ext_Opportunity A
																LEFT JOIN Ext_Pledge C ON A.OpportunityId = C.New_Opportunity
																LEFT JOIN _Donation_Fact B ON CONVERT(NVARCHAR(100),C.New_PledgeId) = B.Expectancy_Key 
															WHERE 1 = 1
																AND Donor_Primary_Yn = A.[Y]  
														) 
											) A
									) A
									LEFT JOIN 
										(SELECT New_PledgeId
											, New_TotalPledged
											, New_BalanceDue_Base
											, New_TotalPaid_Base
											, New_InstallmentAmount_Base
											, Plus_PaymentAmount_Base
											, Plus_AnnualAmount_Base
											, New_PaymentsToMake
											, New_PaymentsReceived
											, New_BeginDate
											, New_EndDate
											, Plus_InstallmentDate 
											, New_SignatureDate
											, New_NotificationDate 
											, Plus_FundingDate
											, Plus_EstimatedMaturityDate
											, Plus_PaymentStartDate
											, New_Opportunity
											FROM Ext_Pledge
											WHERE 1 = 1
												AND New_Opportunity IS NOT NULL
										) B ON A.OpportunityId = CONVERT(NVARCHAR(100),B.New_Opportunity) AND (A.OpportunityId_RowNum = 1 OR A.Expectancy_Key = CONVERT(NVARCHAR(100),B.New_PledgeId))
							) A				
							LEFT JOIN _Donation_Fact B ON A.Donation_Key = B.Donation_Key AND Donation_Key_RowNum = 1
							LEFT JOIN _Donation_Dim C ON A.Donation_Key = C.Donation_Key
					) A
			) A
			LEFT JOIN
				(SELECT C.OpportunityID AS Initiative_Key
					, CONVERT(NVARCHAR(100),B.SystemUserId) AS User_Initiative_Liaison_Key
					FROM Ext_Connection A 
						INNER JOIN Ext_System_User B ON A.Record1Id = B.SystemUserId 
						INNER JOIN Ext_Opportunity C ON A.Record2Id = C.OpportunityId AND A.Record2ObjectTypeCode = 3 
						INNER JOIN Ext_Connection_Role D ON A.Record1RoleId = D.ConnectionRoleId AND D.Name IN ([Initiative_Liaison])
				) B ON A.Initiative_Key = B.Initiative_Key
			LEFT JOIN
				(SELECT A.OpportunityId AS Initiative_Key
					, CONVERT(NVARCHAR(100),B.SystemUserId) AS User_Coordinating_Liaison_Key
					FROM Ext_Opportunity A
						INNER JOIN Ext_System_User B ON A.Plus_CoordinatingLiaisonId = B.SystemUserId
				) C ON A.Initiative_Key = C.Initiative_Key		
			'-- Ext_From_Statement_4
		, NULL -- Ext_From_Statement_5
		, NULL -- Ext_From_Statement_6
		, NULL -- Ext_From_Statement_7
		, NULL -- Ext_Where_Statement_4
		, NULL -- Ext_Where_Statement_5
		, NULL -- Ext_Where_Statement_6
		, NULL -- Ext_Where_Statement_7
		, NULL -- Extra_1
		, NULL -- Extra_2
		, NULL -- Extra_3
		, NULL -- Extra_4
		, NULL -- Extra_5
		, NULL -- Extra_6
		, NULL -- Extra_7
		, NULL -- Extra_8
		, NULL -- Extra_9
		, NULL -- Extra_10
	)
	;	










	