-- ÎÄ¼þÃû¡¡£ºlongxuelihe.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈÝ¡¡¡¡£ºÁúÑªÀñºÐ Ê¹ÓÃ¿É»ñµÃ
-- ´´½¨Ê±¼ä£º2011-07-11 11:54:21

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "Long HuyÕt Hoµn", tbProp = {6,1,2117,1,0,0}, nCount = 3},	
	{szName = "Tèng Kim Phi Tèc hoµn", tbProp = {6,1,190,1,0,0}, nCount = 5},
	{szName = "Tèng Kim Ngo¹i Phæ hoµn", tbProp = {6,1,178,1,0,0}, nCount = 5},	-- ÎïÆ·ID²»È·¶¨
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 5
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	-- ÅÐ¶Ï±³°ü¿Õ¼ä
	tbAwardTemplet:GiveAwardByList(%tbAward, "Sö Dông Long HuyÕt LÔ Hép", 1)
	return 0
end