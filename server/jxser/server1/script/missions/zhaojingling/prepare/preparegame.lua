Include("\\script\\missions\\zhaojingling\\templet\\gametemplet.lua")
Include("\\script\\missions\\zhaojingling\\head.lua")
Include("\\script\\task\\task_addplayerexp.lua")

PrepareGame = GameTemplet:new()
PrepareGame.szMapType = "ChuÈn bÞ t×m Méc Nh©n"
PrepareGame.nPlayerCount = 0
PrepareGame.nExp = 1000000 --¸øÂÖ¿ÕµÄÍæ¼ÒµÄ¾­Ñé

PrepareGame.Player = 
{
	szPath = "\\script\\missions\\zhaojingling\\prepare\\prepareplayer.lua",
	szClassName = "PreparePlayer",
}

PrepareGame.tbNpcTypeList = 
{
	["wagoner"] = 
	{
		nNpcId = 235,
		szName = "Xa phu ®Êu tr­êng chuÈn bÞ",
		nLevel = 95,
		szScriptPath = "\\script\\missions\\zhaojingling\\prepare\\wagoner.lua",
		szPosPath = "\\settings\\maps\\chrismas\\wagoner.txt",
	},
}

PrepareGame.tbForbitItemType = 
{
	"PK", "CITYWAR", "SONGJIN", "SONGJIN_SP", "TRANSFER", "MATE", "SPECIAL", "CALLNPC", "SPRING", "DUANWUJIE", "ADDEXP", "YAOXIANG", "EXPBONUS", "CHRISTMAS"
}

function PrepareGame:GoToGame()
	local nPCount = self.nPlayerCount
	local nMapCount = floor(nPCount / ALL_MAXPLAYERCOUNT)
	local nRestCount = nPCount - nMapCount * ALL_MAXPLAYERCOUNT
	if nRestCount >= LEASTPLAYERCOUNT then
		nMapCount = nMapCount + 1
	end
	local tbGame = DynamicExecute("\\script\\missions\\zhaojingling\\game\\game.lua", "getglobal", "Game")	
	local tbMap = tbGame:Start(nMapCount)
	local tbPlayerName = {}
	if self.tbPlayer == nil then
		return
	end
	for key, value in self.tbPlayer do
		if value ~= nil then
			tinsert(tbPlayerName, key)
		end
	end
	tbGame.tbPlayer = tbGame.tbPlayer or {}
	self:Chaos(tbPlayerName, 1, nPCount)
	local nLoopCount = nMapCount
	if nRestCount > 0 and nRestCount < LEASTPLAYERCOUNT then
		nLoopCount = nLoopCount + 1
	end
	for i=1, nLoopCount do
		local nBeginId = (i - 1) * ALL_MAXPLAYERCOUNT + 1
		local nEndId = i * ALL_MAXPLAYERCOUNT
		if nEndId > nPCount then
			nEndId = nPCount
		end
		local nMapId = -1
		if tbMap ~= nil and tbMap[i] ~= nil then
			nMapId = tbMap[i]
		end
		self:WantGoToMap(tbPlayerName, nBeginId, nEndId, MAXPLAYERCOUNT, nMapId, tbGame.tbPlayer)
	end
	self.tbPlayer = nil
	self.nPlayerCount = 0
end

function PrepareGame:WantGoToMap(tbPlayerName, nBeginId, nEndId, nSigleCount, nMapId, tbAllPlayer)
	if nMapId ~= -1 then
		tbAllPlayer[nMapId] = tbAllPlayer[nMapId] or {}
	end
	self:Chaos(tbPlayerName, nBeginId, nEndId)
	local nCount = nEndId - nBeginId + 1 --Ã¿ÕÅ±ÈÈüµØÍ¼µÄÍæ¼ÒÊýÁ¿
	local nRoomCount = floor(nCount / nSigleCount) --Ã¿ÕÅ±ÈÈüµØÍ¼ÓÐ¼¸¸ö±ÈÈü·¿¼ä
	local nRestCount = nCount - nRoomCount * nSigleCount
	if nRestCount >= LEASTPLAYERCOUNT then
		nRoomCount = nRoomCount + 1
	end
	local tbRoomId = {}
	for i=1, GAMECOUNT do
		tbRoomId[i] = i
	end
	self:Chaos(tbRoomId, 1, GAMECOUNT)
	local nLoopCount = nRoomCount
	if nRestCount > 0 and nRestCount < LEASTPLAYERCOUNT then
		nLoopCount = nLoopCount + 1
	end
	for i=1, nLoopCount do
		local nTmpBeginId = (i - 1) * nSigleCount + nBeginId
		local nTmpEndId = i * nSigleCount + nBeginId - 1
		if nTmpEndId > nEndId then
			nTmpEndId = nEndId
		end
		local nRoomIndex = -1
		if i <= nRoomCount then
			nRoomIndex = tbRoomId[i]	
		end
		self:DoGoToMap(tbPlayerName, nTmpBeginId, nTmpEndId, nMapId, nRoomIndex, tbAllPlayer)
	end
end

function PrepareGame:DoGoToMap(tbPlayerName, nBeginId, nEndId, nMapId, nRoomIndex, tbAllPlayer)
	if nMapId ~= -1 and nRoomIndex ~= -1 then
		tbAllPlayer[nMapId][nRoomIndex] = tbAllPlayer[nMapId][nRoomIndex] or {}
	end
	local nCanGoToMap = 1 --Ä¬ÈÏ¿ÉÒÔ±»´«ËÍ½ø±ÈÈüµØÍ¼
	if (nEndId - nBeginId + 1) < LEASTPLAYERCOUNT then
		--²»×ã6ÈËµÄÊ±ºòÕâ6¸öÍæ¼Ò½«²»ÄÜ±»´«ËÍ½ø±ÈÈüµØÍ¼,Í¬Ê±»á±»´«ËÍÖÁ¼ÇÂ¼¹ýµÄ±¨Ãûµã
		nCanGoToMap = 0
	end
	for i=nBeginId, nEndId do
		local nPlayerIndex = SearchPlayer(tbPlayerName[i])
		if nPlayerIndex > 0 then
			local nCurMapId = getplayermapid(nPlayerIndex)
			if nCurMapId == PREPARE_MAP then
				if nCanGoToMap == 1 then
					local nStartRow = PREPAREPOSENDLINE + 1 + (nRoomIndex - 1) * (GAMEPOSLINECOUNT + 1)
					local nEndRow = nStartRow + GAMEPOSLINECOUNT
					CallPlayerFunction(nPlayerIndex, self.MoveTo, self, nMapId, POSPATH, nStartRow, nEndRow)
					CallPlayerFunction(nPlayerIndex, SetTask, TSK_GROUPID, nRoomIndex)
					tinsert(tbAllPlayer[nMapId][nRoomIndex], tbPlayerName[i])
				else
					local nOriMapId = CallPlayerFunction(nPlayerIndex, GetTask, TSK_LEAVERMAPID)
					local nX = CallPlayerFunction(nPlayerIndex, GetTask, TSK_LEAVERPOSX)
					local nY = CallPlayerFunction(nPlayerIndex, GetTask, TSK_LEAVERPOSY)
					CallPlayerFunction(nPlayerIndex, NewWorld, nOriMapId, nX, nY)
					CallPlayerFunction(nPlayerIndex, tl_addPlayerExp, self.nExp)
					CallPlayerFunction(nPlayerIndex, Msg2Player, format("TrËn nµy ng­¬i ®· ®­îc lµm s¹ch, nh¹n ®­îc %d ®iÓm kinh nghiÖm", self.nExp))
				end
			end
		end
	end
end

--½«±íµÄË³Ðò±äÂÒ
function PrepareGame:Chaos(tbPlayerName, nBeginId, nEndId)
	for i=nBeginId, nEndId do
		local nId1 = random(nBeginId, nEndId)
		local nId2 = random(nBeginId, nEndId)
		local szName = tbPlayerName[nId1]
		tbPlayerName[nId1] = tbPlayerName[nId2]
		tbPlayerName[nId2] = szName
	end
end

function PrepareGame:Start()
	self:AssociateMap(PREPARE_MAP)
	self:RegAll()
	self:AddAllNpc()
	self:SetForbitItem()
end
