Include("\\script\\activitysys\\config\\1013\\variables.lua")
Include("\\script\\activitysys\\config\\1013\\awardlist.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "§èi tho¹i víi ThÇn Tµi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ThÇn Tµi"},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		--{"SetDialogTitle",	{"<npc>B¾t ®Çu tõ th¸ng 10/2012, §ång ®¹o cã thÓ tíi gÆp <npc> ë BiÖn Kinh ®Ó nép ch÷ c¸i ®Ó nhËn th­ëng"} },
		{"AddDialogOpt",	{"§æi m¶nh ch÷ c¸i",2} },
		{"AddDialogOpt",	{"Nép ch÷ c¸i",11} },
		{"AddDialogOpt",	{"Danh S¸ch top 10 nép Bé 4 ch÷",24} },
		{"AddDialogOpt",	{"NhËn th­ëng nép ®ñ hai Bé Ch÷",18} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "§æi m¶nh ch÷ c¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ muèn ®æi m¶nh ch÷ c¸i nµo?"},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"M¶nh ch÷ Vâ",3} },
		{"AddDialogOpt",	{"M¶nh ch÷ L©m",4} },
		{"AddDialogOpt",	{"M¶nh ch÷ TruyÒn",5} },
		{"AddDialogOpt",	{"M¶nh ch÷ Kú",6} },
		{"AddDialogOpt",	{"M¶nh ch÷ B¸t",7} },
		{"AddDialogOpt",	{"M¶nh ch÷ M¹ch",8} },
		{"AddDialogOpt",	{"M¶nh ch÷ Ch©n",9} },
		{"AddDialogOpt",	{"M¶nh ch÷ Kinh",10} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ Vâ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ Vâ",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ Vâ",MANH_VO,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_VO,1,EVENT_LOG_TITLE,"DoiManhChuVo"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ L©m",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ L©m",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ L©m",MANH_LAM,9} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_LAM,1,EVENT_LOG_TITLE,"DoiManhChuLam"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ TruyÒn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ TruyÒn",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ TruyÒn",MANH_TRUYEN,9} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_TRUYEN,1,EVENT_LOG_TITLE,"DoiManhChuTruyen"} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ Kú",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ Kú",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ Kú",MANH_KY,9} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_KY,1,EVENT_LOG_TITLE,"DoiManhChuKy"} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ B¸t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ B¸t",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ B¸t",MANH_BAT,99} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_BAT,1,EVENT_LOG_TITLE,"DoiManhChuBat"} },
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ M¹ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ M¹ch",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ M¹ch",MANH_MACH,9} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_MACH,1,EVENT_LOG_TITLE,"DoiManhChuMach"} },
	},
}
tbConfig[9] =
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ Ch©n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ Ch©n",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ Ch©n",MANH_CHAN,9} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_CHAN,1,EVENT_LOG_TITLE,"DoiManhChuChan"} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "§æi M¶nh ch÷ Kinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"§æi M¶nh ch÷ Kinh",1,1,2,0.08},
	tbCondition = 
	{
		{"AddOneMaterial",	{"M¶nh ch÷ Kinh",MANH_KINH,9} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{CHU_KINH,1,EVENT_LOG_TITLE,"DoiManhChuKinh"} },
	},
}
tbConfig[11] =
{
	nId = 11,
	szMessageType = "CreateDialog",
	szName = "Nép ch÷ c¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ muèn nép ch÷ c¸i nµo?"},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Nép ch÷ TruyÒn Kú",12} },
		{"AddDialogOpt",	{"Nép ch÷ L©m TruyÒn Kú",13} },
		{"AddDialogOpt",	{"Nép ch÷ Vâ L©m TruyÒn Kú",14} },
		{"AddDialogOpt",	{"Nép ch÷ Ch©n Kinh",15} },
		{"AddDialogOpt",	{"Nép ch÷ M¹ch Ch©n Kinh",16} },
		{"AddDialogOpt",	{"Nép ch÷ B¸t M¹ch Ch©n Kinh",17} },
--		{"AddDialogOpt",	{"Nép ch÷ B¸t M¹ch Ch©n Kinh Vâ L©m TruyÒn Kú",18} },
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ TruyÒn - Kú",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ TruyÒn Kú",1,1,2,0.02},
	tbCondition = 
	{
		{"ThisActivity:CheckVatPhamLimit", {"NopTruyenKy",501,TASK_TRUYENKY.nMaxValue,TASK_TRUYENKY}},
		{"AddOneMaterial",	{"TruyÒn",CHU_TRUYEN,1} },
		{"AddOneMaterial",	{"Kú",CHU_KY,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopTruyenKy", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[13] =
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ L©m - TruyÒn - Kú",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ L©m TruyÒn Kú",1,1,2,0.02},
	tbCondition = 
	{
		{"ThisActivity:CheckVatPhamLimit", {"NopLamTruyenKy",69,TASK_LAMTRUYENKY.nMaxValue,TASK_LAMTRUYENKY}},
		{"AddOneMaterial",	{"L©m",CHU_LAM,1} },
		{"AddOneMaterial",	{"TruyÒn",CHU_TRUYEN,1} },
		{"AddOneMaterial",	{"Kú",CHU_KY,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopLamTruyenKy", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[14] =
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ Vâ - L©m - TruyÒn - Kú",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ Vâ L©m TruyÒn Kú",1,1,2,0.02},
	tbCondition = 
	{
		{"ThisActivity:CheckVatPhamLimit", {"NopVoLamTruyenKy",9,TASK_VOLAMTRUYENKY.nMaxValue,TASK_VOLAMTRUYENKY}},
		{"AddOneMaterial",	{"Vâ",CHU_VO,1} },
		{"AddOneMaterial",	{"L©m",CHU_LAM,1} },
		{"AddOneMaterial",	{"TruyÒn",CHU_TRUYEN,1} },
		{"AddOneMaterial",	{"Kú",CHU_KY,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopVoLamTruyenKy", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[15] =
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ Ch©n - Kinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ Ch©n Kinh",1,1,2,0.02},
	tbCondition = 
	{
		{"ThisActivity:CheckVatPhamLimit", {"NopChanKinh",501,TASK_CHANKINH.nMaxValue,TASK_CHANKINH}},
		{"AddOneMaterial",	{"Ch©n",CHU_CHAN,1} },
		{"AddOneMaterial",	{"Kinh",CHU_KINH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopChanKinh", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[16] =
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ M¹ch - Ch©n - Kinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ M¹ch Ch©n Kinh",1,1,2,0.02},
	tbCondition = 
	{
		{"ThisActivity:CheckVatPhamLimit", {"NopMachChanKinh",69,TASK_MACHCHANKINH.nMaxValue,TASK_MACHCHANKINH}},
		{"AddOneMaterial",	{"M¹ch",CHU_MACH,1} },
		{"AddOneMaterial",	{"Ch©n",CHU_CHAN,1} },
		{"AddOneMaterial",	{"Kinh",CHU_KINH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopMachChanKinh", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[17] =
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Nép ch÷ B¸t - M¹ch - Ch©n - Kinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nép ch÷ B¸t M¹ch Ch©n Kinh",1,1,2,0.02},
	tbCondition = 
	{
		{"ThisActivity:CheckVatPhamLimit", {"NopBatMachChanKinh",9,TASK_BATMACHCHANKINH.nMaxValue,TASK_BATMACHCHANKINH}},
		{"AddOneMaterial",	{"B¸t",CHU_BAT,1} },
		{"AddOneMaterial",	{"M¹ch",CHU_MACH,1} },
		{"AddOneMaterial",	{"Ch©n",CHU_CHAN,1} },
		{"AddOneMaterial",	{"Kinh",CHU_KINH,1} },
	},
	tbActition = 
	{
		{"ThisActivity:NopBatMachChanKinh", {nil}},
		{"ThisActivity:Global2File", {nil}},
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "nil",
	szName = "NhËn th­ëng nép ®ñ B¸t - M¹ch - Ch©n - Kinh - VLTK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckAwardLimit", {nil}},
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:setBitTask", {TASK_BMCK_VLTK, 1}},
		{"PlayerFunLib:AddExp",	{2e9,0,EVENT_LOG_TITLE,"NopDu2BoChu"} },
	},
}
tbConfig[19] = --Load Npc
{
	nId = 19,
	szMessageType = "ServerStart",
	szName = "KÝch Ho¹t Npc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:StartServer",	{nil} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "HuoYueDu",
	szName = "HuoYueDu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:GetAwardEvent",	{1} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "HarvestPlants",
	szName = "Plant tree award",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"tianlu_tree"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:GetAwardEvent",	{2} },
	},
}
tbConfig[22] = 
{
	nId = 22,
	szMessageType = "ItemScript",
	szName = "Thiªn long v« cùc ®an",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {THIENLONG_VCD},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ ®Ó sö dông ®¹o cô, h·y cè g¾ng luyÖn tËp thªm.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TASK_TL_VCD,8,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Kh«ng gian hµnh trang cña ng­¬i kh«ng ®ñ."} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {TASK_TL_VCD, 1}},
		{"PlayerFunLib:AddTask",	{4000,2000} },
		{"PlayerFunLib:GetItem",	{ITEM_HMD_1000,1,EVENT_LOG_TITLE,"SuDungThienLongVoCucDan"} },
	},
}
tbConfig[23] = 
{
	nId = 23,
	szMessageType = "ItemScript",
	szName = "Hçn nguyªn v« cùc ®an",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {HONNGUYEN_VCD},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña c¸c h¹ kh«ng ®ñ ®Ó sö dông ®¹o cô, h·y cè g¾ng luyÖn tËp thªm.",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue",	{TASK_HN_VCD,8,"§· ®¹t ®Õn giíi h¹n, kh«ng thÓ sö dông tiÕp","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{2,"Kh«ng gian hµnh trang cña ng­¬i kh«ng ®ñ."} },
	},
	tbActition = 
	{
		{"tbVNG_BitTask_Lib:addTask", {TASK_HN_VCD, 1}},
		{"PlayerFunLib:AddTask",	{4000,500} },
		{"PlayerFunLib:GetItem",	{ITEM_HMD_500,1,EVENT_LOG_TITLE,"SuDungHonNguyenVoCucDan"} },
	},
}
tbConfig[24] =
{
	nId = 24,
	szMessageType = "CreateDialog",
	szName = "hiÓn thÞ top 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>§¹i hiÖp muèn xem top bé ch÷ nµo?"},
	tbCondition = 
	{
		--{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Xem xÕp h¹ng bé ch÷ Vâ L©m TruyÒn Kú",25} },
		{"AddDialogOpt",	{"Xem xÕp h¹ng bé ch÷ B¸t M¹ch Ch©n Kinh",26} },
		{"AddDialogOpt",	{"Xem xÕp h¹ng n¹p ®ñ 2 bé ch÷",27} },
	},
}
tbConfig[25] =
{
	nId = 25,
	szMessageType = "nil",
	szName = "Xem th«ng tin TOP 10 nép ®ñ bé ch÷ VLTK",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:ShowTop",	{"Vâ L©m TruyÒn Kú","VoLamTruyenKy"} },
	},
}
tbConfig[26] =
{
	nId = 26,
	szMessageType = "nil",
	szName = "Xem th«ng tin TOP 10 nép ®ñ bé ch÷ B¸t M¹ch Ch©n Kinh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:ShowTop",	{"B¸t M¹ch Ch©n Kinh","BatMachChanKinh"} },
	},
}
tbConfig[27] =
{
	nId = 27,
	szMessageType = "nil",
	szName = "Xem th«ng tin TOP 10 nép ®ñ 2 bé ch÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Show_BMCK_VLTK",	{nil} },
	},
}