Include("\\script\\activitysys\\config\\22\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo vâ s­",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Vâ S­ "},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho¹t ®éng b¸o ®¸p ©n s­",2} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i víi vâ s­",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L¹i mét n¨m s­¬ng phong m­a tuyÕt, l¹i mét n¨m ®µo lª táa h­¬ng,  Kh«ng biÕt ®Ö tö cña ta hµnh tÈu giang hå ra sao råi?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng b¸o ®¸p ©n s­",3} },
		{"AddDialogOpt",	{"Mêi vâ s­ dïng §ç Khang Töu",4} },
		{"AddDialogOpt",	{"D©ng tÆng Ngò S¾c H­¬ng Bao",23} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Giíi thiÖu ho¹t ®éng b¸o ®¸p ©n s­",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Vµo thêi gian tõ 18/11/2010 ®Õn 13/12/2010 lµ thêi gian ho¹t ®éng b¸o ®¸p ©n s­. C¸c h¹ cã thÓ xem c¸ch tham gia ë trang chñ."},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "Mêi vâ s­ dïng §ç Khang Töu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2572,-1,-1,-1},},nDukangjiuCount,"Hµnh trang kh«ng cã §ç Khang Töu"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddDukangjiuAward",	{TSK_DuKangJiu,TSK_Date_DuKangJiu,nDukangjiuCount} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo ch­ëng ®¨ng cung n÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ch­ëng §¨ng Cung N÷"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ho¹t ®éng b¸o ®¸p ©n s­",6} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i víi ch­ëng ®¨ng cung n÷",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"GÇn ®©y ta cÇn 1 Ýt T©y Hå long tÜnh trµ, t¬ lôa, sîi chØ mµu, trung d­îc , ta rÊt cÇn gÊp nh÷ng thø nµy, nÕu nh­ ng­¬i tÆng ta nh÷ng thø trªn, ta sÏ tÆng cho ng­¬i phÇn th­ëng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng b¸o ®¸p ©n s­",3} },
		{"AddDialogOpt",	{"§æi t¬ t»m h­¬ng bao",7} },
		{"AddDialogOpt",	{"§æi ngò s¾c h­¬ng bao",8} },
		{"AddDialogOpt",	{"§æi trung d­îc h­¬ng bao",9} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "§æi t¬ t»m h­¬ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T¬ T»m H­¬ng Bao",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T©y Hå Long TÜnh Trµ",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"T¬ T»m",{tbProp={6,1,2574,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2577,1,0,0},nExpiredTime=20101220,},1,"Ng­êi ch¬i nhËn ®­îc T¬ T»m H­¬ng Bao"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "§æi ngò s¾c h­¬ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ngò S¾c H­¬ng Bao",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T©y Hå Long TÜnh Trµ",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"Sîi chØ mµu",{tbProp={6,1,2575,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2578,1,0,0},nExpiredTime=20101220,},1,"Ng­êi ch¬i nhËn ®­îc ngò s¾c h­¬ng bao"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "§æi trung d­îc h­¬ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Trung D­îc H­¬ng Bao",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"T©y Hå Long TÜnh Trµ",{tbProp={6,1,2573,-1,-1,-1},nExpiredTime=20101213,},1} },
		{"AddOneMaterial",	{"Trung D­îc",{tbProp={6,1,2576,-1,-1,-1},nExpiredTime=20101213,},1} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2579,1,0,0},nExpiredTime=20101220,},1,"Ng­êi ch¬i nhËn ®­îc trung d­îc h­¬ng bao"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "FinishSongJin",
	szName = "Tèng Kim 500",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",500,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"Event nhµ gi¸o_Tèng Kim"} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "FinishSongJin",
	szName = "Tèng Kim 3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"Event nhµ gi¸o_Tèng Kim"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "NpcOnDeath",
	szName = "Phong L¨ng ®é",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckBoatBoss",	{nil} },
	},
	tbActition = 
	{
		{"NpcFunLib:DropSingleItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},15,"100"} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "Chuanguan",
	szName = "V­ît ¶i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"17"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},3,"Event nhµ gi¸o_V­ît ¶i"} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "nil",
	szName = "§èi tho¹i víi thÝ luyÖn ®­êng tr­ëng l·o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckTaskDaily",	{TSK_ShiLianTang,nDailyShiliantang,"H«m nay kh«ng thÓ nhËn thªm","<"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ chç, cÇn Ýt nhÊt kh«ng gian 1*1"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},1,"Event nhµ gi¸o_ThÝ luyÖn ®­êng"} },
		{"ThisActivity:AddTaskDaily",	{TSK_ShiLianTang,nDailyShiliantang} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "NpcOnDeath",
	szName = "S¸t thñ cÊp 90",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"NpcFunLib:CheckKillerdBoss",	{90} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},2,"Event nhµ gi¸o_S¸t thñ cÊp 90"} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo hµng rong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Hµng rong"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Mua t¬ lôa",17} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Mua t¬ lôa",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"T¬ T»m",1,1,1,1},
	tbCondition = 
	{
		{"AddOneMaterial",	{"Ng©n l­îng",{nJxb=1},30000} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2574,1,0,0},nExpiredTime=20101213,},1,"Event nhµ gi¸o_Hµng Rong"} },
	},
}
tbConfig[18] = --Ò»¸öÏ¸½Ú
{
	nId = 18,
	szMessageType = "ItemScript",
	szName = "Sö dông §ç Khang töu lÔ bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2580,-1,-1,-1},nExpiredTime=20101213,}},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ chç, cÇn Ýt nhÊt kh«ng gian 1*1"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2572,1,0,0},nExpiredTime=20101213,},2,"Event nhµ gi¸o_Sö dông §ç Khang Töu lÔ bao"} },
	},
}
tbConfig[19] = --Ò»¸öÏ¸½Ú
{
	nId = 19,
	szMessageType = "ItemScript",
	szName = "Sö dông t¬ t»m h­¬ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2577,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckTask",	{TSK_SiChouXiangBao,nSCXiangBaoUpExp,"Sö dông t¬ t»m h­¬ng bao ®¹t ®Õn giíi h¹n cao nhÊt, kh«ng thÓ sö dông thªm.","<"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"§¹i hiÖp ®· ®¹t giíi h¹n sö dông vËt phÈm nµy","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddSichouxiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[20] = --Ò»¸öÏ¸½Ú
{
	nId = 20,
	szMessageType = "ItemScript",
	szName = "Sö dông ngò s¾c h­¬ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2578,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckFreeRoom",	{2,3,1,"Hµnh trang kh«ng ®ñ chç, cÇn Ýt nhÊt kh«ng gian 2*3"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"§¹i hiÖp ®· ®¹t giíi h¹n sö dông vËt phÈm nµy","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddWucaixiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[21] = --Ò»¸öÏ¸½Ú
{
	nId = 21,
	szMessageType = "ItemScript",
	szName = "Sö dông trung d­îc h­¬ng bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,2579,-1,-1,-1},nExpiredTime=20101220,}},
	tbCondition = 
	{
		{"ThisActivity:CheckFreeRoom",	{2,5,1,"Hµnh trang kh«ng ®ñ chç, cÇn Ýt nhÊt kh«ng gian 2*5"} },
		{"ThisActivity:CheckTask",	{TSK_WCAndZYxiangbao,1e6,"§¹i hiÖp ®· ®¹t giíi h¹n sö dông vËt phÈm nµy","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddZhongyaoxiangbaoAward",	{TSK_WCAndZYxiangbao} },
	},
}
tbConfig[22] = --Ò»¸öÏ¸½Ú
{
	nId = 22,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo thÝ luyÖn ®­êng tr­ëng l·o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Tr­ëng l·o ThÝ LuyÖn §­êng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"NhËn §ç Khang Töu",14} },
	},
}

tbConfig[23] = --Ò»¸öÏ¸½Ú
{
	nId = 23,
	szMessageType = "nil",
	szName = "D©ng tÆng Ngò S¾c H­¬ng Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2578,-1,-1,-1},},1,"Hµnh trang kh«ng cã Ngò S¾c H­¬ng Bao"} },
	},
	tbActition = 
	{
		{"ThisActivity:Give5SHB",	{nEXP_Give_NSHB, TSK_Date_Give_NSHB} },
	},
}