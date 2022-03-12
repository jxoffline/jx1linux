Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")
IncludeLib("ITEM")


if not tbVngDelItemLogin then
	tbVngDelItemLogin = {}
end
tbVngDelItemLogin.KEY_LOG = "LOG_FEATURE_CTC"
function tbVngDelItemLogin:OnLogin(bExchangeIn)
	if bExchangeIn == 1 then
		return
	end
	for i = 0, 15 do
		local tbRoomItems = GetRoomItems(i)		
	 	self:RemoveItem (tbRoomItems)
	end
	--Hµnh trang mang trªn ng­êi
	local tbEquipList=GetAllEquipment()
     self:RemoveItem (tbEquipList)	
end

function tbVngDelItemLogin:RemoveItem(tbItems)
	-- xãa item Tam T©m T­¬ng ¶nh Phï vÜnh viÔn
	local nStartdateTTAP = 201509040000
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	if nCurDate >=  nStartdateTTAP then		
		for i=1, getn(tbItems) do
			local nItemIdx = tbItems[i]			
			local nG, nD, nP = GetItemProp(nItemIdx)
			if (nG == 6 and nD == 1 and nP == 439) then				
				tbLog:PlayerActionLog(self.KEY_LOG,"XoaVatPham_"..GetItemName(nItemIdx))	
				RemoveItemByIndex(nItemIdx)					
			end
		end
	end	
	--Thªm h¹n sö dông item event tÕt t©y 1-2016
	local nEndDateT10 = 201601312400
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local tbItemNeedDelT10 = {30361,30362,30380,30381,30382,30383,30384,30385,30386,30387,30388}
	if nCurDate <=  nEndDateT10 then		
		for k=1, getn(tbItems) do
			local nItemIdx1 = tbItems[k]			
			local nG, nD, nP = GetItemProp(nItemIdx1)
			for v=1, getn(tbItemNeedDelT10) do
				if (nG == 6 and nD == 1 and nP == tbItemNeedDelT10[v] ) then				
					tbLog:PlayerActionLog(self.KEY_LOG,"AddExpiredTime_EventT102016: "..GetItemName(nItemIdx1))	
					ITEM_SetExpiredTime(nItemIdx1,20160201)
					SyncItem(nItemIdx1)
					print("=======ITEM_SetExpiredTime 20160201:"..GetItemName(nItemIdx1))
				end
			end
		end
	end	
end

EventSys:GetType("OnLogin"):Reg(0, tbVngDelItemLogin.OnLogin, tbVngDelItemLogin)