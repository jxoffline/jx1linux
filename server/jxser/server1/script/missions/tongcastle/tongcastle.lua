Include("\\script\\missions\\tongcastle\\game.lua")
Include("\\script\\lib\\common.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\global\\autoexec_head.lua")

local tbCity = {
	[978] = {1, 1, "Ph­îng T­êng"},
	[979] = {2, 11, "Thµnh §«"},
	[980] = {3, 162, "§¹i Lý"},
	[981] = {4, 37, "BiÖn Kinh"},
	[982] = {5, 78, "T­¬ng D­¬ng"},
	[983] = {6, 80, "D­¬ng Ch©u"},
	[984] = {7, 176, "L©m An"},
}

TongCastle = Game:New()
TongCastle.szMapType = "Bang héi thµnh b¶o "
TongCastle.tbMapList = {}
TongCastle.GUARDLIMIT = 100
TongCastle.tbForbitItemType = --ÖØÔØ Î¥½ûµÀ¾ß
{
	"TRANSFER", "MATE", "CALLNPC",
}

TongCastle.Player = {
	szPath = "\\script\\missions\\tongcastle\\castleplayer.lua",
	szClassName = "CastlePlayer",
}

TongCastle.tbTrapList = 
{
	["East"] =
	{
		szPosPath = "\\settings\\maps\\tongcastle\\easttrap.txt",--TrapµãµÄ×ø±êÎÄ¼þ
		szTrapFile = "\\script\\missions\\tongcastle\\trap.lua",--Trap½Å±¾µÄÂ·¾¶
	},
	["South"] = 
	{
		szPosPath = "\\settings\\maps\\tongcastle\\southtrap.txt",
		szTrapFile = "\\script\\missions\\tongcastle\\trap.lua",
	},
	["West"] = 
	{
		szPosPath = "\\settings\\maps\\tongcastle\\westtrap.txt",
		szTrapFile = "\\script\\missions\\tongcastle\\trap.lua",
	},
	["North"] = 
	{
		szPosPath = "\\settings\\maps\\tongcastle\\northtrap.txt",
		szTrapFile = "\\script\\missions\\tongcastle\\trap.lua",
	},
}

TongCastle.tbObstacleList = {
	[1] = "\\settings\\maps\\tongcastle\\eastobstacle.txt",
	[2] = "\\settings\\maps\\tongcastle\\southobstacle.txt",
	[3] = "\\settings\\maps\\tongcastle\\westobstacle.txt",
	[4] = "\\settings\\maps\\tongcastle\\northobstacle.txt",
}

TongCastle.tbRealTrap = {
}

TongCastle.tbTrapId = {
}

TongCastle.tbObjFlag = {
}

TongCastle.tbTrap = {
	nCount = 0,
}

TongCastle.tbCamp = {
}

TongCastle.tbFriendNpcList = {
}

TongCastle.tbTreePoint = {
	
}

TongCastle.tbPlayerList = {
}

TongCastle.tbSzDir2Id = {
	["East"] = 1,
	["South"] = 2,
	["West"] = 3,
	["North"] = 4,
}

TongCastle.tbDirName = {
	[1] = "phÝa §«ng",
	[2] = "phÝa Nam",
	[3] = "phÝa T©y",
	[4] = "phÝa B¾c",
	}

TongCastle.tbNpcParam2Type = {
	[1] = "Thanh §ång Th­îng Cæ ThÇn Thô", 
	[2] = "B¹ch §ång Th­îng Cæ ThÇn Thô", 
	[3] = "Hoµng Kim Th­îng Cæ ThÇn Thô",
	[4] = "B¨ng §«ng Thñ VÖ",
	[5] = "HuyÔn Vùng Thñ VÖ",
	[6] = "Tõ Hµng Thñ VÖ",
	[7] = "Háa T­êng Thñ VÖ",
}

TongCastle.tbNpcInfoList = {
}

TongCastle.tbRoomCondition = {
	["personroom"] 	 = {
		szCName = "Nh©n Tù Phßng",
		tbOpenDay = {[3]=1, [6]=1, [0]=1},
		tbStartTime = {18,00},
		tbEndTime = {25,00},
	},
	["edgechannel"] = {
	},
	["earthchannel"] = {
		nNpcParam = 1,
	},
	["earthroom"] = {
		szCName = "§Þa Tù Phßng",
		tbOpenDay = {[3]=1, [6]=1, [0]=1},
		tbStartTime = {20,00},
		tbEndTime = {25,00},
	},
	["skyroom"] = {
		szCName = "Thiªn Tù Phßng",
		tbOpenDay = {[3]=1, [6]=1, [0]=1},
		tbStartTime = {23,40},
		tbEndTime = {25,00},
		nNpcParam = 2,
		nIsAllDir = 1,
	},
	["castle"] = {
		tbOpenDay = {[3]=1, [6]=1, [0]=1},
		tbStartTime = {18,00},
		tbEndTime = {25,00},
	},
}

TongCastle.tbNpcTypeList = --npcµÄÀàÐÍ
{
	["Thanh §ång Th­îng Cæ ThÇn Thô"] = 
	{
		nNpcId = 1912,
		szName = "Thanh §ång Th­îng Cæ ThÇn Thô",
		nLevel = 90,
		nIsboss = 1,
		bNoRevive = 1,
		tbNpcParam = {1,},
		nTime = 1,
		szScriptPath = "\\script\\missions\\tongcastle\\treedeath.lua",
		szPosPath = "\\settings\\maps\\tongcastle\\bronzetree.txt",
	},
	["B¹ch §ång Th­îng Cæ ThÇn Thô"] = 
	{
		nNpcId = 1913,
		szName = "B¹ch §ång Th­îng Cæ ThÇn Thô",
		nLevel = 90,
		nIsboss = 1,
		bNoRevive = 1,
		tbNpcParam = {2,},
		nTime = 1,
		szScriptPath = "\\script\\missions\\tongcastle\\treedeath.lua",
		szPosPath = "\\settings\\maps\\tongcastle\\silvertree.txt",
	},
	["Hoµng Kim Th­îng Cæ ThÇn Thô"] = 
	{
		nNpcId = 1914,
		szName = "Hoµng Kim Th­îng Cæ ThÇn Thô",
		nLevel = 90,
		nIsboss = 1,
		bNoRevive = 1,
		tbNpcParam = {3,},
		nTime = 1,
		szScriptPath = "\\script\\missions\\tongcastle\\treedeath.lua",
		szPosPath = "\\settings\\maps\\tongcastle\\goldtree.txt",
	},
	["B¨ng §«ng Thñ VÖ"] = 
	{
		nNpcId = 1908,
		szName = "B¨ng §«ng Thñ VÖ",
		nLevel = 90,
		nIsboss = 1,
		bNoRevive = 1,
		tbNpcParam = {4,},
		szScriptPath = "\\script\\missions\\tongcastle\\treedeath.lua",
	},
	["HuyÔn Vùng Thñ VÖ"] = 
	{
		nNpcId = 1909,
		szName = "HuyÔn Vùng Thñ VÖ",
		nLevel = 90,
		nIsboss = 1,
		bNoRevive = 1,
		tbNpcParam = {5,},
		szScriptPath = "\\script\\missions\\tongcastle\\treedeath.lua",
	},
	["Tõ Hµng Thñ VÖ"] = 
	{
		nNpcId = 1910,
		szName = "Tõ Hµng Thñ VÖ",
		nLevel = 90,
		nIsboss = 1,
		bNoRevive = 1,
		tbNpcParam = {6,},
		szScriptPath = "\\script\\missions\\tongcastle\\treedeath.lua",
	},
	["Háa T­êng Thñ VÖ"] = 
	{
		nNpcId = 1911,
		szName = "Háa T­êng Thñ VÖ",
		nLevel = 90,
		nIsboss = 1,
		bNoRevive = 1,
		tbNpcParam = {7,},
		szScriptPath = "\\script\\missions\\tongcastle\\treedeath.lua",
	},
}

function TongCastle:Init()
	for key, value in self.tbNpcTypeList do
			if value.szPosPath then
				self:LoadNpcList(key, value.szPosPath)
			end
	end
	for nMapId, bFlag in self.tbMapList do
		if bFlag then
			self.tbCamp[nMapId] = {}
			self.tbCamp[nMapId].nCount = 1
			self.tbTrapId[nMapId] = {}
			self.tbTrapId[nMapId].nCount = 0
			self.tbTrap[nMapId] = {}
			self.tbTrap[nMapId].nCount = 0
			self.tbObjFlag[nMapId] = 0
			self.tbFriendNpcList[nMapId] = {}
			self.tbFriendNpcList[nMapId].tbInfo = {}
			self.tbFriendNpcList[nMapId].nGuard = 0
		end
	end
	self:AddTimer()
end

function TongCastle:GetDir(szDir)
	return self.tbSzDir2Id[szDir]
end

function TongCastle:GetRoomOpenTime(szRoomName)
	local tbOpenDay = self.tbRoomCondition[szRoomName].tbOpenDay
	if not tbOpenDay then
		return
	end
	
	local nWeekDay = tonumber(GetLocalDate("%w"))
	local nLastWeekDay = nWeekDay - 1
	if nLastWeekDay == -1 then
		nLastWeekDay = 6
	end
	
	if (not tbOpenDay[nWeekDay]) and (not tbOpenDay[nLastWeekDay]) then
		return
	end
	
	local nCurTime = tonumber(GetLocalDate("%H"))*60 + tonumber(GetLocalDate("%M"))
	local tbStartTime = self.tbRoomCondition[szRoomName].tbStartTime
	local tbEndTime = self.tbRoomCondition[szRoomName].tbEndTime
	local nStartTime = tbStartTime[1]*60 + tbStartTime[2]
	local nEndTime = tbEndTime[1]*60 + tbEndTime[2]
	
	if tbOpenDay[nLastWeekDay] and (nCurTime < nEndTime - 1440) then
		return nStartTime-1440, nEndTime-1440
	end
	
	if tbOpenDay[nWeekDay] then
		return nStartTime, nEndTime
	end
end

function TongCastle:IsInOpenTime(szRoomName)
	local nCurTime = tonumber(GetLocalDate("%H"))*60 + tonumber(GetLocalDate("%M"))
	local nStartTime,nEndTime = self:GetRoomOpenTime(szRoomName)
	if nStartTime and nEndTime then
		return (nStartTime <= nCurTime) and (nCurTime < nEndTime), nStartTime, nEndTime
	end
end

function TongCastle:GetTrapIdByName(nMapId, szTrapName)
	local nOp, nEd = strfind(szTrapName, "null", 1)
	if nOp ~= nil then
		return -1
	end
	if self.tbTrapId[nMapId][szTrapName] == nil then
		self.tbTrapId[nMapId][szTrapName] = self.tbTrapId[nMapId].nCount + 1
		self.tbTrapId[nMapId].nCount = self.tbTrapId[nMapId].nCount + 1
	end
	return self.tbTrapId[nMapId][szTrapName]
end

function TongCastle:GetRoomNameByTrapName(szTrapName)
	for szRoomName, _ in self.tbRoomCondition do
		local nPos, _ = strfind(szTrapName, szRoomName)
		if nPos then
			return szRoomName
		end
	end
	return ""
end

function TongCastle:AddATrap(szPrefix, szPosPath, szTrapFile)
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return
	end
	
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow = 1, nRowCount do
		local szCurTrapName = format("%s*%s", szPrefix, TabFile_GetCell(szPosPath, nRow, 2))
		local szNextTrapName = format("%s*%s", szPrefix, TabFile_GetCell(szPosPath, nRow+1, 2))
		local nIsTrans = tonumber(TabFile_GetCell(szPosPath, nRow+2, 2))
		local nNpcParam = tonumber(TabFile_GetCell(szPosPath, nRow+3, 2))
		local nTrapCount = tonumber(TabFile_GetCell(szPosPath, nRow+4, 2))
		local nTransCount = tonumber(TabFile_GetCell(szPosPath, nRow+5, 2))
		for nMapId, bFlag in self.tbMapList do
			if bFlag and SubWorldID2Idx(nMapId) >= 0 then
				local nCurTrapId = self:GetTrapIdByName(nMapId, szCurTrapName)
				local nNextTrapId = self:GetTrapIdByName(nMapId, szNextTrapName)
				self.tbTrap[nMapId][nCurTrapId] = {}
				self.tbTrap[nMapId][nCurTrapId].szName = szCurTrapName
				self.tbTrap[nMapId][nCurTrapId].szNextName = szNextTrapName
				self.tbTrap[nMapId][nCurTrapId].nNextId = nNextTrapId
				self.tbTrap[nMapId][nCurTrapId].nIsTrans = nIsTrans
				self.tbTrap[nMapId][nCurTrapId].nCount = nTrapCount
				self.tbTrap[nMapId][nCurTrapId].nDir = self:GetDir(szPrefix)
				self.tbTrap[nMapId][nCurTrapId].tbList = {}
				self.tbTrap[nMapId][nCurTrapId].tbTransList = {}
				for i = nRow+6, nRow+6+nTrapCount-1 do
					local nX = tonumber(TabFile_GetCell(szPosPath, i, 1))
					local nY = tonumber(TabFile_GetCell(szPosPath, i, 2))
					tinsert(self.tbTrap[nMapId][nCurTrapId].tbList, {nX, nY})
					AddMapTrap(nMapId, nX, nY, szTrapFile, nCurTrapId)
				end
				for i = nRow+6+nTrapCount, nRow+6+nTrapCount+nTransCount-1 do
					local nTransX = tonumber(TabFile_GetCell(szPosPath, i, 1))
					local nTransY = tonumber(TabFile_GetCell(szPosPath, i, 2))
					tinsert(self.tbTrap[nMapId][nCurTrapId].tbTransList, {nTransX, nTransY})
				end
			end
		end
		nRow = nRow+6+nTrapCount+nTransCount-1
	end
end

function TongCastle:CheckTrapCondition(nMapId, nCurTrapId)
	local nTmpCamp = GetTmpCamp()
	if nTmpCamp == 1 then
		Msg2Player("<color=yellow>thµnh viªn bang chiÕm thµnh, h¹n chÕ kh«ng truyÒn tèng <color>")
		return 1
	end
	
	local szCurTrapName  = self.tbTrap[nMapId][nCurTrapId].szName
	local szCurRoomName  = self:GetRoomNameByTrapName(szCurTrapName)
	local szNextTrapName = self.tbTrap[nMapId][nCurTrapId].szNextName
	local szNextRooName  = self:GetRoomNameByTrapName(szNextTrapName)
	local nDir 			 = self.tbTrap[nMapId][nCurTrapId].nDir
	
	local tbNextRoom = self.tbRoomCondition[szNextRooName]
	if tbNextRoom then
		local bOpen,_,_ = self:IsInOpenTime(szNextRooName)
		if not bOpen and tbNextRoom.tbStartTime then
			local szTimeUpMsg = format("<color=yellow>%s vµo thø 4, thø 7, chñ nhËt %.2d:%.2d ®Õn 01:00 më, c¸c thêi gian kh¸c kh«ng ®­îc ®i vµo. <color>",
																	tbNextRoom.szCName, tbNextRoom.tbStartTime[1], tbNextRoom.tbStartTime[2], tbNextRoom.tbEndTime[1], tbNextRoom.tbEndTime[2])
			Msg2Player(szTimeUpMsg)
			return
		end
		
		local _,_, nMapIndex = GetPos()
		local nMapId = SubWorldIdx2ID(nMapIndex)
		local nNpcParam = tbNextRoom.nNpcParam
		local nIsAllDir = tbNextRoom.nIsAllDir
		if nNpcParam then
			local nNpcCount = 0
			if nIsAllDir == 1 then
				for i = 1, 4 do
					local szKey = format("nNpcParam%dnDir%d", nNpcParam, i)
					if self.tbFriendNpcList[nMapId][szKey] and self.tbFriendNpcList[nMapId][szKey] > 0 then
						nNpcCount = nNpcCount + self.tbFriendNpcList[nMapId][szKey]
					end
				end
			else
				local szKey = format("nNpcParam%dnDir%d", nNpcParam, nDir)
				if self.tbFriendNpcList[nMapId][szKey] and self.tbFriendNpcList[nMapId][szKey] > 0 then
						nNpcCount = nNpcCount + self.tbFriendNpcList[nMapId][szKey]
				end
			end
			if nNpcCount > 0 then
				if strfind(szNextRooName, "earthchannel") then
					Msg2Player("<color=yellow>thÇn thñ Nh©n Tù Phßng phÝa nµy ch­a ®èn xong, kh«ng thÓ tiÕn vµo §Þa Tù Phßng <color>")
				elseif strfind(szNextRooName, "skyroom") then
					Msg2Player("<color=yellow>Bèn ThÇn Thô cña §Þa Tù Phßng ch­a ®èn hÕt, kh«ng thÓ di vµo Thiªn Tù Phßng.<color>")
				end
				return
			else
--				Msg2Player("<color=yellow>npcËÀ¹â£¬¿ÉÒÔ´«ËÍ<color>")
				return 1
			end
		end
			
		return 1
	end
	return
end

function TongCastle:TestGetRoom()
	local _,_, nMapIndex = GetPos()
	local nMapId = SubWorldIdx2ID(nMapIndex)
	local szPlayerName = GetName()
	Msg2Player(self.tbPlayerList[nMapId][szPlayerName].szCurName)
end

function TongCastle:BroadcastTreeDeath(nMapId, nNpcParam, nDir)
	local nNpcCount = 0
	local szMsg = ""
	if nNpcParam == 1 then
		local szKey = format("nNpcParam%dnDir%d", nNpcParam, nDir)
		if self.tbFriendNpcList[nMapId][szKey] and self.tbFriendNpcList[nMapId][szKey] > 0 then
			nNpcCount = nNpcCount + self.tbFriendNpcList[nMapId][szKey]
		end
		if nNpcCount == 0 then
			szMsg = format("H­íng Nh©n Tù Phßng %s toµn bé ThÇn Méc bÞ ®¸nh b¹i, sau khi §Þa Tù Phßng më, h·y ®i vµo §Þa Tù Phßng.", self.tbDirName[nDir])
		else
			szMsg = format("%s h­íng Nh©n Tù Phßng toµn bé ThÇn Méc bÞ ®¸nh b¹i, tiÕp tôc ®¸nh b¹i %d ThÇn Méc h­íng %s cã thÓ sau khi §Þa Tù Phßng më h·y ®i vµo §Þa Tù Phßng.",
															self.tbDirName[nDir], nNpcCount, self.tbDirName[nDir])
		end
	elseif nNpcParam == 2 then
		for i=1, 4 do
			local szKey = format("nNpcParam%dnDir%d", nNpcParam, i)
			if self.tbFriendNpcList[nMapId][szKey] and self.tbFriendNpcList[nMapId][szKey] > 0 then
				nNpcCount = nNpcCount + self.tbFriendNpcList[nMapId][szKey]
			end
		end
		if nNpcCount == 0 then
			szMsg = "Toµn bé ThÇn Méc §Þa Tù Phßng bÞ ®¸nh b¹i, cã thÓ sau khi Thiªn Tù Phßng më h·y ®i vµo Thiªn Tù Phßng."
		else
			szMsg = format("§Þa Tù Phßng h­íng %s ThÇn Thô bÞ ®¸nh b¹i, ®¸nh b¹i ThÇn Thô cña §Þa Tù Phßng cßn d­ l¹i cã thÓ sau khi Thiªn Tù Phßng më h·y ®i vµo Thiªn Tù Phßng.", self.tbDirName[nDir])
		end
	elseif nNpcParam == 3 then
		return
	end
	Msg2Map(nMapId, szMsg)
end

function TongCastle:ExecTranAction(nMapId, nCurTrapId, nIsTrans)
	local szPlayerName = GetName()
	local szCurRooName = self:GetRoomNameByTrapName(self.tbPlayerList[nMapId][szPlayerName].szCurName)
	local szCurTrapName  = self.tbTrap[nMapId][nCurTrapId].szName
	local szRoomName  = self:GetRoomNameByTrapName(szCurTrapName)
	local szNextTrapName = self.tbTrap[nMapId][nCurTrapId].szNextName
	local szNextRoomName  = self:GetRoomNameByTrapName(szNextTrapName)
	local nNextTrapId = self.tbTrap[nMapId][nCurTrapId].nNextId
	local nDir 	= self.tbTrap[nMapId][nCurTrapId].nDir
	
	if nIsTrans == 1 then
		self.tbPlayerList[nMapId][szPlayerName].nDir = nDir
		self.tbPlayerList[nMapId][szPlayerName].szCurName = szNextTrapName	
	else
		if szCurRoomName ~= szRoomName then
			self.tbPlayerList[nMapId][szPlayerName].nDir = nDir
			self.tbPlayerList[nMapId][szPlayerName].szCurName = szCurTrapName	
		end
	end
	
	if nIsTrans == 1 then
		local nRandomCount = getn(self.tbTrap[nMapId][nCurTrapId].tbTransList)
		if nRandomCount and nRandomCount > 0 then
			local nRandomTrapId = random(1, nRandomCount)
			local nX, nY = unpack(self.tbTrap[nMapId][nCurTrapId].tbTransList[nRandomTrapId]) 
			SetPos(nX/32, nY/32)
		end
	end
end 

function TongCastle:TrapMoveTo(nMapId, nCurTrapId)
	if self.tbTrap[nMapId][nCurTrapId].nIsTrans == 1 and self:CheckTrapCondition(nMapId, nCurTrapId) == 1 then
		self:ExecTranAction(nMapId, nCurTrapId, self.tbTrap[nMapId][nCurTrapId].nIsTrans)
		return
	elseif self.tbTrap[nMapId][nCurTrapId].nIsTrans == 0 then
		self:ExecTranAction(nMapId, nCurTrapId, self.tbTrap[nMapId][nCurTrapId].nIsTrans)
	end
end

function TongCastle:OnTime()
	for nMapId, bFlag in self.tbMapList do
		if bFlag then
			local nMapIndex = SubWorldID2Idx(nMapId)
			if nMapIndex >= 0 and self.tbPlayerList[nMapId] then
				local tbMsg = {}
				local nMsgCount = 0
				local szCityTongName, _ = GetCityOwner(%tbCity[nMapId][1])
				for szPlayerName, tbPlayer in self.tbPlayerList[nMapId] do
					local nPlayerIndex = SearchPlayer(szPlayerName)
					if nPlayerIndex > 0 then
						local szTongName, _ = CallPlayerFunction(nPlayerIndex, GetTongName)
						local szRoomName = self:GetRoomNameByTrapName(self.tbPlayerList[nMapId][szPlayerName].szCurName)
						if szCityTongName ~= szTongName and self.tbRoomCondition[szRoomName] then
							local bOpen,nStartTime,nEndTime = self:IsInOpenTime(szRoomName)
							local nCurTime = tonumber(GetLocalDate("%H"))*60 + tonumber(GetLocalDate("%M"))
							if bOpen and (nEndTime - nCurTime <= 5) then
								local szTimeUpMsg = format("phßng nµy cßn %d phót sÏ ®ãng l¹i", nEndTime - nCurTime)
								CallPlayerFunction(nPlayerIndex, Msg2Player, szTimeUpMsg)
							elseif (not bOpen) and self.tbRoomCondition[szRoomName].tbStartTime then
								CallPlayerFunction(nPlayerIndex, Msg2Player, format("%s Tù Phßng thêi gian më ngµy h«m nay ®· kÕt thóc, ng­¬i bÞ truyÒn tèng ®Õn bang héi thµnh b¶o .", self.tbRoomCondition[szRoomName].szCName))
								CallPlayerFunction(nPlayerIndex, NewWorld, 176, 1661, 3271)
							end
								
							if self.tbPlayerList[nMapId][szPlayerName] then
								local nDir = self.tbPlayerList[nMapId][szPlayerName].nDir
								local szCurTrapName = self.tbPlayerList[nMapId][szPlayerName].szCurName
								local szCurRoomName  = self:GetRoomNameByTrapName(szCurTrapName)
								local szMsg = ""
								
								if self.tbRoomCondition[szCurRoomName].szCName then
									if self.tbDirName[nDir] and szCurRoomName ~= "skyroom" then
										szMsg = self.tbDirName[nDir]
									end
									local szMsg = format("trong %s%s cã tån t¹i hiÖp kh¸ch m«n ph¸i kh¸c, ®Ó b¶o ®¶m an toµn cho thÇn thô, h·y trë l¹i kiÓm tra ", szMsg, self.tbRoomCondition[szCurRoomName].szCName)
									nMsgCount = nMsgCount + 1
									tbMsg[nMsgCount] = szMsg				
								end
							end
						end
					end
				end
				
				local handle = OB_Create()
				ObjBuffer:PushObject(handle, nMsgCount)
				ObjBuffer:PushObject(handle, szCityTongName)
				for i = 1, nMsgCount do
					ObjBuffer:PushObject(handle, tbMsg[i])
				end
				RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:Msg2Tong", handle)
				OB_Release(handle)
				
				self:UpdateObstacleObj(nMapId)
			end
		end
	end
	
	local bCastleOpened = self:IsInOpenTime("castle")
	if not bCastleOpened then
		self:TransOutPlayer()
	end	
	return 60*18, 0
end

function TongCastle:UpdateObstacleObj(nMapId)
	local bSkyRoomOpen = self:IsInOpenTime("skyroom")
	local nNpcCount = 0
	for i = 1, 4 do
		local szKey = format("nNpcParam%dnDir%d", 2, i)
		if self.tbFriendNpcList[nMapId][szKey] and self.tbFriendNpcList[nMapId][szKey] > 0 then
			nNpcCount = nNpcCount + self.tbFriendNpcList[nMapId][szKey]
		end
	end	
	
	if bSkyRoomOpen and nNpcCount == 0 and self.tbObjFlag[nMapId] == 1 then
		self:DelAllAObstacleObj(nMapId)
	elseif nNpcCount ~= 0 and self.tbObjFlag[nMapId] == 0 then
		self:AddAllObstacleObj(nMapId)
	end
end

function TongCastle:DelAllAObstacleObj(nMapId)
	self.tbObjFlag[nMapId] = 0
	for i = 1, 4 do
		self:ClearAObstacleObj(nMapId, i)
	end
	for i = 1, getn(self.tbTrap[nMapId]) do
		if strfind(self.tbTrap[nMapId][i].szName, "skyroom1") or strfind(self.tbTrap[nMapId][i].szName, "earthroom2") then
			self.tbTrap[nMapId][i].nIsTrans = 0
		end
	end
end

function TongCastle:AddTimer()
	AddTimer(60*18, "TongCastle:OnTime", 0)
end

function TongCastle:AddAObstacle(nMapId, szPosPath)
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return
	end
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow = 2, nRowCount do
		local nX = tonumber(TabFile_GetCell(szPosPath, nRow, 1))
		local nY = tonumber(TabFile_GetCell(szPosPath, nRow, 2))
		AddObstacleObj(469, nMapId, nX, nY)
	end
end

function TongCastle:ClearAObstacleObj(nMapId, nDir)
	local szPosPath = self.tbObstacleList[nDir]
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return
	end
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow = 2, nRowCount do
		local nX = tonumber(TabFile_GetCell(szPosPath, nRow, 1))
		local nY = tonumber(TabFile_GetCell(szPosPath, nRow, 2))
		ClearObstacleObj(nMapId, nX, nY)
	end
end

function TongCastle:AddPlayer2List(szPlayerName, nMapId, szTongName)
	if self.tbPlayerList[nMapId] == nil then
		self.tbPlayerList[nMapId] = {}
	end
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		self.tbPlayerList[nMapId][szPlayerName] = {nDir = 0, szCurName = "",}
		local szCityTong, _ = GetCityOwner(%tbCity[nMapId][1])
		if szCityTong == szTongName then
			self.tbCamp[nMapId][szCityTong] = 1
		elseif self.tbCamp[nMapId][szTongName] == nil or 
			self.tbCamp[nMapId][szTongName] == 1 then

			self.tbCamp[nMapId][szTongName] = self.tbCamp[nMapId].nCount + 1
			self.tbCamp[nMapId].nCount = self.tbCamp[nMapId].nCount + 1
		end 
		CallPlayerFunction(nPlayerIndex, SetTmpCamp, self.tbCamp[nMapId][szTongName])
	end
end

function TongCastle:DelPlayer2List(szPlayerName, nMapId)
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		self.tbPlayerList[nMapId][szPlayerName] = nil
		CallPlayerFunction(nPlayerIndex, SetTmpCamp, 0)
	end
end

function TongCastle:LoadNpcList(szName, szPosPath)
	local tb = self.tbNpcTypeList[szName]
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	if not tb then
		return 
	end
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow = 2, nRowCount do
		local nX = tonumber(TabFile_GetCell(szPosPath, nRow, 1))
		local nY = tonumber(TabFile_GetCell(szPosPath, nRow, 2))
		local nDir = tonumber(TabFile_GetCell(szPosPath, nRow, 3))
		for nMapId, bFlag in self.tbMapList do
			if bFlag then	
				local tbCurNpcInfo = {
					nParam = tb.tbNpcParam[1],
					nMapId = nMapId,
					nX = nX,
					nY = nY,
					nDir = nDir,
				}
				if self.tbNpcInfoList[nMapId] == nil then
					self.tbNpcInfoList[nMapId] = {}
				end
				tinsert(self.tbNpcInfoList[nMapId], tbCurNpcInfo)
			end
		end
	end
end

function TongCastle:ClearGuardNpc(hParam)
	local nMapId = ObjBuffer:PopObject(hParam)
	if SubWorldID2Idx(nMapId) < 0 then
		return
	end
	if self.tbFriendNpcList[nMapId] then
		local tbTmp = clone(self.tbFriendNpcList[nMapId])
		for nNpcIndex, dwNpcId in tbTmp.tbInfo do
			if GetNpcId(nNpcIndex) == dwNpcId then
				local nNpcParam = GetNpcParam(nNpcIndex, 1)
				local nDir = GetNpcParam(nNpcIndex, 2)
				if nNpcParam >= 4 then
					self:UnRegANpc(nMapId, nNpcParam, nDir, nNpcIndex, dwNpcId)
					DelNpc(nNpcIndex)
				end
			end
		end
	end
end

function TongCastle:AddAllObstacleObj(nMapId)
	self.tbObjFlag[nMapId] = 1
	for i = 1, 4 do
		self:AddAObstacle(nMapId, self.tbObstacleList[i])
	end
	for i = 1, getn(self.tbTrap[nMapId]) do
		if strfind(self.tbTrap[nMapId][i].szName, "skyroom1") or strfind(self.tbTrap[nMapId][i].szName, "earthroom2") then
			self.tbTrap[nMapId][i].nIsTrans = 1
		end
	end
end

function TongCastle:AddTreeInMap(nMapId, nTreeType)
	self:ClearAllTreeNpc(nMapId, nTreeType)
	local tbNewNpc = {}
	local nCount = getn(self.tbNpcInfoList[nMapId])

	for i = 1, nCount do
		local tbNpcInfo = self.tbNpcInfoList[nMapId][i]
		local nNpcParam = tbNpcInfo.nParam
		if (nMapId == tbNpcInfo.nMapId) and ((not nTreeType) or nNpcParam == nTreeType) then
			local nX = tbNpcInfo.nX
			local nY = tbNpcInfo.nY
			local nDir = tbNpcInfo.nDir
			local szNpcName = self.tbNpcParam2Type[nNpcParam]
			local tbNpc = self.tbNpcTypeList[szNpcName]
			local nNewNpcIndex = self:basemission_CallNpc(tbNpc, nMapId, nX, nY)
			if nNewNpcIndex > 0 then
				SetNpcParam(nNewNpcIndex, 2, nDir)
				SetTmpCamp(1, nNewNpcIndex)
				self:RegANpc(nMapId, nNpcParam, nDir, nNewNpcIndex, GetNpcId(nNewNpcIndex))
				tinsert(tbNewNpc, {nNpcParam=nNpcParam, nX=nX, nY=nY, nDir=nDir})
			end
		end
	end

	local nNewNpcCount = getn(tbNewNpc)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nNewNpcCount)
	ObjBuffer:PushObject(handle, nMapId)
	for i=1,nNewNpcCount do
			ObjBuffer:PushObject(handle, tbNewNpc[i].nNpcParam)
			ObjBuffer:PushObject(handle, tbNewNpc[i].nX)
			ObjBuffer:PushObject(handle, tbNewNpc[i].nY)
			ObjBuffer:PushObject(handle, tbNewNpc[i].nDir)
	end
	RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua", "tbS3TongCastle:SaveNpcData", handle)
	OB_Release(handle)
	
	Msg2Map(nMapId, format("<color=yellow>Lµm míi %s trong Thµnh B¶o Bang Héi. <color>", self.tbNpcParam2Type[nTreeType]))
end

function TongCastle:TreeNpcRevive(hParam)--nMapId, nTreeType)
	local nTreeType = ObjBuffer:PopObject(hParam)
	local tbMap = self:GetMapListOnThisServer()
	
	for i=1,getn(tbMap) do
		self:AddTreeInMap(tbMap[i], nTreeType)
	end
end

function TongCastle:AddTreeFromRelay(nMapId, hParam)
	if (not hParam) or (OB_IsEmpty(hParam) == 1) then
		return
	end
	local nCount = ObjBuffer:PopObject(hParam)
	for i=1, nCount do
		local nNpcParam = ObjBuffer:PopObject(hParam)
		local nX = ObjBuffer:PopObject(hParam)
		local nY = ObjBuffer:PopObject(hParam)
		local nDir = ObjBuffer:PopObject(hParam)
		local szNpcName = self.tbNpcParam2Type[nNpcParam]
		local tbNpc = self.tbNpcTypeList[szNpcName]
		local nNewNpcIndex = self:basemission_CallNpc(tbNpc, nMapId, nX, nY)
		if nNewNpcIndex > 0 then
			SetNpcParam(nNewNpcIndex, 2, nDir)
			SetTmpCamp(1, nNewNpcIndex)
			self:RegANpc(nMapId, nNpcParam, nDir, nNewNpcIndex, GetNpcId(nNewNpcIndex))
		end
	end
	
	self:UpdateObstacleObj(nMapId)
end

function TongCastle:GetAndAddTreeFromRelay()
	local tbMap = self:GetMapListOnThisServer()
	local nCount = getn(tbMap)
	
	ObjBuffer:PushObject(handle, nCount)
	for i=1,getn(tbMap) do
		local handle = OB_Create()
		ObjBuffer:PushObject(handle, tbMap[i])
		RemoteExecute("\\script\\mission\\tongcastle\\tongcastle.lua",
									"tbS3TongCastle:SendTreeToGS", handle,
									"TongCastle:AddTreeFromRelay", tbMap[i])
		OB_Release(handle)
	end
end

function TongCastle:FindNpc(nMapId, nNpcIndex, dwNpcId)
	if self.tbFriendNpcList[nMapId] == nil then
		return
	end
	if self.tbFriendNpcList[nMapId].tbInfo == nil then
		return
	end
	if self.tbFriendNpcList[nMapId].tbInfo[nNpcIndex] ~= dwNpcId then
		return
	end
	return 1
end

function TongCastle:ClearAllTreeNpc(nMapId, nType)
	if self.tbFriendNpcList[nMapId] then
		local tbTmp = clone(self.tbFriendNpcList[nMapId])
		for nNpcIndex, dwNpcId in tbTmp.tbInfo do
			if GetNpcId(nNpcIndex) == dwNpcId then
				local nNpcParam = GetNpcParam(nNpcIndex, 1)
				local nDir = GetNpcParam(nNpcIndex, 2)
				if (not nType) or (nNpcParam>=1 and nNpcParam <= 3 and nNpcParam == nType)then
					self:UnRegANpc(nMapId, nNpcParam, nDir, nNpcIndex, dwNpcId)
					DelNpc(nNpcIndex)
				end
			end
		end
	end
end

function TongCastle:RegANpc(nMapId, nNpcParam, nDir, nNpcIndex, dwNpcId)
	local szKey = format("nNpcParam%dnDir%d", nNpcParam, nDir)
	if self.tbFriendNpcList[nMapId] == nil then
		self.tbFriendNpcList[nMapId] = {}
		self.tbFriendNpcList[nMapId].tbInfo = {}
		self.tbFriendNpcList[nMapId].nGuard = 0
	end
	if self.tbFriendNpcList[nMapId][szKey] == nil then
		self.tbFriendNpcList[nMapId][szKey] = 0
	end
	self.tbFriendNpcList[nMapId][szKey] = self.tbFriendNpcList[nMapId][szKey] + 1
	self.tbFriendNpcList[nMapId].tbInfo[nNpcIndex] = dwNpcId
	if nNpcParam >= 4 then
		self.tbFriendNpcList[nMapId].nGuard = self.tbFriendNpcList[nMapId].nGuard + 1
	end
end

function TongCastle:GuardIsLimit(nMapId)
	if self.tbFriendNpcList[nMapId].nGuard + 1 > self.GUARDLIMIT then
		return 
	end
	return 1
end

function TongCastle:UnRegANpc(nMapId, nNpcParam, nDir, nNpcIndex, dwNpcId)
	local szKey = format("nNpcParam%dnDir%d", nNpcParam, nDir)
	if self.tbFriendNpcList[nMapId] == nil then
		return
	end
	if self.tbFriendNpcList[nMapId].tbInfo == nil then
		return
	end
	local dwTmpNpcId = self.tbFriendNpcList[nMapId].tbInfo[nNpcIndex]
	if dwTmpNpcId ~= dwNpcId then
		return
	end
	if nNpcParam >= 4 then
		self.tbFriendNpcList[nMapId].nGuard = self.tbFriendNpcList[nMapId].nGuard - 1
	end
	self.tbFriendNpcList[nMapId][szKey]= self.tbFriendNpcList[nMapId][szKey] - 1
	self.tbFriendNpcList[nMapId].tbInfo[nNpcIndex] = nil
end

function TongCastle:TransOutPlayer()
	for nMapId, bFlag in self.tbMapList do
		if bFlag and self.tbPlayerList[nMapId] then
			for szPlayerName, _ in self.tbPlayerList[nMapId] do
				local nPlayerIndex = SearchPlayer(szPlayerName)
				if nPlayerIndex > 0 then
					CallPlayerFunction(nPlayerIndex, Msg2Player, "Thêi gian më Thµnh B¶o Bang Héi kÕt thóc, ng­¬i bÞ chuyÓn ra ngoµi.")
					CallPlayerFunction(nPlayerIndex, NewWorld, 176, 1661, 3271)
				end
			end
		end
	end
end

function TongCastle:GetMapListOnThisServer()
	local tbMap = {}
	for nMapId, bFlag in self.tbMapList do
		local nMapIndex = SubWorldID2Idx(nMapId)
		if bFlag and nMapIndex >= 0 then
			tinsert(tbMap, nMapId)
		end
	end
	
	return tbMap
end

function TongCastle:TreeLifeTimeOver(hParam)
	local nTreeType = ObjBuffer:PopObject(hParam)
	local tbMap = self:GetMapListOnThisServer()
	for i=1,getn(tbMap) do
			self:ClearAllTreeNpc(tbMap[i], nTreeType)
	end
end

function TongCastle:Start()

	self:AssociateMap(978)
	self:AssociateMap(979)
	self:AssociateMap(980)
	self:AssociateMap(981)
	self:AssociateMap(982)
	self:AssociateMap(983)
	self:AssociateMap(984)
	
	self:SetForbitItem()
	self:Init()
	self:RegAll()
	self:AddAllTrap()
	self:GetAndAddTreeFromRelay()
	
end

function TongCastle:basemission_CallNpc(tbNpc, nMapId, nPosX, nPosY)
	nMapId	= nMapId or tbNpc.nMapId
	nPosX	= nPosX or tbNpc.nPosX 
	nPosY	= nPosY or tbNpc.nPosY
	local nMapIndex = SubWorldID2Idx(nMapId)
	if nMapIndex >= 0 then		
		local nNpcIndex = AddNpcEx(
			tbNpc.nNpcId,  --npc Id
			tbNpc.nLevel or 1,		-- µÈ¼¶
			tbNpc.nSeries or random(0,4),		-- ÎåÐÐ
			nMapIndex,	-- µØÍ¼
			nPosX,	-- X×ø±ê
			nPosY,	-- Y×ø±ê
			tbNpc.bNoRevive or 1,			-- ²»ÖØÉú
			tbNpc.szName,		-- Ãû×Ö
			tbNpc.nIsboss or 0
		);	-- ÊÇ·ñBOSS
		if nNpcIndex <= 0 then
			return 0
		end
		if tbNpc.szDeathScript then
			SetNpcDeathScript(nNpcIndex, tbNpc.szDeathScript);
		end
			
		if tbNpc.szScriptPath then 
			SetNpcScript(nNpcIndex, tbNpc.szScriptPath)
		end
		if tbNpc.nTime then
			SetNpcTimer(nNpcIndex, 18*tbNpc.nTime);
		end
		
		if tbNpc.nCurCamp then
			SetNpcCurCamp(nNpcIndex, tbNpc.nCurCamp)
		end
		if tbNpc.tbNpcParam then
			for i =1, getn(tbNpc.tbNpcParam) do 
				if tbNpc.tbNpcParam[i] then
					SetNpcParam(nNpcIndex, i, tbNpc.tbNpcParam[i])
				end
			end
		end
		if tbNpc.pCallBack then
			tbNpc:pCallBack(nNpcIndex)
		end
		return nNpcIndex
	else
		return 0
	end
end

--AutoFunctions:Add(TongCastle.Start, TongCastle)