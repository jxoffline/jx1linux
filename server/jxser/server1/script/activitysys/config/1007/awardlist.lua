tbLogUse_Big_Box = {
		[100] = {"Sudung100HopQuanLon"}, 
		[200] = {"Sudung200HopQuanLon"},
		[300] = {"Sudung300HopQuanLon"},
		[400] = {"Sudung400HopQuanLon"},
		[500] = {"Sudung500HopQuanLon"},
		[600] = {"Sudung600HopQuanLon"},
		[700] = {"Sudung700HopQuanLon"},
		[800] = {"Sudung800HopQuanLon"},
		[900] = {"Sudung900HopQuanLon"},
		[1000] = {"Sudung1000HopQuanLon"},
		[1100] = {"Sudung1100HopQuanLon"},
		[1200] = {"Sudung1200HopQuanLon"},
		[1300] = {"Sudung1300HopQuanLon"},
		[1400] = {"Sudung1400HopQuanLon"},
		[1500] = {"Sudung1500HopQuanLon"},
		[1600] = {"Sudung1600HopQuanLon"},
		[1700] = {"Sudung1700HopQuanLon"},
		[1800] = {"Sudung1800HopQuanLon"},
		[1900] = {"Sudung1900HopQuanLon"},
		[2000] = {"Sudung2000HopQuanLon"},
}
tbUse_Big_Box_AdditionalAward = {
	-- [200] 		= {szName="Ch©n Nguyªn §¬n (trung)",
	-- 						pFun = function (tbItem, nItemCount, szLogTitle)
	-- 							local tbItemName = {szName="Ch©n Nguyªn §¬n (trung)", tbProp={6,1,30228,1,0,0},nCount=300,nBindState=-2}
	-- 							if CalcFreeItemCellCount() > 1 then 
	-- 								tbAwardTemplet:Give(tbItemName, 1, {"EVENT_PHUNU", "PhanThuongDatMoc200"})		
	-- 							end
	-- 						end						
	-- 				},
	-- [400] 		= 
	-- {
	-- 		{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=500},
	-- 		{szName = "Phi Phong CÊp 6",
	-- 		 pFun = function (tbItem, nItemCount, szLogTitle)
	-- 					local tbItemName = {
	-- 							[1] = {szName="Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=7*24*60},
	-- 							[2] = {szName="Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=7*24*60},
	-- 							[3] = {szName="Phi phong Ngù Phong (Träng kÝch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=7*24*60},
	-- 					}
	-- 					local nRan = random(1,3)
	-- 					tbAwardTemplet:Give(tbItemName[nRan], 1, {"EVENT_PHUNU", "PhanThuongDatMoc400"})		
	-- 				end									
	-- 		},
	-- },
	-- [800] 		= 
	-- {
	-- 		{szName="HuyÕt Long §»ng cÊp 6",tbProp= {6,1,30289,6,0,0}, nCount=10},
	-- 		{szName="Ch©n Nguyªn §¬n (trung)",
	-- 				pFun = function (tbItem, nItemCount, szLogTitle)
	-- 					local tbItemName = {szName="Ch©n Nguyªn §¬n (trung)", tbProp={6,1,30228,1,0,0},nCount=500,nBindState=-2}
	-- 					if CalcFreeItemCellCount() > 1 then 
	-- 						tbAwardTemplet:Give(tbItemName, 1, {"EVENT_PHUNU", "PhanThuongDatMoc800"})		
	-- 					end
	-- 				end						
	-- 		},
	-- },
	-- [1200] 		= 
	-- {
	-- 	{szName="HuyÕt Long §»ng cÊp 6",tbProp= {6,1,30289,6,0,0}, nCount=10},
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=500},
	-- },	
	-- [1600] 		= 
	-- {
	-- 	{szName="HuyÕt Long §»ng cÊp 6",tbProp= {6,1,30289,6,0,0}, nCount=10},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",
	-- 				pFun = function (tbItem, nItemCount, szLogTitle)
	-- 					local tbItemName = {szName="Ch©n Nguyªn §¬n (trung)", tbProp={6,1,30228,1,0,0},nCount=500,nBindState=-2}
	-- 					if CalcFreeItemCellCount() > 1 then 
	-- 						tbAwardTemplet:Give(tbItemName, 1, {"EVENT_PHUNU", "PhanThuongDatMoc200"})		
	-- 					end
	-- 				end						
	-- 		},
	-- },
	-- [2000] 		= 
	-- {
	-- 	{szName="HuyÕt Long §»ng cÊp 6",tbProp= {6,1,30289,6,0,0}, nCount=10},
	-- 	{szName="Phong v©n chiÕn m·",tbProp={0,10,20,1, 0,0}, nCount=1,nExpiredTime=7 * 60 * 24},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",
	-- 				pFun = function (tbItem, nItemCount, szLogTitle)
	-- 					local tbItemName = {szName="Ch©n Nguyªn §¬n (trung)", tbProp={6,1,30228,1,0,0},nCount=500,nBindState=-2}
	-- 					if CalcFreeItemCellCount() > 1 then 
	-- 						tbAwardTemplet:Give(tbItemName, 1, {"EVENT_PHUNU", "PhanThuongDatMoc200"})		
	-- 					end
	-- 				end						
	-- 		},
	-- },
}
tbAward_A = 
{
	-- ["AwardNomal"] = {
	-- 	{szName="B¹ch Hæ B¶o Th¹ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=0.1},
	-- 	{szName="B¹ch Hæ Thiªn Th¹ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=0.05},
	-- 	{szName="B¹ch Hæ ThÇn Th¹ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=0.03},
	-- 	{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.03},
	-- 	{szName="B¹ch Hæ Kim Bµi",tbProp={6,1,3183,1,0,0},nCount=1,nRate=0.04},
	-- 	{szName="B¶o R­¬ng Kim ¤ Kh«i ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.025},
	-- 	{szName="B¶o R­¬ng Kim ¤ Y ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.025},
	-- 	{szName="B¶o R­¬ng Kim ¤ Hµi ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.025},
	-- 	{szName="B¶o R­¬ng Kim ¤ Yªu §¸i ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.025},
	-- 	{szName="B¶o R­¬ng Kim ¤ Hé UyÓn( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.025},
	-- 	{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.025},
	-- 	{szName="B¶o R­¬ng Kim ¤ Béi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.025},
	-- 	{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.018},
	-- 	{szName="B¶o R­¬ng Kim ¤ H¹ Giíi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.018},
	-- 	{szName="B¶o R­¬ng Kim ¤ Vò KhÝ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.01},
	-- 	{szName="B¹ch Hæ Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={2,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B¹ch Hæ Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.003},
	-- 	{szName="B¹ch Hæ H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B¹ch Hæ Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B¹ch Hæ Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={9,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B¹ch Hæ Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B¹ch Hæ Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.007},
	-- 	{szName="B¹ch Hæ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.006},
	-- 	{szName="B¹ch Hæ H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.006},
	-- 	{szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.002},
	-- 	{szName="§å Phæ B¹ch Hæ Kh«i",tbProp={6,1,3173,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="§å Phæ B¹ch Hæ Y",tbProp={6,1,3174,1,0,0},nCount=1,nRate=0.03},
	-- 	{szName="§å Phæ B¹ch Hæ Hµi",tbProp={6,1,3175,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="§å Phæ B¹ch Hæ Yªu §¸i",tbProp={6,1,3176,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="§å Phæ B¹ch Hæ Hé UyÓn",tbProp={6,1,3177,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="§å Phæ B¹ch Hæ H¹ng Liªn",tbProp={6,1,3178,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="§å Phæ B¹ch Hæ Béi",tbProp={6,1,3179,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="§å Phæ B¹ch Hæ Th­îng Giíi",tbProp={6,1,3180,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="B¹ch Hæ §å Phæ H¹ Giíi",tbProp={6,1,3181,1,0,0},nCount=1,nRate=0.15},
	-- 	{szName="§å Phæ B¹ch Hæ KhÝ Giíi",tbProp={6,1,3182,1,0,0},nCount=1,nRate=0.02},
	-- 	{szName="100 v¹n l­îng",nJxb=1000000, nCount = 1,nRate=4},
	-- 	{szName="200 v¹n l­îng",nJxb=2000000, nCount = 1,nRate=2},
	-- 	{szName="500 v¹n l­îng",nJxb=5000000, nCount = 1,nRate=1},
	-- 	{szName="1000 v¹n l­îng",nJxb=10000000, nCount = 1,nRate=0.4},
	-- 	{szName="2000 v¹n l­îng",nJxb=20000000, nCount = 1,nRate=0.2},
	-- 	{szName="5000 v¹n l­îng",nJxb=50000000, nCount = 1,nRate=0.1},
	-- 	{szName="M¶nh HuyÕt Long §»ng cÊp 6",tbProp={6,1,30290,6,0,0},nCount=1,nRate=10},
	-- 	{szName="M¶nh HuyÕt Long §»ng cÊp 9",tbProp={6,1,30290,9,0,0},nCount=1,nRate=5},
	-- 	{szName="B¹ch Hæ Trïng LuyÖn Ngäc",tbProp={6,1,3187,1,0,0},nCount=1,nRate=0.2},
	-- 	{szName="Ngò Hµnh Kú Th¹ch",tbProp={6,1,2125,1,0,0},nCount=1,nRate=5},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=14,nBindState=-2},
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=5,nRate=14},
	-- 	{szName="HuyÕt Long §»ng cÊp 6",tbProp={6,1,30289,6,0,0},nCount=1,nRate=0.5},
	-- 	{szName="HuyÕt Long §»ng cÊp 9",tbProp={6,1,30289,9,0,0},nCount=1,nRate=0.3},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=5000000,nRate=24.52},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=8000000,nRate=13},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=10000000,nRate=3},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=1},
	-- },
	-- ["AwardSpecial"] = {
	-- 	{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.3,nExpiredTime=43200},
	-- 	{szName="B¹ch Hæ Ph¸t Qu¸n - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={2,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B¹ch Hæ Kim Kh¶i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B¹ch Hæ H¹ng Liªn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B¹ch Hæ Hé UyÓn - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B¹ch Hæ Ngäc Béi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={9,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B¹ch Hæ Hµi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B¹ch Hæ Yªu §¸i - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.4},
	-- 	{szName="B¹ch Hæ Th­îng Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.3},
	-- 	{szName="B¹ch Hæ H¹ Giíi ChØ - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.3},
	-- 	{szName="B¹ch Hæ KhÝ Giíi - Tù chän hÖ ph¸i",tbProp={6,1,30242,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.1},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=50},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=22.58},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=100000000,nRate=9.5},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=200000000,nRate=4},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=500000000,nRate=1},
	-- 	{szName="B¶o R­¬ng Kim ¤ Kh«i ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.6},
	-- 	{szName="B¶o R­¬ng Kim ¤ Y ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.6},
	-- 	{szName="B¶o R­¬ng Kim ¤ Hµi ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.6},
	-- 	{szName="B¶o R­¬ng Kim ¤ Yªu §¸i ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.6},
	-- 	{szName="B¶o R­¬ng Kim ¤ Hé UyÓn( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.6},
	-- 	{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.6},
	-- 	{szName="B¶o R­¬ng Kim ¤ Béi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.6},
	-- 	{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.5},
	-- 	{szName="B¶o R­¬ng Kim ¤ H¹ Giíi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.5},
	-- 	{szName="B¶o R­¬ng Kim ¤ Vò KhÝ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.3},
	-- 	{szName="B¹ch Hæ B¶o Th¹ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=2},
	-- 	{szName="B¹ch Hæ Thiªn Th¹ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=1},
	-- 	{szName="B¹ch Hæ ThÇn Th¹ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=0.8},
	-- 	{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=0.02},
	-- },
	-- ["AwardMocNho"] = {
	-- 	{szName="200 v¹n l­îng",nJxb=2000000, nCount = 1,nRate=3},
	-- 	{szName="HuyÕt Long §»ng cÊp 6",tbProp={6,1,30289,6,0,0},nCount=1,nRate=7},
	-- 	{szName="HuyÕt Long §»ng cÊp 9",tbProp={6,1,30289,9,0,0},nCount=1,nRate=4},
	-- 	{szName="B¹ch Hæ Trïng LuyÖn Ngäc",tbProp={6,1,3187,1,0,0},nCount=1,nRate=0.5},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=10000000,nRate=36.3},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=20000000,nRate=12},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=50000000,nRate=5.5},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=100000000,nRate=3},
	-- 	{szName = "§iÓm Kinh NghiÖm", nExp=200000000,nRate=1},
	-- 	{szName="B¶o R­¬ng Kim ¤ Kh«i ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={2,0,0,0,0,0}, nRate=0.2},
	-- 	{szName="B¶o R­¬ng Kim ¤ Y ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={6,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B¶o R­¬ng Kim ¤ Hµi ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={8,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B¶o R­¬ng Kim ¤ Yªu §¸i ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={5,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B¶o R­¬ng Kim ¤ Hé UyÓn( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={4,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B¶o R­¬ng Kim ¤ H¹ng Liªn( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={1,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B¶o R­¬ng Kim ¤ Béi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={9,0,0,0,0,0}, nRate=0.2},
	-- 	{szName="B¶o R­¬ng Kim ¤ Th­îng Giíi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={3,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B¶o R­¬ng Kim ¤ H¹ Giíi( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={10,0,0,0,0,0},nRate=0.2},
	-- 	{szName="B¶o R­¬ng Kim ¤ Vò KhÝ( lùa chän m«n ph¸i)",tbProp={6,1,30180,1,0,0},nCount=1,tbParam={7,0,0,0,0,0},nRate=0.1},
	-- 	{szName="B¹ch Hæ B¶o Th¹ch",tbProp={6,1,3184,1,0,0},nCount=1,nRate=2},
	-- 	{szName="B¹ch Hæ Thiªn Th¹ch",tbProp={6,1,3185,1,0,0},nCount=1,nRate=1},
	-- 	{szName="B¹ch Hæ ThÇn Th¹ch",tbProp={6,1,3186,1,0,0},nCount=1,nRate=0.8},
	-- 	{szName="B¹ch Hæ LÖnh",tbProp={6,1,2357,1,0,0},nCount=1,nRate=1},
	-- 	{szName="B¹ch Hæ Kim Bµi",tbProp={6,1,3183,1,0,0},nCount=1,nRate=1},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",tbProp={6,1,30228,1,0,0},nCount=1,nRate=10,nBindState=-2},
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=5,nRate=10},
	-- },
}	