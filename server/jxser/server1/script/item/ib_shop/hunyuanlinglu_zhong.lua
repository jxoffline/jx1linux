-- ÎÄ¼şÃû¡¡£ºhunyuanlinglu_zhong.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£º»ìÔªÁéÂ¶£¨ÖĞ£© º¬ÓĞ500¾«Á¦£¬ÒÔ¼°7¸öÈÎÎñÁîÅÆºÍ7¸öÊ®¼¶µÄĞŞÁ¶Ä¾ÈË
-- ´´½¨Ê±¼ä£º2011-07-12 11:19:45

Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\jingli.lua")


-- ÈÎÎñÁîÅÆÑ°ÕÒ¿óÊ¯£¬ÈÎÎñµÄÖµÎª 211 - 216
local renwuSetmagicLevel = function(nItemIndex)
	SetItemMagicLevel(nItemIndex, 1, random(211,216)) -- ÉèÖÃ²É¿óÈÎÎñ
end

local tbMask = 
{
	{szName = "LÖnh bµi ", tbProp = {6,2,1020,1,0,0}, nExpiredTime = 7*24*60, 
		CallBack = renwuSetmagicLevel,
	},	
	{szName = "Méc nh©n", tbProp = {6,1,2969,1,0,0}, nCount = 7, nExpiredTime = 7*24*60},	
	
}

function main(nItemIndex)
	local nWidth = 1
	local nHeight = 2
	local nCount = 8
	local nEnergy = 500
	if CountFreeRoomByWH(nWidth, nHeight, nCount) < nCount then
		Say(format("§Ó b¶o ®¶m tµi s¶n cña ®¹i hiÖp, xin h·y ®Ó trèng %d %dx%d hµnh trang", nCount, nWidth, nHeight))
		return 1
	end
	
	local nRenWuCount = 7
	local tbRealyAward = {}
	
	for i=1,nRenWuCount do
		tinsert(tbRealyAward, %tbMask[1])
	end
	tinsert(tbRealyAward, %tbMask[2])
	
	local player = Player:New(PlayerIndex)
	local potion = HunyuanPotion:New(player)
	if (potion:Use(nEnergy) == 1) then
		tbAwardTemplet:GiveAwardByList(tbRealyAward, "Sö dông Hçn Nguyªn Linh Lé( Trung)", 1)
		return 0
	else
		return 1
	end
end
