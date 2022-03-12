Include("\\script\\vng_event\\20110225_8_thang_3\\item\\item_head.lua")
tbVNGWD2011_BowBox = {}
function main(itemidx)
	if (tbVNGWD2011_ItemHead:isExpired(itemidx) == 1 or tbVNG_WomenDay2011:IsActive() ~= 1) then
		Msg2Player("VËt phÈm qu¸ h¹n sö dông, tù ®éng mÊt ®i.")
		return 0; -- delete item
	end
	local nResult, szErrorMessage = tbVNGWD2011_BowBox:UseItem()
	if (nResult == 1)then
		return 0;	
	else
		if( szErrorMessage ~= nil) then
			Talk(1, "", szErrorMessage)
			return 1 -- khong delete item	
		end
	end		
end

function tbVNGWD2011_BowBox:UseItem()
	if tbVNG_WomenDay2011:CheckCondition() ~= 1 then
		return 0, "B¹n kh«ng ®ñ ®iÒu kiÖn sö dông vËt phÈm! Yªu cÇu cÊp ®é trªn 150 vµ ®·  n¹p thÎ."
	end
	
	if tbVNGWD2011_ItemHead:checkBag(3) ~= 1 then
		return 0, "§Ó b¶o vÖ tµi s¶n, xin vui lßng chõa 3 « trèng trong hµnh trang råi míi sö dông vËt phÈm nµy!"
	end		
	
	local tbAward = {szName="ChiÕc N¬",tbProp={6,1,30099,1,0,0},nCount=3,nExpiredTime=20110314}
	tbAwardTemplet:GiveAwardByList(tbAward, "[VNG][8thang3][Sö dông Hép N¬]")
	return 1
end