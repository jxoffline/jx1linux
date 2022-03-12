Include("\\script\\activitysys\\config\\1003\\variables.lua")
Include("\\script\\activitysys\\config\\1003\\awardlist.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "songjin mark>=1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"PlayerFunLib:CheckTask",	{"751",1000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4, 30, EVENT_LOG_TITLE, "TongKim1000"} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "KÕt thóc mçi ¶i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,1, EVENT_LOG_TITLE, "VuotquamoiAi"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "Chuanguan",
	szName = "COT 17",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4, 5, EVENT_LOG_TITLE, "Change_Of_Time_17"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "Chuanguan",
	szName = "COT 28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4, 5, EVENT_LOG_TITLE, "Change_Of_Time_28"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "FinishFengLingDu",
	szName = "FinishFengLingDu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,5,EVENT_LOG_TITLE,"Feng_Ling_Du_Finish"} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
		{"NpcFunLib:CheckBoatBoss",	{nil} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,20,EVENT_LOG_TITLE,"Feng_Ling_Du_Boat_Boss"} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "NpcOnDeath",
	szName = "kill_boat_big_boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckId",	{"1692"} },
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,20,EVENT_LOG_TITLE,"Feng_Ling_Du_Boat_Big_Boss"} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "YDBZguoguan",
	szName = "YanDi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,2,EVENT_LOG_TITLE,"Yan_Di_Each"} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "YDBZguoguan",
	szName = "YanDi 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,20,EVENT_LOG_TITLE,"Yan_Di_10"} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "NpcOnDeath",
	szName = "killer boss",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
		{"PlayerFunLib:CheckTotalLevel",	{MIN_LEVEL,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,5,EVENT_LOG_TITLE,"FinishKillerBoss90"} },
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },		
	},
	tbActition = 
	{
		{"AddDialogOpt",	{format("MiÔn phÝ nhËn vËt phÈm %s",ITEM_1.szName),12} },
		{"AddDialogOpt",	{format("Mua %s",ITEM_3.szName),16} },
	},
}
tbConfig[12] = 
{
	nId = 12,
	szMessageType = "nil",
	szName = "get free item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTransLifeCount",	{2,"Yªu cÇu trïng sinh 2 trë lªn",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"Yªu cÇu ®¼ng cÊp 150 trë lªn",">="} },	
		{"PlayerFunLib:CheckTaskDaily",	{TSK_DAILY_1,MAX_ITEM_1_DAILY,"H«m nay ng­¬i kh«ng thÓ nhËn n÷a, ngµy mai h·y quay l¹i.","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{TSK_DAILY_1,1} },
		{"PlayerFunLib:GetItem",	{ITEM_1,1,EVENT_LOG_TITLE,"NhanHanhQuanLenhTaiHangRong"} },
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "ClickNpc",
	szName = "click lingfan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§¹i sø ho¹t ®éng"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },			
	},
	tbActition = 
	{
		{"AddDialogOpt",	{format("Nép vËt phÈm %s nhËn th­ëng",ITEM_1.szName),14} },
		{"AddDialogOpt",	{"Hîp thµnh phÇn th­ëng",23} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng sö dông ®¹t mèc 200 Huy HiÖu §¹i So¸i",27} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng sö dông ®¹t mèc 3000 Huy HiÖu §¹i So¸i",33} },
		{"AddDialogOpt",	{"Ho¹t ®éng ®ua top server",28} },
	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "give item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép vËt phÈm Hµnh Qu©n LÖnh",1,0,0,0,0,50},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTransLifeCount",	{2,"Yªu cÇu trïng sinh 2 trë lªn",">="} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"Yªu cÇu ®¼ng cÊp 150 trë lªn",">="} },
		{"PlayerFunLib:CheckTaskDaily",	{TSK_DAILY_2,MAX_ITEM_1_DAILY,"H«m nay ng­¬i kh«ng thÓ nép vËt phÈm n÷a, ngµy mai h·y quay l¹i.","<"} },
		{"ThisActivity:CheckGiveItemLimit", {nil}},
		{"AddOneMaterial",	{ITEM_1.szName,ITEM_1,1} },
	},
	tbActition = 
	{		
		{"ThisActivity:GiveItemGetExp", {nil}},
	},
}
tbConfig[15] = --§¸nh qu¸i rít Item
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "kill monster at field",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,322,340,225,226,227"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_2,1,"20"} },		
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "buy item",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_3.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{MONEY.szName,MONEY,1000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_3,1,EVENT_LOG_TITLE,"MuaHuyHieu3TaiHangRong"} },
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "Dïng Hép Huy HiÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_5},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },		
		{"PlayerFunLib:CheckFreeBagCell",	{3,"default"} },				
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_4,20,EVENT_LOG_TITLE,"SuDungHopHuyHieu"} },
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Dïng Huy HiÖu 4 sao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_6},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD1,TSK_USE_AWARD1.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{		
		{"ThisActivity:UseItemGetExp", {ITEM_6.szName, 1e6, TSK_USE_AWARD1, "SuDungHuyHieu4Sao"}},
		{"tbVNG_BitTask_Lib:addTask",	{TSK_USE_AWARD1,1} },
	},
}
tbConfig[19] =
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "Dïng Huy HiÖu sao vµng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_7},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD2,TSK_USE_AWARD2.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{		
		{"ThisActivity:UseItemGetExp", {ITEM_7.szName, 2e6, TSK_USE_AWARD2, "SuDungHuyHieuSaoVang"}},
		{"tbVNG_BitTask_Lib:addTask",	{TSK_USE_AWARD2,2} },
	},
}
tbConfig[20] =
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "Dïng Huy HiÖu sao ®á",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_8},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD3,TSK_USE_AWARD3.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{		
		{"ThisActivity:UseItemGetExp", {ITEM_8.szName, 3e6, TSK_USE_AWARD3, "SuDungHuyHieuSaoDo"}},
		{"tbVNG_BitTask_Lib:addTask",	{TSK_USE_AWARD3,3} },
	},
}
tbConfig[21] =
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "Dïng Huy HiÖu §¹i So¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_9},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:VnCheckInCity",	{"default"} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD4,TSK_USE_AWARD4.nMaxValue,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:UseItem1", {nil}},
	},
}
tbConfig[22] =
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "Hép Quµ Vui VÎ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_12},
	tbCondition = 
	{
		{"ThisActivity:HappyBoxCondition",	{nil} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD6,1,"Mçi ng­êi ch¬i chØ sö dông 1 lÇn Hép quµ vui vÎ","~="} },
	},
	tbActition =
	{
		{"ThisActivity:UseHappyBox",	{nil} },
		{"tbVNG_BitTask_Lib:setBitTask", {TSK_USE_AWARD6, 1}},
	},
}
tbConfig[23] =
{
	nId = 23,
	szMessageType = "CreateDialog",
	szName = "chän ghÐp phÇn th­ëng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Xin chän lo¹i phÇn th­ëng?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"GhÐp [Huy HiÖu 4 Sao]",24} },
		{"AddDialogOpt",	{"GhÐp [Huy HiÖu Sao Vµng - §á]",25} },
		{"AddDialogOpt",	{"GhÐp [Huy HiÖu §¹i So¸i]",26} },
	},
}
tbConfig[24] = 
{
	nId = 24,
	szMessageType = "CreateCompose",
	szName = "compose 1",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_6.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{ITEM_2.szName,ITEM_2,1} },
		{"AddOneMaterial",	{ITEM_3.szName,ITEM_3,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_6,1,EVENT_LOG_TITLE,"GhepHuyHieu4Sao"} },
	},
}
tbConfig[25] = 
{
	nId = 25,
	szMessageType = "CreateCompose",
	szName = "compose 2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Huy HiÖu Sao Vµng - §á",1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{ITEM_2.szName,ITEM_2,1} },
		{"AddOneMaterial",	{ITEM_4.szName,ITEM_4,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{COMPOSE_AWARD_1,1,EVENT_LOG_TITLE,"GhepHuyHieuSaoVangDo"} },
	},
}
tbConfig[26] = 
{
	nId = 26,
	szMessageType = "CreateCompose",
	szName = "compose 3",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_9.szName,1,1,1,0.004,0,250},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"",">="} },
		{"AddOneMaterial",	{ITEM_3.szName,ITEM_3,1} },
		{"AddOneMaterial",	{ITEM_10.szName,ITEM_10,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_9,1,EVENT_LOG_TITLE,"GhepHuyHieuDaiSoai"} },
	},
}

tbConfig[27] = 
{
	nId = 27,
	szMessageType = "nil",
	szName = "sö dông ®¹t mèc nhËn hµo quang",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD5,200,"Yªu cÇu sö dông vËt phÈm Huy HiÖu §¹i So¸i ®¹t <color=red>200<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD7,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{TSK_USE_AWARD7,1} },
		{"ThisActivity:GetTittleAward", {nil}},
	},
}

tbConfig[28] =
{
	nId = 28,
	szMessageType = "CreateDialog",
	szName = "®ua top",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Ng­êi ch¬i nÕu thu thËp ®­îc vËt phÈm [Tói ChiÕn Th¾ng] cã thÓ ®em ®Õn gÆp ta ®Ó tham gia ho¹t ®éng ®ua top server. Ng­êi ch¬i nµo nép ®­îc nhiÒu vËt phÈm nhÊt sÏ nhËn ®­îc phÇn th­ëng gi¸ trÞ. Chi tiÕt xem t¹i trang chñ <color=blue>volam.zing.vn<color>. <enter>Ho¹t ®éng nµy chÝnh thøc b¾t ®Çu sau thêi gian b¶o tr× ngµy 8/4/2013. H·y tÝch lòy ngay tõ b©y giê nhÐ!"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckInMap", {"11", "Xin vui lßng ®Õn Thµnh §«"}},
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nép vËt phÈm [Tói ChiÕn Th¾ng]",29} },
		{"AddDialogOpt",	{"Xem b¶ng xÕp h¹ng",30} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng xÕp h¹ng",31} },
		{"AddDialogOpt",	{"NhËn phÇn th­ëng ng­êi ®Çu tiªn ®¹t top server",32} },
	},
}
tbConfig[29] =
{
	nId = 29,
	szMessageType = "CreateCompose",
	szName = "giao nép",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Nép vËt phÈm",1,1,1,0},
	tbCondition = 
	{			
		{"AddOneMaterial",	{ITEM_11.szName,ITEM_11,1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },	
		{"ThisActivity:Top10_CheckTime",	{nil} },
	},
	tbActition = 
	{
		{"ThisActivity:Top10_GiveItem",	{nil} },		
	},
}
tbConfig[30] =
{
	nId = 30,
	szMessageType = "nil",
	szName = "xem b¶ng xÕp h¹ng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{				
	},
	tbActition = 
	{
		{"ThisActivity:ShowTopList",	{nil} },
	},
}
tbConfig[31] =
{
	nId = 31,
	szMessageType = "nil",
	szName = "nhËn phÇn th­ëng top 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetTopListAward",	{nil} },
	},
}
tbConfig[32] =
{
	nId = 32,
	szMessageType = "nil",
	szName = "nhËn phÇn th­ëng top 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },			
	},
	tbActition = 
	{
		{"ThisActivity:GetFirstWinnerAward",	{nil} },
	},
}

tbConfig[33] = 
{
	nId = 33,
	szMessageType = "nil",
	szName = "sö dông ®¹t mèc 3000 huy hÞªu ®¹i so¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD5,3000,"Yªu cÇu sö dông vËt phÈm Huy HiÖu §¹i So¸i ®¹t <color=red>3000<color> lÇn trë lªn míi nhËn ®­îc phÇn th­ëng nµy.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TSK_USE_AWARD10,0,"Ng­¬i ®· nhËn phÇn th­ëng nµy råi","=="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:setBitTask",	{TSK_USE_AWARD10,1} },
		{"PlayerFunLib:GetItem",	{tbAward_3, 1, EVENT_LOG_TITLE, "PhanThuongDat3000HuyHieuDaiSoai"} },
	},
}