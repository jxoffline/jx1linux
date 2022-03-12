

-------¾Ö²¿±äÁ¿¶¨Òå ¿ªÊ¼---------
-------¾Ö²¿±äÁ¿¶¨Òå ½áÊø---------

tbConfig = {}
tbConfig[1] = --Ò»¸öÏ¸½Ú
{
	nId = 1,
	szMessageType = "nil",
	szName = "PhÇn th­ëng sau khi chuyÓn sinh ®¹t ®Õn cÊp 160 lµ phiªn vò",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {nil},
	tbCondition = 
	{
		{"PlayerFunLib:CheckTransLifeCount",	{3,"ChØ cã thÓ ë cÊp 190 tiÕn hµnh trïng sinh lÇn 3, ®ång thêi ®¹t ®Õn cÊp 160 míi cã thÓ nhËn ®­îc phÇn th­ëng nµy","=="} },
		{"PlayerFunLib:CheckLevel",	{160,"ChØ cã thÓ ë cÊp 190 tiÕn hµnh trïng sinh lÇn 3, ®ång thêi ®¹t ®Õn cÊp 160 míi cã thÓ nhËn ®­îc phÇn th­ëng nµy","=="} },
		{"PlayerFunLib:CheckTaskBit",	{"2582",1,1,"ChØ cã thÓ ë cÊp 190 tiÕn hµnh trïng sinh lÇn 3, ®ång thêi ®¹t ®Õn cÊp 160 míi cã thÓ nhËn ®­îc phÇn th­ëng nµy"} },
		{"PlayerFunLib:CheckTaskBit",	{"2582",2,0,"§¹i hiÖp ®· nhËn phÇn th­ëng nµy råi."} },
		{"PlayerFunLib:CheckFreeBagCellWH",	{2,3,1,"default"} },
	},
	tbActition = 
	{
		{"PlayerFunLib:GetItem",	{{tbProp={0,10,7,5,5,0},nExpiredTime=259200,},1,"3rdTransAward"} },
		{"PlayerFunLib:SetTaskBit",	{"2582",2,1} },
	},
}
tbConfig[2] = --Ò»¸öÏ¸½Ú
{
	nId = 2,
	szMessageType = "ClickNpc",
	szName = "PhÇn th­ëng sau khi chuyÓn sinh ®¹t ®Õn cÊp 160 lµ phiªn vò",
	nStartDate = nil,
	nEndDate  = nil,
	tbMessageParam = {"B¾c §Èu L·o Nh©n"},
	tbCondition = 
	{
	},
	tbActition = 
	{
		{"AddDialogOpt",	{"PhÇn th­ëng sau khi chuyÓn sinh ®¹t ®Õn cÊp 160 lµ phiªn vò",1} },
	},
}
