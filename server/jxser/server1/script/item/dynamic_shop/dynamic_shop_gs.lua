if MODEL_GAMESERVER ~= 1 then
	return
end

Include("\\script\\script_protocol\\protocol_def_gs.lua")

DynamicShop = {}

DynamicShop.tbShop = 
{
	[178] = 
	{
		szFile = "\\script\\second_hand_store\\second_hand_gs.lua",
		szGetList =  "SecondHandStore_Agent:ApplyGetList",
		szBuyCmd = "SecondHandStore_Agent:ApplyBuy"
	},
}

function DynamicShop:SendToClient(nHandle)
	ScriptProtocol:SendData("emSCRIPT_PROTOCOL_STORES_REQUEST_ITEM", nHandle)
end


function DynamicShop:ProtocolProcess(szFun, tbParam)
	 if self[szFun] ~= "function" then
	 	return
	end
	 
	self[szFun](self, unpack(tbParam) )
end


function DynamicShop:SendItem(nRequestPage)
	
	local nDynamicShopID = GetDynamicShopID();

	local pShop = self.tbShop[nDynamicShopID];
	
	if (nDynamicShopID <= 0  or pShop == nil) then
		print("nDynamicShopID <= 0 or pShop == nil", nDynamicShopID, pShop)
		return
	end
	
	-- 交付处理函数处理
	 DynamicExecuteByPlayer(PlayerIndex, pShop.szFile, pShop.szGetList, nRequestPage);

end


function DynamicShop:SendItemToClient(nRequestPage, tbItem)
	
	if tbItem == nil  then
		return 
	end

	
	local nDynamicShopID = GetDynamicShopID();
	
	local nHandle = OB_Create()
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nDynamicShopID)
	ObjBuffer:PushByType(nHandle, OBJTYPE_NUMBER, nRequestPage)
	
	ObjBuffer:PushByType(nHandle, OBJTYPE_TABLE, tbItem)
	self:SendToClient(nHandle)
	OB_Release(nHandle)
end



function DynamicShop:Buy(nShopId, nIdx)
	
	local nDynamicShopID = GetDynamicShopID();


	if nDynamicShopID ~= nShopId then
		return
	end


	local pShop = self.tbShop[nDynamicShopID];
	
	if (nDynamicShopID <= 0  or pShop == nil) then
		print("nDynamicShopID <= 0 or pShop == nil", nDynamicShopID, pShop)
		return
	end
	
	-- 交付处理函数处理
	DynamicExecuteByPlayer(PlayerIndex, pShop.szFile, pShop.szBuyCmd, nIdx);
end