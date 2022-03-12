Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\misc\\taskmanager.lua")


-------局部变量定义 开始---------
-------局部变量定义 结束---------

local tbConfig = {}
tbConfig[1] = --一个细节
{
	nId = 1,
	szMessageType = "nil",
	szName = "Test",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"lib:CheckItemInBag",	{"return {szName = \"浓情巧克力\",tbProp = {6,1,445,1,0,0},}",1,"材料不足"} },
	},
	tbActition = 
	{
		{"lib:ConsumeEquiproomItem",	{"return {szName = \"浓情巧克力\",tbProp = {6,1,445,1,0,0},}",1} },
	},
}
G_ACTIVITY:RegisteActivityDetailConfig(1, tbConfig)
