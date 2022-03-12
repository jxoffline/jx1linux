
function add482()
		level = random(10,20);
		AddSkillState(482, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÄÚ»ğÉËº¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> Ho¶ s¸t néi c«ng trong 1 phót t¨ng:"..(level*10).."<#> ®iÓm")	
end

function add498()
		level = random(10,30);
		AddSkillState(498, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÍâ»ğÉËº¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> Ho¶ s¸t ngo¹i c«ng trong 1 phót t¨ng:"..(level*10).."<#> ®iÓm")	
end

Tab={add482}

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


