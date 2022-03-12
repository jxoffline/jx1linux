Include("\\script\\activitysys\\config\\1004\\mainquest.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
tbFullLVTranslife = {}
tbFullLVTranslife.tbBitTsk = 
{
	[1] = {nTaskID = 3071,nStartBit = 26,nBitCount = 1,nMaxValue = 1},--tiÓu
	[2] = {nTaskID = 3071,nStartBit = 27,nBitCount = 1,nMaxValue = 1},--trung
	[3] = {nTaskID = 3071,nStartBit = 28,nBitCount = 1,nMaxValue = 1},--®¹i
}
function main(nItemIdx)
	local _, _, nP = GetItemProp(nItemIdx)
	local nTranslifeStage = 0
	if nP == 30442 then
		nTranslifeStage = 1
	elseif nP == 30443 then
		nTranslifeStage = 2
	elseif nP == 30444 then
		nTranslifeStage = 3
	else
		return 1
	end	
	tbFullLVTranslife:GetFullLevelTranslife(nItemIdx, nTranslifeStage)
	return 1	
end

function tbFullLVTranslife:GetFullLevelTranslife(nItemIdx, nStage)
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTsk[nStage]) == 1 then
		Talk(1, "", "Mçi nh©n vËt chØ cã thÓ sö dông vËt phÈm nµy 1 lÇn.")
		return
	end
	local nCurTranslife = ST_GetTransLifeCount()
	local nLevel = GetLevel()
	local nType = nil
	if nCurTranslife == nStage - 1 then
		if nLevel < 190 then
			Talk(1, "", "CÇn ph¶i ®¹t ®¼ng cÊp 190 trë lªn míi cã thÓ sö dông vËt phÈm nµy.")
			return
		else
			nType = 1
		end
	elseif nCurTranslife >= nStage then
		local nTSLevel,_ = zhuansheng_get_gre(nStage)
		if nTSLevel == 200 then
			Talk(1, "", format("C¸c h¹ trïng sinh lÇn <color=yellow>%d<color> ë ®¼ng cÊp <color=yellow>200<color>, kh«ng cÇn sö dông vËt phÈm nµy..", nStage))
			return
		else
			nType = 2
		end
	else
		Talk(1, "", "§é tu luyÖn vÉn ch­a ®ñ, kh«ng thÓ sö dông vËt phÈm nµy.")
		return
	end
	if IsMyItem(nItemIdx) ~= 1 or RemoveItemByIndex(nItemIdx) ~= 1 then
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.tbBitTsk[nStage], 1)
	if nType == 1 then
		ST_LevelUp(200 - GetLevel())
		Msg2Player("Chóc mõng b¹n vâ c«ng tiÕn bé v­ît bËc, ®¼ng cÊp ®¹t ®Õn 200.")
		tbLog:PlayerActionLog("TrungSinhChiDon", "ThangDangCap200")
	else
		local nTSLevel, nResistID = zhuansheng_get_gre(nStage)
		local tbStage = %tbDTT_Data.tbStages[nStage]
		for i = 1, getn(tbStage) do
			self:GetFullLevelTranslife_2(nStage, i, nTSLevel)
		end
		zhuansheng_set_gre(nStage, 200, nResistID);
		KickOutSelf()
	end	
end

function tbFullLVTranslife:GetFullLevelTranslife_2(nStage, nType, nLevel)
	local tbStage = %tbDTT_Data.tbStages[nStage]
	if not tbStage or not tbStage[nType] or not tbStage[nType][nLevel] then		
		return
	end
	local strTypePoint = tbStage[nType].strType
	local tbTemp = tbStage[nType][nLevel]
	local tbBTask = tbStage[nType].tbBitTask
	if not tbBTask then	
		return
	end
	if tbVNG_BitTask_Lib:getBitTask(tbBTask[2]) ~= 0 then
		Msg2Player(format("<color=green>B¹n ®· nhËn <color=yellow>%s<color=green> tõ viÖc hoµn thµnh nhiÖm vô §«ng Trïng H¹ Th¶o råi<color>", strTypePoint))
		return
	end
	tbVNG_BitTask_Lib:setBitTask(tbBTask[1], 1)
	tbVNG_BitTask_Lib:setBitTask(tbBTask[2], 1)
	--Add phÇn th­ëng
	local nPointCount = tbTemp[1]
	if strTypePoint == "§iÓm kü n¨ng" then
		AddMagicPoint(nPointCount)
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Chóc mõng b¹n nhËn ®­îc <color=yellow>%s.<color>", str))
		tbLog:PlayerActionLog("TrungSinhChiDon", "NhanHoTroTS"..nStage, str)
	elseif strTypePoint == "§iÓm tiÒm n¨ng" then
		AddProp(nPointCount)
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Chóc mõng b¹n nhËn ®­îc <color=yellow>%s.<color>", str))
		tbLog:PlayerActionLog("TrungSinhChiDon", "NhanHoTroTS"..nStage, str)
	elseif strTypePoint == "Kh¸ng tÊt c¶" then
		for i = 0, 4 do
			AddMaxResist(i, nPointCount);
		end
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Chóc mõng b¹n nhËn ®­îc <color=yellow>%s.<color>", str))
		tbLog:PlayerActionLog("TrungSinhChiDon", "NhanHoTroTS"..nStage, str)
	elseif strTypePoint == "Kü n¨ng tèi ®a" then
		SetSkillMaxLevelAddons(GetSkillMaxLevelAddons() + nPointCount)
		local str = nPointCount.." "..strTypePoint
		Msg2Player(format("<color=green>Chóc mõng b¹n nhËn ®­îc <color=yellow>%s.<color>", str))
		tbLog:PlayerActionLog("TrungSinhChiDon", "NhanHoTroTS"..nStage, str)
	elseif strTypePoint == "Kh¸ng tÝnh" then
		local n_translevel, n_transresist = zhuansheng_get_gre(nStage);
		if n_transresist >= 0 and n_transresist <= 4 then
			AddMaxResist(n_transresist, nPointCount);
			local str = nPointCount.." "..TB_BASE_RESIST[n_transresist]
			Msg2Player(format("<color=green>Chóc mõng b¹n nhËn ®­îc <color=yellow>%s.<color>", str))
			tbLog:PlayerActionLog("TrungSinhChiDon", "NhanHoTroTS"..nStage, str)
		end
	end	
end