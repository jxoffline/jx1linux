Include("\\vng_script\\activitysys\\config\\1030\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1030\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1030\\awardlist.lua")


tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "when ServerStart",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:OnServerStart", {}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "TQSK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tæng Qu¶n Sù KiÖn"},
	tbCondition =
	{		
				
	},
	tbActition =
	{			
		{"AddDialogOpt",	{"§æi B¸ch Niªn Tr©n Lé",3} },
		{"AddDialogOpt",	{"§æi Thiªn Niªn Tr©n Lé",4} },			
		{"AddDialogOpt",	{"NhËn phÇn th­ëng mèc",5} },		
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "§æi ITEM_BACHNIEN_TL",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BACHNIEN_TL.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },		
		{"AddOneMaterial",	{ITEM_BINH_RUOU.szName,ITEM_BINH_RUOU,5 }},	
		{"AddOneMaterial",	{MONEY.szName,MONEY,MONEY_5Van }},
	},	
	tbActition =
	{		
		{"PlayerFunLib:GetItem",	{ITEM_BACHNIEN_TL,1,EVENT_LOG_TITLE,"Doi - ITEM_BACHNIEN_TL"} },	
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "§æi ITEM_THIENNIEN_TL",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_THIENNIEN_TL.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },		
		{"AddOneMaterial",	{ITEM_BINH_RUOU.szName,ITEM_BINH_RUOU,5 }},	
		{"AddOneMaterial",	{ITEM_MEN_RUOU.szName,ITEM_MEN_RUOU,1 }},			
	},	
	tbActition =
	{		
		{"PlayerFunLib:GetItem",	{ITEM_THIENNIEN_TL,1,EVENT_LOG_TITLE,"Doi - ITEM_THIENNIEN_TL"} },	
	},
}

--nhan thuong moc
tbConfig[5] =
{
	nId = 5,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i sù kiÖn event ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"C¸c h¹ ®· dïng ®­îc :\n	- Thiªn Niªn Tr©n Lé : <color=yellow><lua GetBitTask(2737, 12, 12) /><color> c¸i.\n	- V¹n Niªn Tr©n Lé : <color=yellow><lua GetBitTask(2738, 0, 12) /><color> c¸i."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"NhËn mèc 1000 Thiªn Niªn Tr©n Lé",6} },
		{"AddDialogOpt",	{"NhËn mèc 1500 Thiªn Niªn Tr©n Lé",7} },	
		{"AddDialogOpt",	{"NhËn mèc 500 V¹n Niªn Tr©n Lé",8} },
		{"AddDialogOpt",	{"NhËn mèc 1000 V¹n Niªn Tr©n Lé",9} },	
		{"AddDialogOpt",	{"NhËn mèc 2000 V¹n Niªn Tr©n Lé",10} },
		{"AddDialogOpt",	{"NhËn mèc 3000 V¹n Niªn Tr©n Lé",11} },				
	},
}

---phan thuong moc 
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_THIENNIEN_TL, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_THIENNIEN_TL, MOC_1000, "B¹n ch­a dïng ®ñ 1000 Thiªn Niªn Tr©n Lé.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_THIENNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_ThienNienTL["1000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1000_ThienNienTL"}} },
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 1500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1500_THIENNIEN_TL, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_THIENNIEN_TL, MOC_1500, "B¹n ch­a dïng ®ñ 1500 Thiªn Niªn Tr©n Lé.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1500_THIENNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_ThienNienTL["1500"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1500_ThienNienTL"}} },
	},
}
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_500_VANNIEN_TL, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_VANNIEN_TL, MOC_500, "B¹n ch­a dïng ®ñ 500 V¹n Niªn Tr©n Lé.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_500_VANNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VanNienTL["500"],1,{EVENT_LOG_TITLE,"PhanThuongMoc500_VanNienTL"}} },
	},
}
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_VANNIEN_TL, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_VANNIEN_TL, MOC_1000, "B¹n ch­a dïng ®ñ 1000 V¹n Niªn Tr©n Lé.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_VANNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VanNienTL["1000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1000_VanNienTL"}} },
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 2000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_2000_VANNIEN_TL, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_VANNIEN_TL, MOC_2000, "B¹n ch­a dïng ®ñ 2000 V¹n Niªn Tr©n Lé.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_2000_VANNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VanNienTL["2000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc2000_VanNienTL"}} },
	},
}
tbConfig[11] = 
{
	nId = 11,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_3000_VANNIEN_TL, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_VANNIEN_TL, MOC_3000, "B¹n ch­a dïng ®ñ 3000 V¹n Niªn Tr©n Lé.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_3000_VANNIEN_TL, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VanNienTL["3000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc3000_VanNienTL"}} },
	},
}
--Su dung Item
tbConfig[12] = 
{
	nId = 12,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_BACHNIEN_TL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BACHNIEN_TL, MOC_2000, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},		
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BACHNIEN_TL, 1}},		
		{"tbAwardTemplet:Give",{tbAward_Use_BACHNIEN_TL,1,{EVENT_LOG_TITLE,"Use - ITEM_BACHNIEN_TL"}} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_THIENNIEN_TL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_THIENNIEN_TL, MOC_1500, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},		
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_THIENNIEN_TL, 1}},		
		{"tbAwardTemplet:Give",{tbAward_Use_THIENNIEN_TL,1,{EVENT_LOG_TITLE,"Use - ITEM_THIENNIEN_TL"}} },
	},
}
tbConfig[17] = 
{
	nId = 17,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_VANNIEN_TL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },			
		{"ThisActivity:CheckLimitUseTienDon",{}},
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_VANNIEN_TL, 1}},		
		{"tbAwardTemplet:Give",{tbAward_Use_VanNienTL,1,{EVENT_LOG_TITLE,"Use - ITEM_VANNIEN_TL"}} },	
	},
}
tbConfig[18] = 
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_TIENDON},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },				
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_TIENDON, 1, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},			
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_TIENDON, 1}},	
		{"Msg2Player",{"Giíi h¹n sö dông V¹n Niªn Tr©n Lé t¨ng lªn 3000 c¸i."}},	
		{"Talk",{1,"","Sö dông Tiªn §¬n t¨ng giíi h¹n sö dông V¹n Niªn Tr©n Lé t¨ng lªn 3000 c¸i."}},	
	},
}
tbConfig[19] = --§¸nh qu¸i rít Item
{
	nId = 19,
	szMessageType = "NpcOnDeath",
	szName = "B¶n ®å ®¸nh qu¸i nhËn nguyªn liÖu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"",">="} },
		{"NpcFunLib:CheckInMap",	{"321,340,322,225,226,227,75"} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{ITEM_BINH_RUOU,1,"5"} },
	},
}
--Hoan Thanh Da Tau
tbConfig[20] = 
{
	nId = 20,
	szMessageType = "HoanThanhDaTau",
	szName = "hoµn thµnh nv d· tÈu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{50,"",">="} },		
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_MEN_RUOU,3,EVENT_LOG_TITLE,"HoanThanh_DaTau"} },	
	},
}

tbConfig[21] = 
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_HOP_VANNIEN_TL},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph¶i cã Ýt nhÊt 5 « trèng míi cã thÓ sö dông."} },			
	},
	tbActition = 
	{			
		{"tbAwardTemplet:Give",{tbAward_Use_HOP_VANNIEN_TL,1,{EVENT_LOG_TITLE,"Use - ITEM_HOP_VANNIEN_TL"}} },
	},
}