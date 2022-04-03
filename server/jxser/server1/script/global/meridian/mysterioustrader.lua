Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailog.lua")
IncludeLib("SETTING");
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\global\\meridian\\vnmeridan_head.lua")
tbMeridanExp2Material = {}
tbMeridanExp2Material.tbExpRequire = {
	[0] = 1000000,
	[1] = 1000000,
	[2] = 1000000,
	[3] = 2000000,
	[4] = 3000000,
	[5] = 4000000,
}

function tbMeridanExp2Material:Main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	local tbDialog = DailogClass:new(szNpcName)
	tbDialog.szTitleMsg = format("<npc>\t%s%s%s%s%s", 
										"Muèn ®æi <color=yellow>Ch©n Nguyªn §¬n (tiÓu)<color> yªu cÇu ph¶i cã trªn <color=red>5,000,000<color> ®iÓm kinh nghiÖm, mçi lÇn ®æi sÏ tiªu hao l­îng ®iÓm kinh nghiÖm tïy thuéc vµo sè lÇn trïng sinh, cô thÓ nh­ sau:",
										"\nTrïng sinh 2 trë xuèng: ®æi <color=yellow>1 Ch©n Nguyªn §¬n (tiÓu)<color> tiªu hao <color=red>1,000,000<color> ®iÓm kinh nghiÖm",
										"\nTrïng sinh 3: ®æi <color=yellow>1 Ch©n Nguyªn §¬n (tiÓu)<color> tiªu hao <color=red>2,000,000<color> ®iÓm kinh nghiÖm",
										"\nTrïng sinh 4: ®æi <color=yellow>1 Ch©n Nguyªn §¬n (tiÓu)<color> tiªu hao <color=red>3,000,000<color> ®iÓm kinh nghiÖm",
										"\nTrïng sinh 5: ®æi <color=yellow>1 Ch©n Nguyªn §¬n (tiÓu)<color> tiªu hao <color=red>4,000,000<color> ®iÓm kinh nghiÖm")
	tbDialog:AddOptEntry("Ta muèn ®æi", tbMeridanExp2Material.ExchangeAskClient4Numb, {tbMeridanExp2Material})
	tbDialog:Show()
end

function tbMeridanExp2Material:GetMaxCount()
	local nTranslifecount = ST_GetTransLifeCount()
	local nCurExp = GetExp()
	local nExpReq = self.tbExpRequire[nTranslifecount]
	if not nExpReq or nExpReq <= 0 then
		return
	end
	local nRet = floor(nCurExp/nExpReq)
	if nRet > 500 then
		nRet = 500
	end
	return nRet
end

function tbMeridanExp2Material:GetExpRequire(nCount)
	local nTranslifecount = ST_GetTransLifeCount()
	local nCurExp = GetExp()
	local nExpReq = self.tbExpRequire[nTranslifecount] * nCount
	if not nExpReq or nExpReq <= 0 or nExpReq > nCurExp then
		return nil
	end
	return nExpReq
end

function tbMeridanExp2Material:ExchangeConfirm(nInput)
	if CalcFreeItemCellCount() < 1 then
		Talk(1, "", "§Ó b¶o ®¶m tµi s¶n, xin vui lßng chõa Ýt nhÊt 1 « trèng trong hµnh trang.")
		return
	end
	local nExchangeCount = 0
	local nMaxCount = self:GetMaxCount()
	if nInput > nMaxCount then
		Talk(1, "", "Sè l­îng kinh nghiÖm hiÖn t¹i cña c¸c h¹ kh«ng ®ñ, xin h·y nhËp sè kh¸c!")
		tbMeridanExp2Material:ExchangeAskClient4Numb()
		return
	end
	local nBitTskIdx = %tbVnMeridanHead.nMAX_EXP_EXCHANGE_TSK_IDX
	local nLimitCount = %tbVnMeridanHead.tbBitTask[nBitTskIdx].nMaxValue
	local nCurCount = %tbVnMeridanHead:GetDailyTaskCount(nBitTskIdx)
	if nCurCount >= nLimitCount then		
		return
	end
	if nCurCount + nInput > nLimitCount then
		nExchangeCount = nLimitCount - nCurCount
	else
		nExchangeCount = nInput
	end
	local nExpReduce = self:GetExpRequire(nExchangeCount)
	if not nExpReduce then		
		return
	end
	%tbVnMeridanHead:AddTaskDaily(nBitTskIdx, nExchangeCount)
	ReduceOwnExp(nExpReduce)
	local tbItemAward = {szName="Ch©n Nguyªn §¬n (tiÓu)",tbProp={6,1,30227,1,0,0},nCount=nExchangeCount,nBindState=-2}
	%tbAwardTemplet:Give(tbItemAward, 1, {"KinhMach", "ExpDoiChanNguyen", nExchangeCount})
end

function tbMeridanExp2Material:ExchangeAskClient4Numb()
	local nBITTSK_IDX = tbVnMeridanHead.nMAX_EXP_EXCHANGE_TSK_IDX
	if tbVnMeridanHead:CheckTaskLimit(nBITTSK_IDX) ~= 1 then
		Talk(1, "", format("Mçi ngµy chØ cã thÓ ®æi tèi ®a %d vËt phÈm Ch©n Nguyªn §¬n (tiÓu)", tbVnMeridanHead.tbBitTask[nBITTSK_IDX].nMaxValue))
		return
	end
	if GetExp() < 5000000 then
		Talk(1, "", "<color=red>Sè ®iÓm kinh nghiÖm hiÖn t¹i qu¸ thÊp, kh«ng thÓ ®æi vËt phÈm. Yªu cÇu ph¶i cã Ýt nhÊt 5000000 ®iÓm<color>")
		return
	end
	local nMaxCount = self:GetMaxCount()
	g_AskClientNumberEx(1, nMaxCount, "NhËp sè l­îng", {self.ExchangeConfirm, {self}})
end

local pEventType = EventSys:GetType("AddNpcOption")
nId = pEventType:Reg("ThÇn BÝ Th­¬ng Nh©n", "§æi <Ch©n Nguyªn §¬n (tiÓu)>", tbMeridanExp2Material.Main,{tbMeridanExp2Material})