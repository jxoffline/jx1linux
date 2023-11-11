Include("\\script\\activitysys\\config\\1012\\variables.lua")
tbConfig = {}
tbConfig[1] = --Load Npc
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "KÝch Ho¹t Npc",
	nStartDate = 201209270000,
	nEndDate  = 201210312400,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201209\\zhongqiu.lua"} },
	},
	tbActition = 
	{
		{"tbzhongqiu:AddTaskNpc",	{nil} },
	},
}
tbConfig[2] = --Nép Lång §Ìn
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "§èi tho¹i víi H»ng Nga",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"H»ng Nga"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Trong thêi gian 0 giê 30/09/2012 ®Õn 24 giê 31/10/2012, ®ång ®¹o cã thÓ hîp thµnh c¸c lo¹i lång ®Ìn ë chÞ H»ng, vµ nép lång ®Ìn kÐo qu©n cho chÞ H»ng sÏ nhËn ®­îc phÇn th­ëng kinh nghiÖm, lÇn nép 1000, 2000, 3000,... sÏ nhËn ®­îc kinh nghiÖm nhiÒu h¬n b×nh th­êng. §é lín cña h»ng nga sÏ tïy thuéc vµo sè l­îng lång ®Ìn kÐo qu©n ®· nép, mçi ngµy vµo lóc 20 giê nÕu nh­ H»ng Nga ë tr¹ng th¸i lín nhÊt sÏ xuÊt hiÖn hiÖu øng b¾n ph¸o hoa, c¸c ®ång ®¹o ®øng xung quanh ®ã cã thÓ nhËn ®­îc phÇn th­ëng kinh nghiÖm. Mçi ngµy 20 giê 30 phót, h»ng nga sÏ trë vÒ tr¹ng th¸i nhá nhÊt, sè l­îng ®Ìn kÐo qu©n còng vÒ 0. Trong thêi gian ho¹t ®éng mçi ng­êi nhiÒu nhÊt chØ ®­îc nép 2000 lång ®Ìn."} },
		{"AddDialogOpt",	{"TÆng lång ®Ìn kÐo qu©n",17} },
		{"AddDialogOpt",	{"Hîp thµnh Lång §Ìn",4} },
	},
}
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "Hép B¸nh Nh©n ThÞt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {BANH_NHANTHIT_BOX},
	tbCondition = 
	{
		{"PlayerFunLib:CheckInMap",	{"11,1,37,176,162,78,80,174,121,153,101,99,100,20,53","Xin h·y sö dông t¹i thµnh thÞ hoÆc t©n thñ th«n!"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BANH_NHANTHIT,5,EVENT_LOG_TITLE,"Nhan5BanhNhanThit"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "CreateDialog",
	szName = "Hîp thµnh Lång §Ìn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ muèn hîp thµnh lo¹i lång ®Ìn nµo?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Lång ®Ìn B­¬m B­ím",5} },
		{"AddDialogOpt",	{"Lång ®Ìn Con Thá",6} },
		{"AddDialogOpt",	{"Lång ®Ìn Ph­îng",7} },
		{"AddDialogOpt",	{"Lång ®Ìn Rång",8} },
	},
}
tbConfig[5] = --Lång ®Ìn b­¬m b­ím
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh lång ®Ìn b­¬m b­ím",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Lång ®Ìn b­¬m b­ím",1,1,1,0.02},
	tbCondition = 
	{
		{"lib:CheckDay",	{20120927, 20121101, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{BANH_HATSEN.szName,BANH_HATSEN,1} },
		{"AddOneMaterial",	{BANH_DAUXANH.szName,BANH_DAUXANH,1} },
		{"AddOneMaterial",	{BANH_KHOAIMON.szName,BANH_KHOAIMON,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{LONGDEN_BB,1,EVENT_LOG_TITLE,"HopthanhlongdenBuomBuom"} },
		--{"PlayerFunLib:AddExp",	{5e5,0,EVENT_LOG_TITLE,"HopthanhlongdenBuomBuomNhanDiemExp"} },
	},
}
tbConfig[6] = --Lång ®Ìn Con Thá
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh Lång ®Ìn Con Thá",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Lång ®Ìn Con Thá",1,1,1,0.02},
	tbCondition = 
	{
		{"lib:CheckDay",	{20120927, 20121101, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{BANH_HATSEN.szName,BANH_HATSEN,1} },
		{"AddOneMaterial",	{BANH_DAUXANH.szName,BANH_DAUXANH,1} },
		{"AddOneMaterial",	{BANH_KHOAIMON.szName,BANH_KHOAIMON,1} },
		{"AddOneMaterial",	{BANH_DEO.szName,BANH_DEO,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{LONGDEN_CT,1,EVENT_LOG_TITLE,"HopthanhlongdenConTho"} },
		--{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,"HopthanhlongdenConThoNhanDiemExp"} },
	},
}
tbConfig[7] = --Lång ®Ìn Ph­îng
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh Lång ®Ìn ph­îng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Lång ®Ìn ph­îng",1,1,1,0.02},
	tbCondition = 
	{
		{"lib:CheckDay",	{20120927, 20121101, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{BANH_HATSEN.szName,BANH_HATSEN,1} },
		{"AddOneMaterial",	{BANH_DAUXANH.szName,BANH_DAUXANH,1} },
		{"AddOneMaterial",	{BANH_KHOAIMON.szName,BANH_KHOAIMON,1} },
		{"AddOneMaterial",	{BANH_NHANTHIT.szName,BANH_NHANTHIT,1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{LONGDEN_PH,1,EVENT_LOG_TITLE,"HopthanhlongdenPhuong"} },
		--{"PlayerFunLib:AddExp",	{5e6,0,EVENT_LOG_TITLE,"HopthanhlongdenPhuongNhanDiemExp"} },
	},
}
tbConfig[8] = --Lång ®Ìn rång
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Hîp thµnh Lång ®Ìn rång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Lång ®Ìn rång",1,1,1,0.02},
	tbCondition = 
	{
		{"lib:CheckDay",	{20120927, 20121101, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"AddOneMaterial",	{BANH_HATSEN.szName,BANH_HATSEN,1} },
		{"AddOneMaterial",	{BANH_DAUXANH.szName,BANH_DAUXANH,1} },
		{"AddOneMaterial",	{BANH_KHOAIMON.szName,BANH_KHOAIMON,1} },
		{"AddOneMaterial",	{BANH_THAPCAM.szName,BANH_THAPCAM,1} },	
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{LONGDEN_R,1,EVENT_LOG_TITLE,"HopthanhlongdenRong"} },
		--{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,"HopthanhlongdenRongNhanDiemExp"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "ClickNpc",
	szName = "Tæng Qu¶n Sù KiÖn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tæng Qu¶n Sù KiÖn"},
	tbCondition ={},
	tbActition = 
	{
		{"AddDialogOpt",	{"Tham gia t×m nguyªn liÖu ghÐp b¸nh Trung Thu",10} },
	},
}
tbConfig[10] =
{
	nId = 10,
	szMessageType = "nil",
	szName = "Më ¤",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:OpenUI",	{nil} },
	},
}
tbConfig[11] = --Mua B¸nh dÎo t¹i npc Hang rong
{
	nId = 11,
	szMessageType = "ClickNpc",
	szName = "Hµng rong b¸n b¸nh deo",
	nStartDate = 201209270000,
	nEndDate  = 201210312400,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua B¸nh DÎo",12} },
		{"AddDialogOpt",	{"Mua Cµ Rèt",18} },
	},
}
tbConfig[12] =
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Mua b¸nh DÎo",
	nStartDate = 201209270000,
	nEndDate  = 201210312400,
	tbMessageParam = {"B¸nh DÎo",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"20000 l­îng",{nJxb=20000,},1} },
		{"lib:CheckDay",	{20120927, 20121101, "Thêi h¹n ®æi ®· kÕt thóc"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BANH_DEO,1,EVENT_LOG_TITLE,"MuaBanhDeoNpcHangRong"} },
	},
}
tbConfig[13] = 
{
	nId = 13,
	szMessageType = "ItemScript",
	szName = "Lång §Ìn B­¬m B­ím",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {LONGDEN_BB},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTask",	{nTask_ItemScript_BB,nLimit_LongDen_BB,"Trong suèt thêi gian ho¹t ®éng mçi nh©n vËt chØ ®­îc sö dông nhiÒu nhÊt 1000 Lång ®Ìn B­¬m B­ím","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_ItemScript_BB,1} },
		{"ThisActivity:Log_LongDenBB",	{nTask_ItemScript_BB}},
	},
}
tbConfig[14] = 
{
	nId = 14,
	szMessageType = "ItemScript",
	szName = "Lång ®Ìn con thá",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {LONGDEN_CT},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTask",	{nTask_ItemScript_CT,nLimit_LongDen_CT,"Trong suèt thêi gian ho¹t ®éng mçi nh©n vËt chØ ®­îc sö dông nhiÒu nhÊt 1000 Lång ®Ìn Con Thá","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_ItemScript_CT,1} },
		--{"PlayerFunLib:AddExp",	{1e6,0,EVENT_LOG_TITLE,format("SuDung%dLanLongDenConTho",GetTask(nTask_ItemScript_CT))} },
		{"ThisActivity:Log_LongDenCT",	{nTask_ItemScript_CT} },
	},
}
tbConfig[15] = 
{
	nId = 15,
	szMessageType = "ItemScript",
	szName = "Lång ®Ìn ph­îng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {LONGDEN_PH},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTask",	{nTask_ItemScript_P,nLimit_LongDen_P,"Trong suèt thêi gian ho¹t ®éng mçi nh©n vËt chØ ®­îc sö dông nhiÒu nhÊt 2000 Lång ®Ìn Ph­îng","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_ItemScript_P,1} },
		--{"PlayerFunLib:AddExp",	{5e6,0,EVENT_LOG_TITLE,format("SuDung%dLanLongDenPhuong",GetTask(nTask_ItemScript_P))} },
		{"ThisActivity:Log_LongDenP",	{nTask_ItemScript_P} },
		{"ThisActivity:GetRabbit",{nil} },
	},
}
tbConfig[16] = 
{
	nId = 16,
	szMessageType = "ItemScript",
	szName = "Lång ®Ìn rång",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {LONGDEN_R},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckTask",	{nTask_ItemScript_R,nLimit_LongDen_R,"Trong suèt thêi gian ho¹t ®éng mçi nh©n vËt chØ ®­îc sö dông nhiÒu nhÊt 2000 Lång ®Ìn Rång","<"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTask",	{nTask_ItemScript_R,1} },
		--{"PlayerFunLib:AddExp",	{6e6,0,EVENT_LOG_TITLE,format("SuDung%dLanLongDenRong",GetTask(nTask_ItemScript_R))} },
		{"ThisActivity:Log_LongDenR",	{nTask_ItemScript_R} },
		{"ThisActivity:Use_LongDenRong",{nil}},
		{"ThisActivity:GetRabbit",{nil} },
	},
}
tbConfig[17] = --tÆng Cöu Tiªn Ngù YÕn
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Nép lång ®Ìn kÐo qu©n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Nép lång ®Ìn kÐo qu©n",1,1,1,0.02},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\event\\zhongqiu_jieri\\201209\\zhongqiu.lua"} },
		{"lib:CheckTime",	{{{000000,200000},{203000,240000}}, "Kh«ng ph¶i lµ thêi gian ho¹t ®éng"} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, lÇn sau h·y ®Õn nhÐ!",">="} },
		{"ThisActivity:ComposeLimit", {nil}},
		{"AddOneMaterial",	{"Lång §Ìn KÐo Qu©n",LONGDEN_KQ,1} },			
	},
	tbActition = 
	{
		{"ThisActivity:GiveCompose", {nil}},
	},
}
tbConfig[18] =
{
	nId = 18,
	szMessageType = "CreateCompose",
	szName = "Mua Cµ R«t",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Cµ Rèt",1,1,1,0.02},
	tbCondition = 
	{
		{"AddOneMaterial",	{"100000 l­îng",{nJxb=100000,},1} },
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{ITEM_CAROT,1,EVENT_LOG_TITLE,"MuaCaRotNpcHangRong"} },
	},
}