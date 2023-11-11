Include("\\script\\vng_event\\vip_account_2011\\item\\head.lua")
function main(nItemIdx)
	if (tbVNG_VIPAcc_ItemHead:isExpired(nItemIdx) == 1) then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0; -- delete item
	end
	local nResult, szErrorMessage = tbVNG_VIPAcc_ItemHead:useItem("dai")
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end
end

