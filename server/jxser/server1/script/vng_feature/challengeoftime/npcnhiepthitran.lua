tbCOT_Party = {}
DescLink_NhiepThiTran = "<#><link=image[147,167]:\\spr\\npcres\\enemy\\enemy154\\enemy154_pst.spr>NhiÕp ThÝ TrÇn:<link>";
function tbCOT_Party:CheckCondition()
	if IsCaptain() ~= 1 then
		Talk(1, "", "Xin lçi, chØ cã ®éi tr­ëng míi cã quyÒn kiÓm tra ®iÒu kiÖn tham gia cña tæ ®éi!")
		return
	end
	local tbDialog = {}
	local nTeamSize = GetTeamSize()
	local nOldPlayer = PlayerIndex
	
	for i = 1, nTeamSize do
		PlayerIndex = GetTeamMember(i)
		local nFlag1 = DynamicExecuteByPlayer(PlayerIndex,"\\script\\vng_lib\\bittask_lib.lua", "tbVNG_BitTask_Lib:getBitTask", {nTaskID = 3071,nStartBit = 25,nBitCount = 1,nMaxValue = 1})
		if nFlag1 ~= 0 then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color> kh«ng tháa ®iÒu kiÖn ®Ó tham gia", GetName()))
		end
		--KiÓm tra s¸t thñ gi¶n
		if self:CalcSword() < 1 then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "Kh«ng cã S¸t Thñ Gi¶n"))
		end
	
		--KiÓm tra sè lÇn v­ît ¶i trong ngµy
		local nDailyTaskCount = self:GetDailyTaskCount()
		if ( nDailyTaskCount >= 3) then
			tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "§· v­ît ¶i ®ñ 3 lÇn"))
		else
			local nLHHUse = self:GetLHHUseCount()
			if (nDailyTaskCount == 1 and nLHHUse < 1) or (nDailyTaskCount == 2 and nLHHUse < 2) then
				tinsert(tbDialog, getn(tbDialog) + 1, format("<color=red>%s<color>: %s", GetName(), "Ch­a sö dông Long HuyÕt Hoµn"))
			end
		end
		
	end -- loop whole party
	PlayerIndex = nOldPlayer
	if getn(tbDialog) > 0 then
		local strTittle = DescLink_NhiepThiTran.."Tæ ®éi hiÖn t¹i kh«ng thÓ tham gia\n khiªu chiÕn:"
		for i = 1, getn(tbDialog) do
			strTittle = strTittle.."\n"..tbDialog[i]
		end
		Describe(strTittle, 1, "§ãng/OnCancel")
	else
		local strTittle = DescLink_NhiepThiTran.."Tæ ®éi hiÖn t¹i cã thÓ tham gia khiªu chiÕn"
		Describe(strTittle, 1, "§ãng/OnCancel")
	end
end

function tbCOT_Party:CalcSword()
	local nHaveSword = 0
	for j =  20, 90, 10 do
		if nHaveSword > 1 then
			break
		else
			nHaveSword = CalcEquiproomItemCount( 6, 1, 400, j ) + nHaveSword
		end
	end
	return nHaveSword	
end

function tbCOT_Party:GetDailyTaskCount()
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	local nResult = 0
	if (ndate ~= GetTask(1551)) then --ch­a ®i v­ît ¶i trong ngµy
			nResult = 0
	else		
		if ndate ~= GetTask(2641) then --ch­a sö dông long huyÕt hoµn
			if GetTask(1550) <= 0 then --sè lÇn v­ît ¶i cã thÓ tham gia
				nResult = nResult + 1
			end
		else
			nResult = 1 + GetTask(2642) - GetTask(1550)
			if nResult < 0 then
				nResult = 0
			end
		end
	end
	return nResult
end

--sè lÇn sö dông long huyÕt hoµn
function tbCOT_Party:GetLHHUseCount()
	local ndate = tonumber(GetLocalDate("%y%m%d"));
	local nResult = 0
	if ndate ~= GetTask(2641) then 
		nResult = 0
	else
		nResult = GetTask(2642)
	end
	return nResult
end

function OnCancel()

end