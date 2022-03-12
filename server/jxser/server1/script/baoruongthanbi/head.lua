Task_Daily_OpenBox1 = 2730
Task_Daily_OpenBox2 = 2731
Task_Daily_OpenBox3 = 2732
Task_Daily_OpenBox4 = 2733
Task_GetKeyBox_OnlineTime = 2734


function ConpareValue(nBoxValue, nKeyValue, nKeyIndex)
	local nKeyVar = CheckUserInputKey(nKeyIndex)
	local nGetBoxVar = 0
	if (nKeyVar == 2) then
		nGetBoxVar = floor(nBoxValue/1000)
		if (nGetBoxVar == nKeyValue) then
			return 4--giai 2 so
		end
	end
	if (nKeyVar == 3) then
		nGetBoxVar = floor(nBoxValue/100)
		if (nGetBoxVar == nKeyValue) then
			return 3--giai 3 so
		end
	end
	if (nKeyVar == 4) then
		nGetBoxVar = floor(nBoxValue/10)
		if (nGetBoxVar == nKeyValue) then
			return 2--giai 4 so
		end
	end
	if (nKeyVar == 5) then
		nGetBoxVar = floor(nBoxValue/1)
		if (nGetBoxVar == nKeyValue) then
			return 1--giai 5 so
		end
	end
	return 0--ko trung
end

function GetBoxValue(nBoxIndex)
	local nBoxVar = GetItemParam(nBoxIndex, 1);
	return nBoxVar
end
function GetKeyValue(nKeyIndex)
	local nKeyVar = GetItemParam(nKeyIndex, 1);
	return nKeyVar
end

function CheckUserInputKey(nIndexKey)
	local nKeyValue = GetKeyValue(nIndexKey)
	--Msg2Player("haint say nIndexKey: "..nIndexKey)
	--Msg2Player("Haint say nKeyValue: "..nKeyValue)
	if (nKeyValue <= 99) then
		return 2--key 2 so
	end
	if (nKeyValue > 99 and nKeyValue <= 999) then
		return 3--key 3 so
	end
	if (nKeyValue > 999 and nKeyValue <= 9999) then
		return 4--key 4 so
	end
	return 5--5 so
end

function RemoveAllItem(nCount, nIndexBox)
	for i=1, nCount do
		local nItemIndex = GetGiveItemUnit(i)	--lay ve Item Index cac vat pham
		if (nItemIndex ~= nIndexBox) then
			RemoveItemByIndex(nItemIndex)
		end
	end
end

function KeyBox_ActiveDropItem()
		local nDate = tonumber(GetLocalDate("%Y%m%d"))
		if (nDate > 20101010) then
			return 0
		end
		return 1
end
