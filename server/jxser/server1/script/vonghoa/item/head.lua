OneDayTime = 60 * 24
Task_BeUse_VongHoa = 2720							-- Task sö dông vong hoa
nMaxEXP = 650000
nEndDate = 20100919
Task_IsCurUse_VongHoa = 2721
Task_NPC_InDex = 2722
Task_TimerId = 2723


function VH_ActiveDay()
		local nDate = tonumber(GetLocalDate("%Y%m%d"))
		if (nDate > nEndDate) then
			return 0
		end
		return 1
end

function AddMaterial(nVar)
	if (nVar == 1) then
		--for i=1, nCount do
			local nItemIndex = AddStackItem(50,6,1,1064,1,0,0)
			ITEM_SetExpiredTime(nItemIndex, 20100913)
			SyncItem(nItemIndex)
			local nItemIndex = AddStackItem(49,6,1,1064,1,0,0)
			ITEM_SetExpiredTime(nItemIndex, 20100913)
			SyncItem(nItemIndex)
		--end
	end
	if (nVar == 2) then
		--for i=1, nCount do
			local nItemIndex = AddStackItem(50, 6,1,1065,1,0,0)
			ITEM_SetExpiredTime(nItemIndex, 20100913)
			SyncItem(nItemIndex)
			local nItemIndex = AddStackItem(49, 6,1,1065,1,0,0)
			ITEM_SetExpiredTime(nItemIndex, 20100913)
			SyncItem(nItemIndex)
		--end
	end
	if (nVar == 3) then
			--for i=1, nCount do
			local nItemIndex = AddStackItem(50, 6,1,1066,1,0,0)
			ITEM_SetExpiredTime(nItemIndex, 20100913)
			SyncItem(nItemIndex)
			local nItemIndex = AddStackItem(49, 6,1,1066,1,0,0)
			ITEM_SetExpiredTime(nItemIndex, 20100913)
			SyncItem(nItemIndex)
		--end
	end
	
end
