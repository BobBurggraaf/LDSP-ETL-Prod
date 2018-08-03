Start-Process powershell -Verb runAs

FUNCTION Insert-Alpha_Table_1
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
				[STRING] $Dest_Instance = 'W16359\S01'              #<----------------------------------------------------------
				[STRING] $Dest_Db = 'LDSPhilanthropiesDW'
				[STRING] $Dest_Connect_String = "Data Source=$Dest_Instance;Initial Catalog=$Dest_Db;Integrated Security=TRUE;"
						
				####################################################################################################################

				#---------------------------------------------
				# Alpha Insert
				#---------------------------------------------
				$DateTime = Get-Date

				$Insert_Alpha_Table = "INSERT INTO Oa_Extract.Alpha_Table_1 (
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
			
		FUNCTION Create-Alpha_Table_1
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
				$New_Folder_Path = "F:\Powershell Scripts\Logs\Extract_" + $Folder_Date
				IF(!(Test-Path $New_Folder_Path))
					{
						New-Item -ItemType Directory -Force -Path $New_Folder_Path
					}
						
				[STRING]$Log_Root = $New_Folder_Path + "\PS_Extract_Alpha_Table_1_"
				[STRING]$Log_DateTime = Get-Date -Format "yyyyMMdd_HHmmss"
				[String]$Log_File_Type = '.log'
				[STRING]$Log_File_Name = $Log_Root + $Log_DateTime + $Log_File_Type
				
				Start-Transcript -Path $Log_File_Name -Force -NoClobber
				
				Write-Host
				Write-Host "~ This is the beginning of the Create-Alpha_Table_1 script."
				Write-Host
						
				####################################################################################################################
				
				#---------------------------------------------
				# Destination variables
				#---------------------------------------------
				[STRING] $Dest_Instance = 'W16359\S01'          #<----------------------------------------------------------
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
				
				$Drop_Alpha_Table = "IF EXISTS (SELECT 1 WHERE OBJECT_ID('Oa_Extract.Alpha_Table_1') IS NOT NULL)
									BEGIN
										EXEC('DROP TABLE Oa_Extract.Alpha_Table_1')
									END"
		 
				Invoke-Sqlcmd `
					-ServerInstance $Dest_Instance `
					-Database $Dest_Db `
					-Query $Drop_Alpha_Table
			
				$Create_Alpha_Table = "CREATE TABLE Oa_Extract.Alpha_Table_1 (
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
				
				Insert-Alpha_Table_1 -p1 "Beginning" -p2 "1A" -p3 "Created Oa_Extract.Alpha_Table_1" -p8 $Create_Alpha_Table -p9 1
				
				#---------------------------------------------	 
				# Reset Extract_Stage in the Extract_Tables table
				#---------------------------------------------
				
				$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Extract_Stage = NULL
												, Extract_Stage_DateTime = NULL
												, Coupler_Stage = NULL
												, Coupler_Stage_DateTime = NULL
												, Tier_2_Stage = NULL
												, Tier_2_Stage_DateTime = NULL
												, Tier_3_Stage = NULL
												, Tier_3_Stage_DateTime = NULL
												, Tier_4_Stage = NULL
												, Tier_4_Stage_DateTime = NULL
												, Tier_5_Stage = NULL
												, Tier_5_Stage_DateTime = NULL
												, Tier_6_Stage = NULL
												, Tier_6_Stage_DateTime = NULL
												, Tier_7_Stage = NULL
												, Tier_7_Stage_DateTime = NULL
												, Tier_8_Stage = NULL
												, Tier_8_Stage_DateTime = NULL
												, Tier_9_Stage = NULL
												, Tier_9_Stage_DateTime = NULL
												, Tier_10_Stage = NULL
												, Tier_10_Stage_DateTime = NULL
												, Tier_11_Stage = NULL
												, Tier_11_Stage_DateTime = NULL
												, Tier_12_Stage = NULL
												, Tier_12_Stage_DateTime = NULL
											WHERE 1 = 1
											"
			
				Invoke-Sqlcmd `
					-ServerInstance $Dest_Instance `
					-Database $Dest_Db `
					-Query $Update_Extract_Tables
					
				write-host "~ Updated the Extract_Tables table with NULL values for Extract_Stage and Extract_Stage_DateTime."
				
				Insert-Alpha_Table_1 -p1 "Reset Extract_Stage" -p2 "1B" -p3 "Updated Extract_Tables table" -p8 $Update_Extract_Tables -p9 1
				
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
				$New_Folder_Path = "F:\Powershell Scripts\Logs\Extract_" + $Folder_Date
				IF(!(Test-Path $New_Folder_Path))
					{
						New-Item -ItemType Directory -Force -Path $New_Folder_Path
					}
						
				[STRING]$Log_Root = $New_Folder_Path + "\PS_Extract_"
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
						$SQLServer = "MSSQL12316\S06"
						$Database = "OneAccord_MSCRM"
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
						[STRING] $Dest_Instance = 'W16359\S01'                           #<----------------------------------------------------------
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
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key
														  "                                                                                   
								$Dest_Table_Name = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Dest_Table_Name_Qry).Destination_Table
						
						[STRING]$Dest_Create_Fields_Qry = "SELECT Dest_Create_Fields
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key
														  "                                                                                    
								$Dest_Create_Fields = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Dest_Create_Fields_Qry).Dest_Create_Fields
						
						[STRING]$Dest_Insert_Fields_Qry = "SELECT Dest_Insert_Fields
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key
														  "                                                                                    
								$Dest_Insert_Fields = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Dest_Insert_Fields_Qry).Dest_Insert_Fields
					
						[STRING]$Dest_Where_Statement_Qry = "SELECT Dest_Where_Statement
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key
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
								Insert-Alpha_Table_1 -p1 $Dest_Table_Name -p2 "2A" -p3 "Drop, Create, Insert - Begin" -p4 $Beg_DateTime -p9 1
								
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
								Insert-Alpha_Table_1 -p1 $Dest_Table_Name -p2 "2B" -p3 "Drop, Create, Insert - End" -p4 $Beg_DateTime -p5 $End_DateTime -p8 $Create_Table -p9 1
								
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
																		FROM Oa_Extract.Alpha_Table_1
																		WHERE 1 = 1
																			AND Alpha_Stage = '$Dest_Table_Name'
																	) A ,
																	(SELECT Max(Alpha_DateTime) AS End_Time 
																		FROM Oa_Extract.Alpha_Table_1
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
								Insert-Alpha_Table_1 -p1 $Dest_Table_Name -p2 "2S" -p3 "Stats" -p4 $Beg_DateTime -p5 $End_DateTime -p6 $Stats_Time -p7 $Stats_Cnt -p9 1
								
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
								Insert-Alpha_Table_1 -p1 $Dest_Table_Name -p2 "2X" -p3 "Error" -p9 0 -p12 $Error_Count -p15 $Error_Message
								
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
		FUNCTION Copy-Destination_Data
			{
				[CmdletBinding(
							PositionalBinding=$FALSE,
							SupportsPaging = $TRUE					  
							  )
				]
				[Alias("eod")]

				Param
				(
					# Name of the destination schema and table
					[Parameter(Mandatory=$TRUE)]
					[ValidatePattern("[a-z]*")]
					[ValidateLength(0,100)]
					[Alias("p1")]
					[String]
					$Destination_Table_Name ,

					# Id of the table to be processed
					[Parameter(Mandatory=$TRUE)]
					[Alias("p2")]
					[INT]
					$Processing_Key_Coupler
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
				$New_Folder_Path = "F:\Powershell Scripts\Logs\Extract_" + $Folder_Date
				IF(!(Test-Path $New_Folder_Path))
					{
						New-Item -ItemType Directory -Force -Path $New_Folder_Path
					}
						
				[STRING]$Log_Root = $New_Folder_Path + "\PS_Extract_"
				$Pos = $Destination_Table_Name.IndexOf(".")
				[STRING]$Table_Name = $Destination_Table_Name.Substring($Pos+1)
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
						Write-Host "~ This is the beginning of the Copy-Destination_Data script."
						Write-Host
						
						
						####################################################################################################################
						
						
						#---------------------------------------------
						# Destination variables
						#---------------------------------------------
						[STRING] $Dest_Instance = 'W16359\S01'                   #<----------------------------------------------------------
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
												
						
						####################################################################################################################
						
						
						#---------------------------------------------
						# Get Variables from DDL Table
						#---------------------------------------------	
						[STRING]$Ext_Table_Name_Qry = "SELECT CONCAT('dbo.',Ext_Table) AS Ext_Table
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Coupler
														  "                                                                                   
								$Ext_Table_Name = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Name_Qry).Ext_Table
						
						[STRING]$Ext_Create_Fields_Qry = "SELECT Ext_Create_Fields
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Coupler
														  "                                                                                    
								$Ext_Create_Fields = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Create_Fields_Qry).Ext_Create_Fields
								
						[STRING]$Ext_Create_Fields_2_Qry = "SELECT Ext_Create_Fields_2
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Coupler
														  "                                                                                    
								$Ext_Create_Fields_2 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Create_Fields_2_Qry).Ext_Create_Fields_2
								
						[STRING]$Ext_Create_Fields_3_Qry = "SELECT Ext_Create_Fields_3
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Coupler
														  "                                                                                    
								$Ext_Create_Fields_3 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Create_Fields_3_Qry).Ext_Create_Fields_3
						
						[STRING]$Ext_Insert_Fields_Qry = "SELECT Ext_Insert_Fields
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Coupler
														  "                                                                                    
								$Ext_Insert_Fields = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Insert_Fields_Qry).Ext_Insert_Fields
						
						[STRING]$Ext_Select_Statement_Qry = "SELECT Ext_Select_Statement
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Coupler
														  "                                                                                    
								$Ext_Select_Statement = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Select_Statement_Qry).Ext_Select_Statement
								
						[STRING]$Ext_From_Fields_Qry = "SELECT Ext_From_Statement
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Coupler
														  "                                                                                    
								$Ext_From_Statement = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_From_Fields_Qry).Ext_From_Statement
					
						[STRING]$Ext_Where_Statement_Qry = "SELECT Ext_Where_Statement
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Coupler
														  "                                                                                    
								$Ext_Where_Statement = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Where_Statement_Qry).Ext_Where_Statement
								
						[STRING]$Ext_Where_Statement_2_Qry = "SELECT Ext_Where_Statement_2
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Coupler
														  "                                                                                    
								$Ext_Where_Statement_2 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Where_Statement_2_Qry).Ext_Where_Statement_2
								
						[STRING]$Ext_Where_Statement_3_Qry = "SELECT Ext_Where_Statement_3
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Coupler
														  "                                                                                    
								$Ext_Where_Statement_3 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Where_Statement_3_Qry).Ext_Where_Statement_3

						Write-Host
						Write-Host "~ Processing Key: $Processing_Key_Coupler"
						Write-Host "~ Ext_Table_Name: $Ext_Table_Name"
						Write-Host "~ Ext_Create_Fields: $Ext_Create_Fields"
						Write-Host "~ Ext_Insert_Fields: $Ext_Insert_Fields"
						Write-Host "~ Ext_Select_Statement: $Ext_Select_Statement"
						Write-Host "~ Ext_From_Statement: $Ext_From_Statement"
						Write-Host "~ Ext_Where_Statement: $Ext_Where_Statement"
						Write-Host		
								
						TRY
							{
									
								####################################################################################################################
								
								#---------------------------------------------
								# Insert Into Alpha Table
								#---------------------------------------------
								$Beg_DateTime = Get-Date
								Insert-Alpha_Table_1 -p1 $Ext_Table_Name -p2 "12A" -p3 "Drop, Create, Insert - Begin" -p4 $Beg_DateTime -p9 1
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $Beg_DateTime"
								Write-Host "~ Beginning of $Ext_Table_Name"
								Write-Host "~ Alpha_Stage: $Ext_Table_Name"
								Write-Host "~ Alpha_Step_Number: 12A"
								Write-Host "~ Alpha_Step_Name: Drop, Create, Insert - Begin"
								Write-Host
								
								####################################################################################################################
							
								#---------------------------------------------
								# Get Destination data
								#---------------------------------------------
								$Sql = "SELECT $Ext_Select_Statement FROM $Ext_From_Statement WHERE 1 = 1 $Ext_Where_Statement $Ext_Where_Statement_2 $Ext_Where_Statement_3"
														    
								
								
								#---------------------------------------------
								# Drop table is it exists in destination
								#---------------------------------------------
								$Drop_Table = "IF EXISTS (SELECT 1 WHERE OBJECT_ID('$Ext_Table_Name') IS NOT NULL)
													BEGIN
														EXEC('DROP TABLE $Ext_Table_Name')
													END"
						 
								Invoke-Sqlcmd `
									-ServerInstance $Dest_Instance `
									-Database $Dest_Db `
									-Query $Drop_Table
								
								
								#---------------------------------------------
								# Create destination table
								#---------------------------------------------
								$Create_Table = "CREATE TABLE $Ext_Table_Name (
													$Ext_Create_Fields
													$Ext_Create_Fields_2
													$Ext_Create_Fields_3
													)"
								 
								Invoke-Sqlcmd `
									-ServerInstance $Dest_Instance `
									-Database $Dest_Db `
									-QueryTimeout 1800 `
									-ConnectionTimeOut 1800 `
									-Query $Create_Table
								
								
								
								#---------------------------------------------
								# Insert into Ext
								#---------------------------------------------
								$Insert_Data = "INSERT INTO $Ext_Table_Name (
													$Ext_Insert_Fields
													)
													$Sql
													"
								 
								Invoke-Sqlcmd `
									-ServerInstance $Dest_Instance `
									-Database $Dest_Db `
									-QueryTimeout 1800 `
									-ConnectionTimeOut 1800 `
									-Query $Insert_Data
															
								
								
								####################################################################################################################
								
								#---------------------------------------------
								# Insert Into Alpha Table
								#---------------------------------------------				
								$End_DateTime = Get-Date
								Insert-Alpha_Table_1 -p1 $Ext_Table_Name -p2 "12B" -p3 "Drop, Create, Insert - End" -p4 $Beg_DateTime -p5 $End_DateTime -p8 $Insert_Data -p9 1
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $End_DateTime"
								Write-Host "~ Ending of $Ext_Table_Name"
								Write-Host "~ Alpha_Stage: $Ext_Table_Name"
								Write-Host "~ Alpha_Step_Number: 12B"
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
																		FROM Oa_Extract.Alpha_Table_1
																		WHERE 1 = 1
																			AND Alpha_Stage = '$Ext_Table_Name'
																	) A ,
																	(SELECT Max(Alpha_DateTime) AS End_Time 
																		FROM Oa_Extract.Alpha_Table_1
																		WHERE 1 = 1
																			AND Alpha_Stage = '$Ext_Table_Name'
																	) B
														  "
								
								$Stats_Time_Qry = Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Stats_Query_Time

								[Int]$Stats_Time = [convert]::ToInt32($Stats_Time_Qry.Time_Diff)



								[STRING]$Stats_Query_Cnt = "SELECT COUNT(*) AS Record_Cnt
																FROM $Ext_Table_Name
														  "
																									 
								$Stats_Cnt_Qry = Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Stats_Query_Cnt

								[Int]$Stats_Cnt = [convert]::ToInt32($Stats_Cnt_Qry.Record_Cnt)
								
								$Stat_DateTime = Get-Date
								Insert-Alpha_Table_1 -p1 $Ext_Table_Name -p2 "12S" -p3 "Stats" -p4 $Beg_DateTime -p5 $End_DateTime -p6 $Stats_Time -p7 $Stats_Cnt -p9 1
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $Stat_DateTime"
								Write-Host "~ Stats of $Ext_Table_Name"
								Write-Host "~ Alpha_Stage: $Ext_Table_Name"
								Write-Host "~ Alpha_Step_Number: 12S"
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
								Insert-Alpha_Table_1 -p1 $Ext_Table_Name -p2 "12X" -p3 "Error" -p9 0 -p12 $Error_Count -p15 $Error_Message
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $Error_DateTime"
								Write-Host "~ Error on $Ext_Table_Name"
								Write-Host "~ Alpha_Stage: $Ext_Table_Name"
								Write-Host "~ Alpha_Step_Number: 12X"
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
								# Return to standard error handling
								#---------------------------------------------
								$ErrorActionPreference = $Old
								
								
								write-host "The End (Copy-Destination_Data)"
								
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
		
		FUNCTION Copy-Tier_2_Data
			{
				[CmdletBinding(
							PositionalBinding=$FALSE,
							SupportsPaging = $TRUE					  
							  )
				]
				[Alias("eod")]

				Param
				(
					# Name of the destination schema and table
					[Parameter(Mandatory=$TRUE)]
					[ValidatePattern("[a-z]*")]
					[ValidateLength(0,100)]
					[Alias("p1")]
					[String]
					$Ext_Table_Name ,

					# Id of the table to be processed
					[Parameter(Mandatory=$TRUE)]
					[Alias("p2")]
					[INT]
					$Processing_Key_Tier_2
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
				$New_Folder_Path = "F:\Powershell Scripts\Logs\Extract_" + $Folder_Date
				IF(!(Test-Path $New_Folder_Path))
					{
						New-Item -ItemType Directory -Force -Path $New_Folder_Path
					}
						
				[STRING]$Log_Root = $New_Folder_Path + "\PS_Extract_"
				$Pos = $Ext_Table_Name.IndexOf(".")
				[STRING]$Table_Name = $Ext_Table_Name.Substring($Pos+1)
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
						Write-Host "~ This is the beginning of the Copy-Tier_2_Data script."
						Write-Host
						
						
						####################################################################################################################
						
						
						#---------------------------------------------
						# Destination variables
						#---------------------------------------------
						[STRING] $Dest_Instance = 'W16359\S01'                    #<----------------------------------------------------------
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
												
						
						####################################################################################################################
						
						
						#---------------------------------------------
						# Get Variables from DDL Table
						#---------------------------------------------	
						[STRING]$Ext_Table_Name_Qry = "SELECT CONCAT('dbo.',Ext_Table) AS Ext_Table
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                   
								$Ext_Table_Name = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Name_Qry).Ext_Table
						
						[STRING]$Ext_Create_Fields_Qry = "SELECT Ext_Create_Fields
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Create_Fields = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Create_Fields_Qry).Ext_Create_Fields
						
						[STRING]$Ext_Create_Fields_2_Qry = "SELECT Ext_Create_Fields_2
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Create_Fields_2 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Create_Fields_2_Qry).Ext_Create_Fields_2
						
						[STRING]$Ext_Create_Fields_3_Qry = "SELECT Ext_Create_Fields_3
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Create_Fields_3 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Create_Fields_3_Qry).Ext_Create_Fields_3
								
						[STRING]$Ext_Insert_Fields_Qry = "SELECT Ext_Insert_Fields
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Insert_Fields = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Insert_Fields_Qry).Ext_Insert_Fields
						
						[STRING]$Ext_Select_Statement_Qry = "SELECT Ext_Select_Statement
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Select_Statement = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Select_Statement_Qry).Ext_Select_Statement
								
						[STRING]$Ext_Select_Statement_2_Qry = "SELECT Ext_Select_Statement_2
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Select_Statement_2 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Select_Statement_2_Qry).Ext_Select_Statement_2
								
						[STRING]$Ext_From_Fields_Qry = "SELECT Ext_From_Statement
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_From_Statement = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_From_Fields_Qry).Ext_From_Statement
								
						[STRING]$Ext_From_Statement_2_Qry = "SELECT Ext_From_Statement_2
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_From_Statement_2 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_From_Statement_2_Qry).Ext_From_Statement_2
					
						[STRING]$Ext_Where_Statement_Qry = "SELECT Ext_Where_Statement
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Where_Statement = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Where_Statement_Qry).Ext_Where_Statement
						
						[STRING]$Ext_Where_Statement_2_Qry = "SELECT Ext_Where_Statement_2
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Where_Statement_2 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Where_Statement_2_Qry).Ext_Where_Statement_2
								
						[STRING]$Ext_Where_Statement_3_Qry = "SELECT Ext_Where_Statement_3
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Where_Statement_3 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Where_Statement_3_Qry).Ext_Where_Statement_3

						[STRING]$Ext_Select_Statement_3_Qry = "SELECT Ext_Select_Statement_3
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Select_Statement_3 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Select_Statement_3_Qry).Ext_Select_Statement_3
		
						[STRING]$Ext_Select_Statement_4_Qry = "SELECT Ext_Select_Statement_4
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Select_Statement_4 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Select_Statement_4_Qry).Ext_Select_Statement_4

						[STRING]$Ext_Select_Statement_5_Qry = "SELECT Ext_Select_Statement_5
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Select_Statement_5 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Select_Statement_5_Qry).Ext_Select_Statement_5
						
						[STRING]$Ext_Select_Statement_6_Qry = "SELECT Ext_Select_Statement_6
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Select_Statement_6 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Select_Statement_6_Qry).Ext_Select_Statement_6
						
						[STRING]$Ext_Select_Statement_7_Qry = "SELECT Ext_Select_Statement_7
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Select_Statement_7 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Select_Statement_7_Qry).Ext_Select_Statement_7
						
						[STRING]$Ext_From_Statement_3_Qry = "SELECT Ext_From_Statement_3
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_From_Statement_3 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_From_Statement_3_Qry).Ext_From_Statement_3
						
						[STRING]$Ext_From_Statement_4_Qry = "SELECT Ext_From_Statement_4
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_From_Statement_4 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_From_Statement_4_Qry).Ext_From_Statement_4
						
						[STRING]$Ext_From_Statement_5_Qry = "SELECT Ext_From_Statement_5
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_From_Statement_5 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_From_Statement_5_Qry).Ext_From_Statement_5
						
						[STRING]$Ext_From_Statement_6_Qry = "SELECT Ext_From_Statement_6
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_From_Statement_6 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_From_Statement_6_Qry).Ext_From_Statement_6
						
						[STRING]$Ext_From_Statement_7_Qry = "SELECT Ext_From_Statement_7
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_From_Statement_7 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_From_Statement_7_Qry).Ext_From_Statement_7
						
						[STRING]$Ext_Where_Statement_4_Qry = "SELECT Ext_Where_Statement_4
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Where_Statement_4 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Where_Statement_4_Qry).Ext_Where_Statement_4
						
						[STRING]$Ext_Where_Statement_5_Qry = "SELECT Ext_Where_Statement_5
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Where_Statement_5 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Where_Statement_5_Qry).Ext_Where_Statement_5
						
						[STRING]$Ext_Where_Statement_6_Qry = "SELECT Ext_Where_Statement_6
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Where_Statement_6 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Where_Statement_6_Qry).Ext_Where_Statement_6
						
						[STRING]$Ext_Where_Statement_7_Qry = "SELECT Ext_Where_Statement_7
																FROM Oa_Extract.Extract_Tables
																WHERE 1 = 1
																	AND Extract_Tables_Key = $Processing_Key_Tier_2
														  "                                                                                    
								$Ext_Where_Statement_7 = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Where_Statement_7_Qry).Ext_Where_Statement_7
														
								
								
						Write-Host
						Write-Host "~ Processing Key: $Processing_Key_Tier_2"
						Write-Host "~ Ext_Table_Name: $Ext_Table_Name"
						Write-Host "~ Ext_Create_Fields: $Ext_Create_Fields"
						Write-Host "~ Ext_Create_Fields 2: $Ext_Create_Fields_2"
						Write-Host "~ Ext_Create_Fields 3: $Ext_Create_Fields_3"
						Write-Host "~ Ext_Insert_Fields: $Ext_Insert_Fields"
						Write-Host "~ Ext_Select_Statement: $Ext_Select_Statement"
						Write-Host "~ Ext_From_Statement: $Ext_From_Statement"
						Write-Host "~ Ext_Where_Statement: $Ext_Where_Statement"
						Write-Host		
								
						TRY
							{
									
								####################################################################################################################
								
								#---------------------------------------------
								# Insert Into Alpha Table
								#---------------------------------------------
								$Beg_DateTime = Get-Date
								Insert-Alpha_Table_1 -p1 $Ext_Table_Name -p2 "12A" -p3 "Drop, Create, Insert - Begin" -p4 $Beg_DateTime -p9 1
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $Beg_DateTime"
								Write-Host "~ Beginning of $Ext_Table_Name"
								Write-Host "~ Alpha_Stage: $Ext_Table_Name"
								Write-Host "~ Alpha_Step_Number: 12A"
								Write-Host "~ Alpha_Step_Name: Drop, Create, Insert - Begin"
								Write-Host
								
								####################################################################################################################
							
								#---------------------------------------------
								# Get Destination data
								#---------------------------------------------
									[STRING]$Sql = "SELECT $Ext_Select_Statement $Ext_Select_Statement_2 $Ext_Select_Statement_3 $Ext_Select_Statement_4 $Ext_Select_Statement_5 $Ext_Select_Statement_6 $Ext_Select_Statement_7 
														FROM $Ext_From_Statement $Ext_From_Statement_2 $Ext_From_Statement_3 $Ext_From_Statement_4 $Ext_From_Statement_5 $Ext_From_Statement_6 $Ext_From_Statement_7
														WHERE 1 = 1 $Ext_Where_Statement $Ext_Where_Statement_2 $Ext_Where_Statement_3 $Ext_Where_Statement_4 $Ext_Where_Statement_5 $Ext_Where_Statement_6 $Ext_Where_Statement_7"
                                			    
								Write-Host
								Write-Host "~ Insert Query: $Sql"														   								
								
								#---------------------------------------------
								# Drop table is it exists in destination
								#---------------------------------------------
								$Drop_Table = "IF EXISTS (SELECT 1 WHERE OBJECT_ID('$Ext_Table_Name') IS NOT NULL)
													BEGIN
														EXEC('DROP TABLE $Ext_Table_Name')
													END"
						 
								Invoke-Sqlcmd `
									-ServerInstance $Dest_Instance `
									-Database $Dest_Db `
									-Query $Drop_Table
								
								
								#---------------------------------------------
								# Create destination table
								#---------------------------------------------
								[STRING]$Create_Table = "CREATE TABLE $Ext_Table_Name (
													$Ext_Create_Fields
													$Ext_Create_Fields_2
													$Ext_Create_Fields_3
													)"
								 
								Invoke-Sqlcmd `
									-ServerInstance $Dest_Instance `
									-Database $Dest_Db `
									-QueryTimeout 1800 `
									-ConnectionTimeOut 1800 `
									-Query $Create_Table
								
								
								
								#---------------------------------------------
								# Insert into Ext
								#---------------------------------------------
								[STRING]$Insert_Data = "INSERT INTO $Ext_Table_Name (
													$Ext_Insert_Fields
													)
													$Sql
                                                " 
								
								Write-Host
								Write-Host "~ Insert Data Query: $Insert_Data"
                                 
								Invoke-Sqlcmd `
									-ServerInstance $Dest_Instance `
									-Database $Dest_Db `
									-QueryTimeout 1800 `
									-ConnectionTimeOut 1800 `
									-Query $Insert_Data
															
								
								
								####################################################################################################################
								
								#---------------------------------------------
								# Insert Into Alpha Table
								#---------------------------------------------				
								$End_DateTime = Get-Date
								Insert-Alpha_Table_1 -p1 $Ext_Table_Name -p2 "12B" -p3 "Drop, Create, Insert - End" -p4 $Beg_DateTime -p5 $End_DateTime -p8 $Insert_Data -p9 1
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $End_DateTime"
								Write-Host "~ Ending of $Ext_Table_Name"
								Write-Host "~ Alpha_Stage: $Ext_Table_Name"
								Write-Host "~ Alpha_Step_Number: 12B"
								Write-Host "~ Alpha_Step_Name: Drop, Create, Insert - End"
								Write-Host
								
								####################################################################################################################
														
								####################################################################################################################
								
								#---------------------------------------------
								# Insert Into Alpha Table - Stats
								#---------------------------------------------
								[STRING]$Stats_Query_Time = "SELECT DATEDIFF(S,Beg_Time,End_Time) AS Time_Diff
																FROM
																	(SELECT Min(Alpha_DateTime) AS Beg_Time 
																		FROM Oa_Extract.Alpha_Table_1
																		WHERE 1 = 1
																			AND Alpha_Stage = '$Ext_Table_Name'
																	) A ,
																	(SELECT Max(Alpha_DateTime) AS End_Time 
																		FROM Oa_Extract.Alpha_Table_1
																		WHERE 1 = 1
																			AND Alpha_Stage = '$Ext_Table_Name'
																	) B
														  "
								
								$Stats_Time_Qry = Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Stats_Query_Time

								[Int]$Stats_Time = [convert]::ToInt32($Stats_Time_Qry.Time_Diff)



								[STRING]$Stats_Query_Cnt = "SELECT COUNT(*) AS Record_Cnt
																FROM $Ext_Table_Name
														  "
																									 
								$Stats_Cnt_Qry = Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Stats_Query_Cnt

								[Int]$Stats_Cnt = [convert]::ToInt32($Stats_Cnt_Qry.Record_Cnt)
								
								$Stat_DateTime = Get-Date
								Insert-Alpha_Table_1 -p1 $Ext_Table_Name -p2 "12S" -p3 "Stats" -p4 $Beg_DateTime -p5 $End_DateTime -p6 $Stats_Time -p7 $Stats_Cnt -p9 1
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $Stat_DateTime"
								Write-Host "~ Stats of $Ext_Table_Name"
								Write-Host "~ Alpha_Stage: $Ext_Table_Name"
								Write-Host "~ Alpha_Step_Number: 12S"
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
								Insert-Alpha_Table_1 -p1 $Ext_Table_Name -p2 "12X" -p3 "Error" -p9 0 -p12 $Error_Count -p15 $Error_Message
								
								Write-Host
								Write-Host "~ Alpha_DateTime: $Error_DateTime"
								Write-Host "~ Error on $Ext_Table_Name"
								Write-Host "~ Alpha_Stage: $Ext_Table_Name"
								Write-Host "~ Alpha_Step_Number: 12X"
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
								# Return to standard error handling
								#---------------------------------------------
								$ErrorActionPreference = $Old
								
								
								write-host "The End (Copy-Destination_Data)"
								
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
		# If this is the first than create the Alpha_Table_1
		#   Else sleep
		#---------------------------------------------
		#Create-Alpha_Table_1                                                   #<----------------------------------------------------------
		Start-Sleep -s $Sleep_Time  

		#---------------------------------------------
		# Log file
		#---------------------------------------------
		[STRING]$Folder_Date = Get-Date -Format "yyyyMMdd"
		$New_Folder_Path = "F:\Powershell Scripts\Logs\Extract_" + $Folder_Date
		IF(!(Test-Path $New_Folder_Path))
			{
				New-Item -ItemType Directory -Force -Path $New_Folder_Path
			}
				
		[STRING]$Log_Root = $New_Folder_Path + "\PS_Extract_"
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

		[STRING] $Dest_Instance = 'W16359\S01'                #<----------------------------------------------------------
		[STRING] $Dest_Db = 'LDSPhilanthropiesDW'
		[STRING] $Dest_Connect_String = "Data Source=$Dest_Instance;Initial Catalog=$Dest_Db;Integrated Security=TRUE;"


		#---------------------------------------------
		# Loop Thru Tables
		#---------------------------------------------

				#---------------------------------------------
				# Tables to Process
				#---------------------------------------------
				
				[STRING]$Tables_To_Process_Qry = "SELECT COUNT(Source_Table) AS Tables_To_Process
													FROM Oa_Extract.Extract_Tables
													WHERE 1 = 1
														AND Tier = 1
														AND (Extract_Stage IS NULL 
															OR Extract_Stage = 'Incomplete'
															)
														AND Active = 1
												"                                                                                   
					$Tables_To_Process_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process = [convert]::ToInt32($Tables_To_Process_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process"
				
				[STRING]$Tables_To_Process_Coupler_Qry = "SELECT COUNT(Source_Table) AS Tables_To_Process
															FROM Oa_Extract.Extract_Tables
															WHERE 1 = 1 
																AND Tier = 1
																AND (Coupler_Stage IS NULL 
																	OR Coupler_Stage = 'Incomplete'
																	OR Coupler_Stage LIKE 'Job%'
																	)
																AND Active = 1
														"                                                                                   
					$Tables_To_Process_Coupler_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Coupler_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Coupler = [convert]::ToInt32($Tables_To_Process_Coupler_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Coupler_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Coupler"
				
				[STRING]$Tables_To_Process_Tier_2A_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 2
															AND Ext_Table IN ('_Picklist_1','_Picklist_2','_Picklist_3','_Picklist_4')
															AND (Tier_2_Stage IS NULL 
																OR Tier_2_Stage = 'Incomplete'
																OR Tier_2_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_2A_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_2A_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_2A = [convert]::ToInt32($Tables_To_Process_Tier_2A_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_2A_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_2A"
				
				[STRING]$Tables_To_Process_Tier_2B_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 2														
															AND (Tier_2_Stage IS NULL 
																OR Tier_2_Stage = 'Incomplete'
																)
															AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_2B_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_2B_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_2B = [convert]::ToInt32($Tables_To_Process_Tier_2B_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_2B_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_2B"
				
				[STRING]$Tables_To_Process_Tier_3_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 3
																			AND (Tier_3_Stage IS NULL 
																				OR Tier_3_Stage = 'Incomplete'
																				)
																			AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_3_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_3_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_3 = [convert]::ToInt32($Tables_To_Process_Tier_3_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_3_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_3"
				
				[STRING]$Tables_To_Process_Tier_4_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 4
																			AND (Tier_4_Stage IS NULL 
																				OR Tier_4_Stage = 'Incomplete'
																				)
																			AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_4_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_4_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_4 = [convert]::ToInt32($Tables_To_Process_Tier_4_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_4_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_4"
				
				[STRING]$Tables_To_Process_Tier_5_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 5
																			AND (Tier_5_Stage IS NULL 
																				OR Tier_5_Stage = 'Incomplete'
																				)
																			AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_5_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_5_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_5 = [convert]::ToInt32($Tables_To_Process_Tier_5_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_5_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_5"
				
				[STRING]$Tables_To_Process_Tier_6_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 6
																			AND (Tier_6_Stage IS NULL 
																				OR Tier_6_Stage = 'Incomplete'
																				)
																			AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_6_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_6_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_6 = [convert]::ToInt32($Tables_To_Process_Tier_6_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_6_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_6"
				
				[STRING]$Tables_To_Process_Tier_7_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 7
																			AND (Tier_7_Stage IS NULL 
																				OR Tier_7_Stage = 'Incomplete'
																				)
																			AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_7_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_7_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_7 = [convert]::ToInt32($Tables_To_Process_Tier_7_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_7_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_7"
				
				[STRING]$Tables_To_Process_Tier_8_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 8
																			AND (Tier_8_Stage IS NULL 
																				OR Tier_8_Stage = 'Incomplete'
																				)
																			AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_8_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_8_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_8 = [convert]::ToInt32($Tables_To_Process_Tier_8_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_8_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_8"
				
				[STRING]$Tables_To_Process_Tier_9_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 9
																			AND (Tier_9_Stage IS NULL 
																				OR Tier_9_Stage = 'Incomplete'
																				)
																			AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_9_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_9_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_9 = [convert]::ToInt32($Tables_To_Process_Tier_9_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_9_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_9"
				

[STRING]$Tables_To_Process_Tier_10_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 10
																			AND (Tier_10_Stage IS NULL 
																				OR Tier_10_Stage = 'Incomplete'
																				)
																			AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_10_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_10_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_10 = [convert]::ToInt32($Tables_To_Process_Tier_10_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_10_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_10"

[STRING]$Tables_To_Process_Tier_11_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 11
																			AND (Tier_11_Stage IS NULL 
																				OR Tier_11_Stage = 'Incomplete'
																				)
																			AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_11_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_11_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_11 = [convert]::ToInt32($Tables_To_Process_Tier_11_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_11_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_11"

[STRING]$Tables_To_Process_Tier_12_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 12
																			AND (Tier_12_Stage IS NULL 
																				OR Tier_12_Stage = 'Incomplete'
																				)
																			AND Active = 1
														"                                                                                   
					$Tables_To_Process_Tier_12_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_12_Qry).Tables_To_Process
				
					[Int]$Tables_To_Process_Tier_12 = [convert]::ToInt32($Tables_To_Process_Tier_12_var)
				
				Write-Host
				Write-Host $Tables_To_Process_Tier_12_Qry
				Write-Host "~ Tables to Process: $Tables_To_Process_Tier_12"



				
				#---------------------------------------------
				# Loop Begin Time
				#---------------------------------------------
				$Loop_Begin_DateTime = Get-Date
				
				Write-Host 
				Write-Host "~ Loop Begin Time: $Loop_Begin_DateTime"
				
				
		DO 
			{
				IF($Tables_To_Process -gt 0)
					{
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 1
															AND (Extract_Stage IS NULL 
																OR Extract_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Qry).Next_Table
							
							[Int]$Processing_Key = [convert]::ToInt32($Processing_Key_Var)
						
						Write-Host
						Write-Host $Processing_Key_Qry
						Write-Host "~ Processing Key: $Processing_Key"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Extract_Stage = '$Job_Name'                   
												, Extract_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Qry2 = "SELECT Extract_Stage
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1 
															AND Extract_Tables_Key = $Processing_Key
													"                                                                                   
							$Extract_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Qry2).Extract_Stage
								
						Write-Host
						Write-Host $Processing_Key_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Extract_Stage (2): $Extract_Stage"
						
						IF($Job_Name -eq $Extract_Stage) 
							{
						
						
								#---------------------------------------------
								# Source Table
								#---------------------------------------------
								
								[STRING]$Source_Table_Qry = "SELECT Source_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key
																		  "                                                                                   
												$Source_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Source_Table_Qry).Source_Table
								
								Write-Host
								Write-Host $Source_Table_Qry
								Write-Host "~ Source Table: $Source_Table"
								
								#---------------------------------------------
								# Destination Table
								#---------------------------------------------
								
								[STRING]$Dest_Table_Qry = "SELECT Destination_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key
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
														FROM Oa_Extract.Alpha_Table_1
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Extract_Stage = 'Complete'
																, Extract_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Extract_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Extract_Stage = 'Incomplete'
																					, Extract_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Extract_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Qry = "SELECT COUNT(Source_Table) AS Tables_To_Process
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Tier = 1
																		AND (Extract_Stage IS NULL 
																			OR Extract_Stage = 'Incomplete'
																			)
																		AND Active = 1
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
					}
				ELSEIF ($Tables_To_Process_Coupler -gt 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Coupler_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 1
															AND Extract_Stage = 'Complete'
															AND (Coupler_Stage IS NULL 
																OR Coupler_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Coupler_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Coupler_Qry).Next_Table
							
							[Int]$Processing_Key_Coupler = [convert]::ToInt32($Processing_Key_Coupler_Var)
						
						Write-Host
						Write-Host $Processing_Key_Coupler_Qry
						Write-Host "~ Processing Key: $Processing_Key_Coupler"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Coupler_Stage = '$Job_Name'                   
												, Coupler_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Coupler
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Coupler_Qry2 = "SELECT Coupler_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Coupler
																"                                                                                   
							$Coupler_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Coupler_Qry2).Coupler_Stage
								
						Write-Host
						Write-Host $Processing_Key_Coupler_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Coupler_Stage (2): $Coupler_Stage"
						
						IF($Job_Name -eq $Coupler_Stage) 
							{
						
						
								#---------------------------------------------
								# Destination Table
								#---------------------------------------------
								
								[STRING]$Destination_Table_Qry = "SELECT Destination_Table
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Extract_Tables_Key = $Processing_Key_Coupler
																"                                                                                   
												$Destination_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Destination_Table_Qry).Destination_Table
								
								Write-Host
								Write-Host $Destination_Table_Qry
								Write-Host "~ Destination Table: $Destination_Table"
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Coupler
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Destination_Data -p1 $Destination_Table -p2 $Processing_Key_Coupler
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Coupler_Stage = 'Complete'
																, Coupler_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Coupler"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Coupler_Stage = 'Incomplete'
																					, Coupler_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Coupler
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Coupler_Qry = "SELECT COUNT(Source_Table) AS Tables_To_Process
															FROM Oa_Extract.Extract_Tables
															WHERE 1 = 1
																AND Tier = 1
																AND (Coupler_Stage IS NULL 
																	OR Coupler_Stage = 'Incomplete'
																	OR Coupler_Stage LIKE 'Job%'
																	)
																AND Active = 1
														"                                                                                   
								$Tables_To_Process_Coupler_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Coupler_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Coupler = [convert]::ToInt32($Tables_To_Process_Coupler_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Coupler_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Coupler"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}
				ELSEIF ($Tables_To_Process_Tier_2A -gt 0 -AND $Tables_To_Process_Coupler -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_2A_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 2
															AND Ext_Table IN ('_Picklist_1','_Picklist_2','_Picklist_3','_Picklist_4')
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_String_Map'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_Entity'
																)
															AND (Tier_2_Stage IS NULL 
																OR Tier_2_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_2A_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_2A_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_2A = [convert]::ToInt32($Processing_Key_Tier_2A_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_2A_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_2A"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_2_Stage = '$Job_Name'                   
												, Tier_2_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_2A
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_2A_Qry2 = "SELECT Tier_2_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_2A
																"                                                                                   
							$Tier_2A_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_2A_Qry2).Tier_2_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_2A_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_2A_Stage (2): $Tier_2A_Stage"
						
						IF($Job_Name -eq $Tier_2A_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_2A
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_2A
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_2_Stage = 'Complete'
																, Tier_2_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_2A"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_2_Stage = 'Incomplete'
																					, Tier_2_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_2A
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_2A_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 2
															AND Ext_Table IN ('_Picklist_1','_Picklist_2','_Picklist_3','_Picklist_4')
															AND (Tier_2_Stage IS NULL 
																OR Tier_2_Stage = 'Incomplete'
																OR Tier_2_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_2A_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_2A_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_2A = [convert]::ToInt32($Tables_To_Process_Tier_2A_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_2A_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_2A"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}	
				ELSEIF ($Tables_To_Process_Tier_2B -gt 0 -AND $Tables_To_Process_Tier_2A -eq 0 -AND $Tables_To_Process_Coupler -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_2B_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 2
															AND (Tier_2_Stage IS NULL 
																OR Tier_2_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_2B_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_2B_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_2B = [convert]::ToInt32($Processing_Key_Tier_2B_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_2B_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_2B"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_2_Stage = '$Job_Name'                   
												, Tier_2_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_2B
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_2B_Qry2 = "SELECT Tier_2_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_2B
																"                                                                                   
							$Tier_2B_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_2B_Qry2).Tier_2_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_2B_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_2A_Stage (2): $Tier_2B_Stage"
						
						IF($Job_Name -eq $Tier_2B_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_2B
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_2B
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_2_Stage = 'Complete'
																, Tier_2_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_2B"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_2_Stage = 'Incomplete'
																					, Tier_2_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_2B
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_2B_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 2
															AND (Tier_2_Stage IS NULL 
																OR Tier_2_Stage = 'Incomplete'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_2B_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_2B_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_2B = [convert]::ToInt32($Tables_To_Process_Tier_2B_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_2B_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_2B"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
								
								#---------------------------------------------
								# Tables_To_Process_Tier_3
								#---------------------------------------------
							
								[STRING]$Tables_To_Process_Tier_3_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
																		FROM Oa_Extract.Extract_Tables
																		WHERE 1 = 1
																			AND Tier = 3
																			AND (Tier_3_Stage IS NULL 
																				OR Tier_3_Stage = 'Incomplete'
																				)
																			AND Active = 1
																		"                                                                                   
									$Tables_To_Process_Tier_3_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_3_Qry).Tables_To_Process
								
									[Int]$Tables_To_Process_Tier_3 = [convert]::ToInt32($Tables_To_Process_Tier_3_var)
								
								Write-Host
								Write-Host $Tables_To_Process_Tier_3_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_3"
								
					}
				ELSEIF ($Tables_To_Process_Tier_3 -gt 0 -AND $Tables_To_Process_Coupler -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_3_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 3
															AND Ext_Table IN ('_Email_Dim','_Psa_Dim','_Hier_Dim','_User_Dim','_User_Initiative_Liaison_Dim','_Expectancy_Fact','_Recurring_Gift_Fact','_Gift_','_Gift_Credit_','_Gift_Hist_','Ext_Address_2','_Address_Dim_1','_Bio_Strat_Plan_Fact','_Recurring_Gift_Dim','_Employment_Dim')
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_Email'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Tier_2_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = '_Email_Type_'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_Psa'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_Institution'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_System_User'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_Pledge'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_Recurring_Gift_Rules'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_Recognition_Credit'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_Gift'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_Gift_Hist'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Coupler_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = 'Ext_Opportunity'
																)
															AND (Tier_3_Stage IS NULL 
																OR Tier_3_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_3_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_3_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_3 = [convert]::ToInt32($Processing_Key_Tier_3_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_3_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_3"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_3_Stage = '$Job_Name'                   
												, Tier_3_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_3
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_3_Qry2 = "SELECT Tier_3_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_3
																"                                                                                   
							$Tier_3_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_3_Qry2).Tier_3_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_2B_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_3_Stage (2): $Tier_3_Stage"
						
						IF($Job_Name -eq $Tier_3_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_3
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_3
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_3_Stage = 'Complete'
																, Tier_3_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_3"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_3_Stage = 'Incomplete'
																					, Tier_3_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_3
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_3_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 3
															AND (Tier_3_Stage IS NULL 
																OR Tier_3_Stage = 'Incomplete'
																OR Tier_3_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_3_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_3_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_3 = [convert]::ToInt32($Tables_To_Process_Tier_3_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_3_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_3"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}
								
				ELSEIF ($Tables_To_Process_Tier_4 -gt 0 -AND $Tables_To_Process_Coupler -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_4_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 4															
															AND (Tier_4_Stage IS NULL 
																OR Tier_4_Stage = 'Incomplete'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Tier_2_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = '_Gift_Credit_'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Tier_3_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = '_Gift_'
																)
															AND 1 =
																(SELECT COUNT(CASE WHEN Tier_3_Stage = 'Complete' THEN 1 ELSE NULL END) AS Cnt
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1
																		AND Ext_Table = '_Gift_Hist_'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_4_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_4_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_4 = [convert]::ToInt32($Processing_Key_Tier_4_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_4_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_4"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_4_Stage = '$Job_Name'                   
												, Tier_4_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_4
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_4_Qry2 = "SELECT Tier_4_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_4
																"                                                                                   
							$Tier_4_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_4_Qry2).Tier_4_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_4_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_4_Stage (2): $Tier_4_Stage"
						
						IF($Job_Name -eq $Tier_4_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_4
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_4
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_4_Stage = 'Complete'
																, Tier_4_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_4"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_4_Stage = 'Incomplete'
																					, Tier_4_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_4
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_4_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 4
															AND (Tier_4_Stage IS NULL 
																OR Tier_4_Stage = 'Incomplete'
																OR Tier_4_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_4_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_4_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_4 = [convert]::ToInt32($Tables_To_Process_Tier_4_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_4_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_4"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}
					
					
				ELSEIF ($Tables_To_Process_Tier_5 -gt 0 -AND $Tables_To_Process_Coupler -eq 0 -AND $Tables_To_Process_Tier_4 -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_5_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 5															
															AND (Tier_5_Stage IS NULL 
																OR Tier_5_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_5_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_5_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_5 = [convert]::ToInt32($Processing_Key_Tier_5_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_5_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_5"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_5_Stage = '$Job_Name'                   
												, Tier_5_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_5
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_5_Qry2 = "SELECT Tier_5_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_5
																"                                                                                   
							$Tier_5_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_5_Qry2).Tier_5_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_5_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_5_Stage (2): $Tier_5_Stage"
						
						IF($Job_Name -eq $Tier_5_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_5
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_5
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_5_Stage = 'Complete'
																, Tier_5_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_5"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_5_Stage = 'Incomplete'
																					, Tier_5_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_5
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_5_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 5
															AND (Tier_5_Stage IS NULL 
																OR Tier_5_Stage = 'Incomplete'
																OR Tier_5_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_5_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_5_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_5 = [convert]::ToInt32($Tables_To_Process_Tier_5_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_5_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_5"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}
					
				ELSEIF ($Tables_To_Process_Tier_6 -gt 0 -AND $Tables_To_Process_Coupler -eq 0 -AND $Tables_To_Process_Tier_5 -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_6_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 6															
															AND (Tier_6_Stage IS NULL 
																OR Tier_6_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_6_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_6_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_6 = [convert]::ToInt32($Processing_Key_Tier_6_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_6_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_6"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_6_Stage = '$Job_Name'                   
												, Tier_6_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_6
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_6_Qry2 = "SELECT Tier_6_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_6
																"                                                                                   
							$Tier_6_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_6_Qry2).Tier_6_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_6_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_6_Stage (2): $Tier_6_Stage"
						
						IF($Job_Name -eq $Tier_6_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_6
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_6
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_6_Stage = 'Complete'
																, Tier_6_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_6"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_6_Stage = 'Incomplete'
																					, Tier_6_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_6
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_6_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 6
															AND (Tier_6_Stage IS NULL 
																OR Tier_6_Stage = 'Incomplete'
																OR Tier_6_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_6_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_6_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_6 = [convert]::ToInt32($Tables_To_Process_Tier_6_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_6_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_6"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}
				ELSEIF ($Tables_To_Process_Tier_7 -gt 0 -AND $Tables_To_Process_Coupler -eq 0 -AND $Tables_To_Process_Tier_6 -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_7_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 7															
															AND (Tier_7_Stage IS NULL 
																OR Tier_7_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_7_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_7_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_7 = [convert]::ToInt32($Processing_Key_Tier_7_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_7_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_7"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_7_Stage = '$Job_Name'                   
												, Tier_7_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_7
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_7_Qry2 = "SELECT Tier_7_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_7
																"                                                                                   
							$Tier_7_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_7_Qry2).Tier_7_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_7_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_7_Stage (2): $Tier_7_Stage"
						
						IF($Job_Name -eq $Tier_7_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_7
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_7
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_7_Stage = 'Complete'
																, Tier_7_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_7"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_7_Stage = 'Incomplete'
																					, Tier_7_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_7
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_7_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 7
															AND (Tier_7_Stage IS NULL 
																OR Tier_7_Stage = 'Incomplete'
																OR Tier_7_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_7_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_7_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_7 = [convert]::ToInt32($Tables_To_Process_Tier_7_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_7_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_7"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}
					
				ELSEIF ($Tables_To_Process_Tier_8 -gt 0 -AND $Tables_To_Process_Coupler -eq 0 -AND $Tables_To_Process_Tier_7 -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_8_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 8															
															AND (Tier_8_Stage IS NULL 
																OR Tier_8_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_8_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_8_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_8 = [convert]::ToInt32($Processing_Key_Tier_8_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_8_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_8"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_8_Stage = '$Job_Name'                   
												, Tier_8_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_8
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_8_Qry2 = "SELECT Tier_8_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_8
																"                                                                                   
							$Tier_8_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_8_Qry2).Tier_8_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_8_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_8_Stage (2): $Tier_8_Stage"
						
						IF($Job_Name -eq $Tier_8_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_8
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_8
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_8_Stage = 'Complete'
																, Tier_8_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_8"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_8_Stage = 'Incomplete'
																					, Tier_8_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_8
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_8_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 8
															AND (Tier_8_Stage IS NULL 
																OR Tier_8_Stage = 'Incomplete'
																OR Tier_8_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_8_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_8_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_8 = [convert]::ToInt32($Tables_To_Process_Tier_8_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_8_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_8"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}
					
				ELSEIF ($Tables_To_Process_Tier_9 -gt 0 -AND $Tables_To_Process_Coupler -eq 0 -AND $Tables_To_Process_Tier_8 -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_9_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 9															
															AND (Tier_9_Stage IS NULL 
																OR Tier_9_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_9_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_9_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_9 = [convert]::ToInt32($Processing_Key_Tier_9_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_9_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_9"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_9_Stage = '$Job_Name'                   
												, Tier_9_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_9
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_9_Qry2 = "SELECT Tier_9_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_9
																"                                                                                   
							$Tier_9_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_9_Qry2).Tier_9_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_9_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_9_Stage (2): $Tier_9_Stage"
						
						IF($Job_Name -eq $Tier_9_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_9
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_9
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_9_Stage = 'Complete'
																, Tier_9_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_9"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_9_Stage = 'Incomplete'
																					, Tier_9_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_9
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_9_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 9
															AND (Tier_9_Stage IS NULL 
																OR Tier_9_Stage = 'Incomplete'
																OR Tier_9_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_9_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_9_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_9 = [convert]::ToInt32($Tables_To_Process_Tier_9_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_9_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_9"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}

ELSEIF ($Tables_To_Process_Tier_10 -gt 0 -AND $Tables_To_Process_Coupler -eq 0 -AND $Tables_To_Process_Tier_9 -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_10_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 10															
															AND (Tier_10_Stage IS NULL 
																OR Tier_10_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_10_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_10_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_10 = [convert]::ToInt32($Processing_Key_Tier_10_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_10_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_10"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_10_Stage = '$Job_Name'                   
												, Tier_10_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_10
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_10_Qry2 = "SELECT Tier_10_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_10
																"                                                                                   
							$Tier_10_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_10_Qry2).Tier_10_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_10_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_10_Stage (2): $Tier_10_Stage"
						
						IF($Job_Name -eq $Tier_10_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_10
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_10
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_10_Stage = 'Complete'
																, Tier_10_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_10"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_10_Stage = 'Incomplete'
																					, Tier_10_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_10
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_10_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 10
															AND (Tier_10_Stage IS NULL 
																OR Tier_10_Stage = 'Incomplete'
																OR Tier_10_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_10_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_10_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_10 = [convert]::ToInt32($Tables_To_Process_Tier_10_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_10_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_10"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}

ELSEIF ($Tables_To_Process_Tier_11 -gt 0 -AND $Tables_To_Process_Coupler -eq 0 -AND $Tables_To_Process_Tier_10 -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_11_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 11															
															AND (Tier_11_Stage IS NULL 
																OR Tier_11_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_11_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_11_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_11 = [convert]::ToInt32($Processing_Key_Tier_11_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_11_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_11"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_11_Stage = '$Job_Name'                   
												, Tier_11_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_11
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_11_Qry2 = "SELECT Tier_11_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_11
																"                                                                                   
							$Tier_11_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_11_Qry2).Tier_11_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_11_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_11_Stage (2): $Tier_11_Stage"
						
						IF($Job_Name -eq $Tier_11_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_11
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_11
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_11_Stage = 'Complete'
																, Tier_11_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_11"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_11_Stage = 'Incomplete'
																					, Tier_11_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_11
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_11_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 11
															AND (Tier_11_Stage IS NULL 
																OR Tier_11_Stage = 'Incomplete'
																OR Tier_11_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_11_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_11_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_11 = [convert]::ToInt32($Tables_To_Process_Tier_11_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_11_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_11"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}

ELSEIF ($Tables_To_Process_Tier_12 -gt 0 -AND $Tables_To_Process_Coupler -eq 0 -AND $Tables_To_Process_Tier_11 -eq 0)
					{
						
						#---------------------------------------------
						# Processing Key
						#---------------------------------------------
					
						[STRING]$Processing_Key_Tier_12_Qry = "SELECT COALESCE(MIN(Extract_Tables_Key),0) AS Next_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 12															
															AND (Tier_12_Stage IS NULL 
																OR Tier_12_Stage = 'Incomplete'
																)
															AND Active = 1
													"                                                                                   
							$Processing_Key_Tier_12_Var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_12_Qry).Next_Table
							
							[Int]$Processing_Key_Tier_12 = [convert]::ToInt32($Processing_Key_Tier_12_Var)
						
						Write-Host
						Write-Host $Processing_Key_Tier_12_Qry
						Write-Host "~ Processing Key: $Processing_Key_Tier_12"
						
						#---------------------------------------------
						# Extract_Tables Update
						#---------------------------------------------				
						$Update_DateTime = Get-Date
					
						$Update_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
											SET Tier_12_Stage = '$Job_Name'                   
												, Tier_12_Stage_DateTime = '$Update_DateTime'
											WHERE 1 = 1
												AND Extract_Tables_Key = $Processing_Key_Tier_12
												"
						
						Invoke-Sqlcmd `
							-ServerInstance $Dest_Instance `
							-Database $Dest_Db `
							-Query $Update_Extract_Tables
						
						Write-Host $Update_Extract_Tables
						
						#---------------------------------------------
						# Wait then recheck, if it is the same name then run, else end
						#---------------------------------------------
						
						Start-Sleep -s $Sleep_Time 
						
						[STRING]$Processing_Key_Tier_12_Qry2 = "SELECT Tier_12_Stage
																	FROM Oa_Extract.Extract_Tables
																	WHERE 1 = 1 
																		AND Extract_Tables_Key = $Processing_Key_Tier_12
																"                                                                                   
							$Tier_12_Stage = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Processing_Key_Tier_12_Qry2).Tier_12_Stage
								
						Write-Host
						Write-Host $Processing_Key_Tier_12_Qry2
						Write-Host "~ Job Name: $Job_Name"
						Write-Host "~ Tier_12_Stage (2): $Tier_12_Stage"
						
						IF($Job_Name -eq $Tier_12_Stage) 
							{
						
						
								
								#---------------------------------------------
								# Ext Table
								#---------------------------------------------
								
								[STRING]$Ext_Table_Qry = "SELECT Ext_Table
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Extract_Tables_Key = $Processing_Key_Tier_12
																		  "                                                                                   
												$Ext_Table = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Ext_Table_Qry).Ext_Table
								
								Write-Host
								Write-Host $Ext_Table
								Write-Host "~ Destination Table: $Ext_Table"
								
								
								#---------------------------------------------
								# Extract Data
								#---------------------------------------------
								
								Copy-Tier_2_Data -p1 $Ext_Table -p2 $Processing_Key_Tier_12
								
								
								#---------------------------------------------
								# Check If Extract was successful
								#---------------------------------------------
								
								[STRING]$Extract_Success_Qry = "SELECT COUNT(CASE WHEN Alpha_Result = 1 THEN 1 ELSE NULL END) AS Count_Alpha_Result
														FROM Oa_Extract.Alpha_Table_1
														WHERE 1 = 1
															AND Alpha_Stage = CONCAT('dbo.','$Ext_Table')
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
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Complete_DateTime = Get-Date
									
										$Update_Complete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
															SET Tier_12_Stage = 'Complete'
																, Tier_12_Stage_DateTime = '$Update_Complete_DateTime'
															WHERE 1 = 1
																AND Extract_Tables_Key = $Processing_Key_Tier_12"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Complete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Complete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Complete."
									}
									ELSE
									{
										#---------------------------------------------
										# Extract_Tables Update
										#---------------------------------------------
										$Update_Incomplete_DateTime = Get-Date
									
										$Update_Incomplete_Extract_Tables = "UPDATE Oa_Extract.Extract_Tables 
																				SET Tier_12_Stage = 'Incomplete'
																					, Tier_12_Stage_DateTime = '$Update_Complete_DateTime'
																				WHERE 1 = 1
																					AND Extract_Tables_Key = $Processing_Key_Tier_12
																			"
										
										Invoke-Sqlcmd `
											-ServerInstance $Dest_Instance `
											-Database $Dest_Db `
											-Query $Update_Incomplete_Extract_Tables
										
										Write-Host
										Write-Host $Update_Incomplete_Extract_Tables
										Write-Host "~ Ext_Tables updated to Incomplete."
										
									}
							}	
								
								#---------------------------------------------
								# Tables to Process
								#---------------------------------------------
								
								[STRING]$Tables_To_Process_Tier_12_Qry = "SELECT COUNT(Ext_Table) AS Tables_To_Process
														FROM Oa_Extract.Extract_Tables
														WHERE 1 = 1
															AND Tier = 12
															AND (Tier_12_Stage IS NULL 
																OR Tier_12_Stage = 'Incomplete'
																OR Tier_12_Stage LIKE 'Job%'
																)
															AND Active = 1
														"                                                                                   
								$Tables_To_Process_Tier_12_var = (Invoke-Sqlcmd -ServerInstance $Dest_Instance -Database $Dest_Db -Query $Tables_To_Process_Tier_12_Qry).Tables_To_Process
							
								[Int]$Tables_To_Process_Tier_12 = [convert]::ToInt32($Tables_To_Process_Tier_12_var)
							
								Write-Host
								Write-Host $Tables_To_Process_Tier_12_Qry
								Write-Host "~ Tables to Process: $Tables_To_Process_Tier_12"
								
								
								#---------------------------------------------
								# Current Process Time
								#---------------------------------------------
								$Current_Process_DateTime = Get-Date
								
								Write-Host 
								Write-Host "~ Current Process Time: $Current_Process_DateTime"
								
								$Total_Processing_Time = New-TimeSpan -Start $Loop_Begin_DateTime -End $Current_Process_DateTime
								
								Write-Host 
								Write-Host "~ Total Processing Time: $Total_Processing_Time"
					}

					
					
			
			} UNTIL ($Tables_To_Process_Tier_10 -eq 0 -OR $Total_Processing_Time -gt '02:44:00')
			
			

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
		
		[System.Environment]::Exit(1)
		
Stop-Process $PID
