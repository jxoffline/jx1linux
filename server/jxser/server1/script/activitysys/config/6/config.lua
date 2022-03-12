

-------¾Ö²¿±äÁ¿¶¨Òå ¿ªÊ¼---------
-------¾Ö²¿±äÁ¿¶¨Òå ½áÊø---------

tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "FinishSongJin",
	szName = "Bªn th¾ng tèng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {1,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTaskDaily",	{1926,0,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{"5000000*(mod(GetTask(1926),256)+1)",0,"sonjin"} },
		{"ThisActivity:ExecActivityDetail",	{4} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "FinishSongJin",
	szName = "Bªn thua tèng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"-1",3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTaskDaily",	{1926,0,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{"3000000*(mod(GetTask(1926),256)+1)",0,"sonjin"} },
		{"ThisActivity:ExecActivityDetail",	{4} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "FinishSongJin",
	szName = "Bªn hßa tèng kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {0,3},
	tbCondition = 
	{
		{"PlayerFunLib:CheckBT_PL_BATTLEPOINT",	{3000,">="} },
		{"PlayerFunLib:CheckTaskDaily",	{1926,0,"",">="} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddExp",	{"4000000*(mod(GetTask(1926),256)+1)",0,"sonjin"} },
		{"ThisActivity:ExecActivityDetail",	{4} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "§Æt sè lÇn Tèng Kim",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTaskDaily",	{1926,3,"","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{1926,1} },
	},
}
