
function add471()
		level = random(2,10);
		AddSkillState(471, level, 0, 12 )	--Ôö¼ÓÍæ¼ÒÑªÁ¿ºÍÄÚÁ¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> håi phôc sinh lùc trong nöa gi©y"..(level*500).."<#> ®iÓm vµ håi phôc néi lùc trong nöa gi©y"..(level*500).."<#> ®iÓm")	
end

function add472()
		level = random(1,10);
		AddSkillState(472, level, 0, 540 )	--Ôö¼ÓÍæ¼ÒÑªÁ¿ºÍÄÚÁ¦³ÖĞø»Ö¸´
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 30 gi©y håi phôc sinh lùc, håi phôc mçi nöa gi©y"..(level*100).."<#> ®iÓm vµ 30 gi©y håi phôc néi lùc, håi phôc mçi nöa gi©y"..(level*100).."<#> ®iÓm")	
end

function add490()
		level = random(10,20);
		AddSkillState(490, level, 0, 540 )	--Ôö¼ÓÍæ¼ÒÑªÁ¿ºÍÄÚÁ¦ÉÏÏŞ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> møc sinh lùc 30 gi©y t¨ng:"..(level*100).."<#> ®iÓm vµ trong 30 gi©y møc néi lùc t¨ng:"..(level*100).."<#> ®iÓm")	
end

Tab={add471,add472,add490}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		return 0;	-- É¾³ıÎïÆ·
	end
end

