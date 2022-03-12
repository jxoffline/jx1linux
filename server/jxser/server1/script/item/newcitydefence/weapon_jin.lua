
function add479()
		level = random(10,20);
		AddSkillState(479, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÄÚÆÕÉËº¦
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> s¸t th­¬ng vËt lı néi c«ng trong 1 phót t¨ng:"..(level*10).."<#> ®iÓm")	
end

function add487()
		level = random(5,10);
		AddSkillState(487, level, 0, 1080 )	--Ôö¼ÓÍæ¼ÒÍâÆÕÉËº¦°Ù·Ö±È
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> s¸t th­¬ng vËt lı ngo¹i c«ng trong 1 phót t¨ng "..(level*10).."<#> %")	
end

Tab={add479,add487}

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

