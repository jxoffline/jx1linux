-- ====================== ÎÄ¼þÐÅÏ¢ ======================

-- ½£ÏÀÇéÔµÍøÂç°æÔ½ÄÏ°æ - Ç§ÄêºÎÊ×ÎÚ
-- ÎÄ¼þÃû¡¡£ºqiannian_heshouwu.lua
-- ´´½¨Õß¡¡£º×Ó·Çô~
-- ´´½¨Ê±¼ä£º2009-05-21 12:17:35
-- ×ªÉúºó½ÇÉ«Ê¹ÓÃ£¬Í¨¹ý´ËÎïÆ·×î¶à»ñµÃ25µãÇ±ÄÜµã

-- ======================================================

IncludeLib("SETTING");

TSK_QIANNIAN_HESHOUWU_PROP = 2597;

function main()
	if (GetTask(TSK_QIANNIAN_HESHOUWU_PROP) >= 25) then
		Msg2Player("VËt phÈm nµy kh«ng thÓ n©ng cÊp c«ng lùc cña ®¹i hiÖp ®­îc.");
		return 1;
	end
	
	if (ST_IsTransLife() ~= 1) then
		Msg2Player("§¹i hiÖp kh«ng thÓ thu ®­îc bÊt kú hiÖu qu¶ nµo.");
		return 1;
	end
	
	local tb_prop = {
		{pot=3,msg="Mét ®iÓm "},
		{pot=4,msg="Ch­a høa "},
		{pot=5,msg="Mét sè "},
		{pot=6,msg="Kh«ng Ýt "},
		{pot=7,msg="H¬i nhiÒu "},
		};
	
	local n_rand = random(1,5);
	local n_prop = tb_prop[n_rand].pot
	if (n_prop + GetTask(TSK_QIANNIAN_HESHOUWU_PROP) > 25) then
		n_prop = 25 - GetTask(TSK_QIANNIAN_HESHOUWU_PROP);
	end
	
	AddProp(n_prop);
	
	SetTask(TSK_QIANNIAN_HESHOUWU_PROP,GetTask(TSK_QIANNIAN_HESHOUWU_PROP)+ n_prop);
	
	Msg2Player(format("Sau khi sö dông cã thÓ thu ®­îc %s hiÖu qu¶",tostring(n_prop)));
end
