
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\second_hand_store\\goodslist.lua")

SecondHandStore = {}

SecondHandStore.tbGoodsList = SecondHandGoodsList
SecondHandStore.nMaxItemCount = 1000

SecondHandStore.SAVE_KEY = "Second_Hand_Store"

SecondHandStore.SK_GOOOD = 1
SecondHandStore.SK_ID_LIST = 2
SecondHandStore.SK_CurUsedIdx = 3

SecondHandStore.ERROR_GOODS_NOT_EXIST = "VÀt ph»m nµy kh´ng tÂn tπi."

SecondHandStore.ERROR_GOODS_LOCKED = "VÀt ph»m nµy Æang Æ≠Óc mua bÎi ng≠Íi kh∏c."

SecondHandStore.ERROR_GOODS_EXPIRED = "VÀt ph»m nµy Æ∑ Æ≠Óc c t Æi."
SecondHandStore.ERROR_ILLEGAL_PRICE = "Gi∏ c∂ cÒa vÀt ph»m nµy kh´ng b◊nh th≠Íng."

SecondHandStore.nStorageTime = 10080 * 60 --µ•Œª√Î

function Pack(...)
	return arg
end

----------sharedata ≤Ÿ◊˜------------------------------------------
function SecondHandStore:Save(nId, nKey, var)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, var)	
	OB_SaveShareData(handle, self.SAVE_KEY, nId, nKey)
	OB_Release(handle)
end

function SecondHandStore:Delete(nId, nKey)
	ClearRecordOnShareDB(self.SAVE_KEY, nId, nKey)
end

function SecondHandStore:Load(nId, nKey)
	local handle = OB_Create()	
	OB_LoadShareData(handle, self.SAVE_KEY, nId, nKey)
	local var = nil
	if OB_IsEmpty(handle) ~= 1 then
		var = ObjBuffer:PopObject(handle)
	end
	OB_Release(handle)
	return var
end


function SecondHandStore:AddGoodsToDB(Node)
	
	local tbIdList = self.tbGoodsList:GetIdList()
	self:Save(self.SK_ID_LIST, 1, tbIdList)
	self:Save(self.SK_GOOOD, Node.nIdx, Node.Data)
	self:Save(self.SK_CurUsedIdx, 1, self.tbGoodsList.CurUsedIdx)
end

function SecondHandStore:DelGoodsFromDB(Node)
	
	local tbIdList = self.tbGoodsList:GetIdList()
	self:Save(self.SK_ID_LIST, 1, tbIdList)
	self:Delete(self.SK_GOOOD, Node.nIdx)
end

function SecondHandStore:LoadFromDb()
	local tbIdx = self:Load(self.SK_ID_LIST, 1) or {}
	
	OutputMsg("tbIdx nCount "..getn(tbIdx))
	
	for i=1, getn(tbIdx) do
		if type(tbIdx[i]) == "number" then
			local Goods = self:Load(self.SK_GOOOD, tbIdx[i])
			if Goods then
				self.tbGoodsList:AddNode(Goods)
			end
		end
	end
	self.tbGoodsList.CurUsedIdx = self:Load(self.SK_CurUsedIdx, 1) or 0
end



----------sharedata ≤Ÿ◊˜ Ω· ¯-----------------------------------------

-------------÷˜¬ﬂº≠---------------------------------------

function SecondHandStore:AddItemToList(tbGoods)
	if not tbGoods.nIdx then
		tbGoods.nIdx = self.tbGoodsList:NewIdx()
	end
	tbGoods.nOnSaleTime = GetSysCurrentTime() --…œº‹ ±º‰
	tbGoods.nStorageTime = self.nStorageTime -- ¥Ê∑≈ ±º‰
	
	local Node = self.tbGoodsList:AddNode(tbGoods)
	self:AddGoodsToDB(Node)
	if self.tbGoodsList.nCount > self.nMaxItemCount then
		self.tbGoodsList:DelFristNode()
	end
end

function SecondHandStore:DelItemFromList(nIdx)
	local Node = self.tbGoodsList:DelNode(nIdx)
	if Node then
		self:DelGoodsFromDB(Node)	
	end
end

function SecondHandStore:GetGoodsByIdx(nIdx)
	local Node = self.tbGoodsList:GetNode(nIdx)
	if Node then
		return Node.Data
	end
end


function SecondHandStore:CheckAllItem()
	
	for nIdx, Node in self.tbGoodsList.Map do
		if Node and Node.Data then
			if not self:CheckItemSaleTime(Node.Data) then
				self:LockGoods(nIdx)
				self:DelItemFromList(nIdx)
			end
		end
		
	end
end

function SecondHandStore:CheckItemSaleTime(Goods)
	local nTime = self:GetCurTime()
	if Goods.nOnSaleTime + (Goods.nStorageTime or 0) < nTime then
		return
	end
	return 1
end



function SecondHandStore:GetCurTime()
	return GetSysCurrentTime()
end

function SecondHandStore:LockGoods(nIdx)
	
	local Goods = self:GetGoodsByIdx(nIdx)
	if Goods then
		Goods.bLock = 1
	end
end

function SecondHandStore:UnLockGoods(nIdx)
	local Goods = self:GetGoodsByIdx(nIdx)
	if Goods then
		Goods.bLock = nil
	end
end

function SecondHandStore:IsGoodsLocked(nIdx)
	local Goods = self:GetGoodsByIdx(nIdx)
	if Goods then
		return Goods.bLock
	end
end

function SecondHandStore:GetValidGoods(nIdx)
	local Goods =  self:GetGoodsByIdx(nIdx)
	if not Goods then
		return nil, self.ERROR_GOODS_NOT_EXIST
	end
	if self:IsGoodsLocked(nIdx) then
		return nil, self.ERROR_GOODS_LOCKED
	end
	
	if Goods.nPrice <= 0 then
		self:WriteLog(format("Gi∏ cÒa Æπo cÙ <%s> bªng 0", Goods.szName or "lost item"))
		return nil, self.ERROR_ILLEGAL_PRICE
		
	end
	
	self:LockGoods(nIdx)
	if not self:CheckItemSaleTime(Goods) then
		self:DelItemFromList(nIdx)
		return nil, self.ERROR_GOODS_EXPIRED
	end
	
	return 1, Goods
end

function SecondHandStore:WriteLog(szMsg)
	OutputMsg(szMsg)
end

----------------–≠“È¥¶¿Ì-------------------------------------------

function SecondHandStore:PublishGoods(ParamHandle, ResultHandle)
	-- local tbParam		= ObjBuffer:PopObject(ParamHandle)
	-- local Goods	= tbParam[1]
	-- if Goods then
	-- 	self:AddItemToList(Goods)
	-- end
end

function SecondHandStore:NotifyDelItemFromList(ParamHandle, ResultHandle)
	-- local tbParam		= ObjBuffer:PopObject(ParamHandle)
	-- local nIdx	= tbParam[1]
	-- 
	-- self:DelItemFromList(nIdx)
end

function SecondHandStore:ApplyUnLockGoods(ParamHandle, ResultHandle)
	-- local tbParam		= ObjBuffer:PopObject(ParamHandle)
	-- local nIdx	= tbParam[1]
	-- 
	-- self:UnLockGoods(nIdx)
end

function SecondHandStore:SendGoods(ParamHandle, ResultHandle)
	-- local tbParam		= ObjBuffer:PopObject(ParamHandle)
	-- local szPlayerName	= tbParam[1]
	-- local nIdx			= tbParam[2]
	-- 
	-- local bSucess, varData = self:GetValidGoods(nIdx)
	-- 
	-- ObjBuffer:PushObject(ResultHandle, szPlayerName)
	-- ObjBuffer:PushObject(ResultHandle, bSucess)
	-- ObjBuffer:PushObject(ResultHandle, varData)
    -- 
end

function SecondHandStore:SendList(ParamHandle, ResultHandle)
	
	-- local tbParam		= ObjBuffer:PopObject(ParamHandle)
	-- local szPlayerName	= tbParam[1]
	-- local nPage			= tbParam[2]
	-- local nPerPageCount	= tbParam[3]
	-- 
	-- local tbList, nNextPage = self.tbGoodsList:GetList(nPage, nPerPageCount)
	-- ObjBuffer:PushObject(ResultHandle, szPlayerName)
	-- ObjBuffer:PushObject(ResultHandle, tbList)
	-- ObjBuffer:PushObject(ResultHandle, nPage)
	-- ObjBuffer:PushObject(ResultHandle, nNextPage)
	
end


function SecondHandStore:GetCount(ParamHandle, ResultHandle)
	-- local tbParam		= ObjBuffer:PopObject(ParamHandle)
	-- local szPlayerName	= tbParam[1]	
	-- ObjBuffer:PushObject(ResultHandle, self.tbGoodsList.nCount)
	
end