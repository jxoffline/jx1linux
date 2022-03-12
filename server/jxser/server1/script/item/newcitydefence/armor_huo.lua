
function add473()
		level = random(1,7);
		AddSkillState(473, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÆÕ·À
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> t¨ng phßng phæ trong 1 phót"..(level*10).."<#> %")	
end

Tab={add473}

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

