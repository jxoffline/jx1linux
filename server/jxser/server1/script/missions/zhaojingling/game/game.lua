Include("\\script\\missions\\zhaojingling\\templet\\gametemplet.lua")
Include("\\script\\missions\\zhaojingling\\head.lua")
Include("\\script\\global\\autoexec_head.lua")

Game = GameTemplet:new()
Game.szMapType = "u trng t譵 M閏 Nh﹏"
Game.nGameState = 0 --比赛场的比赛状态，0表示还没开始，1表示比赛进行中
Game.nMuRenCount = 10 --每个房间木人每15秒的刷新数量

Game.Player = 
{
	szPath = "\\script\\missions\\zhaojingling\\game\\gameplayer.lua",
	szClassName = "GamePlayer",
}

Game.tbNpcTypeList = 
{
	["muren"] = 
	{
		nNpcId = 1749,
		szName = "M閏 Nh﹏",
		nLevel = 95,
		nTime = 10,
		szScriptPath = "\\script\\missions\\zhaojingling\\game\\muren.lua"
	},
}

Game.tbForbitItemType = 
{
	"PK", "CITYWAR", "SONGJIN", "SONGJIN_SP", "TRANSFER", "MATE", "SPECIAL", "CALLNPC", "SPRING", "DUANWUJIE", "ADDEXP", "YAOXIANG", "EXPBONUS", "CHRISTMAS"
}

function Game:AddMuRenOneRoom(szKey, szPosPath, nMapId)
	local tbNpc = self.tbNpcTypeList[szKey]
	
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end
	
	if not tbNpc then
		return
	end
	
	local nRowCount = TabFile_GetRowCount(szPosPath)
	local nTotalCount = nRowCount - 1
	if self.nMuRenCount >= nTotalCount then
		for nRow=2, nRowCount do
			local nX = TabFile_GetCell(szPosPath, nRow, "POSX")
			local nY = TabFile_GetCell(szPosPath, nRow, "POSY")
			if self.tbMapList[nMapId] then
				basemission_CallNpc(tbNpc, nMapId, nX, nY)
			end
		end
	else	
		local nBeginPos = random(1, nTotalCount)
		local nDistance = floor(nTotalCount / self.nMuRenCount)
		for i=1, self.nMuRenCount do
			local nPos = nBeginPos + nDistance * (i - 1)
			nPos = mod(nPos, nTotalCount) + 1
			local nX = TabFile_GetCell(szPosPath, nPos + 1, "POSX")
			local nY = TabFile_GetCell(szPosPath, nPos + 1, "POSY")		
			if self.tbMapList[nMapId] then
				basemission_CallNpc(tbNpc, nMapId, nX, nY)
			end
		end
	end
end

function Game:AddAllMuRen()
	if self.tbMap == nil then
		return
	end
	for key, value in self.tbMap do
		self:AddMuRenOneMap(value)
	end
end

function Game:AddMuRenOneMap(nMapId)
	if self.tbPlayer == nil or self.tbPlayer[nMapId] == nil then
		return
	end
	for key, value in self.tbPlayer[nMapId] do
		self:AddMuRenOneRoom("muren", format("\\settings\\maps\\chrismas\\elf_%d.txt", key), nMapId)
	end
end

--比赛开始
function Game:Start(nMapCount)
	if nMapCount == 0 then
		return
	end
	self:ApplyMap(nMapCount)
	self:RegAll()
	self:SetForbitItem(GAME_MAP)
	self.nGameState = 1
	return self.tbMap
end

--比赛结束
function Game:Over()
	self.nGameState = 0 --一定要在玩家出地图之前设为0
	self:GoOutGame()
	self:FreeMap()	
	self.tbMap = nil
end

--将所有玩家传出地图
function Game:GoOutGame()
	if self.tbPlayer == nil then
		return
	end
	for key, value in self.tbPlayer do
		self:GoOutMap(key, value)
	end
	self.tbPlayer = nil
end

function Game:GoOutMap(nMapId, tbMapPlayer)
	for key, value in tbMapPlayer do
		self:GoOutRoom(nMapId, value)
	end
end

function Game:GoOutRoom(nMapId, tbRoomPlayer)
	for key, value in tbRoomPlayer do
		local nPlayerIndex = SearchPlayer(value)
		if nPlayerIndex > 0 then
			local nCurMapId = getplayermapid(nPlayerIndex)
			if nCurMapId == nMapId then				
				local nOriMapId = CallPlayerFunction(nPlayerIndex, GetTask, TSK_LEAVERMAPID)
				local nX = CallPlayerFunction(nPlayerIndex, GetTask, TSK_LEAVERPOSX)
				local nY = CallPlayerFunction(nPlayerIndex, GetTask, TSK_LEAVERPOSY)
				CallPlayerFunction(nPlayerIndex, NewWorld, nOriMapId, nX, nY)
			end
		end
	end
end

function Game:ApplyMap(nMapCount)
	self.tbMap = self.tbMap or {}
	for i=1, nMapCount do
		self.tbMap[i] = ApplyDungeonMap(GAME_MAP)
		self:AssociateMap(self.tbMap[i])
	end
end

function Game:FreeMap()
	if self.tbMap == nil then
		return
	end
	local nMapCount = getn(self.tbMap)
	for i=1, nMapCount do
		ReturnDungenonMap(GAME_MAP, self.tbMap[i])
	end
end

function Game:SetForbitItem(nMapId)
	local szMapType = self.szMapType
	set_MapType(nMapId, szMapType)
	for i=1, getn(self.tbForbitItemType) do
		if self.tbForbitItemType[i] == "MATE" then
			FORBITMAP_LIST[nMapId] = 1	
		end
		
		tb_MapType[szMapType] = tb_MapType[szMapType] or {}
		tinsert(tb_MapType[szMapType], self.tbForbitItemType[i])
	end
end

function initialize()	
	PreApplyDungeonMap(GAME_MAP, 0, 1)
end

AutoFunctions:Add(initialize)



