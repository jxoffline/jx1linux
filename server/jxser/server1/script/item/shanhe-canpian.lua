Include("\\script\\task\\newtask\\newtask_head.lua")

function main(nItemIdx)
	local _,_,detail = GetItemProp(nItemIdx)
	local nWorldMaps = nt_getTask(1027) -- ¿´¿´Íæ¼ÒÉíÉÏÓĞ¶àÉÙ¸öÉ½ºÓÉçğ¢Í¼
	if (detail == 440) then
		-- ¸øÍæ¼ÒÔö¼Ó100¸öÉ½ºÓÉçğ¢Í¼²ĞÆ¬
		nWorldMaps = nWorldMaps + 100;
		nt_setTask(1027,nWorldMaps);
		Msg2Player("B¹n nhËn ®­îc 100 m¶nh b¶n ®å S¬n Hµ X· T¾c! HiÖn t¹i b¹n cã tæng céng"..nWorldMaps.." m¶nh b¶n ®å S¬n Hµ X· T¾c.");
	elseif (detail == 2514) then
		-- ¸øÍæ¼ÒÔö¼Ó1000¸öÉ½ºÓÉçğ¢Í¼²ĞÆ¬
		nWorldMaps = nWorldMaps + 1000;
		nt_setTask(1027,nWorldMaps);
		Msg2Player("§¹i hiÖp nhËn ®­îc 1000 m¶nh b¶n ®å s¬n hµ x· t¾c! Tæng céng cã "..nWorldMaps.." m¶nh b¶n ®å S¬n Hµ X· T¾c.");
	end
end
