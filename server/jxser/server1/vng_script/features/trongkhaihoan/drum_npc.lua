Include("\\vng_script\\features\\trongkhaihoan\\head.lua")

if not tbVNGDrumNpc then
	tbVNGDrumNpc = {}
end
if not tbVNGDrumNpcList then
	tbVNGDrumNpcList = {}
end

function OnTime(NpcIndex)
	local tbVNGDrumNpc = tbVNGDrumNpcList[NpcIndex]
	if (tbVNGDrumNpc) then
		return tbVNGDrumNpc:OnTime()
	else
		return 0, 0
	end
end

function tbVNGDrumNpc:New(szTongName, nTongId)
	
	local tb = clone(tbVNGDrumNpc)
	local w,x,y = GetWorldPos();
	tb.Pos = {SubWorldID2Idx(w), x*32, y*32};
	tb.NpcIndex = AddNpc(tbVNGTriumphDrum.nNPCID, 1, tb.Pos[1], tb.Pos[2], tb.Pos[3], 0, format("Trèng kh¶i hoµn <%s>",szTongName));
	tb.nTongId = nTongId
	tb.TimerCount = tbVNGTriumphDrum.nTimerCount
	
	if (tb.NpcIndex <= 0) then
		return nil
	end

	tbVNGDrumNpcList[tb.NpcIndex] = tb
	AddTimer(tbVNGTriumphDrum.nTimerOut, "OnTime", tb.NpcIndex)
	return tb
end

function tbVNGDrumNpc:OnTime()
	
	self.TimerCount = self.TimerCount - 1
	--print("=====tbVNGDrumNpc:OnTime() self.NpcIndex:"..self.NpcIndex)
	--print("=====tbVNGDrumNpc:OnTime() self.TimerCount:"..self.TimerCount)
	
	if self.TimerCount <= 0 then
		--print("=====tbVNGDrumNpc:OnTime() self.TimerCount*-1:"..self.TimerCount*-1)
		DelNpc(self.NpcIndex)
		tbVNGDrumNpcList[self.NpcIndex] = nil
		return 0, 0
	end
	
	local nOldPlayer = PlayerIndex
	local tbAllPlayer, nPlayerCount = GetNpcAroundPlayerList(self.NpcIndex, tbVNGTriumphDrum.nSercherRange)
	local tbGoodPlayer = {}
	
	for i = 1, nPlayerCount do
		PlayerIndex = tbAllPlayer[i]
		local szTongName, nTongId = GetTongName();
		if nTongId == self.nTongId and GetLevel() >= tbVNGTriumphDrum.nLimit_Level then
			tbGoodPlayer[getn(tbGoodPlayer)+ 1] = PlayerIndex
		end 
	end
		
	local nGoodPlayerCount = getn(tbGoodPlayer)
	local nGoodPlayerExp = tbVNGTriumphDrum:GetExpDrump(nGoodPlayerCount)
	local szMsg = format("HiÖn t¹i cã %d thµnh viªn ®øng c¹nh trèng kh¶i hoµn. Cã thÓ nhËn ®­îc %d kinh nghiÖm.", nGoodPlayerCount, nGoodPlayerExp)
	local nCurDay = tonumber(GetLocalDate("%Y%m%d"))
	Msg2Tong(self.nTongId, szMsg)
	
	local tbAwardExp = {nExp = nGoodPlayerExp}
	
	for i = 1, nGoodPlayerCount do
		PlayerIndex = tbGoodPlayer[i]
			
		local nCurExpValue  = tbVNG_BitTask_Lib:getBitTask(tbVNGTriumphDrum.tbBitTaskID_DailyExp) 
		print("=====tbVNGDrumNpc:OnTime() nCurExpValue: "..nCurExpValue)
		if nCurExpValue < tbVNGTriumphDrum.nLimit_DayAward then	
			tbVNG_BitTask_Lib:addTask(tbVNGTriumphDrum.tbBitTaskID_DailyExp, nGoodPlayerExp/10000)
			if (nCurExpValue + tbAwardExp.nExp/10000) > tbVNGTriumphDrum.nLimit_DayAward then
				local nNewExp = (tbVNGTriumphDrum.nLimit_DayAward - nCurExpValue)*10000
				print(format("=====tbVNGDrumNpc:OnTime() Taskexp CUOI CUNG: %s: %d ",GetName(),tbVNG_BitTask_Lib:getBitTask(tbVNGTriumphDrum.tbBitTaskID_DailyExp) ))
				PlayerFunLib:AddExp(nNewExp,0,EVENT_LOG_TITLE,"PhanThuongTrongKhaiHoan")
			else
				print(format("=====tbVNGDrumNpc:OnTime() Taskexp: %s: %d ",GetName(),tbVNG_BitTask_Lib:getBitTask(tbVNGTriumphDrum.tbBitTaskID_DailyExp) ))
				PlayerFunLib:AddExp(nGoodPlayerExp,0,EVENT_LOG_TITLE,"PhanThuongTrongKhaiHoan")
			end
			--tbAwardTemplet:GiveAwardByList(tbAwardExp, "PhanThuongTrongKhaiHoan")
		else
			Msg2Player("H«m nay c¸c h¹ ®· nhËn kinh nghiÖm tõ Trèng kh¶i hoµn ®¹t tèi ®a, kh«ng thÓ nhËn thªm.")
		end
	end
	
	PlayerIndex = nOldPlayer
	return tbVNGTriumphDrum.nTimerOut, self.NpcIndex
end