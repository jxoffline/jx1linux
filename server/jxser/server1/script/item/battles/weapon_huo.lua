IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

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

Tab={add482,add498}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		BT_SetData(PL_GETITEM, BT_GetData(PL_GETITEM) + 1);
		bt_addtotalpoint(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		checkbattlerule(BT_GetTypeBonus(PL_GETITEM, GetCurCamp()))
		BT_SortLadder();
		BT_BroadSelf();
		return 0;	-- É¾³ıÎïÆ·
	end
end


