Include("\\script\\activitysys\\config\\1006\\variables.lua")
tbConfig = {}
tbConfig[1] =
{
	nId = 1,
	szMessageType = "ItemScript",
	szName = "Sö dông B¹ch Ch©n §¬n LÔ Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30149,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1676,1,0,0},tbParam={500000000}},1,"DCKyTranCacThang10", "SuDungBachChanDonLeBao"} },
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "Sö dông HuyÕt Ch©n §¬n LÔ Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30150,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1677,1,0,0},tbParam={1000000000}},1,"DCKyTranCacThang10", "SuDungHuyetChanDonLeBao"} },
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "Sö dông HuyÒn Ch©n §¬n LÔ Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30151,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,1678,1,0,0},tbParam={1500000000}},1,"DCKyTranCacThang10", "SuDungHuyenChanDonLeBao"} },
	},
}
tbConfig[4] =
{
	nId = 4,
	szMessageType = "ItemScript",
	szName = "Sö dông Tö Kim Ch©n §¬n LÔ Bao",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {{tbProp={6,1,30152,1,0,0},}},
	tbCondition = 
	{
		{"PlayerFunLib:VnCheckInCity", {"default"}},
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={6,1,2263,1,0,0},tbParam={2000000000}},1,"DCKyTranCacThang10", "SuDungTuKimChanDonLeBao"} },
	},
}
tbConfig[5] =
{
	nId = 5,
	szMessageType = "ClickNpc",
	szName = "Kú Lôc Nh©n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Kú Lôc Nh©n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"§æi trang bÞ B¹ch Hæ",6} },
	},
}
tbConfig[6] =
{
	nId = 6,
	szMessageType = "CreateDialog",
	szName = "§æi trang bÞ B¹ch Hæ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>C¸c h¹ muèn ®æi trang bÞ nµo?"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"B¹ch hæ ph¸t qu¸n",7} },
		{"AddDialogOpt",	{"B¹ch hæ kim kh¶i",8} },
		{"AddDialogOpt",	{"B¹ch hæ h¹ng liªn",9} },
		{"AddDialogOpt",	{"B¹ch hæ hé uyÓn",10} },
		{"AddDialogOpt",	{"B¹ch hæ ngäc béi",11} },
		{"AddDialogOpt",	{"B¹ch hæ hµi",12} },
		{"AddDialogOpt",	{"B¹ch hæ yªu ®¸i",13} },
		{"AddDialogOpt",	{"B¹ch hæ th­îng giíi chØ",14} },
		{"AddDialogOpt",	{"B¹ch hæ h¹ giíi chØ",15} },
		{"AddDialogOpt",	{"B¹ch hæ khÝ giíi",16} },
	},
}
tbConfig[7] = --B¹ch hæ ph¸t qu¸n
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "Mua B¹ch hæ ph¸t qu¸n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¹ch hæ ph¸t qu¸n",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Hoa §¨ng §iÖp",ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_PHATQUAN,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanNonBH"} },
	},
}
tbConfig[8] = --B¹ch Hæ Kim Kh¶i
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Mua B¹ch Hæ Kim Kh¶i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¹ch Hæ Kim Kh¶i",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,400} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_KIMKHAI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanAoBH"} },
	},
}
tbConfig[9] = --B¹ch Hæ H¹ng Liªn
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "Mua B¹ch Hæ H¹ng Liªn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¹ch Hæ H¹ng Liªn",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_HANGLIEN,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanHangLienBH"} },
	},
}
tbConfig[10] = --B¹ch Hæ Hé UyÓn
{
	nId = 10,
	szMessageType = "CreateCompose",
	szName = "Mua B¹ch Hæ Hé UyÓn",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¹ch Hæ Hé UyÓn",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_HOUYEN,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanBaoTayBH"} },
	},
}
tbConfig[11] = --B¹ch Hæ Ngäc Béi 
{
	nId = 11,
	szMessageType = "CreateCompose",
	szName = "Mua B¹ch Hæ Ngäc Béi ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¹ch Hæ Ngäc Béi ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_NGOCBOI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanNgocBoiBH"} },
	},
}
tbConfig[12] = --B¹ch Hæ Hµi 
{
	nId = 12,
	szMessageType = "CreateCompose",
	szName = "Mua B¹ch Hæ Hµi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¹ch Hæ Hµi ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_HAI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanHaiBH"} },
	},
}
tbConfig[13] = --B¹ch Hæ Yªu §¸i
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Mua B¹ch Hæ Yªu §¸i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¹ch Hæ Yªu §¸i",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,180} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_YEUDAI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanYeuDaiBH"} },
	},
}
tbConfig[14] = --B¹ch Hæ Th­îng Giíi ChØ
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "Mua B¹ch Hæ Th­îng Giíi ChØ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¹ch Hæ Th­îng Giíi ChØ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_T_GIOICHI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanThuongGioiBH"} },
	},
}
tbConfig[15] = --B¹ch Hæ H¹ Giíi ChØ
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Mua B¹ch Hæ H¹ Giíi ChØ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¹ch Hæ H¹ Giíi ChØ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,300} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_H_GIOICHI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanHaGioiBH"} },
	},
}
tbConfig[16] = --B¹ch Hæ KhÝ Giíi 
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Mua B¹ch Hæ KhÝ Giíi ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>B¹ch Hæ KhÝ Giíi ",1,1,1,0.02},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"§¼ng cÊp cña ng­¬i ch­a ®ñ 150, kh«ng thÓ tham gia ho¹t ®éng nµy",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{ITEM_DANGDIEP.szName,ITEM_DANGDIEP,500} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{BACHHO_KHIGIOI,1,EVENT_LOG_TITLE, "GhepHoaDangDiepNhanKhiGioiBH"} },
	},
}
