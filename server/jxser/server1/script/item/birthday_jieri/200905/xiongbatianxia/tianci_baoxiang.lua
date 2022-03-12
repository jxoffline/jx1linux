-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°å - Ìì´Í±¦Ïä
-- ÎÄ¼þÃû¡¡£ºtianci_baoxiang.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-05-21 14:38:37

-- ======================================================

Include("\\script\\event\\birthday_jieri\\200905\\class.lua");
Include("\\script\\lib\\awardtemplet.lua")

local tbItem = 
{
	{szName="Hïng", tbProp={6, 1, 2062, 1, 0, 0}, nRate = 25, nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
	{szName="B¸", tbProp={6, 1, 2063, 1, 0, 0}, nRate = 25,  nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
	{szName="Thiªn", tbProp={6, 1, 2064, 1, 0, 0}, nRate = 25,  nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
	{szName="H¹", tbProp={6, 1, 2065, 1, 0, 0}, nRate = 25,  nExpiredTime	= tbBirthday0905.tbTask.item_expiredtime1},
}

function main(nItemIndex)
		
	if GetItemParam(nItemIndex, 1) == 0 or GetItemParam(nItemIndex, 1) <= tonumber(GetLocalDate("%Y%m%d")) then
		Talk(1,"", "VËt phÈm nµy ®· hÕt h¹n")
		return 0
	end
	if CalcFreeItemCellCount() < 1 then
		Talk(1,"", format("Chç trèng hµnh trang kh«ng ®ñ %d chç, h·y s¾p xÕp l¹i.", 1))
		return 1
	end
	tbAwardTemplet:GiveAwardByList(%tbItem, "use "..GetItemName(nItemIndex));
	
end

function IsPickable(nItemIndex)
	
	local nExpiredTime = tbBirthday0905.tbTask.item_expiredtime1;
	if tonumber(GetLocalDate("%Y%m%d")) >= nExpiredTime then
		Msg2Player("VËt phÈm nµy ®· hÕt h¹n");
		return 0
	end
	
	if ITEM_GetExpiredTime(nItemIndex) == 0 then
		tbAwardTemplet:ITEM_SetExpiredTime(nItemIndex, nExpiredTime);
	end
	
	return 1
end