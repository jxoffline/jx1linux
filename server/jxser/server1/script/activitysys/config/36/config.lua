tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "Chuanguan",
	szName = "´³¹Ø28",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"28"},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"shijiandetiaozhan"} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "ËÎ½ð»ý·Ö³¬¹ý1000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{1000,">="} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"songjin"} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "CaiJiHuiHuangZhiGuo",
	szName = "NhÆt qu¶ huy hoµng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"huihuangzhiguo"} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "YDBZguoguan",
	szName = "Ñ×µÛ±¦²Ø´³¹ý10¹Ø",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"yandibaozang"} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "FinishMail",
	szName = "NhiÖm vô TÝn Sø ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,3},
	tbCondition = 
	{
		{"lib:Include",	{"\\script\\huoyuedu\\huoyuedu.lua"} },
	},
	tbActition = 
	{
		{"tbHuoYueDu:AddHuoYueDu",	{"xinshirenwu"} },
	},
}
