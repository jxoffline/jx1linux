Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")

tbPVLB_PtSpprt = {}
tbPVLB_PtSpprt.nCOTBatchAward = 20
tbPVLB_PtSpprt.nMaxExp = 10000000
tbPVLB_PtSpprt.nYDBZBatchAward = 6

function tbPVLB_PtSpprt:COTAward(nBatch, tbPlayers)
	if tbPVLB_Check:CheckTime() ~= 1 then
		return
	end
	if nBatch ~= self.nCOTBatchAward then		
		return
	end
	self:Award(tbPlayers, "ToDoiHoTroTanThuVuotAi")
end

function tbPVLB_PtSpprt:YDBZAward(nBatch, tbPlayers)
	if tbPVLB_Check:CheckTime() ~= 1 then
		return
	end
	if nBatch ~= self.nYDBZBatchAward then		
		return
	end
	self:Award(tbPlayers, "ToDoiHoTroTanThuVuotViemDe")
end

function tbPVLB_PtSpprt:Award(tbPlayers, strLog)
	local nNewPlayersCount = 0
	local nOldPlayer = PlayerIndex
	--ß’m sË l≠Óng t©n thÒ trong tÊ ÆÈi
	for i = 1, getn(tbPlayers) do
		PlayerIndex = tbPlayers[i]
		if tbPVLB_Check:IsNewPlayer() == 1 and GetLife(0) > 0 then
			nNewPlayersCount = nNewPlayersCount + 1
		end
	end
	if nNewPlayersCount <= 0 then
		return
	end
	local nExpAward = nNewPlayersCount*3000000
	if nExpAward > self.nMaxExp then
		nExpAward = self.nMaxExp
	end
	 
	for i = 1, getn(tbPlayers) do
		PlayerIndex = tbPlayers[i]
		local tbExp = {szName = "ßi”m Kinh Nghi÷m", nExp = nExpAward}
		tbAwardTemplet:Give(tbExp, 1, {"CuuNienHoiNgoLenhBai", strLog})		
		Msg2Player(format("<color=green>TÊ ÆÈi c„ <color><color=yellow>%d<color><color=green> t©n thÒ, nhÀn Æ≠Óc ph«n th≠Îng bÊ sung: <color><color=yellow>%d Æi”m kinh nghi÷m.<color>", nNewPlayersCount, nExpAward))
	end
	PlayerIndex = nOldPlayer
end