Include("\\script\\item\\forbiditem.lua")
Include("\\script\\item\\heart_head.lua")

DungeonList = {}

DungeonType = {}
Dungeon = {}

DungeonTypeCount = {}

local nPak = curpack()
function Dungeon:new_type(szKey)
	local tb = {}
	for k,v in self do
		tb[k] = v
	end
	DungeonType[szKey] = tb
	tb.szDungeonType = szKey
	tb.nPak = curpack()
	return tb
end


function Dungeon:new(nMapId, nTemplateMapId, tbInitParam)
	
	if DungeonList[nMapId] then
		DungeonList[nMapId]:close()
	end	
	local tb = {}
	for k, v in self do
		tb[k] = v
	end
	tb.nTemplateMapId = nTemplateMapId
	tb.nMapId = nMapId
	
	DungeonTypeCount[self.szDungeonType] = DungeonTypeCount[self.szDungeonType] or 0
	
	DungeonTypeCount[self.szDungeonType] = DungeonTypeCount[self.szDungeonType] + 1
	
	local nMapIndex = SubWorldID2Idx(nMapId)
	local bRet = nil
	if nMapIndex >= 0 then
		local nPak = usepack(self.nPak)
		bRet = tb:_init(unpack(tbInitParam))
		usepack(nPak)
	end
	if nMapIndex >= 0 and bRet then
		DungeonList[nMapId] = tb
		
		
		return tb
	else
		tb:free()
	end
end

function Dungeon:new_dungeon(nTemplateMapId, tbInitParam)
	
	local nMapId = ApplyDungeonMap(nTemplateMapId)
	if nMapId > 0 then
		return self:new(nMapId, nTemplateMapId, tbInitParam)
	end
end

function Dungeon:free()
	DungeonTypeCount[self.szDungeonType] = DungeonTypeCount[self.szDungeonType] - 1
	if DungeonTypeCount[self.szDungeonType] <= 0 then
		DungeonTypeCount[self.szDungeonType] = nil
	end
	
	if self._timer_ then
		for nTimerId, tb in self._timer_ do
			DelTimer(nTimerId)
		end
		self._timer_ = nil
	end
	DungeonList[self.nMapId] = nil
	if self.nTemplateMapId then
		ReturnDungenonMap(self.nTemplateMapId, self.nMapId)
	end
end

function Dungeon:close()
	if self.OnClose then
		self:OnClose()
	end
	self:free()
end

function Dungeon:_init(...)
	return 1
end

function Dungeon:OnEnterMap()
end
function Dungeon:OnLeaveMap()
end

function Dungeon:AddTimer(nFrame, fn, tbParam)
	local nOldPak = usepack(%nPak)
	local nTimerId = AddTimer(nFrame, "Dungeon:OnTime", self.nMapId)
	self._timer_ = self._timer_ or {}
	self._timer_[nTimerId] = {fn, tbParam}
	usepack(nOldPak)
end

function Dungeon:OnTime(nMapId, nTimerId)
	local pDungeon = DungeonList[nMapId]
	if not pDungeon or not pDungeon._timer_ then
		return 0, 0
	end
	local tb = pDungeon._timer_[nTimerId]
	if not tb then
		return 0, 0
	end
	local nPak = usepack(pDungeon.nPak)
	local nFrame = call(tb[1], tb[2])
	usepack(nPak)
	if nFrame and nFrame > 0 then
		return nFrame, nMapId
	else
		if pDungeon._timer_ then
			pDungeon._timer_[nTimerId] = nil
		end
		return 0,0
	end
end

function Dungeon:SetForbitItem(nMapId)
	local szMapType = self.szDungeonType
	set_MapType(nMapId, szMapType)
	for i=1, getn(self.tbForbitItemType) do
		local szItemType = self.tbForbitItemType[i]
		add_Item2Map(szMapType, szItemType)
		if szItemType == "MATE" then
			add_forbit_templatemap(nMapId)
		end
	end
end