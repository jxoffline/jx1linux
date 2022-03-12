-- ====================== ÎÄ¼şĞÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - ÌôÕ½Àñ°ü
-- ÎÄ¼şÃû¡¡£ºtiaozhan_libao.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-04-26 13:16:50

-- ======================================================

Include("\\script\\lib\\pay.lua");
Include("\\script\\lib\\awardtemplet.lua");

function main(nItemIdx)
	local n_level = GetLevel();
	if (n_level < 50 or IsCharged() ~= 1) then
		Say("ChØ cã ng­êi ch¬i cÊp trªn 50 ®· n¹p thÎ míi cã thÓ sö dông.", 0)
		return 1;
	end
	
	if (CalcFreeItemCellCount() < 20) then
		Say(format("§Ó tr¸nh mÊt m¸t tµi s¶n, h·y b¶o ®¶m hµnh trang cßn ®ñ %d « trèng.", 20), 0);
		return 1;
	end
	tbItem = { tbProp = {6,1,1499,1,1,0}, nCount = 20};
	tbAwardTemplet:GiveAwardByList(tbItem, "Khiªu chiÕn LÔ bao")
end

