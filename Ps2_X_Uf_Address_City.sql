/****************************************************

	Name: Uf_Address_City
	Date: 06/06/2018
	
	This function is used to convert city

****************************************************/

USE [LDSPhilanthropiesDW]
GO
/****** Object:  UserDefinedFunction [dbo].[Uf_Address_City]    Script Date: 6/6/2018 1:11:24 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   FUNCTION [dbo].[Uf_Address_City]()
RETURNS TABLE
AS
RETURN

SELECT New_AddressId
	, RTRIM(LTRIM(CASE WHEN Address_City = 'Ofallon' AND Lds_County IN ('Saint Charles','Saint Clair') AND Lds_StateProvince IN ('MO','IL') THEN 'O''Fallon'
						WHEN Address_City = 'O Fallon' AND Lds_County IN ('Saint Charles','Saint Clair') AND Lds_StateProvince IN ('MO','IL') THEN 'O''Fallon'
						WHEN Address_City = 'Mexico D.F.' AND New_Name = 'Mexico' THEN 'Mexico, D.F.'
						WHEN Address_City = 'Mexico DF' AND New_Name = 'Mexico' THEN 'Mexico, D.F.'
						WHEN Address_City = 'Mexico City D.F.' AND New_Name = 'Mexico' THEN 'Mexico, D.F.'
						WHEN Address_City = 'Mexico City DF' AND New_Name = 'Mexico' THEN 'Mexico, D.F.'
						WHEN Address_City = 'Calgary, AB' AND New_Name = 'Canada' THEN 'Calgary AB'
						WHEN Address_City = 'Calgary  AB' AND New_Name = 'Canada' THEN 'Calgary AB'
						WHEN Address_City = 'Calgary' AND New_Name = 'Canada' THEN 'Calgary AB'
						WHEN Address_City = 'Calgary AI' AND New_Name = 'Canada' THEN 'Calgary AB'
						WHEN Address_City = 'Calgary Al' AND New_Name = 'Canada' THEN 'Calgary AB'
						WHEN Address_City = 'Calgary Alberta' AND New_Name = 'Canada' THEN 'Calgary AB'
						WHEN Address_City = 'Calgary BC' AND New_Name = 'Canada' THEN 'Calgary AB'
						WHEN Address_City = 'Calgary, Alberta' AND New_Name = 'Canada' THEN 'Calgary AB'
						WHEN Address_City = 'Shore View' AND Lds_County IN ('Ramsey') AND Lds_StateProvince IN ('MN') THEN 'Shoreview'
						WHEN Address_City = 'Hamilton, ON' AND New_Name = 'Canada' THEN 'Hamilton ON'
						WHEN Address_City = 'Hamilton Ontario' AND New_Name = 'Canada' THEN 'Hamilton ON'
						WHEN Address_City = 'Ducklake SK' AND New_Name = 'Canada' THEN 'Duck Lake SK'
						WHEN Address_City = 'Pachuca HGO' AND New_Name = 'Mexico' THEN 'Pachuca, HGO'
						WHEN Address_City = 'Pachuca' AND New_Name = 'Mexico' THEN 'Pachuca, HGO'
						WHEN Address_City = 'Pachuca Hidalgo' AND New_Name = 'Mexico' THEN 'Pachuca, HGO'
						WHEN Address_City = 'Pachuca De Soto Hida' AND New_Name = 'Mexico' THEN 'Pachuca, HGO'
						WHEN Address_City = 'Pachuca HI' AND New_Name = 'Mexico' THEN 'Pachuca, HGO'
						WHEN Address_City = 'Pachuca HG' AND New_Name = 'Mexico' THEN 'Pachuca, HGO'
						WHEN Address_City = 'Ottawa, ON' AND New_Name = 'Canada' THEN 'Ottawa ON'
						WHEN Address_City = 'Ottawa' AND New_Name = 'Canada' THEN 'Ottawa ON'
						WHEN Address_City = 'Ottawa Ontario' AND New_Name = 'Canada' THEN 'Ottawa ON'
						WHEN Address_City = 'Ottawa AB' AND New_Name = 'Canada' THEN 'Ottawa ON'
						WHEN Address_City = 'Weston-Super-Mare' AND New_Name = 'England' THEN 'Weston-super-Mare'
						WHEN Address_City = 'Weston-Super-Mare' AND New_Name = 'United Kingdom' THEN 'Weston-super-Mare'
						WHEN Address_City = 'Weston Super Mare' AND New_Name = 'United Kingdom' THEN 'Weston-super-Mare'
						WHEN Address_City = 'Weston-Super-Mare B' AND New_Name = 'England' THEN 'Weston-super-Mare'
						WHEN Address_City = 'Risingsun' AND Lds_StateProvince IN ('OH') THEN 'Rising Sun'
						WHEN Address_City = 'Nuku''Alofa' AND New_Name = 'Tonga' THEN 'Nuku''alofa'
						WHEN Address_City = 'Nuku Alofa' AND New_Name = 'Tonga' THEN 'Nuku''alofa'
						WHEN Address_City = 'Nuku'' Alofa' AND New_Name = 'Tonga' THEN 'Nuku''alofa'
						WHEN Address_City = 'Nuku`alofa Tongatapu' AND New_Name = 'Tonga' THEN 'Nuku''alofa'
						WHEN Address_City = 'Nukuaiofa' AND New_Name = 'Tonga' THEN 'Nuku''alofa'
						WHEN Address_City = 'Nukualofa' AND New_Name = 'Tonga' THEN 'Nuku''alofa'
						WHEN Address_City = 'Nukualofa Tongatapu' AND New_Name = 'Tonga' THEN 'Nuku''alofa'
						WHEN Address_City = 'Nuku''Alofa Tongatapu' AND New_Name = 'Tonga' THEN 'Nuku''alofa'
						WHEN Address_City = 'Nukualofa, Tongatapu' AND New_Name = 'Tonga' THEN 'Nuku''alofa'
						WHEN Address_City = 'Willow Brook' AND Lds_County IN ('Du Page') AND Lds_StateProvince IN ('IL') THEN 'Willowbrook'
						WHEN Address_City = 'Puebla' AND New_Name = 'Mexico' THEN 'Puebla, PUE'
						WHEN Address_City = 'Puebla CP' AND New_Name = 'Mexico' THEN 'Puebla, PUE'
						WHEN Address_City = 'Puebla ME' AND New_Name = 'Mexico' THEN 'Puebla, PUE'
						WHEN Address_City = 'Puebla PUE' AND New_Name = 'Mexico' THEN 'Puebla, PUE'
						WHEN Address_City = 'Puebla Puebla' AND New_Name = 'Mexico' THEN 'Puebla, PUE'
						WHEN Address_City = 'Charlestown' AND Lds_County IN ('Jefferson') AND Lds_StateProvince IN ('WV') THEN 'Charles Town'
						WHEN Address_City = 'Xian' AND New_Name IN ('China','CHINA, PEOPLE''S REP OF') THEN 'Xi''an'
						WHEN Address_City = 'Coaldale' AND New_Name = 'Canada' THEN 'Coaldale AB'
						WHEN Address_City = 'Coaldale Alberta' AND New_Name = 'Canada' THEN 'Coaldale AB'
						WHEN Address_City = 'Coaldale, AB' AND New_Name = 'Canada' THEN 'Coaldale AB'
						WHEN Address_City = 'De Lancey' AND Lds_County IN ('Delaware') AND Lds_StateProvince IN ('NY') THEN 'Delancey'
						WHEN Address_City = 'Cardston' AND New_Name = 'Canada' THEN 'Cardston AB'
						WHEN Address_City = 'Cardston, AB' AND New_Name = 'Canada' THEN 'Cardston AB'
						WHEN Address_City = 'Salt Lake Cty' AND Lds_StateProvince IN ('UT') THEN 'Salt Lake City'
						WHEN Address_City = 'St. George' AND Lds_StateProvince IN ('UT') THEN 'Saint George'
						WHEN Address_City = 'W Valley City' AND Lds_StateProvince IN ('UT') THEN 'West Valley City'
						WHEN Address_City = 'West Valley' AND Lds_StateProvince IN ('UT') THEN 'West Valley City'
						WHEN Address_City = 'Saratoga Spgs' AND Lds_StateProvince IN ('UT') THEN 'Saratoga Springs'
						WHEN Address_City = 'Vancouver' AND New_Name = 'Canada' THEN 'Vancouver BC'
						WHEN Address_City = 'Vancouver AB' AND New_Name = 'Canada' THEN 'Vancouver BC'
						WHEN Address_City = 'Vancover BC' AND New_Name = 'Canada' THEN 'Vancouver BC'
						WHEN Address_City = 'Eagle Mtn' AND Lds_StateProvince IN ('UT') THEN 'Eagle Mountain'
						WHEN Address_City = 'N Salt Lake' AND Lds_StateProvince IN ('UT') THEN 'North Salt Lake'
						WHEN Address_City = 'St Anthony' AND Lds_StateProvince IN ('ID') THEN 'Saint Anthony'
					ELSE Address_City END)) AS Address_City
	FROM		
		(SELECT OA.New_AddressId
			, OA.Lds_StateProvince
			, OA.Lds_County
			, NCRY.New_Name
			, RTRIM(LTRIM(dbo.ufProperCase(OA.Lds_City,'|Act|Air|Al|am|an|Ana|and|And|Ann|Arm|as|au|Ave|ba|Bad|Bar|Bay|Bch|Bee|bei|Bei|Bel|Big|Bow|Box|Br|Bud|Buk|By|
								|Cd|Chi|cho|Chu|Cle|Col|Ctr|Cty|Cut|Cyn|Dam|Dan|De|de|Del|Den|Des|DeWinton|di|Do|do|Dos|Dry|du|
								|Eau|Edo|Egg|El|Elk|Ell|Elm|Ely|Emu|en|Et|Eup|Ewa|Eye|Fe|Fox|Foy|Ft|Fu|Gan|Gap|Gi|Gig|Gro|Gto|gu|Gu|Gun|Gye|
								|Hae|Ham|Hat|Hls|Ho|Hof|Hot|Hts|Hu|Ile|im|in|In|Inn|Is|Jal|Jay|Jct|Jet|Jim|Jin|Joe|Joo|Joy|Ju|
								|Kan|Ken|ken|Key|Ki|Ku|Kus|La|Lam|Las|Le|le|Lea|Lee|Les|Lin|Loa|Los|
								|Mai|Mar|Mc|Med|Mer|Mex|Mi|Mie|Min|Mnt|Mor|Mt|Mtn|Mun|Na|Nam|Nan|Nat|New|Nos|Nye|Oak|of|Oil|Ola|Old|Ord|Oro|
								|Pak|Paw|Paz|Pe|Pea|Pen|po|Pok|Pos|Pri|Red|Rex|Rey|Rio|Roi|Roy|Rue|Run|Rye|
								|Sac|Sai|Sam|San|Sao|Sea|Shi|shi|si|Siu|Six|Ski|So|St|Sta|Ste|Sul|Sun|Sur|
								|Ta|Tai|Tan|Tao|Tel|Ten|The|Tin|Top|Tow|Two|Twp|Usk|USSCA|Uul|Van|Vi|Vlg|Vly|voa|
								|Wai|Wan|Way|Wuk|Xi|Yan|Yi|Yuc|Zug|',3
								))) AS Address_City
			FROM Ext_Address OA
				LEFT JOIN Ext_Country NCRY ON OA.New_CountryRegions = NCRY.New_CountryId
		) A