Include("\\vng_script\\activitysys\\config\\1028\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1028\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1028\\awardlist.lua")

tbConfig = {}

tbConfig[1] =
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Sø Gi¶ Trao Th­ëng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Sø Gi¶ Trao Th­ëng"},
	tbCondition =
	{		
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },			
	},
	tbActition =
	{	
		--{"AddDialogOpt",	{"NhËn th­ëng Code Vâ l©m plus.",2} },		
		--{"AddDialogOpt",	{"NhËn th­ëng Code Thay ®æi mËt khÈu.",3} },		
	},
}

tbConfig[2] = 
{
	nId = 2,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng VL Plus ",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckFreeBagCell",{10,"Ph¶i cã Ýt nhÊt 10 « trèng míi cã thÓ nhËn th­ëng."} },			
		{"ThisActivity:CheckExtPointValue", {EXT_POINT_CODE_VL_PLUS}},	
	},
	tbActition =
	{		
		{"ThisActivity:SetBitExPoint_Success",{EXT_POINT_CODE_VL_PLUS}},
		{"tbAwardTemplet:Give",{tbAward_VLPlus,1,{EVENT_LOG_TITLE,"NhanThuong_CodeVLPlus"}} },
	},
}
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "nil",
	szName = "NhËn phÇn th­ëng Change Pass",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckFreeBagCell",{15,"Ph¶i cã Ýt nhÊt 15 « trèng míi cã thÓ nhËn th­ëng."} },			
		{"ThisActivity:CheckExtPointValue", {EXT_POINT_CODE_CHANGE_PASS}},	
	},
	tbActition =
	{		
		{"ThisActivity:SetBitExPoint_Success",{EXT_POINT_CODE_CHANGE_PASS}},
		{"tbAwardTemplet:Give",{tbAward_ChangePass,1,{EVENT_LOG_TITLE,"NhanThuong_CodeChangePass"}} },
	},
}