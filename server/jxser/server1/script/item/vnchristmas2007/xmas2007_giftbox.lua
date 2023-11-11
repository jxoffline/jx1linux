-- ÎÄ¼şÃû¡¡£ºxmas2007_giftbox.lua
-- ´´½¨Õß¡¡£ºzhongchaolong
-- ´´½¨Ê±¼ä£º2007-11-26 14:42:26

--Ê±¼ä£º2008 Äê01 ÔÂ13 ÈÕ 24£º00
--Ê±ÏŞ£º2008 Äê01 ÔÂ31 ÈÕ 24£º00
--¿ÉÒÔ£º½»Ò×£¬ÈÓµô£¬°ÚÌ¯£¬Âôµê = 0 Á½£¬µş¼Ó50¸ö/Î»
--Ê¹ÓÃ: ÓÒ¼üµã»÷Ê¹ÓÃ»ñµÃ¸÷Àà±ù¾§

Include("\\script\\event\\xmas07_makesnowman\\head.lua")
xmas2007_GiftBox_tbItemList =
{
	--Ãû³Æ,{ÎïÆ·Prop},¸ÅÂÊ%,
	{"Kim B¨ng Tinh",{6,1,1628,1,0,0},10},
	{"Méc B¨ng Tinh",{6,1,1629,1,0,0},15},
	{"Thñy B¨ng Tinh",{6,1,1630,1,0,0},20},
	{"Háa B¨ng Tinh",{6,1,1631,1,0,0},25},
	{"Thæ B¨ng Tinh",{6,1,1632,1,0,0},30},
}

function main()
	if xmas07_makeSnowMan_isActPeriod() == 0 then
		Msg2Player("VËt phÈm ®· qu¸ h¹n sö dông, sÏ bŞ mÊt ®i.")
		return 0;
	end
	xmas2007_SnowManItem_GiveRandomItem(xmas2007_GiftBox_tbItemList);
end


