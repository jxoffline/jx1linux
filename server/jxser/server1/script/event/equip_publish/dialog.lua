Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

local SelectOpt = function(pInfo)
	local nPlayerIndex = PlayerIndex

	local nPak = usepack(pInfo.nPak)
	CallPlayerFunction(nPlayerIndex, pInfo.pFun, pInfo.pSelf)
	usepack(nPak)
end

MAKE_EQUIP_LIST = {}
REFINE_EQUIP_LIST = {}



local dialog_refine = function()
	do return end
	local szTitle = "§¹i hiÖp muèn träng chó c¸i g×?"
	local tbOpt = 
	{
		{REFINE_EQUIP_LIST["chilin"].szOpt, %SelectOpt, {REFINE_EQUIP_LIST["chilin"]}},
		{REFINE_EQUIP_LIST["baihu"].szOpt, %SelectOpt, {REFINE_EQUIP_LIST["baihu"]}},
		{REFINE_EQUIP_LIST["jinwu"].szOpt, %SelectOpt, {REFINE_EQUIP_LIST["jinwu"]}},
		{"KÕt thóc ®èi tho¹i"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end
--pEventType:Reg("Thî rÌn thÇn bÝ", "Träng chó trang bÞ", dialog_refine)

local dialog_make = function()
	szTitle = "Ng­¬i muèn chÕ t¹o ®å g×?"
	tbOpt = 
	{
		--{MAKE_EQUIP_LIST["chilin"].szOpt, %SelectOpt, {MAKE_EQUIP_LIST["chilin"]}},
		--{MAKE_EQUIP_LIST["baihu"].szOpt, %SelectOpt, {MAKE_EQUIP_LIST["baihu"]}},
		--{MAKE_EQUIP_LIST["jinwu"].szOpt, %SelectOpt, {MAKE_EQUIP_LIST["jinwu"]}},
		--{MAKE_EQUIP_LIST["zimang"].szOpt, %SelectOpt, {MAKE_EQUIP_LIST["zimang"]}},
		{"KÕt thóc ®èi tho¹i"}
	}
	CreateNewSayEx(szTitle, tbOpt)
end



pEventType:Reg("Thî rÌn trong thµnh", "ChÕ t¹o trang bÞ", dialog_make)
