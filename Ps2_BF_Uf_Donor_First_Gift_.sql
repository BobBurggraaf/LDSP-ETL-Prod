/****************************************************

	Name: _Donor_First_Gift_
	Date: 08/07/2018
	
	

****************************************************/


USE [LDSPhilanthropiesDW]
GO
/****** Object:  UserDefinedFunction [dbo].[_Donor_First_Gift_]    Script Date: 1/20/2018 2:22:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER FUNCTION [dbo].[_Donor_First_Gift_]()
			RETURNS TABLE
			AS 
			RETURN
				SELECT A.Donor_Key
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
					, Donor_First_Gift_Date_Byupw
					, Donor_First_Gift_To_Byupw_Amt
					FROM _All_Donors_ A
						LEFT JOIN 
							(SELECT Donor_Key
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
														AND UPPER(B.New_Name)  LIKE '%BYU%'
														AND UPPER(B.New_Name)  NOT LIKE '%BYUI%'
														AND UPPER(B.New_Name)  NOT LIKE '%BYUH%'
												)
											AND A.New_PostDate IS NOT NULL
										GROUP BY COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor)
									) A
							) B ON A.Donor_Key = B.Donor_Key
						LEFT JOIN
							(SELECT Donor_Key
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
														AND UPPER(B.New_Name)  LIKE '%BYUI%'
												)
											AND A.New_PostDate IS NOT NULL
										GROUP BY COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor)
									) A
							) C ON A.Donor_Key = C.Donor_Key
						LEFT JOIN
							(SELECT Donor_Key
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
														AND UPPER(B.New_Name)  LIKE '%BYUH%'
												)
											AND A.New_PostDate IS NOT NULL
										GROUP BY COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor)
									) A
							) D ON A.Donor_Key = D.Donor_Key
						LEFT JOIN
							(SELECT Donor_Key
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
														AND UPPER(B.New_Name) = 'LDSBC - GENERAL')
											AND A.New_PostDate IS NOT NULL
										GROUP BY COALESCE(A.New_ConstituentDonor, A.New_OrganizationDonor)
									) A
							) E ON A.Donor_Key = E.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Byu_Amt
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN Ldsp_First_Donation_Date_Byu() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
									INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND D.New_Inst = 'BYU'
									AND A.Donation_Credit_Amt IS NOT NULL
								GROUP BY A.Donor_Key
							) F ON A.Donor_Key = F.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Byui_Amt
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN Ldsp_First_Donation_Date_Byui() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
									INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND D.New_Inst = 'BYUI'
									AND A.Donation_Credit_Amt IS NOT NULL
								GROUP BY A.Donor_Key
							) G ON A.Donor_Key = G.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Byuh_Amt
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN Ldsp_First_Donation_Date_Byuh() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
									INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND D.New_Inst = 'BYUH'
									AND A.Donation_Credit_Amt IS NOT NULL
								GROUP BY A.Donor_Key
							) H ON A.Donor_Key = H.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Ldsbc_Amt
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN Ldsp_First_Donation_Date_Ldsbc() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
									INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND D.New_Inst = 'LDSBC'
									AND A.Donation_Credit_Amt IS NOT NULL
								GROUP BY A.Donor_Key
							) I ON A.Donor_Key = I.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Church_Amt
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN Ldsp_First_Donation_Date_Church() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
									INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND D.New_Inst = 'Church'
									AND A.Donation_Credit_Amt IS NOT NULL
								GROUP BY A.Donor_Key
							) J ON A.Donor_Key = J.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Ldsp_Amt
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN Ldsp_First_Donation_Date_Ldsp() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
									INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND A.Donation_Credit_Amt IS NOT NULL
								GROUP BY A.Donor_Key
							) K ON A.Donor_Key = K.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Byu
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND C.New_Inst = 'BYU'
									AND B.New_ReceiptDate IS NOT NULL
								GROUP BY A.Donor_Key
							) L ON A.Donor_Key = L.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Byui
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND C.New_Inst = 'BYUI'
									AND B.New_ReceiptDate IS NOT NULL
								GROUP BY A.Donor_Key
							) M ON A.Donor_Key = M.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Byuh
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND C.New_Inst = 'BYUH'
									AND B.New_ReceiptDate IS NOT NULL
								GROUP BY A.Donor_Key
							) N ON A.Donor_Key = N.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Ldsbc
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND C.New_Inst = 'LDSBC'
									AND B.New_ReceiptDate IS NOT NULL
								GROUP BY A.Donor_Key
							) O ON A.Donor_Key = O.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Church
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND C.New_Inst = 'Church'
									AND B.New_ReceiptDate IS NOT NULL
								GROUP BY A.Donor_Key
							) P ON A.Donor_Key = P.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Ldsp
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND B.New_ReceiptDate IS NOT NULL
								GROUP BY A.Donor_Key
							) Q ON A.Donor_Key = Q.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MIN(B.New_ReceiptDate) AS Donor_First_Gift_Date_Byupw
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN _Hier_Dim C ON A.Hier_Key = C.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND C.New_Inst = 'BYUPW'
									AND B.New_ReceiptDate IS NOT NULL
								GROUP BY A.Donor_Key
							) R ON A.Donor_Key = R.Donor_Key
						LEFT JOIN
							(SELECT A.Donor_Key
								, MAX(A.Donation_Credit_Amt) AS Donor_First_Gift_To_Byupw_Amt
								FROM _Donation_Fact A
									INNER JOIN _Donation_Dim B ON A.Donation_Key = B.Donation_Key
									INNER JOIN Ldsp_First_Donation_Date_Byupw() C ON A.Donor_Key = C.Donor_Key AND B.New_ReceiptDate = C.Min_Receipt_Date
									INNER JOIN _Hier_Dim D ON A.Hier_Key = D.Hier_Key
								WHERE 1 = 1
									AND A.Plus_SharedCreditType != 'Matching' -- Not Matching
									AND A.Plus_Type IN ('Hard','Shared') -- Not Influence 100000001
									AND D.New_Inst = 'BYUPW'
									AND A.Donation_Credit_Amt IS NOT NULL
								GROUP BY A.Donor_Key
							) S ON A.Donor_Key = S.Donor_Key
			;