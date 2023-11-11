Include("\\vng_script\\activitysys\\config\\1027\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1027\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1027\\awardlist.lua")

tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "when ServerStart",
	nStartDate = 201512160000,
	nEndDate  = 201512312400,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:OnServerStart", {}},
	},
}
tbConfig[2] = --§¸nh qu¸i rít Item
{
	nId = 2,
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
		{"NpcFunLib:DropSingleItem",	{ITEM_HOPQUA_GS,1,"2"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "ClickNpc",
	szName = "Npc Ng­êi TuyÕt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ng­êi TuyÕt"},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition =
	{
		{"SetDialogTitle",	{"B¾t ®Çu tõ 16/12/2015 - 31/12/2015, B»ng h÷u toµn câi vâ l©m cïng tham gia  c¸c ho¹t ®éng hÊp s«i ®éng ®Ó ®ãn chµo <color=yellow>Gi¸ng Sinh <color> n¨m nay.\n <color=yellow>Chóc quý ®ång ®¹o vâ l©m mét mïa Gi¸ng sinh an lµnh!<color>"} },
		{"AddDialogOpt",	{"§æi Ng­êi TuyÕt Vµng",4} },
		{"AddDialogOpt",	{"§æi Ng­êi TuyÕt §á",5} },
		{"AddDialogOpt",	{"NhËn th­ëng mèc sö dông Ng­êi TuyÕt Vµng",6} },
		{"AddDialogOpt",	{"NhËn th­ëng mèc sö dông Ng­êi TuyÕt §á vµ Ng­êi TuyÕt",7} },
		{"AddDialogOpt",	{"5 PhÇn th­ëng ®Çu tiªn ®¹t cho ng­êi sö dông 1000 Ng­êi TuyÕt §á vµ Ng­êi TuyÕt",16} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "§æi ITEM_NGUOITUYET_VANG",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_NGUOITUYET_VANG.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },		
		{"AddOneMaterial",	{ITEM_HOATUYET.szName,ITEM_HOATUYET,1 }},	
		{"AddOneMaterial",	{ITEM_CANHTHONG.szName,ITEM_CANHTHONG,1 }},	
		{"AddOneMaterial",	{ITEM_CHUONG_GS.szName,ITEM_CHUONG_GS,1 }},	
		{"AddOneMaterial",	{ITEM_SAO_GS.szName,ITEM_SAO_GS,1 }},			
	},	
	tbActition =
	{		
		{"PlayerFunLib:GetItem",	{ITEM_NGUOITUYET_VANG,1,EVENT_LOG_TITLE,"Doi_ITEM_NGUOITUYET_VANG"} },	
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "§æi ITEM_NGUOITUYET_DO",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_NGUOITUYET_DO.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },		
		{"AddOneMaterial",	{ITEM_HOATUYET.szName,ITEM_HOATUYET,1 }},	
		{"AddOneMaterial",	{ITEM_CANHTHONG.szName,ITEM_CANHTHONG,1 }},	
		{"AddOneMaterial",	{ITEM_CHUONG_GS.szName,ITEM_CHUONG_GS,1 }},	
		{"AddOneMaterial",	{ITEM_SAO_GS.szName,ITEM_SAO_GS,1 }},	
		{"AddOneMaterial",	{ITEM_THIEP_GS.szName,ITEM_THIEP_GS,1 }},	
	},	
	tbActition =
	{		
		{"PlayerFunLib:GetItem",	{ITEM_NGUOITUYET_DO,1,EVENT_LOG_TITLE,"Doi_ITEM_NGUOITUYET_DO"} },	
	},
}
--nhan thuong moc
tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i sù kiÖn event Noel th¸ng 12",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"C¸c h¹ ®· dïng ®­îc :\n	- Ng­êi TuyÕt Vµng : <color=yellow><lua GetBitTask(2725, 0, 12) /><color> c¸i."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta ®· sö dông h¬n   1000 Ng­êi TuyÕt Vµng",8} },
		{"AddDialogOpt",	{"Ta ®· sö dông ®­îc 2000 Ng­êi TuyÕt Vµng",9} },			
	},
}
tbConfig[7] =
{
	nId = 7,
		szMessageType = "CreateDialog",
	szName = "§èi tho¹i sù kiÖn event th¸ng 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"C¸c h¹ ®· dïng ®­îc :\n	- Ng­êi TuyÕt §á : <color=yellow><lua GetBitTask(2725, 12, 10) /><color> c¸i."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta ®· sö dông h¬n   500 Ng­êi TuyÕt §á vµ Ng­êi TuyÕt",10} },
		{"AddDialogOpt",	{"Ta ®· sö dông ®­îc 1000  Ng­êi TuyÕt §á vµ Ng­êi TuyÕt",11} },			
	},
}

---phan thuong moc Thæ Liªn Hoa
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_NguoiTuyetVang, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NguoiTuyetVang, MOC_1000, "B¹n ch­a dïng ®ñ 1000 Ng­êi TuyÕt Vµng.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_NguoiTuyetVang, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_NguoiTuyetVang["1000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1000_NguoiTuyetVang"}} },
	},
}
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 2000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_2000_NguoiTuyetVang, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NguoiTuyetVang, MOC_2000, "B¹n ch­a dïng ®ñ 2000 Ng­êi TuyÕt Vµng.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_2000_NguoiTuyetVang, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_NguoiTuyetVang["2000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc2000_NguoiTuyetVang"}} },
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_500_NguoiTuyetDo, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NguoiTuyetDo, MOC_500, "B¹n ch­a dïng ®ñ 500 Ng­êi TuyÕt §á vµ Ng­êi TuyÕt", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_500_NguoiTuyetDo, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_NguoiTuyetDo["500"],1,{EVENT_LOG_TITLE,"PhanThuongMoc500_NguoiTuyetDo"}} },
	},
}
tbConfig[11] = 
{
	nId = 11,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_NguoiTuyetDo, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NguoiTuyetDo, MOC_1000, "B¹n ch­a dïng ®ñ 1000 Ng­êi TuyÕt §á vµ Ng­êi TuyÕt", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_NguoiTuyetDo, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_NguoiTuyetDo["1000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1000_NguoiTuyetDo"}} },
	},
}

--Su dung Item
tbConfig[12] = 
{
	nId = 12,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = 201512160000,
	nEndDate  = 201512312400,
	tbMessageParam = {ITEM_NGUOITUYET_VANG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"ThisActivity:CheckUseInMap",{}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_NguoiTuyetVang, MOC_2000 , "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},
	},
	tbActition = 
	{			
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_NguoiTuyetVang, 1}},		
		{"ThisActivity:Add_CayThong",	{ID_THONG_TT} },
	},
}

tbConfig[13] = 
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = 201512160000,
	nEndDate  = 201512312400,
	tbMessageParam = {ITEM_NGUOITUYET_DO},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"ThisActivity:CheckUseInMap",{}}	,
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_NguoiTuyetDo, MOC_1000 , "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_NguoiTuyetDo, 1}},			
		{"ThisActivity:Add_CayThong",	{ID_THONG_HK} },		
	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = 201512160000,
	nEndDate  = 201512312400,
	tbMessageParam = {ITEM_HOPQUA_GS},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph¶i cã Ýt nhÊt 5 « trèng míi cã thÓ nhËn th­ëng."} },					
	},
	tbActition = 
	{
		{"tbAwardTemplet:Give",{tbAward_Use_Hop_QuaGiangsSinh,1,{EVENT_LOG_TITLE,"Use_ITEM_HOPQUA_GS"}} },
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "Sö dông Item",
	nStartDate = 201512160000,
	nEndDate  = 201512312400,
	tbMessageParam = {ITEM_NGUOI_TUYET},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_NguoiTuyetDo, MOC_1000 , "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_NguoiTuyet, MOC_200 , "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_NguoiTuyetDo, 1}},		
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_NguoiTuyet, 1}},		
		{"tbAwardTemplet:Give",{tbAward_Tree[ID_THONG_HK],1,{EVENT_LOG_TITLE,"Use_ITEM_NGUOI_TUYET"}} },
	},
}

--nhan phan thuogn top 5
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "nil",
	szName = "Nhan thuong top 5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph¶i cã Ýt nhÊt 5 « trèng míi cã thÓ nhËn th­ëng."} },					
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_RECV_TOP_5, 1 , "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_NguoiTuyetDo, MOC_1000, "B¹n ch­a dïng ®ñ 1000 Ng­êi TuyÕt §á vµ Ng­êi TuyÕt.", ">="}},
	},
	tbActition = 
	{			
		{"ThisActivity:GetAwardTop5",	{} },
	},
}