

-------¾Ö²¿±äÁ¿¶¨Òå ¿ªÊ¼---------
local TASK_TIME_LEFT_A		= 2662
local TASK_TIME_LEFT_B		= 2663
local TASK_ITEM_USED_A		= 2664
local TASK_ITEM_USED_B		= 2665
-------¾Ö²¿±äÁ¿¶¨Òå ½áÊø---------

tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "nil",
	szName = "nil",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "nil",
	szName = "Tİch HuyÕt Cèc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"CÊp bËc qu¸ thÊp, e r»ng qu¸ nguy hiÓm víi ®¹i hiÖp!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"Thêi gian tu luyÖn cña c¸c h¹ ®· hÕt!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{917,1816,3392} },
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "nil",
	szName = "¸c Nh©n Cèc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"CÊp bËc qu¸ thÊp, e r»ng qu¸ nguy hiÓm víi ®¹i hiÖp!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"Thêi gian tu luyÖn cña c¸c h¹ ®· hÕt!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{918,1816,3392} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "Thùc Cèt Nhai",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"CÊp bËc qu¸ thÊp, e r»ng qu¸ nguy hiÓm víi ®¹i hiÖp!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"Thêi gian tu luyÖn cña c¸c h¹ ®· hÕt!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{919,1608,3168} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "nil",
	szName = "H¾c Méc Nhai",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"CÊp bËc qu¸ thÊp, e r»ng qu¸ nguy hiÓm víi ®¹i hiÖp!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,0,"Thêi gian tu luyÖn cña c¸c h¹ ®· hÕt!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{920,1608,3168} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "nil",
	szName = "Thiªn Phô S¬n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"CÊp bËc qu¸ thÊp, e r»ng qu¸ nguy hiÓm víi ®¹i hiÖp!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"Thêi gian tu luyÖn cña c¸c h¹ ®· hÕt!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{921,1560,3104} },
	},
}
tbConfig[7] = --Ò»¸öÏ¸½Ú
{
	nId = 7,
	szMessageType = "nil",
	szName = "Bµn Long S¬n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"CÊp bËc qu¸ thÊp, e r»ng qu¸ nguy hiÓm víi ®¹i hiÖp!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"Thêi gian tu luyÖn cña c¸c h¹ ®· hÕt!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{922,1560,3104} },
	},
}
tbConfig[8] = --Ò»¸öÏ¸½Ú
{
	nId = 8,
	szMessageType = "nil",
	szName = "§Şa MÉu S¬n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"CÊp bËc qu¸ thÊp, e r»ng qu¸ nguy hiÓm víi ®¹i hiÖp!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"Thêi gian tu luyÖn cña c¸c h¹ ®· hÕt!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{923,2008,4080} },
	},
}
tbConfig[9] = --Ò»¸öÏ¸½Ú
{
	nId = 9,
	szMessageType = "nil",
	szName = "UyÓn Phông S¬n",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"CÊp bËc qu¸ thÊp, e r»ng qu¸ nguy hiÓm víi ®¹i hiÖp!",">="} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,0,"Thêi gian tu luyÖn cña c¸c h¹ ®· hÕt!",">"} },
	},
	tbActition = 
	{
		{"NewWorld",	{924,2008,4080} },
	},
}
tbConfig[10] = --Ò»¸öÏ¸½Ú
{
	nId = 10,
	szMessageType = "ItemScript",
	szName = "Sö dông B¹ch Cèt LÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2255,1,0,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"Ph¶i lµ ng­êi ch¬i nép thÎ vµ cÊp 130 trë lªn míi cã thÓ sö dông",">="} },
		{"PlayerFunLib:IsCharged",	{"Ph¶i lµ ng­êi ch¬i nép thÎ vµ cÊp 130 trë lªn míi cã thÓ sö dông"} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_A,1020,"Thêi gian tu luyÖn cña b¹ch cèt nhiÒu nhÊt chØ ®­îc tİch lòy 1080 phót!","<="} },
		{"PlayerFunLib:CheckTaskDaily",	{TASK_ITEM_USED_A,3,"§¹o cô nµy mçi ngµy chØ ®­îc sö dông 3 lÇn!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{TASK_ITEM_USED_A,1} },
		{"dostring",	{"local nLeftTime = GetTask(2662); if  nLeftTime < 0 then nLeftTime = 60; else nLeftTime = nLeftTime + 60; end SetTask(2662, nLeftTime);"} },
		{"dostring",	{"Msg2Player(format([[Thêi gian tİch lòy tu luyÖn cña b¹ch cèt lµ %d phót]], GetTask(2662)))"} },
	},
}
tbConfig[11] = --Ò»¸öÏ¸½Ú
{
	nId = 11,
	szMessageType = "ItemScript",
	szName = "Sö dông Thiªn Long LÖnh",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"return {tbProp={6,1,2256,1,0,0},}"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel",	{130,"Ph¶i lµ ng­êi ch¬i nép thÎ vµ cÊp 130 trë lªn míi cã thÓ sö dông",">="} },
		{"PlayerFunLib:IsCharged",	{"Ph¶i lµ ng­êi ch¬i nép thÎ vµ cÊp 130 trë lªn míi cã thÓ sö dông"} },
		{"PlayerFunLib:CheckTask",	{TASK_TIME_LEFT_B,1020,"Thêi gian tİch lòy tu luyÖn nhiÒu nhÊt cña thiªn long lµ 1080 phót","<="} },
		{"PlayerFunLib:CheckTaskDaily",	{TASK_ITEM_USED_B,3,"§¹o cô nµy mçi ngµy chØ ®­îc sö dông 3 lÇn!","<"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:AddTaskDaily",	{TASK_ITEM_USED_B,1} },
		{"dostring",	{"local nLeftTime = GetTask(2663); if  nLeftTime < 0 then nLeftTime = 60; else nLeftTime = nLeftTime + 60; end SetTask(2663, nLeftTime);"} },
		{"dostring",	{"Msg2Player(format([[Thêi gian tİch lòy tu luyÖn cña thiªn long lµ %d phót]], GetTask(2663)))"} },
	},
}
tbConfig[12] = --Ò»¸öÏ¸½Ú
{
	nId = 12,
	szMessageType = "ClickNpc",
	szName = "BÊm vµo xa phu",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Xa phu"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"§i ®Õn b¶n ®å míi",13} },
	},
}
tbConfig[13] = --Ò»¸öÏ¸½Ú
{
	nId = 13,
	szMessageType = "CreateDialog",
	szName = "Chän dßng chän b¶n ®å",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Kh¸ch quan muèn ®i ®©u?"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"Tİch HuyÕt Cèc",2} },
		{"AddDialogOpt",	{"¸c Nh©n Cèc",3} },
		{"AddDialogOpt",	{"Thùc Cèt Nhai",4} },
		{"AddDialogOpt",	{"H¾c Méc Nhai",5} },
		{"AddDialogOpt",	{"Thiªn Phô S¬n",6} },
		{"AddDialogOpt",	{"Bµn Long S¬n",7} },
		{"AddDialogOpt",	{"§Şa MÉu S¬n",8} },
		{"AddDialogOpt",	{"UyÓn Phông S¬n",9} },
	},
}
