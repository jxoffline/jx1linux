-- ÎÄ¼şÃû¡¡£ºdabaijuwanlibao.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£º´ó°×¾ÔÍèÀñ°ü ¼¯ºÏÈı¸ö´ó°×¾ÔÍè
-- ´´½¨Ê±¼ä£º2011-07-12 10:38:31

Include("\\script\\lib\\awardtemplet.lua")

local tbAward = 
{
	{szName = "§¹i B¹ch C©u hoµn", tbProp = {6,1,130,1,0,0}, nCount = 3},	
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
	tbAwardTemplet:GiveAwardByList(%tbAward, "Sö dông §¹i B¹ch C©u Hoµn LÔ Bao", 1)
	return 0
end