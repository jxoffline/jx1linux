
Include("\\script\\second_hand_store\\itemdef.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\functionlib.lua")

SecondHandStore_Agent = {}

SecondHandStore_Agent.nPreCount = 55
SecondHandStore_Agent.bClose = 0

function SecondHandStore_Agent:CloseAgent()
	self.bClose = 1
end

function SecondHandStore_Agent:OpenAgent()
	self.bClose = 0
end

function SecondHandStore_Agent:WriteLog(szMsg)
	
	WriteLog(format("[%s]\t%s\t%s.","SecondHandStore_Agent",GetLocalDate("%Y-%m-%d %H:%M"), szMsg))
end

function SecondHandStore_Agent:Msg2Player(szName, szMsg)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		lib:DoFunByPlayer(nPlayerIndex, Msg2Player, szMsg)
	end
end


function SecondHandStore_Agent:SellGoodsToPlayer(szName, tbGoods)
	
	if not tbGoods or tbGoods.nPrice <= 0 then --理论上tbGoods绝对合法
		return 
	end
	local nPlayerIndex = SearchPlayer(szName)

	if nPlayerIndex > 0 then
		if lib:DoFunByPlayer(nPlayerIndex, CountFreeRoomByWH, tbGoods.nWidth, tbGoods.nHeight, 1) >= 1 then
			if lib:DoFunByPlayer(nPlayerIndex,Pay, tbGoods.nPrice) == 1 then
				lib:DoFunByPlayer(nPlayerIndex, tbAwardTemplet.GiveAwardByList, tbAwardTemplet, tbGoods, "buy second hand goods")
				return 1
			else
				self:Msg2Player(szName, "Ti襫 V祅g kh玭g ! ")
			end	
		else
			self:Msg2Player(szName, "Kho秐g tr鑞g trong t骾 kh玭g ! ")
		end
			
			
	end
end


----------------向relay发出请求----------------------------------------------------

function SecondHandStore_Agent:ApplyBuy(nIdx)
	if self.bClose == 1 then
		return 
	end
	self:ExecuteRelyScript("SecondHandStore:SendGoods", {GetName(), nIdx}, "SecondHandStore_Agent:ReceiveGoods")
end


function SecondHandStore_Agent:ApplyGetList(nPage)
	if self.bClose == 1 then
		return 
	end
	self:ExecuteRelyScript("SecondHandStore:SendList", {GetName(), nPage, self.nPreCount}, "SecondHandStore_Agent:ShowList")
	
end


function SecondHandStore_Agent:Sell(nItemIndex)
	if self.bClose == 1 then
		return 
	end
	if ITEM_GetExpiredTime(nItemIndex) > 0 or (ITEM_GetLeftUsageTime(nItemIndex) > 0 and ITEM_GetLeftUsageTime(nItemIndex) < 4294967295) then
		return
	end
	local tbItem = SecondHandItem:new(nItemIndex)
	
	if tbItem.nQuality == 1 or tbItem.nQuality == 2 or tbItem.nQuality == 4 then
		if tbItem.nPrice > 0  then
			self:ExecuteRelyScript("SecondHandStore:PublishGoods", {tbItem})
		end
	end
end

function SecondHandStore_Agent:ApplyShowVar()
	
	self:ExecuteRelyScript("SecondHandStore:GetCount", {GetName()}, "SecondHandStore_Agent:ShowCount")
end

-------------收到relay回复------------------

function SecondHandStore_Agent:ReceiveGoods(nParam, ResultHandle)
	
	local szPlayerName = ObjBuffer:PopObject(ResultHandle)
	local bSuccess = ObjBuffer:PopObject(ResultHandle)
	local varData = ObjBuffer:PopObject(ResultHandle)
	if bSuccess then --成功获取的话 varData为一个商品，否则是错误信息
		 --成功卖给玩家，则通知relay删除该道具，否则通知relay解锁该道具
		if self:SellGoodsToPlayer(szPlayerName, varData) then
			self:ExecuteRelyScript("SecondHandStore:NotifyDelItemFromList", {varData.nIdx})
			
			self:ApplyGetList(1)
		else
			self:ExecuteRelyScript("SecondHandStore:ApplyUnLockGoods", {varData.nIdx})
		end
	else
		self:Msg2Player(szPlayerName, varData)
	end
end


function SecondHandStore_Agent:ShowList(nParam, ResultHandle)
	local szPlayerName = ObjBuffer:PopObject(ResultHandle)
	local tbList = ObjBuffer:PopObject(ResultHandle)
	local nCurPage = ObjBuffer:PopObject(ResultHandle)
	local nNextPage = ObjBuffer:PopObject(ResultHandle)
	
	local tbOpt = {}
	if not tbList then
		return print("tbList is nil ")
	end
	
	local nPlayerIndex = SearchPlayer(szPlayerName)
	if nPlayerIndex > 0 then
		DynamicExecuteByPlayer(nPlayerIndex, "\\script\\item\\dynamic_shop\\dynamic_shop_gs.lua", "DynamicShop:SendItemToClient", nCurPage, tbList)
	end
end

function SecondHandStore_Agent:ShowCount(nParam, ResultHandle)
	local szPlayerName = ObjBuffer:PopObject(ResultHandle)	
	
	self:Msg2Player(szPlayerName, tostring(var))
end





function SecondHandStore_Agent:ExecuteRelyScript(szFun, tbParam, szCallBackFun)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, tbParam)
	RemoteExecute("\\script\\second_hand_store\\second_hand_gc.lua", szFun, handle, szCallBackFun)	
	OB_Release(handle)
end


