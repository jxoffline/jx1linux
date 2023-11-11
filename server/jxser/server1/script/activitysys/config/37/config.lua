Include("\\script\\activitysys\\config\\37\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "Khi khëi ®éng server sÏ t¶i ¤ng Giµ Noel",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "NpcOnDeath",
	szName = "B¶n ®å ®¸no qu¸i nhËn ®­îc ¸o Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,75,227,340,93"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_XMAS_CLOTHING,1,"6"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "§iÓm tÝch lòy Tèng Kim cao cÊp lín h¬n 1000 thÊp h¬n 3000 nhËn ®­îc Tói Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"TongKim1000NhanTuiNoel"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "FinishSongJin",
	szName = "§iÓm tÝch lòy Tèng Kim cao cÊp 3000 nhËn ®­îc Tói Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,30,EVENT_LOG_TITLE,"TongKim3000NhanTuiNoel"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i thø 17 nhËn ®­îc Tói Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"VuotAi17NhanTuiNoel"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "Chuanguan",
	szName = "V­ît qua ¶i thø 28 nhËn ®­îc Tói Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"VuotAi28NhanTuiNoel"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "Thñy TÆc §Çu LÜnh Phong L¨ng §é nhËn ®­îc Tói Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,10,EVENT_LOG_TITLE,"TieuDietThuyTacDauLinhNhanTuiNoel"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "NpcOnDeath",
	szName = "Thñy TÆc §¹i §Çu LÜnh Phong L¨ng §é nhËn ®­îc Tói Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckId",	{"1692"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,20,EVENT_LOG_TITLE,"TieuDietThuyTacDaiDauLinhNhanTuiNoel"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "Viªm §Õ v­ît qua ¶i thø 10 nhËn ®­îc Tói Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,15,EVENT_LOG_TITLE,"VuotAiViemDe10NhanTuiNoel"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt Boss Hoµng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckWorldBoss",	{nil} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,50,EVENT_LOG_TITLE,"TieuDietBossTheGioiNhanTuiNoel"} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "NpcOnDeath",
	szName = "Tiªu diÖt Boss S¸t Thñ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_BAG,3,EVENT_LOG_TITLE,"TieuDietBossSatThuNhanTuiNoel"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "Chuanguan",
	szName = "V­ît ¶i tiªu diÖt Boss ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"30"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_XMAS_STAR,1,EVENT_LOG_TITLE,"chuangguan30"} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "YDBZ_KillMaxBoss",
	szName = "Viªm §Õ tiªu diÖt Boss cuèi ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:YDBZ_GiveStar",	{nil} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "ClickNpc",
	szName = "NhÊn vµo §¹i Tïng Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§¹i Tïng Gi¸ng Sinh"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Online nhËn phÇn th­ëng",15} },
		{"AddDialogOpt",	{"Hîp thµnh vËt phÈm",17} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i nhËn QuÇn Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Vµo lóc 0:00-01-12-2011 ®Õn 24:00-31-12-2011, c¸c ®¹i hiÖp cÊp 150 vµ 150 trë lªn (trïng sinh kh«ng giíi h¹n) cã thÓ tham gia ho¹t ®éng Gi¸ng Sinh, cø mçi tiÕng ®ång hå oline trªn m¹ng sÏ nhËn ®­îc 10 QuÇn Gi¸ng Sinh vµ 40 B¸nh BÝ §á, mçi ngµy nhiÒu nhÊt chØ nhËn ®­îc 5 lÇn",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Online nhËn phÇn th­ëng",16} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "nil",
	szName = "QuyÕt ®Þnh nhËn QuÇn Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTaskDaily",	{TSK_XMAS_TROUSERS_DAILY,50,"H«m nay ng­¬i kh«ng thÓ nhËn n÷a, ngµy mai h·y quay l¹i.","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:GiveXmasTrousers",	{nil} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i hîp thµnh vËt phÈm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Trong thêi gian ho¹t ®éng, ®¹i hiÖp ng­¬i cã thÓ ®Õn chç cña ta ®©y hîp thµnh Hép Quµ Gi¸ng Sinh, ¤ng Giµ Noel (nhá), ¤ng Giµ Noel (trung), ¤ng Giµ Noel (®¹i), B¸nh Gi¸ng Sinh, trong ®ã tØ lÖ hîp thµnh thµnh c«ng cña Hép Quµ Gi¸ng Sinh lµ 70%, tØ lÖ hîp thµnh thµnh c«ng cña ¤ng Giµ Noel (tiÓu) lµ 60%, tØ lÖ thµnh c«ng hîp thµnh c¸c vËt phÈm kh¸c lµ 100%, ng­¬i cã muèn hîp thµnh kh«ng?",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Hîp thµnh Hép Quµ Gi¸ng Sinh",18} },
		{"AddDialogOpt",	{"Hîp thµnh ¤ng Giµ Noel (nhá)",19} },
		--T¹m ®ãng - Modified By DinhHQ - 20111129
	--	{"AddDialogOpt",	{"Hîp thµnh ¤ng Giµ Noel (trung)",20} },
		{"AddDialogOpt",	{"Hîp thµnh ¤ng Giµ Noel (®¹i)",21} },
		{"AddDialogOpt",	{"Hîp thµnh B¸nh Gi¸ng Sinh",22} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh Hép Quµ Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hép quµ gi¸ng sinh",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"¸o gi¸ng sinh",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"QuÇn Gi¸ng Sinh",ITEM_XMAS_TROUSERS,1} },
		--Change request Event Noel - Modified by DinhHQ - 20111129
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},50000} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeXmasGift",	{nil} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh ¤ng Giµ Noel (nhá)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"¤ng Giµ Noel (nhá)",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"¸o gi¸ng sinh",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"QuÇn Gi¸ng Sinh",ITEM_XMAS_TROUSERS,1} },
		{"AddOneMaterial",	{"Tói Gi¸ng Sinh",ITEM_XMAS_BAG,1} },
		--Change request Event Noel - Modified by DinhHQ - 20111129
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},100000} },
	},
	tbActition = 
	{
		{"ThisActivity:ComposeXmasPerson_S",	{nil} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh ¤ng Giµ Noel (trung)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"¤ng Giµ Noel (trung)",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"¸o gi¸ng sinh",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"Nãn gi¸ng sinh",{tbProp={6,1,3072,1,0,0},},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3078,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"GhepNguoiTuyet(trung)"} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh ¤ng Giµ Noel (®¹i)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"¤ng Giµ Noel (®¹i)",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"¸o gi¸ng sinh",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"QuÇn Gi¸ng Sinh",ITEM_XMAS_TROUSERS,1} },
		{"AddOneMaterial",	{"Tói Gi¸ng Sinh",ITEM_XMAS_BAG,1} },
		{"AddOneMaterial",	{"Nãn gi¸ng sinh",{tbProp={6,1,3072,1,0,0},},2} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3079,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"GhepNguoiTuyet(lon)"} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh B¸nh Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¸nh Gi¸ng Sinh",1,1,1,0.02,0,50},
	tbCondition = 
	{
		{"AddOneMaterial",	{"¸o gi¸ng sinh",ITEM_XMAS_CLOTHING,2} },
		{"AddOneMaterial",	{"Tói Gi¸ng Sinh",ITEM_XMAS_BAG,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3082,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"composeXmasCake"} },
	},
}
tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "ClickNpc",
	szName = "NhÊn vµo ¤ng Giµ Noel",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"¤ng Giµ Noel"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"Vµo lóc 0:00-01-12-2011 ®Õn 24:00-31-12-2011, c¸c ®¹i hiÖp cÊp 150 vµ 150 trë lªn (trïng sinh kh«ng giíi h¹n) cã thÓ ®Õn ®©y sö dông 300, 400, 500 Ng«i Sao ®Ó ®æi lÊy lÖnh bµi triÖu håi Boss Tr­¬ng Tuyªn, Kim ThÝ L­îng, Mé Dung Toµn, xin hái ng­¬i muèn ®æ lo¹i nµo?"} },		
		{"AddDialogOpt",	{"LÖnh Bµi triÖu håi Boss Tr­¬ng Tuyªn",24} },
		{"AddDialogOpt",	{"LÖnh Bµi triÖu håi Boss Kim ThÝ L­îng",25} },
		{"AddDialogOpt",	{"LÖnh Bµi triÖu håi Mé Dung Toµn",26} },
		--§Òn bï exp - Modified by DinhHQ - 20111201
		--{"AddDialogOpt",	{"NhËn ®Òn bï ®iÓm kinh nghiÖm",33} },
		--Ho¹t ®éng thø 3 - Modified By DinhHQ -20111215
		{"AddDialogOpt",	{"Mãn quµ ®ªm gi¸ng sinh",34} },
		{"AddDialogOpt",	{"Hîp thµnh «ng giµ Noel hång",38} },
	},
}
tbConfig[24] = --Ò»¸öÏ¸½Ú
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "LÖnh Bµi triÖu håi Boss Tr­¬ng Tuyªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"LÖnh bµi Boss - Tr­¬ng Tuyªn",1,1,1,1,0,50},
	tbCondition = 
	{
		--Change request event noel - Modified By DinhHQ - 20111129
		{"AddOneMaterial",	{"Ng«i Sao",ITEM_XMAS_STAR,300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3083,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"DoiLenhBaiGoiBossTaiNpcOngGiaNoel"} },
	},
}
tbConfig[25] = --Ò»¸öÏ¸½Ú
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "LÖnh Bµi triÖu håi Boss Kim ThÝ L­îng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"LÖnh bµi Boss - Kim ThÝ L­îng",1,1,1,1,0,50},
	tbCondition = 
	{
		--Change request event noel - Modified By DinhHQ - 20111129
		{"AddOneMaterial",	{"Ng«i Sao",ITEM_XMAS_STAR,400} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3084,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"DoiLenhBaiGoiBossTaiNpcOngGiaNoel"} },
	},
}
tbConfig[26] = --Ò»¸öÏ¸½Ú
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "LÖnh Bµi triÖu håi Mé Dung Toµn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"LÖnh bµi Boss - Mé Dung Toµn",1,1,1,1,0,50},
	tbCondition = 
	{
		--Change request event noel - Modified By DinhHQ - 20111129
		{"AddOneMaterial",	{"Ng«i Sao",ITEM_XMAS_STAR,500} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,3085,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"DoiLenhBaiGoiBossTaiNpcOngGiaNoel"} },
	},
}
tbConfig[27] = --Ò»¸öÏ¸½Ú
{
	nId = 27,
	szMessageType = "ItemScript",
	szName = "Sö dông ¤ng Giµ Noel (nhá)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3077,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_PERSON_S_LIMIT,MAX_USED_XMAS_PERSON_S_LIMIT,"Ng­¬i ®· sö dông ®ñ ¤ng Giµ Noel (nhá), kh«ng thÓ sö dông thªm n÷a!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_S",	{nil} },
	},
}
tbConfig[28] = --Ò»¸öÏ¸½Ú
{
	nId = 28,
	szMessageType = "ItemScript",
	szName = "Sö dông ¤ng Giµ Noel (trung)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3078,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_PERSON_M_LIMIT,MAX_USED_XMAS_PERSON_M_LIMIT,"Ng­¬i ®· sö dông ®ñ ¤ng Giµ Noel (trung), kh«ng thÓ sö dông thªm n÷a!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_M",	{nil} },
	},
}
tbConfig[29] = --Ò»¸öÏ¸½Ú
{
	nId = 29,
	szMessageType = "ItemScript",
	szName = "Sö dông ¤ng Giµ Noel (®¹i)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3079,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_PERSON_L_LIMIT,MAX_USED_XMAS_PERSON_L_LIMIT,"Ng­¬i ®· sö dông ®ñ ¤ng Giµ Noel (®¹i), kh«ng thÓ sö dông thªm n÷a!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_L",	{nil} },
	},
}
tbConfig[30] = --Ò»¸öÏ¸½Ú
{
	nId = 30,
	szMessageType = "ItemScript",
	szName = "Sö dông hép quµ gi¸ng sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3080,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_GIFT_LIMIT,MAX_USED_XMAS_GIFT_LIMIT,"Ng­¬i ®· sö dông ®ñ Hép Quµ Gi¸ng Sinh, kh«ng thÓ giao thªm ®­îc n÷a!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasGift",	{nil} },
	},
}
tbConfig[31] = --Ò»¸öÏ¸½Ú
{
	nId = 31,
	szMessageType = "ItemScript",
	szName = "Sö dông B¸nh Gi¸ng Sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,3082,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },
		{"ThisActivity:CheckTask",	{TSK_XMAS_CAKE_LIMIT,MAX_USED_XMAS_CAKE_LIMIT,"Ng­¬i ®· sö dông ®ñ B¸nh Gi¸ng Sinh råi, kh«ng thÓ giao thªm ®­îc n÷a!","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasCake",	{nil} },
	},
}
tbConfig[32] = --Ò»¸öÏ¸½Ú
{
	nId = 32,
	szMessageType = "OnLogin",
	szName = "Ng­êi ch¬i trùc tuyÕn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:PlayerOnLogin",	{nil} },
	},
}
tbConfig[33] = 
{
	nId = 33,
	szMessageType = "nil",
	szName = "NhËn ®Òn bï gi¸ng sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetCompensation",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2911,nStartBit = 29,nBitCount = 1,nMaxValue = 1}, 0, "Mçi nh©n vËt chØ ®­îc nhËn th­ëng 1 lÇn", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2911,nStartBit = 29,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{18e6,0,"Event_Noel","NhanThuongDenBuTrongCay"} },
	},
}
tbConfig[34] =
{
	nId = 34,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i nhËn phÇn th­ëng ®ªm gi¸ng sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Vµo lóc 0:00-24-12-2011 ®Õn 24:00-25-12-2011, c¸c ®¹i hiÖp cÊp 150 vµ 150 trë lªn (trïng sinh kh«ng giíi h¹n) cã thÓ ®Õn gÆp ta ®Ó nhËn mãn quµ gi¸ng sinh lµ 200 triÖu ®iÓm kinh nghiÖm kh«ng céng dån, mçi nh©n vËt chØ cã thÓ nhËn mét lÇn duy nhÊt.",0},
	tbCondition = 
	{		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn nhËn th­ëng",35} },
	},
}
tbConfig[35] = 
{
	nId = 35,
	szMessageType = "nil",
	szName = "nhËn phÇn th­ëng ®ªm gi¸ng sinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"ThisActivity:CheckTimeGetFreeExp",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {{nTaskID = 2912,nStartBit = 20,nBitCount = 1,nMaxValue = 1}, 0, "Mçi nh©n vËt chØ ®­îc nhËn th­ëng 1 lÇn", "=="}},	
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {{nTaskID = 2912,nStartBit = 20,nBitCount = 1,nMaxValue = 1}, 1}},
		{"PlayerFunLib:AddExp",	{200e6,0,"Event_Noel","NhanThuongDiemKinhNghiemDemGiangSinh"} },
	},
}
tbConfig[36] =--Click hµng rong mua gµ quay quay
{
	nId = 36,
	szMessageType = "ClickNpc",
	szName = "NhÊn vµo Hµng rong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Mua Gµ Quay",37} },
	},
}
tbConfig[37] =
{
	nId = 37,
	szMessageType = "CreateCompose",
	szName = "Mua Gµ Quay",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Gµ quay",1,1,1,0.02,0,50},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},10000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{szName="Gµ quay",tbProp={6,1,30167,1,0,0},nExpiredTime=20120101,},1,EVENT_LOG_TITLE,"MuaGaQuay"} },
	},
}
tbConfig[38] =
{
	nId = 38,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh «ng giµ Noel hång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"¤ng giµ Noel hång",1,1,1,0.02,0,50},
	tbCondition = 
	{		
		{"AddOneMaterial",	{"Gµ quay",{tbProp={6,1,30167,1,0,0},nExpiredTime=20120101,},1} },		
		{"AddOneMaterial",	{"B¸nh bÝ ®á",{tbProp={6,1,30166,1,0,0},nExpiredTime=20120101,},1} },
		{"AddOneMaterial",	{"Nãn gi¸ng sinh",ITEM_XMAS_HAT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,30168,1,0,0},nExpiredTime=20120101,},1, EVENT_LOG_TITLE, "GhepOngGiaNoelHong"} },
	},
}
tbConfig[39] = 
{
	nId = 39,
	szMessageType = "ItemScript",
	szName = "Sö dông ¤ng Giµ Noel hång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30168,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{3, 3, 1,"default"} },
		{"PlayerFunLib:CheckInMap",	{"11,1,37,,176,162,78,80,174,121,153,101,99,100,20,53", "ChØ cã thÓ sö dông t¹i c¸c thµnh thÞ vµ c¸c t©n thñ th«n."} },
		{"PlayerFunLib:CheckTask",	{2916,1500,"Mçi nh©n vËt chØ ®­îc phÐp sö dông tèi ®a 1500 vËt phÈm ¤ng giµ Noel hång","<"} },		
	},
	tbActition = 
	{
		{"ThisActivity:UseXmasPerson_Pink",	{nil} },
	},
}