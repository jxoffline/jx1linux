tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo long nhi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"BÐ Long"},
	tbCondition = 
	{
		{"ThisActivity:IsOpen",	{nil} },
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Ta muèn ®æi phi phong",2} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "Ta muèn ®æi phi phong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ChØ cã ®¹i hiÖp danh tiÕng lÉy lõng, míi xøng ®¸ng nhËn ®­îc phi phong tuyÖt ®Ñp cña ta, ®¹i hiÖp ngµi muèn chon lo¹i nµo?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Phi phong L¨ng V©n",4} },
		{"AddDialogOpt",	{"Phi phong TuyÖt ThÕ",5} },
		{"AddDialogOpt",	{"Phi phong Ph¸ Qu©n",6} },
		{"AddDialogOpt",	{"Phi phong Ng¹o TuyÕt",10} },
		{"AddDialogOpt",	{"Phi phong Kinh L«i",11} },
		{"AddDialogOpt",	{"Trang kÕ ",3} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "Ta muèn ®æi phi phong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>ChØ cã ®¹i hiÖp danh tiÕng lÉy lõng, míi xøng ®¸ng nhËn ®­îc phi phong tuyÖt ®Ñp cña ta, ®¹i hiÖp ngµi muèn chon lo¹i nµo?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Phi phong Ngù Phong",12} },
		{"AddDialogOpt",	{"Trang tr­íc",2} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "CreateCompose",
	szName = "Phi phong L¨ng V©n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong L¨ng V©n",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},66} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3465},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "Phi phong TuyÖt ThÕ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong TuyÖt ThÕ",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{2} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},462} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3466},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ph¸ Qu©n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ph¸ Qu©n",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{3} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},1386} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3467},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ngao tuyÕt (DÞch chuyÓn tøc thêi)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ngao tuyÕt (DÞch chuyÓn tøc thêi)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{4} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},2310} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3468},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "CreateCompose",
	szName = "Phi phong Kinh L«i (DÞch chuyÓn tøc thêi)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Kinh L«i (DÞch chuyÓn tøc thêi)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3470},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3473},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "CreateDialog",
	szName = "Phi phong Ng¹o TuyÕt",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>Phi phong Ng¹o TuyÕt <color> cã mÊy lo¹i d­íi ®©y , ®¹i hiÖp ngµi muèn chän lo¹i nµo?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Phi phong Ngao tuyÕt (DÞch chuyÓn tøc thêi)",7} },
		{"AddDialogOpt",	{"Phi phong Ng¹o TuyÕt (X¸c suÊt hãa gi¶i s¸t th­¬ng)",13} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "CreateDialog",
	szName = "Phi phong Kinh L«i",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>Phi phong Kinh L«i <color>cã mÊy lo¹i d­íi ®ay, ®¹i hiÖp ngµi muèn chän lo¹i nµo?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Phi phong Kinh L«i (DÞch chuyÓn tøc thêi)",8} },
		{"AddDialogOpt",	{"Phi phong Kinh L«i (X¸c suÊt hãa gi¶i s¸t th­¬ng)",14} },
		{"AddDialogOpt",	{"Phi phong Kinh L«i ( Träng kÝch )",15} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "CreateDialog",
	szName = "Phi phong Ngù Phong",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>Phi phong Ngù Phong<color> cã mÊy lo¹i d­íi ®©y, ®¹i hiÖp ngµi muèn chän lo¹i nµo?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Phi phong Ngù Phong (DÞch chuyÓn tøc thêi )",9} },
		{"AddDialogOpt",	{"Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",16} },
		{"AddDialogOpt",	{"Phi phong Ngù Phong (Träng kÝch)",17} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ng¹o TuyÕt (X¸c suÊt hãa gi¶i s¸t th­¬ng)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ng¹o TuyÕt (X¸c suÊt hãa gi¶i s¸t th­¬ng)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{4} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},2310} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3469},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[14] = --Ò»¸öÏ¸½Ú
{
	nId = 14,
	szMessageType = "CreateCompose",
	szName = "Phi phong Kinh L«i (X¸c suÊt hãa gi¶i s¸t th­¬ng)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Kinh L«i (X¸c suÊt hãa gi¶i s¸t th­¬ng)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3471},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[15] = --Ò»¸öÏ¸½Ú
{
	nId = 15,
	szMessageType = "CreateCompose",
	szName = "Phi phong Kinh L«i ( Träng kÝch )",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Kinh L«i ( Träng kÝch )",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{5} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},3234} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3472},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[16] = --Ò»¸öÏ¸½Ú
{
	nId = 16,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ngù Phong (X¸c suÊt hãa gi¶i s¸t th­¬ng)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3474},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
tbConfig[17] = --Ò»¸öÏ¸½Ú
{
	nId = 17,
	szMessageType = "CreateCompose",
	szName = "Phi phong Ngù Phong (Träng kÝch)",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Phi phong Ngù Phong (Träng kÝch)",0,1,1,1},
	tbCondition = 
	{
		{"ThisActivity:CheckFortuneRank",	{6} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"AddOneMaterial",	{"Tinh lùc",{nCount=1,pGetCount=function () return GetEnergy() end,pConsume=function (self, nConsumeCount) return ReduceEnergy(nConsumeCount) end,},4620} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{nQuality=1,tbProp={0,3475},nBindState = -2,nExpiredTime=10080,},1,"Mua phi phong"} },
	},
}
