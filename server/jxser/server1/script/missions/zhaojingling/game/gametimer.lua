Include("\\script\\missions\\zhaojingling\\game\\game.lua")
Include("\\script\\lib\\objbuffer_head.lua")

Game.nInterval = 15 --µ¥Î»Ãë 
Game.nPassTime = 0 --ÒÑ¾­¹ýÁË¶àÉÙÊ±¼ä,µ¥Î»Ãë
Game.nRemindInterval = 30 --ÏµÍ³Ã¿30ÃëÌáÊ¾Íæ¼ÒÅÅÃûºÍÕÒµ½¿þÀÜÄ¾ÈËµÄÊýÁ¿

local szRemoteScript = "\\script\\event\\zhaojingling\\event.lua"

function Game:InitTimer()
	if self.nTimeIndex then
		DelTimer(self.nTimeIndex)
	end
	self.nPassTime = 0
	self.nTimeIndex = AddTimer(self.nInterval * 18, "Game:OnTime", 0)
end

function Game:OnTime(nTimerId, nParam)
	self.nPassTime = self.nPassTime + self.nInterval
	local nTimeDis = self.nPassTime - GAMETIME * 60
	local nValue = mod(self.nPassTime, self.nRemindInterval)
	if nValue == 0 then
		self:SortPaiMing(nTimeDis)
	end
		
	if nTimeDis >= 0 then
		--±ÈÈü½áÊø,Í£Ö¹¼ÆÊ±Æ÷
		self:Over()
		return 0, 0
	end
	
	local nNotAddMuRen = 0
	if self.nPassTime == self.nInterval then
		--±ÈÈü¿ªÊ¼Ç°15ÃëÖÓµÄÊ±ºò²»¼ÓÔØ¿þÀÜÄ¾ÈË
		nNotAddMuRen = 1
	end
	
	if self.nPassTime >= (GAMETIME * 60 - self.nRemindInterval) then
		--±ÈÈü×îºó30Ãë²»¼ÓÔØ¿þÀÜÄ¾ÈË
		nNotAddMuRen = 1
	end
	
	if nNotAddMuRen ~= 1 then
		self:AddAllMuRen() --Ã¿¹ý15Ãë¼ÓÔØÒ»´Î¿þÀÜÄ¾ÈË
	end
	return self.nInterval * 18, 0
end

function Game:SortPaiMing(nTimeDis)
	if self.tbPlayer == nil then
		return
	end
	for key, value in self.tbPlayer do
		self:SortPaiMingOneMap(key, value, nTimeDis)
	end
end

function Game:SortPaiMingOneMap(nMapId, tbMapPlayer, nTimeDis)
	for key, value in tbMapPlayer do
		self:SortPaiMingOneRoom(nMapId, value, nTimeDis)
	end
end

function Game:SortPaiMingOneRoom(nMapId, tbRoomPlayer, nTimeDis)
	local tbPlayerName = {}
	for key, value in tbRoomPlayer do
		local nPlayerIndex = SearchPlayer(value)
		if nPlayerIndex > 0 then
			local nCount = CallPlayerFunction(nPlayerIndex, GetTask, TSK_COUNT_ONETIME)
			if nCount > 0 then
				tinsert(tbPlayerName, {value, nCount})
			end
		end
	end
	sort(tbPlayerName, self.SortCompare)
	local nIndex = 1
	for key, value in tbPlayerName do
		if key ~= "n" then
			local nPlayerIndex = SearchPlayer(value[1])
			if nPlayerIndex > 0 then
				local nCurMapId = getplayermapid(nPlayerIndex)
				if nCurMapId == nMapId then
					CallPlayerFunction(nPlayerIndex, SetTask, TSK_RANK, nIndex)
					local szMsg = format("Ng­¬i ®· t×m ®­îc %d Méc Nh©n, hiÖn t¹i lµ h¹ng thø %d", value[2], nIndex)
					CallPlayerFunction(nPlayerIndex, Msg2Player, szMsg)
					local nRoomId = CallPlayerFunction(nPlayerIndex, GetTask, TSK_GROUPID)
					local szAccount = CallPlayerFunction(nPlayerIndex, GetAccount)
					WriteLog(format("[ Thêi gian Méc Nh©n:%s Sè phßng: %d xÕp h¹ng:%d account: %s nh©n vËt: %s sè l­îng: %s", GetLocalDate("%Y-%m-%d %H:%M"), nRoomId, nIndex, szAccount, value[1], value[2]))
					nIndex = nIndex + 1
					if nTimeDis >= 0 then --Ò»¾Ö½áÊøµÄÊ±ºò
						self:AddMuRenCount(value[1], value[2])
					end
				end
			end
		end
	end
end

--°´ÕÒµ½¿þÀÜÄ¾ÈËµÄÊýÁ¿´Ó´óµ½Ð¡ÅÅÁÐ
Game.SortCompare = function(tbA, tbB)
	return tbA[2] > tbB[2]
end

function Game:AddMuRenCount(szName, nCount)
	if nCount == 0 then
		return
	end
	local obj = ObjBuffer:New()
	obj:Push(szName)
	obj:Push(nCount)
	RemoteExecute(%szRemoteScript, "tbJingLing:g2s_AddCount", obj.m_Handle)
	obj:Destroy()
end
