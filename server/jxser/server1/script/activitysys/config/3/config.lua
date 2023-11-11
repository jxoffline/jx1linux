

-------¾Ö²¿±äÁ¿¶¨Òå ¿ªÊ¼---------
-------¾Ö²¿±äÁ¿¶¨Òå ½áÊø---------

tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "nil",
	szName = "Chän dßng chän tÆng v¹n b¶o r­¬ng",
	nStartDate = 200910150000,
	nEndDate  = 200911020000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{1,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2564,0,"Mçi ngµy chØ ®­îc nhËn miÔn phÝ 1 <color=yellow>v¹n b¶o r­¬ng<color> tõ<color=yellow>Nam H¶i Kú Nh©n<color>","=="} },
		{"PlayerFunLib:CheckLevel",	{140,"default",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{"return {tbProp={6,1,2157,1,0,0},nExpiredTime=10080,}",1,"wanbaoxiang,get from npc"} },
		{"PlayerFunLib:AddTaskDaily",	{2564,1} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ItemScript",
	szName = "Sö dông [V¹n b¶o r­¬ng miÔn phÝ]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2157,-1,-1,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2565,9,"Mçi ngµy chØ ®­îc sö dông tèi ®a 9 <color=yellow> v¹n b¶o r­¬ng<color>","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{16,1,"wanbaoxiang,Use_Free_Box","",""} },
		{"PlayerFunLib:AddTaskDaily",	{2565,1} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "ItemScript",
	szName = "Sö dông [V¹n b¶o r­¬ng thu phÝ]",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2158,-1,-1,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckFreeBagCell",	{10,"default"} },
		{"PlayerFunLib:CheckTaskDaily",	{2565,9,"Mçi ngµy chØ ®­îc sö dông tèi ®a 9 <color=yellow> v¹n b¶o r­¬ng<color>","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetAward",	{17,1,"wanbaoxiang,Use_Free_Box","",""} },
		{"PlayerFunLib:AddTaskDaily",	{2565,1} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo Nam H¶i Kú Nh©n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Nam H¶i Kú Nh©n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"TÆng v¹n b¶o r­¬ng",1} },
	},
}
