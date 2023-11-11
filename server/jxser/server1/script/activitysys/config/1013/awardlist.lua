Include("\\script\\lib\\awardtemplet.lua")
tbAward_A = 
{
	-- ["HarvestPlants"] = {--PhÇn th­ëng trång c©y
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=1,nRate=30},
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=2,nRate=8},
	-- 	{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=3,nRate=4},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",
	-- 			pFun = function (tbItem, nItemCount, szLogTitle)
	-- 				local tbItemName = {szName="Ch©n Nguyªn §¬n (trung)", tbProp={6,1,30228,1,0,0},nCount=1,nBindState=-2}
	-- 				if CalcFreeItemCellCount() > 1 then 
	-- 					tbAwardTemplet:Give(tbItemName, 1, {"GH_2012", "TrongCayThienLocNhanThuong1CND"})		
	-- 				end
	-- 			end,
	-- 			nRate=30										
	-- 	},
	-- 	{szName="Ch©n Nguyªn §¬n (trung)",
	-- 			pFun = function (tbItem, nItemCount, szLogTitle)
	-- 				local tbItemName = {szName="Ch©n Nguyªn §¬n (trung)", tbProp={6,1,30228,1,0,0},nCount=2,nBindState=-2}
	-- 				if CalcFreeItemCellCount() > 1 then 
	-- 					tbAwardTemplet:Give(tbItemName, 1, {"GH_2012", "TrongCayThienLocNhanThuong2CND"})		
	-- 				end
	-- 			end,
	-- 			nRate=3										
	-- 	},
	-- 	{szName="Cµn Kh«n Song TuyÖt Béi",tbProp={6,1,2219,1,0,0},nCount=1,nRate=0.04,nExpiredTime=43200},
	-- 	{szName="Méc Nh©n LÖnh",tbProp={6,1,30105,1,0,0},nCount=5,nRate=3.48308},
	-- 	{szName="Cèng HiÕn LÔ bao",tbProp={6,1,30214,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	-- 	{szName="Phong V©n Phi Tèc hoµn",tbProp={6,1,190,1,0,0},nCount=10,nRate=5,nExpiredTime=20160},
	-- 	{szName="Cµn Kh«n T¹o Hãa §an (®¹i) ",tbProp={6,1,215,1,0,0},nCount=10,nRate=5},
	-- 	{szName="Phong V©n Chiªu Binh LÖnh",tbProp={6,1,30083,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	-- 	{szName="LÖnh bµi ",tbProp={6,1,157,1,0,0},nCount=10,nRate=5},
	-- 	{szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=1,nRate=2,nExpiredTime=20160},
	-- 	{szName="Qu¶ Hoµng Kim",tbProp={6,1,907,1,0,0},nCount=1,nRate=1,nExpiredTime=43200},
	-- 	{szName="KiÕn ThiÕt LÔ Bao",tbProp={6,1,30216,1,0,0},nCount=1,nRate=1,nExpiredTime=20160},
	-- 	{szName="NhÊt Kû Cµn Kh«n Phï",tbProp={6,1,2126,1,0,0},nCount=1,nRate=0.3,nExpiredTime=43200},
	-- 	{szName="Vâ",tbProp={6,1,30260,1,0,0},nCount=1,nRate=0,nExpiredTime=20121101},
	-- 	{szName="L©m",tbProp={6,1,30261,1,0,0},nCount=1,nRate=0.00026,nExpiredTime=20121101},
	-- 	{szName="TruyÒn",tbProp={6,1,30262,1,0,0},nCount=1,nRate=0.0028,nExpiredTime=20121101},
	-- 	{szName="Kú",tbProp={6,1,30263,1,0,0},nCount=1,nRate=0.0028,nExpiredTime=20121101},
	-- 	{szName="M¶nh ch÷ Vâ",tbProp={6,1,30268,1,0,0},nCount=1,nRate=0.00026,nExpiredTime=20121101},
	-- 	{szName="M¶nh ch÷ L©m",tbProp={6,1,30269,1,0,0},nCount=1,nRate=0.0108,nExpiredTime=20121101},
	-- 	{szName="M¶nh ch÷ TruyÒn",tbProp={6,1,30270,1,0,0},nCount=1,nRate=0.08,nExpiredTime=20121101},
	-- 	{szName="M¶nh ch÷ Kú",tbProp={6,1,30271,1,0,0},nCount=1,nRate=0.08,nExpiredTime=20121101},
	-- },
	-- ["HuoYueDu_dynamics"] = {--PhÇn th­ëng §é N¨ng §éng
	-- 		{szName="M¶nh ch÷ B¸t",tbProp={6,1,30272,1,0,0},nCount=1,nRate=0,nExpiredTime=20121101},
	-- 		{szName="M¶nh ch÷ M¹ch",tbProp={6,1,30273,1,0,0},nCount=1,nRate=0.08,nExpiredTime=20121101},
	-- 		{szName="M¶nh ch÷ Ch©n",tbProp={6,1,30274,1,0,0},nCount=1,nRate=0.75,nExpiredTime=20121101},
	-- 		{szName="M¶nh ch÷ Kinh",tbProp={6,1,30275,1,0,0},nCount=1,nRate=0.75,nExpiredTime=20121101},
	-- 		{szName="B¸t",tbProp={6,1,30264,1,0,0},nCount=1,nRate=0.75,nExpiredTime=20121101},
	-- 		{szName="M¹ch",tbProp={6,1,30265,1,0,0},nCount=1,nRate=2.7,nExpiredTime=20121101},
	-- 		{szName="Ch©n",tbProp={6,1,30266,1,0,0},nCount=1,nRate=21,nExpiredTime=20121101},
	-- 		{szName="Kinh",tbProp={6,1,30267,1,0,0},nCount=1,nRate=21,nExpiredTime=20121101},
	-- 		{szName = "§iÓm Kinh NghiÖm", nExp=2000000,nRate=52.97},
	-- },
}
tbAward_B = 
{		
	-- szName = "Phi Phong CÊp 6",
	-- 	pFun = function (tbItem, nItemCount, szLogTitle)
	-- 		local tbItemName = {
	-- 				[1] = {szName="Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",tbProp={0,3473},nCount=1,nQuality = 1,nExpiredTime=259200},
	-- 				[2] = {szName="Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3474},nCount=1,nQuality = 1,nExpiredTime=259200},
	-- 				[3] = {szName="Phi phong Ngù Phong (Träng kÝch)",tbProp={0,3475},nCount=1,nQuality = 1,nExpiredTime=259200},
	-- 		}
	-- 		local nRan = random(1,3)
	-- 		tbAwardTemplet:Give(tbItemName[nRan], 1, {"GH_2012", "NopChuVoLamTruyenKyDuoi9"})		
	-- 	end									
}

tbAward_C = { 
	-- {szName="Ch©n Nguyªn §¬n (trung)", tbProp={6,1,30228,1,0,0},nCount=1,nBindState=-2},
	-- {szName="Hé m¹ch ®¬n", tbProp={6,1,3203,1,0,0},nCount=2},
}
