Include("\\script\\event\\guoqing_jieri\\200908\\head.lua")
Include("\\script\\lib\\compose_jinnang.lua")

local tbCrystal = tbBaseClass:new()

tbCrystal.szName = "Thñy Tinh"
function tbCrystal:_init(nCount)
	
	self.nCount = nCount
end
function tbCrystal:pGetCount()
	return CalcEquiproomItemCount(4, 239, 1, -1) + CalcEquiproomItemCount(4, 240, 1, -1) + CalcEquiproomItemCount(4, 238, 1, -1)
end
function tbCrystal:pConsume(nConsumeCount)
	for i=1, nConsumeCount do
		if ConsumeEquiproomItem(1, 4, 238, 1, -1) == -1 then
			if ConsumeEquiproomItem(1, 4, 239, 1, -1) == -1 then
				if ConsumeEquiproomItem(1, 4, 240, 1, -1) == -1 then
					return
				end
			end
		end
	end
	return 1
end

tbGuoqing0908.tbFormulaList = 
{
	[1] =
	{
		tbMaterial = 
		{
			{szName="ChiÕc mò tai bÌo", tbProp={6, 1, 2097}, nCount = 5},
			{szName="HuyÒn tinh kho¸ng th¹ch (cÊp 2)", tbProp={6, 1, 147, 2}},
			{nJxb = 6e4},
		},
		tbProduct = {szName="ChiÕc mò hßa b×nh", tbProp={6, 1, 2098, 1, 0, 0}, nExpiredTime = 20090914}
		
	},
	[2] =
	{
		tbMaterial = 
		{
			{szName="ChiÕc mò hßa b×nh", tbProp={6, 1, 2098}},
			tbCrystal:new(1),
		},
		tbProduct = 
		{
			szName = "ChiÕc mò tù do", 
			[1] = {szName="ChiÕc mò tù do", tbProp={6, 1, 2099, 1, 0, 0}, nExpiredTime = 20090914, nRate = 95},
			[2] = {szName="ChiÕc mò h¹nh phóc", tbProp={6, 1, 2100, 1, 0, 0}, nExpiredTime = 20090914, nRate = 5},
		}
		
	},
	[3] =
	{
		tbMaterial = 
		{
			{szName="ChiÕc mò hßa b×nh", tbProp={6, 1, 2098}},
			tbCrystal:new(2),
		},
		tbProduct = {szName="ChiÕc mò h¹nh phóc", tbProp={6, 1, 2100, 1, 0, 0}, nExpiredTime = 20090914},

		
	},
}

tbGuoqing0908.ComposeList = tbComposeListForJinNang:new("tbGuoqing0908_compose", tbGuoqing0908.tbFormulaList)

function tbGuoqing0908:ComposeDailogMain(nItemIndex, szDescLink)
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > self.nComposeEndDate then
		return Talk(1, "" ,"Ho¹t ®éng ®· kÕt thóc.")
	end
	
		
	local szTitle = "C¸c h¹ muèn chän ph­¬ng thøc nµo?"
	nItemIndex = nItemIndex or -1
	szDescLink = szDescLink or "<npc>"
	local tbSay = self.ComposeList:MakeOptBytbMaterialList("", nItemIndex, szDescLink)
	tinsert(tbSay, 1, "<dec>"..szDescLink..szTitle)
	tinsert(tbSay, "KÕt thóc ®èi tho¹i/OnCancel")
	CreateTaskSay(tbSay)	
end

function tbGuoqing0908:GetJinnang()
	local nDate = tonumber(GetLocalDate("%y%m%d"))
	if nDate > self.nEndDate then
		return Talk(1, "" ,"Ho¹t ®éng ®· kÕt thóc.")
	end
	
	local bRet, szFailMsg = self:IsPlayerEligible() 
	
	if bRet ~= 1 then
		Talk(2, "", szFailMsg, "Ng­¬i ch­a ®ñ ®iÒu kiÖn ®Ó nhËn vËt phÈm nµy")
		return
	end
	
	if self.tbTask:GetJinNangState() == 1 then
		Say("LÔ Quan"..":".."Ta nhí kh«ng nhÇm th× ng­¬i ®· nhËn råi?",1, "ThËt ng¹i qu¸! T¹i h¹ quªn mÊt./OnCancel")
		return 
	end
	local tbItem = {szName="CÈm nang sù kiÖn", tbProp={6, 1, 1833, 1, 0, 0}, nExpiredTime = self.nComposeEndDate, tbParam = {self.nComposeEndDate, 1000}}
	
	tbAwardTemplet:GiveAwardByList(tbItem, "get by guoqin0908")
	self.tbTask:SetJinNangState(1)
end