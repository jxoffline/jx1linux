
function add466()
		level = random(1,4);
		AddSkillState(466, level, 0, 1080 )	--Íæ¼Ò»ñµÃÊÜÉË¶¯×÷¼õÉÙ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 1 phót gi¶m thä th­¬ng"..(level*10).."<#> %")	
end

function add469()
		level = random(1,4);
		AddSkillState(469, level, 0, 1080 )	--Íæ¼Ò»ñµÃÑ£ÔÎÊ±¼ä¼õÉÙ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 1 phót gi¶m thêi gian bŞ cho¸ng:"..(level*10).."<#> %")	
end

Tab={add466,add469}

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

