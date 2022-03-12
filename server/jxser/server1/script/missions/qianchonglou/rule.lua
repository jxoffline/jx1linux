Include("\\script\\missions\\basemission\\dungeon.lua")

Include("\\script\\global\\autoexec_head.lua")
Include("\\script\\script_protocol\\protocol_def_gs.lua")
Include("\\script\\missions\\qianchonglou\\challenger.lua")

Include("\\script\\item\\forbiditem.lua")

local tbRule = Dungeon:new_type("endless tower")
local COLD_DOWN = 1
tbRule.tbForbitItemType = 
{
	"CALLNPC",
	"TRANSFER",
}
local NPC_RANK = 
{
	[1] = {nPoint = 1, nMinLife = 1, nMaxLife = 5},
	[2] = {nPoint = 2, nMinLife = 1, nMaxLife = 10},
	[3] = {nPoint = 4, nMinLife = 1, nMaxLife = 20},
	[4] = {nPoint = 7, nMinLife = 2, nMaxLife = 40},
	[5] = {nPoint = 10, nMinLife = 2, nMaxLife = 53},
	[6] = {nPoint = 20, nMinLife = 2, nMaxLife = 80},
	[7] = {nPoint = 30, nMinLife = 3, nMaxLife = 133},
	[8] = {nPoint = 40, nMinLife = 3, nMaxLife = 160},
	[9] = {nPoint = 50, nMinLife = 3, nMaxLife = 200},
	[10] = {nPoint = 60, nMinLife = 4, nMaxLife = 266},
	[11] = {nPoint = 100, nMinLife = 5, nMaxLife = 267},
}

local MISSILE_RANK = 
{
	[1] = {nCost = 1, nMinDamage = 1, nMaxDamage = 6},
	[2] = {nCost = 2, nMinDamage = 2, nMaxDamage = 7},
	[3] = {nCost = 3, nMinDamage = 3, nMaxDamage = 8},
	[4] = {nCost = 4, nMinDamage = 4, nMaxDamage = 9},
	[5] = {nCost = 5, nMinDamage = 5, nMaxDamage = 10},
	[6] = {nCost = 6, nMinDamage = 6, nMaxDamage = 11},
	[7] = {nCost = 7, nMinDamage = 7, nMaxDamage = 13},
}

local MAX_NPC_COUNT = 30

local EXTRA_POWER = 100

tbRule.TEMPLATE_MAP_ID = 976


function tbRule:SetForbitItem()
	local szMapType = self.szDungeonType
	set_MapType(self.TEMPLATE_MAP_ID, szMapType)
		
	for i=1, getn(self.tbForbitItemType) do		
		tb_MapType[szMapType] = tb_MapType[szMapType] or {}
		tinsert(tb_MapType[szMapType], self.tbForbitItemType[i])
	end
end
function tbRule:_init(pChallenger)
	self.pChallenger = pChallenger
	local nTime = self.pChallenger:GetPlayTime()
	
	self.nEndTime = GetCurServerTime() + nTime;
	ClearMapNpc(self.nMapId)
	
	--DynamicExecute("\\script\\missions\\qianchonglou\\npc\\monster.lua", "clear_npc", self.nMapId)
	
	for i=1, %MAX_NPC_COUNT do
		DynamicExecute("\\script\\missions\\qianchonglou\\npc\\monster.lua", "add_monster", self.nMapId)
	end
	
	self:AddTimer(nTime * 18, self.OnTime, {self})
	return 1
end

function tbRule:KickOut()
	NewWorld(20,3546,6226)
end
	
function tbRule:OnEnterMap()
	if not self.nEndTime then
		self:KickOut()
	end
	self.pChallenger:OnEnterMap()
	tbPlayerHandle:OpenFisherUi(self.nEndTime)
end

function tbRule:OnLeaveMap()
	local nLeftTime = self.nEndTime - GetCurServerTime()
	self.pChallenger:SetPlayTime(nLeftTime)
	self.pChallenger:OnLeaveMap()
	tbPlayerHandle:CloseFisherUi()
end


function tbRule:OnTime()
	self:close()
	return 0
end

function tbRule:OnClose()
	if self.pChallenger then
		self.pChallenger:GoToLastPos()
	end
	ClearMapNpc(self.nMapId)
	
	--DynamicExecute("\\script\\missions\\qianchonglou\\npc\\monster.lua", "clear_npc", self.nMapId)
end

function tbRule:AwardPoint(nNpcRank)
	local pNpcRank = %NPC_RANK[nNpcRank]
	if not pNpcRank or not self.pChallenger then
		return
	end
	local nPoint = pNpcRank.nPoint
	self.pChallenger:AddAwardPoint(nPoint)
	Msg2Map(self.nMapId, format("%s nhËn ®­îc %d ®iÓm phÇn th­ëng", self.pChallenger.szName, nPoint))
end

function tbRule:UseGun(nGunRank, nX,  nY)
	self.nLastCastTime = self.nLastCastTime or 0
	if self.nLastCastTime + %COLD_DOWN > GetCurServerTime() then
		return
	end	
	if self.pChallenger.nExtraPower >= %EXTRA_POWER then
		self.pChallenger.nExtraPower = 0
		self.pChallenger:UseExtraGun(nX, nY)
	else
		self.pChallenger:UseGun(nGunRank, nX,  nY)
	end
	self.nLastCastTime = GetCurServerTime()
end

function tbRule:AddExtraPower(nNpcRank)
	local pNpcRank = %NPC_RANK[nNpcRank]
	if not pNpcRank or not self.pChallenger then
		return
	end
	local nPoint = pNpcRank.nPoint
	self.pChallenger.nExtraPower = self.pChallenger.nExtraPower + nPoint
	if self.pChallenger.nExtraPower >= %EXTRA_POWER then
		self.pChallenger:SetExtraGun()
		Msg2Map(self.nMapId, "Chóc mõng c¸c h¹ ®· nhËn ®­îc b¹o né ®Æc biÖt, xin h·y lùa chän môc tiªu.")
	end
end



function tbRule:IsDefeatedNpc(nNpcRank, nMissileRank)
	local pNpcRank = %NPC_RANK[nNpcRank]
	local pMissileRank = %MISSILE_RANK[nMissileRank]
	
	if not pNpcRank or not pMissileRank then
		return
	end
	
	local nLife = random(pNpcRank.nMinLife, pNpcRank.nMaxLife)
	local nDamage = random(pMissileRank.nMinDamage, pMissileRank.nMaxDamage) 	
 	
	if nLife <= nDamage then
		return 1
	end
end

function tbRule:GetTowerPos()
	local szPath = "\\settings\\missions\\qianchonglou\\playerpos.txt"
	local nX32, nY32 = DynamicExecute("\\script\\lib\\file.lua", "GetRandomAData", szPath)
	return self.nMapId, nX32/32,nY32/32
end

local init_rule = function ()
	PreApplyDungeonMap(%tbRule.TEMPLATE_MAP_ID, 0, 0)
end
AutoFunctions:Add(init_rule)
tbRule:SetForbitItem()
DynamicExecute("\\script\\item\\heart_head.lua", "add_forbit_templatemap", tbRule.TEMPLATE_MAP_ID)