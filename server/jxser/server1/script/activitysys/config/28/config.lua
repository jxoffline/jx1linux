Include("\\script\\activitysys\\config\\28\\variables.lua")
tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "ClickNpc",
	szName = "Ng­êi choi click vµo L·o N«ng CÇn Cï",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"L·o N«ng CÇn Cï"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"SetDialogTitle",	{"<npc>Mïa xu©n ®· ®Õn, ta muèn trång thªm mét Ýt hoa mµu ë ngoµi th«n chóng ta"} },
		{"AddDialogOpt",	{"Giíi thiÖu ho¹t ®éng TiÕt Trång C©y",2} },
		{"AddDialogOpt",	{"NhËn Thïng Gç",3} },
		{"AddDialogOpt",	{"§­a L·o N«ng mét Thïng N­íc",4} },
		{"AddDialogOpt",	{"§­a L·o N«ng Long ¢m Th¸nh Thñy",5} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "CreateDialog",
	szName = "Giíi thiÖu ho¹t ®éng TiÕt Trång C©y",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"<npc>Mïa xu©n ®· ®Õn, ta muèn trång thªm hoa mµu, vµo kho¶ng thêi gian 0h/28/03/2011 ®Õn 24h/04/04/2011, tiÓu hiÖp ng­¬i cã thÓ ®Õn chç cña ta ®©y ®Ó lÊy Thïng Gç sau ®ã ®Õn bªn §Çm N­íc t¹i Chu Tiªn TrÊn (206,189), Long TuyÒn Th«n (223,189) hoÆc Th¹ch Cæ TrÊn (217,184) ®Ó gióp ta lÊy n­íc, mçi ngµy mçi ng­êi chØ cã thÓ lÊy n­íc nhiÒu nhÊt 5 lÇn, tiÓu hiÖp ng­¬i h•y lÊy n­íc ®Çy thïng cho ta, ta sÏ cho ng­¬i phÇn th­ëng thËt hËu hÜnh; nÕu nh­ nhµ ng­¬i cã thÓ ®em Long ¢m Th¸nh Thñy l¹i ®©y cho ta, ta sÏ tÆng ng­¬i phÇn th­ëng phong phó, khi ta nhËn ®­îc Long ¢m Th¸nh Thñy ®¹t ®Õn sè l­îng 500 lÇn, th× ë ngoµi th«n cña chóng ta sÏ xuÊt hiÖn 1 Méc Kh¸ch rÊt dòng m·nh, nÕu trong vßng 15 phót nhµ ng­¬i cã thÓ ®¸nh b¹i h¾n, th× sÏ nhËn ®­îc phÇn th­ëng ®¸ng gi¸, nÕu trong vßng 15 phót ng­¬i kh«ng ®¸nh b¹i ®­îc h¾n th× Méc Kh¸ch sÏ rêi khái ®ã, Long ¢m Th¸nh Thñy ng­¬i cã thÓ ®i t×m ë trong Kú Tr©n C¸c.",0},
	tbCondition = 
	{
	},
	tbActition = 
	{
	},
}
tbConfig[3] = --Ò»¸öÏ¸½Ú
{
	nId = 3,
	szMessageType = "nil",
	szName = "NhËn Thïng Gç",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, kh«ng thÓ nhËn Thïng Gç",">="} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ"} },
		{"ThisActivity:CheckMuTong",	{nil} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"H«m nay ng­¬i ®· vÊt v¶ l¾m råi, ngµy mai l¹i ®Õn nhÐ","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGetMuTong",	{nil} },
	},
}
tbConfig[4] = --Ò»¸öÏ¸½Ú
{
	nId = 4,
	szMessageType = "nil",
	szName = "§­a L·o N«ng mét Thïng N­íc",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, kh«ng thÓ tham gia ho¹t ®éng",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2737,1,0,0},},1,"Nhanh ch©n ®i lÊy ®Çy n­íc cho ta"} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ"} },
		{"ThisActivity:CheckTaskDaily",	{nTskIdx_DaylyGiveWater,nMaxDaylyGiveWaterCount,"H«m nay ng­¬i ®· vÊt v¶ l¾m råi, hay lµ nghØ ng¬i ®i råi ngµy mai l¹i ®Õn nhÐ","<"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGiveMuTong",	{nil} },
	},
}
tbConfig[5] = --Ò»¸öÏ¸½Ú
{
	nId = 5,
	szMessageType = "CreateCompose",
	szName = "§­a L·o N«ng Long ¢m Th¸nh Thñy",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"",1,1,1,0},
	tbCondition = 
	{
		{"ThisActivity:CheckActivityTime",	{nil} },
		{"PlayerFunLib:CheckTotalLevel",	{nActivityPlayerLevelLimit,"§¼ng cÊp cña ng­¬i kh«ng ®ñ, kh«ng thÓ tham gia ho¹t ®éng",">="} },
		{"PlayerFunLib:CheckItemInBag",	{{tbProp={6,1,2738,1,0,0},},1,"Ta kh«ng cã Long ¢m Th¸nh Thñy"} },
		{"AddOneMaterial",	{"Long ¢m Th¸nh Thñy",{tbProp={6,1,2738,1,0,0},},1} },
		{"PlayerFunLib:CheckFreeBagCell",	{1,"Hµnh trang kh«ng ®ñ"} },
	},
	tbActition = 
	{
		{"ThisActivity:OnGiveLongYinShengShui",	{nil} },
	},
}
tbConfig[6] = --Ò»¸öÏ¸½Ú
{
	nId = 6,
	szMessageType = "ServerStart",
	szName = "Sever më sÏ ®¨ng t¶i NPC",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"ThisActivity:AddInitNpc",	{nil} },
	},
}
