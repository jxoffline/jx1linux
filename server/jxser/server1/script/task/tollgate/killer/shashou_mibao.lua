-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏÊÕ·Ñ°æ - µÀ¾ß:É±ÊÖÃØ±¦
-- ÎÄ¼şÃû¡¡£ºshashou_mibao.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2010-05-24 11:40:18

-- ======================================================

Include("\\script\\lib\\awardtemplet.lua");		-- ½±ÀøÄ£°å
Include("\\script\\task\\tollgate\\killer\\mibao_head.lua")

local n_XuanTian_Chui = 6;

function main(nItemIdx)
	local n_curcnt = CalcItemCount(3, 6,1,2348,-1);
	if (n_curcnt < %n_XuanTian_Chui) then
		Msg2Player(format("CÇn %d %s, c¸c h¹ ®em kh«ng ®ñ sè l­îng!", %n_XuanTian_Chui, "HuyÒn Thiªn Chïy"));
		return 1
	end
	if (CalcFreeItemCellCount() >= 3 and ConsumeItem(3, %n_XuanTian_Chui, 6,1,2348,-1)) then
		tbAwardTemplet:GiveAwardByList(tbItem_Mibao, format("USE %s", "S¸t Thñ Bİ B¶o"))
		AddStatData("baoxiangxiaohao_kaishashoumibao", 1)		-- Êı¾İÂñµãµÚÒ»ÆÚ
	else
		Msg2Player("Kho¶ng trèng trong tói kh«ng ®ñ! ");
		return 1
	end
end
