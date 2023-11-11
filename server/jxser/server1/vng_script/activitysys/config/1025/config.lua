Include("\\vng_script\\activitysys\\config\\1025\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1025\\awardlist.lua")
Include("\\vng_script\\activitysys\\config\\1025\\extend.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")

tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click shijianzongguan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tæng Qu¶n Sù KiÖn"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Lµm b¸nh sinh nhËt",2} },
		{"AddDialogOpt",	{"NhËn tói nguyªn liÖu",3} },
		{"AddDialogOpt",	{"Xem thêi gian tÝch lòy online",10} },									
		{"AddDialogOpt",	{"NhËn phÇn th­ëng mèc sù kiÖn sinh nhËt",4} },		
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "CreateCompose",
	szName = "GhÐp B¸nh sinh nhËt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_BANH_SN.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },		
		{"AddOneMaterial",	{ITEM_DUONG.szName,ITEM_DUONG,1} },
		{"AddOneMaterial",	{ITEM_TRUNG.szName,ITEM_TRUNG,1} },
		{"AddOneMaterial",	{ITEM_BOT.szName,ITEM_BOT,1} },
		{"AddOneMaterial",	{ITEM_SUA.szName,ITEM_SUA,1} },
	},
	
	tbActition =
	{ 
		{"PlayerFunLib:GetItem",	{ITEM_BANH_SN,1,EVENT_LOG_TITLE,"GhetBanhSinhNhat"} },
	}, 
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "nil",
	szName = "§èi tho¹i sù kiÖn event mõng sinh nhËt ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Thêi gian online tÝch lòy ®­îc 5 phót b»ng h÷u sÏ nhËn ®­îc 1 <color=yellow>Tói Nguyªn LiÖu. L­u ý: thêi gian tÝch lòy qua ngµy sÏ ®­îc tÝnh l¹i tõ ®Çu."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"ThisActivity:GetAwardOnline",	{} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i sù kiÖn event mõng sinh nhËt ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Kû niÖm sinh nhËt lÇn thø nhÊt, lÇn nµy \n<color=yellow>Quµ Mõng Sinh NhËt<color> chøa ®ùng rÊt nhiÒu vËt phÈm quý hiÕm xuÊt hiÖn. C¸c b»ng h÷u h·y nhanh chãng t×m ®Ó së h÷u nh÷ng vËt phÈm quý hay trang bÞ Hoµng Kim hiÕm.\n- §Æc biÖt khi sö dông B¸nh Sinh NhËt ®¹t ®Õn c¸c giíi h¹n ta sÏ  cã thªm phÇn th­ëng.\n<color=yellow>Sè B¸nh Sinh NhËt ®· dïng:<lua GetBitTask(2693, 1, 12) /><color>"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Ta ®· sö dông h¬n   100 c¸i",5} },
		{"AddDialogOpt",	{"Ta ®· sö dông ®­îc  800 c¸i",6} },			
	},
}
---phan thuong moc
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 100",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_NhanMoc_100, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BANH_SN, MOC_100, "B¹n ch­a dïng ®ñ 100 B¸nh Sinh NhËt.", ">="}},
	},
	tbActition =
	{			
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_NhanMoc_100, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit["100"],1,{EVENT_LOG_TITLE,"PhanThuongMoc100_BSN"}} },
	},
}
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng mèc sö dông 800",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },		
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_NhanMoc_800, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_USE_BANH_SN, MOC_800, "B¹n ch­a dïng ®ñ 800 B¸nh Sinh NhËt.", ">="}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_NhanMoc_800, 1}},			
		{"tbAwardTemplet:Give",{tbAward_Limit["800"],1,{EVENT_LOG_TITLE,"PhanThuongMoc800_BSN"}} },		
	},
}

--su dung item script
tbConfig[7] =
{
	nId = 7,
	szMessageType = "ItemScript",
	szName = "Sö dông Item",
	nStartDate = 201505160000,
	nEndDate  = 201506052400,
	tbMessageParam = {ITEM_TUI_NGUYEN_LIEU},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },		
	},
	tbActition =
	{			
		{"tbAwardTemplet:Give",{tbAward_TuiNguyenLieu,1,{EVENT_LOG_TITLE,"Use_TuiNguyenLieu"}} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "Sö dông Item",
	nStartDate = 201505160000,
	nEndDate  = 201506052400,
	tbMessageParam = {ITEM_QUA_MUNG_SN},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_TUI_SN, MAX_USE_1000 , "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_TUI_SN, 1}},		
		{"tbAwardTemplet:Give",{tbAward_TuiQuaSinhNhat,1,{EVENT_LOG_TITLE,"SuDungTuiQuaSinhNhat"}} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "Sö dông Item",
	nStartDate = 201505160000,
	nEndDate  = 201506052400,
	tbMessageParam = {ITEM_BANH_SN},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", { tbBITTSK_LIMIT_USE_BANH_SN, MAX_USE_1000 , "Sö dông vËt phÈm qu¸ giíi h¹n, kh«ng thÓ sö dông thªm", "<"}},
	},
	tbActition =
	{		
		{"tbVNG_BitTask_Lib:addTask", { tbBITTSK_LIMIT_USE_BANH_SN, 1}},		
		{"tbAwardTemplet:Give",{tbAward_BanhSinhNhat,1,{EVENT_LOG_TITLE,"SuDungBanhSinhNhat"}} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "nil",
	szName = "§èi tho¹i sù kiÖn event mõng sinh nhËt ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Thêi gian online tÝch lòy ®­îc 5 phót b»ng h÷u sÏ nhËn ®­îc 1 <color=yellow>Tói Nguyªn LiÖu<color>. L­u ý: thêi gian tÝch lòy qua ngµy sÏ ®­îc tÝnh l¹i tõ ®Çu."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"ThisActivity:ShowOnlineTime",	{} },
	},
}