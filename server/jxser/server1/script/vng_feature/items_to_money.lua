Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailog.lua")
Include("\\script\\lib\\log.lua")
tbVngItems2Money ={}
tbVngItems2Money.tbItemList = {
	["6,1,2125,1,0,0"] = 300000,
	["6,1,3059,1,0,0"] = 1250000,
	["6,1,2117,1,0,0"] = 2200000,
	["6,1,2402,1,0,0"] = 1100000,
	["6,1,2339,1,0,0"] = 1100000,
	["6,1,2813,1,0,0"] = 1100000,
	["6,1,2745,1,0,0"] = 1100000,
	["6,1,2517,1,0,0"] = 1100000,
	["6,1,2520,1,0,0"] = 1100000,
	["6,1,2401,1,0,0"] = 3300000,
	["6,1,2266,1,0,0"] = 1100000,
	["6,1,2267,1,0,0"] = 2200000,
	["6,1,2268,1,0,0"] = 3300000,
	["6,1,2256,1,0,0"] = 1100000,
	["6,1,2115,1,0,0"] = 2200000,
	["6,1,1448,1,0,0"] = 1100000,
	["6,1,30184,1,0,0"] = 110000000,
	["6,1,30189,1,0,0"] = 550000000,
}
tbVngItems2Money.nMaxCash = 2000000000

function tbVngItems2Money:main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDialog = DailogClass:new(szNpcName)
	tbDialog.szTitleMsg = "<npc>Ng­¬i cã thÓ mang vËt phÈm kh«ng dïng tíi gÆp ta ®Ó ®æi lÊy ng©n l­îng. L­u ý, ta chØ nhËn 1 sè vËt phÈm nhÊt ®Þnh vµ kh«ng nhËn c¸c vËt phÈm ®ang ë tr¹ng th¸i khãa b¶o hiÓm"
	tbDialog:AddOptEntry("Ta muèn ®æi", tbVngItems2Money.ExchangeUI, {tbVngItems2Money})
	tbDialog:Show()
end

function tbVngItems2Money:ExchangeUI()
	g_GiveItemUI("§æi ng©n l­îng", "", {self.GiveUIOk, {self}}, nil, 0)
end

function tbVngItems2Money:GetItemKey(nItemIdx)
	local nP1, nP2, nP3, nP4, nP5, nP6 = GetItemProp(nItemIdx)
	return format("%d,%d,%d,%d,%d,%d", nP1, nP2, nP3, nP4, nP5, nP6)
end

function tbVngItems2Money:GiveUIOk(nCount)
	if nCount < 0 then
		return
	end
	local nItemIdx = 0
	local nTotalMoney = 0
	local tbItemIndexes = {}
	local strLog = ""
	for i = 1, nCount do
		nItemIdx = GetGiveItemUnit(i)		
		local strItemKey = self:GetItemKey(nItemIdx)		
		if not self.tbItemList[strItemKey] then 
			Talk(1, "", format("VËt phÈm <color=red>%s<color> mµ ng­êi bá vµo ta ®©y kh«ng cÇn, h·y gi÷ l¹i mµ dïng", GetItemName(nItemIdx)))
			return
		else	
			tinsert(tbItemIndexes, nItemIdx)	
			nTotalMoney = nTotalMoney + self.tbItemList[strItemKey]*GetItemStackCount(nItemIdx)
			strLog = strLog..GetItemStackCount(nItemIdx).." "..GetItemName(nItemIdx)..", "
		end		
	end
	if nTotalMoney <= 0 then
		Talk(1, "", "Nh÷ng thø ng­¬i ®­a toµn lµ r¸c r­ëi, t­ëng ta mï sao?")
		return
	end
	if nTotalMoney + GetCash() > self.nMaxCash then
		Talk(1, "", "Sè tiÒn v­ît qu¸ giíi h¹n, ng©n l­îng thu ®­îc cïng víi sè l­îng trong hµnh trang kh«ng thÓ v­ît qu¸ 200,000 v¹n")
		return
	end
	for i = 1, getn(tbItemIndexes) do
		local nTempIdx = tbItemIndexes[i]
		if IsMyItem(nTempIdx) ~= 1 or RemoveItemByIndex(nTempIdx) ~= 1 then
			return
		end		
	end
	Earn(nTotalMoney)
	tbLog:PlayerActionLog("DoiVatPhamLayNganLuong", strLog, nTotalMoney)
end

local pEventType = EventSys:GetType("AddNpcOption")
nId = pEventType:Reg("ThÇn BÝ Th­¬ng Nh©n", "§æi vËt phÈm lÊy ng©n l­îng", tbVngItems2Money.main,{tbVngItems2Money})