Include("\\vng_script\\activitysys\\config\\1029\\head.lua")
Include("\\vng_script\\activitysys\\config\\1029\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1029\\extend.lua")
Include("\\vng_script\\activitysys\\config\\1029\\awardlist.lua")


tbConfig = {}

tbConfig[1] = 
{
	nId = 1,
	szMessageType = "ServerStart",
	szName = "when ServerStart",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		--{"ThisActivity:OnServerStart", {}},
	},
}
tbConfig[2] =
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "Sø Gi¶ Trao Th­ëng",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"Sø Gi¶ Trao Th­ëng"},
	tbCondition = 
	{
	},
	tbActition = 
	{		
		{"AddDialogOpt",	{"NhËn th­ëng code Vang Danh Thiªn H¹",3} },
		{"AddDialogOpt",	{"NhËn th­ëng code Vip 1",4} },
		{"AddDialogOpt",	{"NhËn th­ëng code Trß Ch¬i",5} },
		{"AddDialogOpt",	{"NhËn th­ëng code Vip 2",6} },
		{"AddDialogOpt",	{"NhËn th­ëng code Fanpage",7} },
	},
}
tbConfig[3] = 
{
	nId = 3,
	szMessageType = "nil",
	szName = "NhËn th­ëng code offline",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {100,"default",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_RECV_LOAI_1, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},	
		{"PlayerFunLib:CheckFreeBagCell",{60,"Ph¶i cã Ýt nhÊt 60 « trèng míi cã thÓ nhËn th­ëng."} },			
		{"ThisActivity:CheckBitExtPoint", {EXT_POINT_RECV_LOAI_1} },
	},
	tbActition =
	{			
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_RECV_LOAI_1, 1}},		
		{"Msg2Player",{"Chóc mõng b»ng h÷u ®· nhËn th­ëng code thµnh c«ng"}},
		{"VngExtPointLib:SetBitValueByVersion",{EXT_POINT_RECV_LOAI_1,0},},	
		{"tbAwardTemplet:Give",{tbAward_Code[LOAI_1],1,{EVENT_LOG_TITLE,"NhanCode_Loai_1"}} },
	},
}
tbConfig[4] = 
{
	nId = 4,
	szMessageType = "nil",
	szName = "NhËn th­ëng code offline",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {100,"default",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_RECV_LOAI_2, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},	
		{"PlayerFunLib:CheckFreeBagCell",{60,"Ph¶i cã Ýt nhÊt 60 « trèng míi cã thÓ nhËn th­ëng."} },			
		{"ThisActivity:CheckBitExtPoint", {EXT_POINT_RECV_LOAI_2} },
	},
	tbActition =
	{			
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_RECV_LOAI_2, 1}},		
		{"Msg2Player",{"Chóc mõng b»ng h÷u ®· nhËn th­ëng code thµnh c«ng"}},
		{"VngExtPointLib:SetBitValueByVersion",{EXT_POINT_RECV_LOAI_2,0},},		
		{"tbAwardTemplet:Give",{tbAward_Code[LOAI_2],1,{EVENT_LOG_TITLE,"NhanCode_Loai_2"}} },
	},
}
tbConfig[5] = 
{
	nId = 5,
	szMessageType = "nil",
	szName = "NhËn th­ëng code offline",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {100,"default",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_RECV_LOAI_3, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},	
		{"PlayerFunLib:CheckFreeBagCell",{60,"Ph¶i cã Ýt nhÊt 60 « trèng míi cã thÓ nhËn th­ëng."} },			
		{"ThisActivity:CheckBitExtPoint", {EXT_POINT_RECV_LOAI_3} },
	},
	tbActition =
	{			
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_RECV_LOAI_3, 1}},		
		{"Msg2Player",{"Chóc mõng b»ng h÷u ®· nhËn th­ëng code thµnh c«ng"}},
		{"VngExtPointLib:SetBitValueByVersion",{EXT_POINT_RECV_LOAI_3,0},},		
		{"tbAwardTemplet:Give",{tbAward_Code[LOAI_3],1,{EVENT_LOG_TITLE,"NhanCode_Loai_3"}} },
	},
}
tbConfig[6] = 
{
	nId = 6,
	szMessageType = "nil",
	szName = "NhËn th­ëng code offline",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {100,"default",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_RECV_LOAI_4, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},	
		{"PlayerFunLib:CheckFreeBagCell",{60,"Ph¶i cã Ýt nhÊt 60 « trèng míi cã thÓ nhËn th­ëng."} },			
		{"ThisActivity:CheckBitExtPoint", {EXT_POINT_RECV_LOAI_4} },
	},
	tbActition =
	{			
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_RECV_LOAI_4, 1}},		
		{"Msg2Player",{"Chóc mõng b»ng h÷u ®· nhËn th­ëng code thµnh c«ng"}},	
		{"VngExtPointLib:SetBitValueByVersion",{EXT_POINT_RECV_LOAI_4,0},},	
		{"tbAwardTemplet:Give",{tbAward_Code[LOAI_4],1,{EVENT_LOG_TITLE,"NhanCode_Loai_4"}} },
	},
}
tbConfig[7] = 
{
	nId = 7,
	szMessageType = "nil",
	szName = "NhËn th­ëng code offline",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {100,"default",">="} },
		{"tbVNG_BitTask_Lib:CheckBitTaskValue", {tbBITTSK_LIMIT_RECV_LOAI_5, 1, "B»ng h÷u ®· nhËn th­ëng råi", "<"}},	
		{"PlayerFunLib:CheckFreeBagCell",{60,"Ph¶i cã Ýt nhÊt 60 « trèng míi cã thÓ nhËn th­ëng."} },			
		{"ThisActivity:CheckBitExtPoint", {EXT_POINT_RECV_LOAI_5} },
	},
	tbActition =
	{			
		{"tbVNG_BitTask_Lib:addTask", {tbBITTSK_LIMIT_RECV_LOAI_5, 1}},		
		{"Msg2Player",{"Chóc mõng b»ng h÷u ®· nhËn th­ëng code thµnh c«ng"}},
		{"VngExtPointLib:SetBitValueByVersion",{EXT_POINT_RECV_LOAI_5,0},},		
		{"tbAwardTemplet:Give",{tbAward_Code[LOAI_5],1,{EVENT_LOG_TITLE,"NhanCode_Loai_5"}} },
	},
}

tbConfig[8] =
{
	nId = 8,
	szMessageType = "ItemScript",
	szName = "Sö dông Item",
	nStartDate = 201512010000,
	nEndDate  = 201601312400,
	tbMessageParam = {ITEM_HOPQUA_OFFLINE},
	tbCondition =
	{
		{"PlayerFunLib:CheckLevel", {50,"default",">="} },	
		{"PlayerFunLib:CheckFreeBagCell",{5,"Ph¶i cã Ýt nhÊt 5 « trèng míi cã thÓ nhËn th­ëng."} },					
	},
	tbActition =
	{			
		{"tbAwardTemplet:Give",{tbAward_Offline_Box,1,{EVENT_LOG_TITLE,"Use_ITEM_HOPQUA_OFFLINE"}} },
	},
}

