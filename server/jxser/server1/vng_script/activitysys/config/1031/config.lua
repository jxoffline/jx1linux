Include("\\vng_script\\activitysys\\config\\1031\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1031\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1031\\awardlist.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\vng_script\\vng_lib\\bittask_lib.lua")

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
		{"ThisActivity:OnServerStart", {}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "ChiHang",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {" "},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition =
	{	
		{"SetDialogTitle",	{"<npc>N¨m nay lÔ héi Trung Thu cã chÞ H»ng gi¸ng trÇn, hiÖn diÖn ®Ó ®ãn tr¨ng r»m cïng c¸c ®ång ®¹o toµn câi vâ l©m víi nhiÒu ho¹t ®éng s«i næi tõ <color=yellow>09/09/2015 - 23/09/2015<color>."} },	
		{"AddDialogOpt",	{"Thu thËp lång ®Ìn",3} },		
		{"AddDialogOpt",	{"§æi b¸nh trung thu Minh NguyÖt",4} },		
		{"AddDialogOpt",	{"§æi b¸nh trung thu Viªn NguyÖt",5} },			
		{"AddDialogOpt",	{"NhËn phÇn th­ëng mèc sö dông b¸nh trung thu Viªn nguyÖt",6} },	
		{"AddDialogOpt",	{"NhËn phÇn th­ëng mèc sö dông b¸nh trung thu Hoµng nguyÖt",7} },	
	},
}

tbConfig[3] =
{
	nId = 3,
	szMessageType = "nil",
	szName = "Thu Thap Long Den",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },				
	},
	
	tbActition =
	{
		{"ThisActivity:ThuThapLongDen",	{} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "§æi vËt phÈm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BANH_TT_MINHNGUYET.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },		
		{"AddOneMaterial",	{ITEM_LD_NGOISAO.szName,ITEM_LD_NGOISAO,1} },		
		{"AddOneMaterial",	{ITEM_LD_ONG.szName,ITEM_LD_ONG,1} },
		{"AddOneMaterial",	{ITEM_LD_TRON.szName,ITEM_LD_TRON,1} },
		{"AddOneMaterial",	{ITEM_LD_CACHEP.szName,ITEM_LD_CACHEP,1} },
	},
	
	tbActition =
	{
		{"PlayerFunLib:GetItem",	{ITEM_BANH_TT_MINHNGUYET,1,EVENT_LOG_TITLE,"Doi_ITEM_BANH_TT_MINHNGUYET"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "§æi vËt phÈm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BANH_TT_VIENNGUYET.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },		
		{"AddOneMaterial",	{ITEM_LD_NGOISAO.szName,ITEM_LD_NGOISAO,1} },		
		{"AddOneMaterial",	{ITEM_LD_ONG.szName,ITEM_LD_ONG,1} },
		{"AddOneMaterial",	{ITEM_LD_TRON.szName,ITEM_LD_TRON,1} },
		{"AddOneMaterial",	{ITEM_LD_BUOM_BUOM.szName,ITEM_LD_BUOM_BUOM,1} },		
	},
	
	tbActition =
	{
		{"PlayerFunLib:GetItem",	{ITEM_BANH_TT_VIENNGUYET,1,EVENT_LOG_TITLE,"Doi_ITEM_BANH_TT_VIENNGUYET"} },
	},
}
--nhan thuong moc

tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i sù kiÖn mini event th¸ng 9",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B»ng h÷u ®· sö dông B¸nh Trung Thu Viªn NguyÖt : <color=yellow><lua GetBitTask(2708, 13, 10) /><color> c¸i."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta ®· sö dông h¬n  500 B¸nh Trung Thu Viªn NguyÖt",8} },
		{"AddDialogOpt",	{"Ta ®· sö dông ®­îc 1000  B¸nh Trung Thu Viªn NguyÖt",9} },		
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i sù kiÖn mini event th¸ng 9",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B»ng h÷u ®· sö dông B¸nh Trung Thu Viªn NguyÖt : <color=yellow><lua GetBitTask(2709, 0, 12) /><color> c¸i."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta ®· sö dông h¬n  500 B¸nh Trung Thu Hoµng NguyÖt",10} },
		{"AddDialogOpt",	{"Ta ®· sö dông ®­îc 1000  B¸nh Trung Thu Hoµng NguyÖt",11} },		
	},
}

---phan thuong moc
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
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_500_BTT_VienNguyet, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_VienNguyet, MOC_500, "B¹n ch­a dïng ®ñ 500 c¸i.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_500_BTT_VienNguyet, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VienNguyet["500"],1,{EVENT_LOG_TITLE,"PT_Moc500_BTT_VienNguyet"}} },
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
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_BTT_VienNguyet, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_VienNguyet, MOC_1000, "B¹n ch­a dïng ®ñ 1000 c¸i.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_BTT_VienNguyet, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_VienNguyet["1000"],1,{EVENT_LOG_TITLE,"PT_Moc1000_BTT_VienNguyet"}} },
	},
}

---Nhan thuong moc su dung
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
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_500_BTT_HoangNguyet, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_HoangNguyet, MOC_500, "B¹n ch­a dïng ®ñ 500 c¸i.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_500_BTT_HoangNguyet, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_HoangNguyet["500"],1,{EVENT_LOG_TITLE,"PhanThuongMoc500_BTT_HoangNguyet"}} },
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
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_RECV_MOC_1000_BTT_HoangNguyet, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_HoangNguyet, MOC_1000, "B¹n ch­a dïng ®ñ 1000 c¸i.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_RECV_MOC_1000_BTT_HoangNguyet, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit_HoangNguyet["1000"],1,{EVENT_LOG_TITLE,"PhanThuongMoc1000_BTT_HoangNguyet"}} },
	},
}

--Su dung Item
tbConfig[12] = 
{
	nId = 12,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = 201509100000,
	nEndDate  = 201509242400,
	tbMessageParam = {ITEM_BANH_TT_MINHNGUYET},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_MinhNguyet, MOC_2000, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BTT_MinhNguyet, 1}},
		{"tbAwardTemplet:Give",{tbAward_Use_MinhNguyet,1,{EVENT_LOG_TITLE,"Use_BTT_MinhNguyet"}} },
	},
}
tbConfig[13] = 
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = 201509100000,
	nEndDate  = 201509242400,
	tbMessageParam = {ITEM_BANH_TT_VIENNGUYET},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_VienNguyet, MOC_1000, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BTT_VienNguyet, 1}},
		{"tbAwardTemplet:Give",{tbAward_Use_VienNguyet,1,{EVENT_LOG_TITLE,"Use_BTT_VienNguyet"}} },
	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = 201509100000,
	nEndDate  = 201509242400,
	tbMessageParam = {ITEM_BANH_TT_HOANGNGUYET},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BTT_HoangNguyet, MOC_1000, "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},	
	},
	tbActition = 
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_USE_BTT_HoangNguyet, 1}},
		{"tbAwardTemplet:Give",{tbAward_Use_HoangNguyet,1,{EVENT_LOG_TITLE,"Use_BTT_HoangNguyet"}} },
	},
}
tbConfig[15] = 
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = 201509100000,
	nEndDate  = 201509242400,
	tbMessageParam = {ITEM_HOP_LD_BUOMBUOM},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph¶i cã Ýt nhÊt 5 « trèng míi cã thÓ sö dông."} },			
		
	},
	tbActition = 
	{			
		{"tbAwardTemplet:Give",{tbAward_HopLDBuomBuom,1,{EVENT_LOG_TITLE,"Use_HOP_LD_BUOMBUOM"}} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = 201509100000,
	nEndDate  = 201509242400,
	tbMessageParam = {ITEM_HOP_LD_KEOQUAN},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,2,1,"default"} },
		
	},
	tbActition = 
	{			
		{"tbAwardTemplet:Give",{tbAward_HopLDKeoQuan,1,{EVENT_LOG_TITLE,"Use_HOP_LD_KEOQUAN"}} },
	},
}
