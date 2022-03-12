Include("\\script\\lib\\objbuffer_head.lua")
PrizePool = {}
PrizePool.SAVE_KEY			= "FUNC_PRIZE_POOL"

MIN_POOL_SIZE = 500

MIN_AWARD_PERSENT = 20
MAX_AWARD_PERSENT = 50


function PrizePool:Init(var)
	self.nCoin = self:Load() or 0
end
function PrizePool:Save(var)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, var)	
	OB_SaveShareData(handle, self.SAVE_KEY, 0, 0)
	OB_Release(handle)
end

function PrizePool:Load()
	local handle = OB_Create()	
	OB_LoadShareData(handle, self.SAVE_KEY, 0, 0)
	local var = 0
	if OB_IsEmpty(handle) ~= 1 then
		var = ObjBuffer:PopObject(handle)
	end
	OB_Release(handle)
	return var
end

function PrizePool:AddCoin(ParamHandle, ResultHandle)
	local nCoin = ObjBuffer:PopObject(ParamHandle)
	OutputMsg("PrizePool:AddCoin " .. nCoin)
	if type(nCoin) ~= "number" then
		return
	end
	if nCoin > 0 then
		self.nCoin = self.nCoin + nCoin
		OutputMsg("PrizePool:AddCoin self.nCoin = " .. self.nCoin)
		self:Save(self.nCoin)
	end
end

function PrizePool:GetCoin(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	if type(szName) ~= "string" then
		return
	end
		if self.nCoin < MIN_POOL_SIZE then
		self.nCoin = MIN_POOL_SIZE
	end
	
	ObjBuffer:PushObject(ResultHandle, szName)
	ObjBuffer:PushObject(ResultHandle, self.nCoin)
end

function PrizePool:GetBigAward(ParamHandle, ResultHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	if type(szName) ~= "string" then
		return
	end

	if self.nCoin < MIN_POOL_SIZE then
		self.nCoin = MIN_POOL_SIZE
	end
	
	local rcur=random(MIN_AWARD_PERSENT, MAX_AWARD_PERSENT)
	local nCoin = floor(self.nCoin * rcur / 100)
	
	self.nCoin = self.nCoin - nCoin
	if self.nCoin < MIN_POOL_SIZE then 
		self.nCoin = MIN_POOL_SIZE
	end
	
	self:Save(self.nCoin)
	ObjBuffer:PushObject(ResultHandle, szName)
	ObjBuffer:PushObject(ResultHandle, nCoin)
	ObjBuffer:PushObject(ResultHandle, self.nCoin)
end

PrizePool:Init(var)