Include("\\script\\activitysys\\config\\44\\variables.lua")
tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "songjin3000",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,"3"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTask",	{"751",3000,"",">="} },
	},
	tbActition = 
	{
		{"ThisActivity:Finish",	{SONGJIN} },
	},
}
tbConfig[2] = --一个细节
{
	nId = 2,
	szMessageType = "Chuanguan",
	szName = "change of time 10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"10"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Finish",	{CHANGE_OF_TIME} },
	},
}
tbConfig[3] = --一个细节
{
	nId = 3,
	szMessageType = "YDBZguoguan",
	szName = "yandi6",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {6},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Finish",	{YAN_DI} },
	},
}
tbConfig[4] = --一个细节
{
	nId = 4,
	szMessageType = "FinishMail",
	szName = "xinshi",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {-2,nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Finish",	{XIN_SHI_TASK} },
	},
}
tbConfig[5] = --一个细节
{
	nId = 5,
	szMessageType = "FinishYesou",
	szName = "yesou10",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {10},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Finish",	{YE_SOU} },
	},
}
tbConfig[6] = --一个细节
{
	nId = 6,
	szMessageType = "MazeTaskFinish",
	szName = "maze2",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"2"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Finish",	{JIAN_ZHONG_MI_GONG} },
	},
}
tbConfig[7] = --一个细节
{
	nId = 7,
	szMessageType = "HarvestPlants",
	szName = "tianlu_tree5",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"tianlu_tree"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:TianLuTree",	{nil} },
	},
}
tbConfig[8] = --一个细节
{
	nId = 8,
	szMessageType = "Huoyuedu",
	szName = "HuoYueDu40",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {40},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:Finish",	{HUO_YUE_DU} },
	},
}
