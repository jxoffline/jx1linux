Include("\\vng_script\\activitysys\\config\\1033\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1033\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1033\\awardlist.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

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
	szName = "Tæng Qu¶n Sù KiÖn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tæng Qu¶n Sù KiÖn"},
	tbCondition =
	{		
		
	},
	tbActition =
	{		
		{"AddDialogOpt",	{"§æi Hoµng Kim Th¹ch",3} },		
		{"AddDialogOpt",	{"§æi R­¬ng Hoµng Kim M«n Ph¸i",4} },	
		{"AddDialogOpt",	{"§æi NhÉn Kim Quang",5} },		
		{"AddDialogOpt",	{"§æi Kim Quang thÇn bÝ b¶o r­¬ng",6} },	
	},
}
--Doi Hoang Kim Thach
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "CreateCompose",
	szName = "§æi vËt phÈm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_HOANGKIMTHACH.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },		
		{"AddOneMaterial",	{ITEM_HUYENKIMTHACH.szName,ITEM_HUYENKIMTHACH,4} },	
	},	
	tbActition =
	{
		{"PlayerFunLib:GetItem",	{ITEM_HOANGKIMTHACH,1,EVENT_LOG_TITLE,"Doi - ITEM_HOANGKIMTHACH"} },
	},
}
--doi Ruong HKMP
tbConfig[4] = 
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i sù kiÖn event th¸ng 12",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"\n Thu thËp Hoµng Kim Th¹ch ®Ó ®æi ngÉu nhiªn nhËn ®­îc c¸c b¶o r­¬ng Hoµng Kim M«n ph¸i:\n:<color=yellow>R­¬ng 5 ph¸i cò:<color> Thiªn V­¬ng, Ngò §éc, Thóy Yªn, C«n L«n, Thiªn NhÉn.\n:<color=yellow>R­¬ng 5 ph¸i míi:<color> ThiÕu L©m, §­êng M«n, Nga My, Vâ §ang, C¸i Bang."},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"§æi r­¬ng 5 ph¸i cò",7} },
		{"AddDialogOpt",	{"§æi r­¬ng 5 ph¸i míi",8} },	
				
	},
}
--Doi Nhan Kim Quan
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "§æi vËt phÈm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"NhÉn Kim Quang",szName,1,1,1,0},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },		
		{"AddOneMaterial",	{ITEM_KIMQUANG_THACH.szName,ITEM_KIMQUANG_THACH,600} },	 --600 Kim quang thach
	},	
	tbActition =
	{
		{"tbAwardTemplet:Give",{tbAward_Nhan_KimQuang,1,{EVENT_LOG_TITLE,"DoiNhanKimQuang"}} },
		{"Talk",{1,"","Chóc mõng c¸c h¹ ®æi thµnh c«ng NhÉn Kim Quang."}},
	},
}
--Doi Kim quang ruong
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "§æi vËt phÈm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {ITEM_KIMQUANG_TB_RUONG.szName,1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },		
		{"AddOneMaterial",	{ITEM_KIMQUANG_THACH.szName,ITEM_KIMQUANG_THACH,100} },	 --100 Kim quang thach
	},	
	tbActition =
	{
		{"PlayerFunLib:GetItem",	{ITEM_KIMQUANG_TB_RUONG,1,EVENT_LOG_TITLE,"Doi_ITEM_KIMQUANG_TB_RUONG"} },
	},
}
tbConfig[7] =
{
	nId = 7,
	szMessageType = "nil",
	szName = "§æi vËt phÈm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },			
	},
	
	tbActition =
	{
		{"ThisActivity:DoiRuongHKMP_UI",	{OLDBOX} }, 
	},
}
tbConfig[8] =
{
	nId = 8,
	szMessageType = "nil",
	szName = "§æi vËt phÈm",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel",	{50,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, h·y luyÖn tËp thªm!",">="} },			
	},
	
	tbActition =
	{
		{"ThisActivity:DoiRuongHKMP_UI",	{NEWBOX} }, 
	},
}
--Use Item
tbConfig[9] = 
{
	nId = 9,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_KIMQUANG_TB_RUONG},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },					
	},
	tbActition = 
	{			
		{"tbAwardTemplet:Give",{tbAward_Use_KimQuang_Ruong,1,{EVENT_LOG_TITLE,"Use_ITEM_KIMQUANG_TB_RUONG"}} },	
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "Sö dông ",
	nStartDate = nil,
	nEndDate  = DATE_END_USE_ITEM,
	tbMessageParam = {ITEM_KIMQUANG_LENH},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"ThisActivity:CheckUseInMap",{}}		,
	},
	tbActition = 
	{			
		{"ThisActivity:Call_Gold_Boss",	{} },
	},
}