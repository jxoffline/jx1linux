--Include("\\script\\vng_event\\vip_account_2011\\item\\head.lua")
Include("\\script\\vng_event\\vip_account_2011\\npc\\peachtree.lua")
if not tbVNG_VipAcc_BaoLiXi then
	tbVNG_VipAcc_BaoLiXi = {}
end
tbVNG_VipAcc_BaoLiXi.nStartDay = 20110203
tbVNG_VipAcc_BaoLiXi.nEndDay = 20110207
tbVNG_VipAcc_BaoLiXi.tbTaskInfo =
	{
		nTaskID = 2754,
		nStartBit = 11,
		nBitCount = 1,
		nMaxValue = 1
	}

function main(nItemIdx)
	if tbVNG_VipAcc_BaoLiXi:isActive() ~= 1 then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0; -- delete item
	end
	local nResult, szErrorMessage = tbVNG_VipAcc_BaoLiXi:useItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end
end

function tbVNG_VipAcc_BaoLiXi:isActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEndDay or now < self.nStartDay) then
		return 0;
	end
	return 1;
end
function tbVNG_VipAcc_BaoLiXi:useItem()
	if tbVNG_BitTask_Lib:isMaxBitTaskValue(self.tbTaskInfo) == 1 then
		return 0, "Mçi nh©n vËt chØ ®­îc sö dông vËt phÈm nµy mét lÇn."
	end
	tbVNG_BitTask_Lib:addTask(self.tbTaskInfo, 1)
	tbVNG_VipAcc_Peach:addNpc()
	return 1
end