--by ÁÎÖ¾É½ [2006-09-12]
--2006ÖÐÇï»î¶¯Ö®×öµÆÁý»î¶¯,ÆÕÍ¨µÆÁý·ÅÔÚµØÉÏ¿ÉÒÔµÃµ½Ë«±¶¾­Ñé
--Illustration: µÆÁý -- lightcage au06- -- midautumn2006

if (not __H_ITEM_LIGHTCAGE__) then
	__H_ITEM_LIGHTCAGE__ = 1;
	
Include([[\script\event\mid_autumn06\head.lua]]);

AU06_MINUTE = 18 * 60;
--nIndex
tab_light = {
	{1241, "Lång ®Ìn b­¬m b­ím", 10},
	{1242, "Lång ®Ìn ng«i sao", 20},
	{1243, "Lång ®Ìn èng", 30},
	{1244, "Lång ®Ìn trßn", 40},
	{1245, "Lång ®Ìn c¸ chÐp", 50},
	{1246, "Lång ®Ìn kÐo qu©n", 60}
}
--ÖÐÇï»î¶¯Èë¿Úº¯Êý
function main(sel)
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nDate >= 20061021 or nDate < AU06_BEGINDATE or gb_GetTask("midautumn2006_city_all", 1) ~= 0) then --
		Say("Ho¹t ®éng ®· kÕt thóc, kh«ng thÓ sö dông.", 0);
		return 1;
	end;
	
	if (au06_IsPayed_player() == 0) then
		Say("ChØ cã ng­êi ch¬i n¹p thÎ míi cã thÓ th¾p ®Ìn", 0);
		return 1;
	end;
	
	local nCount = getn(tab_light);
	if (nIndex > nCount) then
		nIndex = nCount;
	elseif (nIndex < 1) then
		nIndex = 1;
	end;
	
	--·ÅÒ»¸ö¶«Î÷ÔÚµØÉÏ
	w, x, y = GetWorldPos();
	world = SubWorldID2Idx(w);
	DropItem(world, x * 32, y * 32, -1, 6, 1, tab_light[nIndex][1], 1, 0, 0, 0);

	--¸øÓè½±ÀøºÍ¹«¸æ
	szName = tab_light[nIndex][2];
	time = tab_light[nIndex][3];
	if (GetItemParam(sel, 1) == 1) then
		AddSkillState(440, 1, 1, time * AU06_MINUTE);
		Msg2Player("B¹n ®· th¾p <color=yellow>"..szName.."<color>, nhËn ®­îc <color=yellow>"..time.."<color> phót nh©n ®«i kinh nghiÖm.");
	else
		Msg2Player("B¹n ®· th¾p <color=yellow>"..szName.."<color>.");
	end;
	return 0
end


function IsPickable( nItemIndex, nPlayerIndex )
    if (1 == GetItemParam(nItemIndex, 1)) then
       return 1;
    end
    Msg2Player("<color=yellow> s¾c mµu lung linh rùc rì. <color>")
	return 0;
end

function PickUp( nItemIndex, nPlayerIndex )
    return 1;
end


end; --//end of __H_ITEM_LIGHTCAGE__
--AddSkillState(440, 20, 1,32400)--30·ÖÖÓÄÚ»ñµÃË«±¶¾­ÑéÊ±¼ä¡£