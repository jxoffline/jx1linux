-- ÎÄ¼şÃû¡¡£ºhunyuanlinglu_da.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£º»ìÔªÁéÂ¶£¨´ó£© º¬ÓĞ1000¾«Á¦£¬ÒÔ¼°15¸öÈÎÎñÁîÅÆºÍ15¸öÊ®¼¶µÄĞŞÁ¶Ä¾ÈË
-- ´´½¨Ê±¼ä£º2011-07-12 14:53:11

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\jingli.lua")

-- ÈÎÎñÁîÅÆÑ°ÕÒ¿óÊ¯£¬ÈÎÎñµÄÖµÎª 211 - 216
local renwuSetmagicLevel = function(nItemIndex)
	SetItemMagicLevel(nItemIndex, 1, random(211,216)) -- ÉèÖÃ²É¿óÈÎÎñ
end


-- ÈÎÎñÁîÅÆÑ°ÕÒ¿óÊ¯£¬ÈÎÎñµÄÖµÎª 211 - 216
local tbMask = 
{
	{szName = "LÖnh bµi ", tbProp = {6,2,1020,1,0,0}, nExpiredTime = 7*24*60, CallBack = renwuSetmagicLevel},	
	{szName = "Méc nh©n", tbProp = {6,1,2969,1,0,0}, nCount = 15, nExpiredTime = 7*24*60},	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 2
	local nCount = 16
	local nEnergy = 1000
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	
	local nRenWuCount = 15
	local tbRealyAward = {}
	
	for i=1,nRenWuCount do
		tinsert(tbRealyAward, %tbMask[1])
	end
	tinsert(tbRealyAward, %tbMask[2])
	
	local player = Player:New(PlayerIndex)
	local potion = HunyuanPotion:New(player)
	if (potion:Use(nEnergy) == 1) then
		tbAwardTemplet:GiveAwardByList(tbRealyAward, "Sö dông Hçn Nguyªn Linh Lé( §¹i)", 1)
		return 0
	else
		return 1
	end
end