Include("\\vng_script\\activitysys\\config\\1026\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1026\\awardlist.lua")
Include("\\vng_script\\activitysys\\config\\1026\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1026\\sale_item_event.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")

tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "click shijianzongguan",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"ThÈm V¹n Tam"},
	tbCondition = 
	{
		{"PlayerFunLib:CheckLevel", {50,"",">="} },		
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Göi vµ rót Ngäc lôc b¶o",2} },	
		{"AddDialogOpt",	{"Trao ®æi vËt phÈm quý hiÕm",3} },			
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i Tham Van Tam",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>Ngäc Lôc B¶o<color> lµ thø duy nhÊt ta muèn.\n Ta nhËn ký göi gi÷ gióp Ngäc Lôc B¶o cho mäi ng­êi.\n	Ng­¬i ®· ký göi: <color=yellow><lua GetTask(2783) /><color>  Ngäc Lôc B¶o" },
	tbCondition = 
	{
	},
	tbActition = 
	{			
		{"AddDialogOpt",	{"Ta muèn göi Ngäc lôc b¶o",4} },
		{"AddDialogOpt",	{"Ta muèn rót 250 Ngäc lôc b¶o",5} },			
	},
}
tbConfig[3] =
{
	nId = 3,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i Tham Van Tam",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc><color=yellow>Ngäc Lôc B¶o<color> lµ thø duy nhÊt ta muèn. Ng­¬i h·y mang ®Õn ®©y cho ta, ta sÏ cã nhiÒu thø quý b¸u trao ®æi.\n	Ng­¬i ®· ký göi: <color=yellow><lua GetTask(2783) /><color>  Ngäc Lôc B¶o" },
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Trao ®æi Ngäc lôc b¶o lÊy vËt phÈm",9} },
		{"AddDialogOpt",	{"Trao ®æi Ngäc lôc b¶o lÊy trang bÞ quý",7} },
		{"AddDialogOpt",	{"Xem bÝ mËt hµng hãa cña ThÈm V¹n Tam",8} },
	},
}
--ky gui ngoc luc bao
tbConfig[4] =
{
	nId = 4,
	szMessageType = "nil",
	szName = "Ký göi Ngäc Lôc B¶o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },		
		{"ThisActivity:CheckSaving_Item",	{} },	
	},	
	tbActition =
	{
		{"ThisActivity:Add_Num_Saving_Item",	{} },	
	},
}
--Rut Ngoc Luc Bao
tbConfig[5] =
{
	nId = 5,
	szMessageType = "nil",
	szName = "Rót Ngäc Lôc B¶o",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Ngäc Lôc B¶o",1,1,1,0.004},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },
		{"ThisActivity:CheckWithdraw_Item",	{} },
	},	
	tbActition =
	{
		--{"ThisActivity:Withdraw_Item",	{} },
	},
}

--doi NLB lÊy vËt phÈm th­êng
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "nil",
	szName = "§æi vËt phÈm th­êng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },	
		{"ThisActivity:CheckSaleDate", {} },
	},
	tbActition =
	{			
		{"ThisActivity:SaleItemDailyDialog", {1} },
	},
}
--doi NLB lÊy vËt phÈm quý
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "nil",
	szName = "§æi vËt phÈm quý",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },	
		{"ThisActivity:CheckSaleDate", {} },
	},
	tbActition =
	{			
		{"ThisActivity:SaleDialog", {} },
	},
}
tbConfig[8] = 
{
	nId = 8,
	szMessageType = "nil",
	szName = "Xem danh s¸ch b¸n hµng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{			
		{"ThisActivity:CheckSaleDate", {} },
	},
	tbActition =
	{			
		{"ThisActivity:ShowPlanSale", {} },
	},
}
--update them dong doi item event t8 Vu Lan trong shop NLB
tbConfig[9] =
{
	nId = 9,
	szMessageType = "CreateDialog",
	szName = "§èi tho¹i Tham Van Tam",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Ng­¬i muèn dïng <color=yellow>Ngäc Lôc B¶o<color> ®Ó trao ®æi g×?" },
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"Trao ®æi Ngäc lôc b¶o lÊy vËt phÈm",6} },
		{"AddDialogOpt",	{"Trao ®æi Ngäc lôc b¶o lÊy V« Danh Hån Th¹ch",10} },		
	},
}
tbConfig[10] = 
{
	nId = 10,
	szMessageType = "nil",
	szName = "§æi vËt phÈm V« Danh Hån Th¹ch",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{	
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckTask",	{TASK_SAVE_SL_NGOCLUCBAO,NLB_VODANH,"Sè Ngäc lôc b¶o kh«ng ®ñ, cÇn 50000 Ngäc Lôc B¶o ®Ó ®æi 1 V« Danh Hån Th¹ch",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{5,"nomsg"} },
	},
	tbActition =
	{			
		{"PlayerFunLib:AddTask",{TASK_SAVE_SL_NGOCLUCBAO, - NLB_VODANH }},
		{"PlayerFunLib:GetItem",	{ITEM_VODANH_HONTHACH,1,EVENT_LOG_TITLE,"DoiVoDanhHonThach_ThanhCong"} },	
	},
}