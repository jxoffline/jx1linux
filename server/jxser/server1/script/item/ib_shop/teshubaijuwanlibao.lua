-- ÎÄ¼şÃû¡¡£ºteshubaijuwanlibao.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£ºÌØÊâ°×¾ÔÍè ¼¯ºÏÈı¸öÌØÊâ°×¾ÔÍè
-- ´´½¨Ê±¼ä£º2011-07-12 11:17:19

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "§¹i B¹ch CÇu Hoµn §Æc BiÖt", tbProp = {6,1,1157,1,0,0}, nCount = 3},	
}


function main(nItemIndex)
	local nWidth = 1
	local nHeight = 1
	local nCount = 3
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	-- ÅĞ¶Ï±³°ü¿Õ¼ä
	tbAwardTemplet:GiveAwardByList(%tbAward, "Sö dông LÔ Bao §¹i B¹ch C©u Hoµn §Æc BiÖt", 1)
	return 0
end