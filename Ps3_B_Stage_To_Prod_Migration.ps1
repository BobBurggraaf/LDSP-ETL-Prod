

FUNCTION Insert-Alpha_Table_3
			{
				[CmdletBinding(
							PositionalBinding=$FALSE,
							SupportsPaging = $TRUE					  
							  )
				]
				[Alias("iat1")]

				Param
				(			
					# Alpha_Stage 
					[Parameter(Mandatory=$TRUE)]
					[Alias("p1")]
					[String]
					$Alpha_Stage ,
					
					# Alpha_Step_Number  
					[Parameter(Mandatory=$TRUE)]
					[Alias("p2")]
					[String]
					$Alpha_Step_Number  ,
					
					# Alpha_Step_Name  
					[Parameter(Mandatory=$TRUE)]
					[Alias("p3")]
					[String]
					$Alpha_Step_Name  ,
					
					# Alpha_Begin_Time  
					[Parameter(Mandatory=$FALSE)]
					[Alias("p4")]
					[DateTime]
					$Alpha_Begin_Time  ,
					
					# Alpha_End_Time 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p5")]
					[DateTime]
					$Alpha_End_Time  ,
					
					# Alpha_Duration_In_Seconds 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p6")]
					[Int]
					$Alpha_Duration_In_Seconds  ,
					
					# Alpha_Count 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p7")]
					[Int]
					$Alpha_Count  ,
					
					# Alpha_Query 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p8")]
					[String]
					$Alpha_Query  ,
					
					# Alpha_Result 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p9")]
					[Int]
					$Alpha_Result  ,
					
					# ErrorNumber 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p10")]
					[Int]
					$ErrorNumber  ,
					
					# ErrorSeverity 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p11")]
					[Int]
					$ErrorSeverity  ,
					
					# ErrorCount 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p12")]
					[Int]
					$ErrorCount  ,
					
					# ErrorProcedure 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p13")]
					[String]
					$ErrorProcedure  ,
					
					# ErrorLine 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p14")]
					[Int]
					$ErrorLine  ,
					
					# ErrorMessage 
					[Parameter(Mandatory=$FALSE)]
					[Alias("p15")]
					[String]
					$ErrorMessage
				)

				#---------------------------------------------
				# Catch Non-Terminating Errors
				#---------------------------------------------
				$Old = $ErrorActionPreference
				$ErrorActionPreference = 'Stop'
								
				####################################################################################################################
				
				#---------------------------------------------
				# Destination variables
				#---------------------------------------------
				[STRING] $Dest_Instance = 'w16359\S01'              #<----------------------------------------------------------
				[STRING] $Dest_Db = 'LDSPhilanthropiesDW'
				[STRING] $Dest_Connect_String = "Data Source=$Dest_Instance;Initial Catalog=$Dest_Db;Integrated Security=TRUE;"
						
				####################################################################################################################

				#---------------------------------------------
				# Alpha Insert
				#---------------------------------------------
				$DateTime = Get-Date

				$Insert_Alpha_Table = "INSERT INTO dbo.Alpha_Table_3 (
									Alpha_DateTime
									, Alpha_Stage
									, Alpha_Step_Number
									, Alpha_Step_Name
									, Alpha_Begin_Time
									, Alpha_End_Time
									, Alpha_Duration_In_Seconds
									, Alpha_Count
									, Alpha_Query
									, Alpha_Result
									, ErrorNumber
									, ErrorSeverity
									, ErrorCount
									, ErrorProcedure
									, ErrorLine
									, ErrorMessage
									)
									VALUES ('$DateTime'                     /*Alpha_DateTime*/
											, '$Alpha_Stage'            	/*Alpha_Stage*/
											, '$Alpha_Step_Number'          /*Alpha_Step_Number*/
											, '$Alpha_Step_Name' 			/*Alpha_Step_Name*/
											, '$Alpha_Begin_Time'           /*Alpha_Begin_Time*/
											, '$Alpha_End_Time'             /*Alpha_End_Time*/
											, $Alpha_Duration_In_Seconds    /*Alpha_Duration_In_Seconds*/
											, $Alpha_Count                  /*Alpha_Count*/
											, '$Alpha_Query'                /*Alpha_Query*/
											, $Alpha_Result                 /*Alpha_Result*/
											, $ErrorNumber                  /*ErrorNumber*/
											, $ErrorSeverity                /*ErrorSeverity*/
											, $ErrorCount                   /*ErrorCount*/
											, '$ErrorProcedure'             /*ErrorProcedure*/
											, $ErrorLine                    /*ErrorLine*/
											, '$ErrorMessage'               /*ErrorMessage*/
											)
										"
				Invoke-Sqlcmd `
					-ServerInstance $Dest_Instance `
					-Database $Dest_Db `
					-Query $Insert_Alpha_Table

				#---------------------------------------------	 
				# Return to standard error handling
				#---------------------------------------------
				$ErrorActionPreference = $Old	
			}
			
		FUNCTION Create-Alpha_Table_3
			{		
				#---------------------------------------------
				# Clear Console and Error Log
				#---------------------------------------------
				CLEAR
				$Error.Clear()

				#---------------------------------------------
				# Catch Non-Terminating Errors
				#---------------------------------------------
				$Old = $ErrorActionPreference
				$ErrorActionPreference = 'Stop'
				
				#---------------------------------------------
				# Log file
				#---------------------------------------------
				[STRING]$Folder_Date = Get-Date -Format "yyyyMMdd"
				$New_Folder_Path = "F:\Powershell Scripts\Logs\Migration_" + $Folder_Date
				IF(!(Test-Path $New_Folder_Path))
					{
						New-Item -ItemType Directory -Force -Path $New_Folder_Path
					}
						
				[STRING]$Log_Root = $New_Folder_Path + "\PS_Migration_Alpha_Table_3_"
				[STRING]$Log_DateTime = Get-Date -Format "yyyyMMdd_HHmmss"
				[String]$Log_File_Type = '.log'
				[STRING]$Log_File_Name = $Log_Root + $Log_DateTime + $Log_File_Type
				
				Start-Transcript -Path $Log_File_Name -Force -NoClobber
				
				Write-Host
				Write-Host "~ This is the beginning of the Create-Alpha_Table_3 script."
				Write-Host
						
				####################################################################################################################
				
				#---------------------------------------------
				# Destination variables
				#---------------------------------------------
				[STRING] $Dest_Instance = 'w16359\S01'          #<----------------------------------------------------------
				[STRING] $Dest_Db = 'LDSPhilanthropiesDW'
				[STRING] $Dest_Connect_String = "Data Source=$Dest_Instance;Initial Catalog=$Dest_Db;Integrated Security=TRUE;"

				Write-Host
				Write-Host "~ Dest_Instance: $Dest_Instance"
				Write-Host "~ Dest_Db: $Dest_Db"
				Write-Host "~ Dest_Connect_String: $Dest_Connect_String"
				Write-Host
						
				####################################################################################################################

				#---------------------------------------------
				# Create Alpha Table
				#---------------------------------------------
				
				$Drop_Alpha_Table = "IF EXISTS (SELECT 1 WHERE OBJECT_ID('dbo.Alpha_Table_3') IS NOT NULL)
									BEGIN
										EXEC('DROP TABLE dbo.Alpha_Table_3')
									END"
		 
				Invoke-Sqlcmd `
					-ServerInstance $Dest_Instance `
					-Database $Dest_Db `
					-Query $Drop_Alpha_Table
			
				$Create_Alpha_Table = "CREATE TABLE dbo.Alpha_Table_3 (
									Alpha_Key INT IDENTITY(1,1) PRIMARY KEY
									, Alpha_DateTime DATETIME
									, Alpha_Stage NVARCHAR(100)
									, Alpha_Step_Number NVARCHAR(10)
									, Alpha_Step_Name NVARCHAR(200)
									, Alpha_Begin_Time DATETIME
									, Alpha_End_Time DATETIME
									, Alpha_Duration_In_Seconds INT
									, Alpha_Count INT
									, Alpha_Query NVARCHAR(MAX)
									, Alpha_Result INT DEFAULT 0
									, ErrorNumber INT
									, ErrorSeverity INT
									, ErrorCount INT
									, ErrorProcedure NVARCHAR(500)
									, ErrorLine INT
									, ErrorMessage NVARCHAR(MAX)
									)"
				 
				Invoke-Sqlcmd `
					-ServerInstance $Dest_Instance `
					-Database $Dest_Db `
					-Query $Create_Alpha_Table
				
				Write-Host
				Write-Host "~ Created Alpha Table"
				Write-Host	
				
				Insert-Alpha_Table_3 -p1 "Beginning" -p2 "1A" -p3 "Created dbo.Alpha_Table_3" -p8 $Create_Alpha_Table -p9 1
				
				
				#---------------------------------------------	 
				# Return to standard error handling
				#---------------------------------------------
				$ErrorActionPreference = $Old
						
				write-host "The End"
				
				#---------------------------------------------	 
				# Stop log
				#---------------------------------------------
				Stop-Transcript
			
			}
			
		FUNCTION Copy-OneAccord_Data
			{
				[CmdletBinding(
							PositionalBinding=$FALSE,
							SupportsPaging = $TRUE					  
							  )
				]
				[Alias("eod")]

				Param
				(
					# Name of the source schema and table
					[Parameter(Mandatory=$TRUE)]
					[ValidatePattern("[a-z]*")]
					[ValidateLength(0,100)]
					[Alias("p1")]
					[String]
					$Source_Table_Name ,

					# Id of the table to be processed
					[Parameter(Mandatory=$TRUE)]
					[Alias("p2")]
					[INT]
					$Processing_Key
				)
				
				
				


				####################################################################################################################
				
				#---------------------------------------------
				# Clear Console and Error Log
				#---------------------------------------------
				#CLEAR
				#$Error.Clear()

				#---------------------------------------------
				# Catch Non-Terminating Errors
				#---------------------------------------------
				$Old = $ErrorActionPreference
				$ErrorActionPreference = 'Stop'
				
				#---------------------------------------------
				# Log file
				#---------------------------------------------
				[STRING]$Folder_Date = Get-Date -Format "yyyyMMdd"
				$New_Folder_Path = "F:\Powershell Scripts\Logs\Migration_" + $Folder_Date
				IF(!(Test-Path $New_Folder_Path))
					{
						New-Item -ItemType Directory -Force -Path $New_Folder_Path
					}
						
				[STRING]$Log_Root = $New_Folder_Path + "\PS_Migration_"
				$Pos = $Source_Table_Name.IndexOf(".")
				[STRING]$Table_Name = $Source_Table_Name.Substring($Pos+1)
				[STRING]$Log_DateTime = Get-Date -Format "yyyyMMdd_HHmmss"
				[String]$Log_File_Type = '.log'
				[STRING]$Log_File_Name = $Log_Root + $Table_Name + "_" + $Log_DateTime + $Log_File_Type
				
				#Sleep to allow a job running the same table to create its log
				Start-Sleep -s 1
				
				#If there is another job running the same table then go to the end
				IF(!(Test-Path $Log_File_Name))
					{
				
						Start-Transcript -Path $Log_File_Name -Force -NoClobber
						
						Write-Host
						Write-Host "~ This is the beginning of the Copy-OneAccord_Data script."
						Write-Host
						
						
						####################################################################################################################
						
						#---------------------------------------------
						# Source Variables
						#---------------------------------------------
						$SQLServer = "w16358\S01"
						$Database = "LDSPhilanthropiesDW"
						$SQLUser = ""                                                   #<----------------------------------------------------------
						$Password = "" | ConvertTo-SecureString -AsPlainText -Force     #<----------------------------------------------------------
						$Password.MakeReadOnly()
						[STRING] $Source_Table_And_Schema = $Source_Table_Name
						
						Write-Host
						Write-Host "~ SQLServer: $SQLServer"
						Write-Host "~ Database: $Database"
						Write-Host "~ SQLUser: $SQLUser"
						Write-Host "~ Password: $Password"
						Write-Host "~ Source_Table_And_Schema: $Source_Table_And_Schema"
						Write-Host
						
						#---------------------------------------------
						# Destination variables
						#---------------------------------------------
						[STRING] $Dest_Instance = 'w16359\S01'                           #<----------------------------------------------------------
						[STRING] $Dest_Db = 'LDSPhilanthropiesDW'
						[STRING] $Dest_Connect_String = "Data Source=$Dest_Instance;Initial Catalog=$Dest_Db;Integrated Security=TRUE;"
						[INT] $Bulk_Copy_Batch_Size = 10000
						[INT] $Bulk_Copy_Timeout = 600

						Write-Host
						Write-Host "~ Dest_Instance: $Dest_Instance"
						Write-Host "~ Dest_Db: $Dest_Db"
						Write-Host "~ Dest_Connect_String: $Dest_Connect_String"
						Write-Host "~ Bulk_Copy_Batch_Size: $Bulk_Copy_Batch_Size"
						Write-Host "~ Bulk_Copy_Timeout: $Bulk_Copy_Timeout"
						Write-Host
						
						#---------------------------------------------
						# Open connection to the database
						#---------------------------------------------
						[string]$connectionString = "Data Source=$SQLServer;Initial Catalog=$Database;"
						$cred = New-Object System.Data.SqlClient.SqlCredential($SQLUser,$Password)
						$SqlConnection = New-Object System.Data.SqlClient.SqlConnection($connectionString)
						$SqlConnection.credential = $cred
						$SqlConnection.Open()
						
						####################################################################################################################
						
						
						#---------------------------------------------
						# Get Variables from DDL Table
						#---------------------------------------------	
						[STRING]$Dest_Table_Name_Qry = "SELECT Destination_Table
																FROM dbo.Stage_To_Prod
																WHERE 1 = 1
																	AND Stage_To_Prod_Key = $Processing_Key
														  "                                                                                   
								$Dest_Table_Name = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Dest_Table_Name_Qry).Destination_Table
						
						[STRING]$Dest_Create_Fields_Qry = "SELECT Dest_Create_Fields
																FROM dbo.Stage_To_Prod
																WHERE 1 = 1
																	AND Stage_To_Prod_Key = $Processing_Key
														  "                                                                                    
								$Dest_Create_Fields = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Dest_Create_Fields_Qry).Dest_Create_Fields
						
						[STRING]$Dest_Insert_Fields_Qry = "SELECT Dest_Insert_Fields
																FROM dbo.Stage_To_Prod
																WHERE 1 = 1
																	AND Stage_To_Prod_Key = $Processing_Key
														  "                                                                                    
								$Dest_Insert_Fields = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Dest_Insert_Fields_Qry).Dest_Insert_Fields
					
						[STRING]$Dest_Where_Statement_Qry = "SELECT Dest_Where_Statement
																FROM dbo.Stage_To_Prod
																WHERE 1 = 1
																	AND Stage_To_Prod_Key = $Processing_Key
														  "                                                                                    
								$Dest_Where_Statement = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Dest_Where_Statement_Qry).Dest_Where_Statement

						Write-Host
						Write-Host "~ Processing Key: $Processing_Key"
						Write-Host "~ Dest_Table_Name: $Dest_Table_Name"
						Write-Host "~ Dest_Create_Fields: $Dest_Create_Fields"
						Write-Host "~ Dest_Insert_Fields: $Dest_Insert_Fields"
						Write-Host "~ Dest_Where_Statement: $Dest_Where_Statement"
						Write-Host		
								
						TRY
							{
									
								####################################################################################################################
								
								#---------------------------------------------
								# Insert Into Alpha Table
								#---------------------------------------------
								$Beg_DateTime = Get-Date
								Insert-Alpha_Table_3 -p1 $Dest_Table_Name -p2 "2A" -p3 "Drop, Create, Insert - Begin" -p4 $Beg_DateTime -p9 1
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $Beg_DateTime"
								Write-Host "~ Beginning of $Dest_Table_Name"
								Write-Host "~ Alpha_Stage: $Dest_Table_Name"
								Write-Host "~ Alpha_Step_Number: 2A"
								Write-Host "~ Alpha_Step_Name: Drop, Create, Insert - Begin"
								Write-Host
								
								####################################################################################################################
							
								#---------------------------------------------
								# Get source data
								#---------------------------------------------
								$Sql = "SELECT $Dest_Insert_Fields FROM $Source_Table_And_Schema WHERE 1 = 1 $Dest_Where_Statement"
								
							    $Sql_Command = New-Object system.Data.SqlClient.SqlCommand($Sql, $SqlConnection) 
								[System.Data.SqlClient.SqlDataReader] $Sql_Reader = $Sql_Command.ExecuteReader()
								
								
								#---------------------------------------------
								# Drop table is it exists in destination
								#---------------------------------------------
								$Drop_Table = "IF EXISTS (SELECT 1 WHERE OBJECT_ID('$Dest_Table_Name') IS NOT NULL)
													BEGIN
														EXEC('DROP TABLE $Dest_Table_Name')
													END"
						 
								Invoke-Sqlcmd `
									-ServerInstance $Dest_Instance `
									-Database $Dest_Db `
									-Query $Drop_Table
								
								
								#---------------------------------------------
								# Create destination table
								#---------------------------------------------
								$Create_Table = "CREATE TABLE $Dest_Table_Name (
													$Dest_Create_Fields
													)"
								 
								Invoke-Sqlcmd `
									-ServerInstance $Dest_Instance `
									-Database $Dest_Db `
									-Query $Create_Table
								
								
								
								#---------------------------------------------
								# Copy to destination
								#---------------------------------------------
								$Bulk_Copy = New-Object Data.SqlClient.SqlBulkCopy($Dest_Connect_String, [System.Data.SqlClient.SqlBulkCopyOptions]::KeepIdentity)
								$Bulk_Copy.DestinationTableName = $Dest_Table_Name
								$Bulk_Copy.BulkCopyTimeOut = $Bulk_Copy_Timeout
								$Bulk_Copy.BatchSize = $Bulk_Copy_Batch_Size
								$Bulk_Copy.WriteToServer($Sql_Reader)
								$Sql_Reader.Close()
								$Bulk_Copy.Close()
								
								
								
								
								
								
								
								####################################################################################################################
								
								#---------------------------------------------
								# Insert Into Alpha Table
								#---------------------------------------------				
								$End_DateTime = Get-Date
								Insert-Alpha_Table_3 -p1 $Dest_Table_Name -p2 "2B" -p3 "Drop, Create, Insert - End" -p4 $Beg_DateTime -p5 $End_DateTime -p8 $Create_Table -p9 1
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $End_DateTime"
								Write-Host "~ Ending of $Dest_Table_Name"
								Write-Host "~ Alpha_Stage: $Dest_Table_Name"
								Write-Host "~ Alpha_Step_Number: 2B"
								Write-Host "~ Alpha_Step_Name: Drop, Create, Insert - End"
								Write-Host
								
								####################################################################################################################
					
								
								
								####################################################################################################################
								
								#---------------------------------------------
								# Insert Into Alpha Table - Stats
								#---------------------------------------------
								[STRING] $Stats_Query_Time = "SELECT DATEDIFF(S,Beg_Time,End_Time) AS Time_Diff
																FROM
																	(SELECT Min(Alpha_DateTime) AS Beg_Time 
																		FROM dbo.Alpha_Table_3
																		WHERE 1 = 1
																			AND Alpha_Stage = '$Dest_Table_Name'
																	) A ,
																	(SELECT Max(Alpha_DateTime) AS End_Time 
																		FROM dbo.Alpha_Table_3
																		WHERE 1 = 1
																			AND Alpha_Stage = '$Dest_Table_Name'
																	) B
														  "
								
								$Stats_Time_Qry = Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Stats_Query_Time

								[Int]$Stats_Time = [convert]::ToInt32($Stats_Time_Qry.Time_Diff)



								[STRING]$Stats_Query_Cnt = "SELECT COUNT(*) AS Record_Cnt
																FROM $Dest_Table_Name
														  "
																									 
								$Stats_Cnt_Qry = Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Stats_Query_Cnt

								[Int]$Stats_Cnt = [convert]::ToInt32($Stats_Cnt_Qry.Record_Cnt)
								
								$Stat_DateTime = Get-Date
								Insert-Alpha_Table_3 -p1 $Dest_Table_Name -p2 "2S" -p3 "Stats" -p4 $Beg_DateTime -p5 $End_DateTime -p6 $Stats_Time -p7 $Stats_Cnt -p9 1
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $Stat_DateTime"
								Write-Host "~ Stats of $Dest_Table_Name"
								Write-Host "~ Alpha_Stage: $Dest_Table_Name"
								Write-Host "~ Alpha_Step_Number: 2S"
								Write-Host "~ Alpha_Step_Name: Stats"
								Write-Host "~ Run Time: $Stats_Time"
								Write-Host "~ Row Count: $Stats_Cnt"
								Write-Host
								
								####################################################################################################################
								
								
								
									
										

									
							}
						CATCH [System.Exception]
							{
								[STRING]$Error_Message = $_.Exception.Message -replace "'",""
								[INT]$Error_Count = $Error.Count
								
								####################################################################################################################
								
								#---------------------------------------------
								# Insert Into Alpha Table - Error
								#---------------------------------------------
								
								$Error_DateTime = Get-Date
								Insert-Alpha_Table_3 -p1 $Dest_Table_Name -p2 "2X" -p3 "Error" -p9 0 -p12 $Error_Count -p15 $Error_Message
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $Error_DateTime"
								Write-Host "~ Error on $Dest_Table_Name"
								Write-Host "~ Alpha_Stage: $Dest_Table_Name"
								Write-Host "~ Alpha_Step_Number: 2X"
								Write-Host "~ Alpha_Step_Name: Error"
								Write-Host
								Write-Host "~ Error Message: $Error_Message"
								Write-Host "~ Error Count: $Error_Count"
								Write-Host
								
								####################################################################################################################
								
								
								
								
								
							}
						FINALLY
							{
								#---------------------------------------------	 
								#Close connection to the database
								#---------------------------------------------
								$SqlConnection.Close()
								
								#---------------------------------------------	 
								# Return to standard error handling
								#---------------------------------------------
								$ErrorActionPreference = $Old
								
								
								write-host "The End (Copy-OneAccord_Data)"
								
								#---------------------------------------------	 
								# Stop log
								#---------------------------------------------
								Stop-Transcript
								
								
							}
					}
				ELSE
					{
						
						#---------------------------------------------	 
						# Return to standard error handling
						#---------------------------------------------
						$ErrorActionPreference = $Old
					}
				
			}
		
				
		#---------------------------------------------
		# Catch Non-Terminating Errors
		#---------------------------------------------
		$Old = $ErrorActionPreference
		$ErrorActionPreference = 'Stop'


		#---------------------------------------------
		# Job Variables
		#---------------------------------------------
		[STRING]$Job_Name = "Job1"                                             #<----------------------------------------------------------
		[INT]$Sleep_Time = 2 * 1                                               #<----------------------------------------------------------

		#---------------------------------------------
		# If this is the first than create the Alpha_Table_3
		#   Else sleep
		#---------------------------------------------
		Create-Alpha_Table_3                                                   #<----------------------------------------------------------
		#Start-Sleep -s $Sleep_Time  

		#---------------------------------------------
		# Log file
		#---------------------------------------------
		[STRING]$Folder_Date = Get-Date -Format "yyyyMMdd"
		$New_Folder_Path = "F:\Powershell Scripts\Logs\Migration_" + $Folder_Date
		IF(!(Test-Path $New_Folder_Path))
			{
				New-Item -ItemType Directory -Force -Path $New_Folder_Path
			}
				
		[STRING]$Log_Root = $New_Folder_Path + "\PS_Migration_"
		[STRING]$Parrellel_Processing = $Job_Name
		[STRING]$Log_DateTime = Get-Date -Format "yyyyMMdd_HHmmss"
		[String]$Log_File_Type = '.log'
		[STRING]$Log_File_Name = $Log_Root + $Parrellel_Processing + "_" + $Log_DateTime + $Log_File_Type

		Start-Transcript -Path $Log_File_Name -Force -NoClobber

		Write-Host
		Write-Host "~ This is the beginning of the Parrellel_Processing script."
		Write-Host
												

		#---------------------------------------------
		# Destination Connection String
		#---------------------------------------------

		[STRING] $Dest_Instance = 'w16359\S01'                #<----------------------------------------------------------
		[STRING] $Dest_Db = 'LDSPhilanthropiesDW'
		[STRING] $Dest_Connect_String = "Data Source=$Dest_Instance;Initial Catalog=$Dest_Db;Integrated Security=TRUE;"


		#---------------------------------------------
		# Loop Thru Tables
		#---------------------------------------------

				#---------------------------------------------
				# Tables to Process
				#---------------------------------------------
				
				[STRING]$Tables_To_Process_Qry = "SELECT COUNT(Source_Table) AS Tables_To_Process
													FROM dbo.Stage_To_Prod
													WHERE 1 = 1
														AND Tier = 1
														AND (Tier_1_Stage IS NULL 
															OR Tier_1_Stage = 'Incomplete'
															)
														
												"                                                                                   
					$Tables_To_Process_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process = [convert]::ToInt32($Tables_To_Process_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process"
				
				
				
				
				#---------------------------------------------
				# Loop Begin Time
				#---------------------------------------------
				$Loop_Begin_DateTime = Get-Date
				
				Write-Host 
				Write-Host "~ Loop Begin Time: $Loop_Begin_DateTime"
				
				
		DO 
			{
				
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Qry = "SELECT COALESCE(MIN(Stage_To_Prod_Key),0) AS Next_Table
														FROM dbo.Stage_To_Prod
														WHERE 1 = 1
															AND Tier = 1
															AND (Tier_1_Stage IS NULL 
																OR Tier_1_Stage = 'Incomplete'
																)															
													"                                                                                   
							$Processing_Key_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Qry).Next_Table
							
							[Int]$Processing_Key = [convert]::ToInt32($Processing_Key_Var)
						
						Write-Host
						Write-Host $Processing_Key_Qry
						Write-Host "~ Processing Key: $Processing_Key"
						
						#---------------------------------------------
						# Stage_To_Prod Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Stage_To_Prod = "UPDATE dbo.Stage_To_Prod 
											SET Tier_1_Stage = '$Job_Name'                   
												, Tier_1_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Stage_To_Prod_Key = $Processing_Key"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Stage_To_Prod
						
						Write-Host $Update_Stage_To_Prod
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Qry2 = "SELECT Tier_1_Stage
														FROM dbo.Stage_To_Prod
														WHERE 1 = 1 
															AND Stage_To_Prod_Key = $Processing_Key
													"                                                                                   
							$Tier_1_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Qry2).Tier_1_Stage
								
						Write-Host
						Write-Host $Processing_Key_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_1_Stage (2): $Tier_1_Stage"
						
						IF($Job_Name -eq $Tier_1_Stage) 
							{
						
						
								#---------------------------------------------
								# Source Table
								#---------------------------------------------
								
								[STRING]$Source_Table_Qry = "SELECT Source_Table
														FROM dbo.Stage_To_Prod
														WHERE 1 = 1
															AND Stage_To_Prod_Key = $Processing_Key
																		  "                                                                                   
												$Source_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Source_Table_Qry).Source_Table
								
								Write-Host
								Write-Host $Source_Table_Qry
								Write-Host "~ Source Table: $Source_Table"
								
								#---------------------------------------------
								# Destination Table
								#---------------------------------------------
								
								[STRING]$Dest_Table_Qry = "SELECT Destination_Table
														FROM dbo.Stage_To_Prod
														WHERE 1 = 1
															AND Stage_To_Prod_Key = $Processing_Key
																		  "                                                                                   
												$Dest_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Dest_Table_Qry).Destination_Table
								
								Write-Host
								Write-Host $Dest_Table
								Write-Host "~ Destination Table: $Dest_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-OneAccord_Data -p1 $Source_Table -p2 $Processing_Key
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM dbo.Alpha_Table_3
														WHERE 1 = 1
															AND Alpha_Stage = '$Dest_Table'
															AND Alpha_Step_Name = 'Stats'
																		  "                                                                                   
									$Extract_Success_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Extract_Success_Qry).Count_Alpha_Result
									
									[Int]$Extract_Success = [convert]::ToInt32($Extract_Success_Var)
								
								Write-Host
								Write-Host $Extract_Success_Qry
								Write-Host "~ Extract Success: $Extract_Success"
								
								IF ($Extract_Success -gt 0)
									{
										#---------------------------------------------
										# Stage_To_Prod Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Stage_To_Prod = "UPDATE dbo.Stage_To_Prod 
															SET Tier_1_Stage = 'Complete'
																, Tier_1_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Stage_To_Prod_Key = $Processing_Key"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Stage_To_Prod
										
										Write-Host
										Write-Host $Update_Complete_Stage_To_Prod
										Write-Host "~ Stage_To_Prod updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Stage_To_Prod Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Stage_To_Prod = "UPDATE dbo.Stage_To_Prod 
																				SET Tier_1_Stage = 'Incomplete'
																					, Tier_1_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Stage_To_Prod_Key = $Processing_Key
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Stage_To_Prod
										
										Write-Host
										Write-Host $Update_Incomplete_Stage_To_Prod
										Write-Host "~ Stage_To_Prod updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Qry = "SELECT COUNT(Source_Table) AS Tables_To_Process
																	FROM dbo.Stage_To_Prod
																	WHERE 1 = 1
																		AND Tier = 1
																		AND (Tier_1_Stage IS NULL 
																			OR Tier_1_Stage = 'Incomplete'
																			)																		
																"                                                                                   
									$Tables_To_Process_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Qry).Tables_To_Process
									
									[Int]$Tables_To_Process = [convert]::ToInt32($Tables_To_Process_Var)
								
								Write-Host
								Write-Host $Tables_To_Process_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					
												
			
			} UNTIL ($Tables_To_Process -eq 0 -OR $Total_Processing_Time -gt '00:59:00')
			
			

		#---------------------------------------------
		#Email Stored Procedure												#<----------------------------------------------------------
		#---------------------------------------------
		$Connection = New-Object System.Data.SQLClient.SQLConnection           
		$Connection.ConnectionString = "Server=$Dest_Instance;Database=$Dest_Db;Integrated Security=True"
		$Connection.Open() 

		$Command = New-Object System.Data.SQLClient.SQLCommand 
		$Command.Connection = $Connection 
		$Command.CommandText = “Exec dbo.usp_Extract_Email” 
		$Command.ExecuteNonQuery()
				

		  
		#---------------------------------------------	 
		# Return to standard error handling
		#---------------------------------------------
		$ErrorActionPreference = $Old

		Write-Host
		Write-Host "~ The process finished."

		#---------------------------------------------	 
		# Stop log
		#---------------------------------------------
		Stop-Transcript
		

