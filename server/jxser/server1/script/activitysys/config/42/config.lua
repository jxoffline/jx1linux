Include("\\script\\activitysys\\config\\42\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click fenghuatree",
	nStartDate = 201205100000,
	nEndDate  = 201206010000,
	tbMessageParam = {"C©y Ph­îng"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Giao nép L­u Linh §¬n",2} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "nil",
	szName = "hand in liulingdan",
	nStartDate = 201205100000,
	nEndDate  = 201206010000,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTotalLevel",	{150,"default",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,3188,1,0,0},},1,"Ng­¬i kh«ng cã L­u Linh §¬n"} },
		{"ThisActivity:CheckTaskDaily",	{TSK_HANDIN_LIULINGDAN,3,"H«m nay ng­¬i kh«ng thÓ tiÕp tôc giao nép L­u Linh §¬n n÷a","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:AddTaskDaily",	{TSK_HANDIN_LIULINGDAN,1} },
		{"PlayerFunLib:ConsumeEquiproomItem",	{{tbProp={6,1,3188,1,0,0},},1} },
		{"ThisActivity:AddTrebleExpTime",	{TSK_TREBLEEXP_TIME,TSK_HANDIN_LIULINGDAN} },
	},
}
