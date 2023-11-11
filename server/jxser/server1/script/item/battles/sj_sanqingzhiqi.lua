IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add505()
		CastSkill(505, 1 )	--È«ÌåÑ£ÔÎ
		Msg2Player("<#> B¹n sö dông 1<color=0xB5FDD7> Tam Thanh Khİ, khiÕn kÎ ®Şch quanh b¹n bŞ cho¸ng.")	
end

function add506()
		CastSkill(506, 1 )	--È«Ìå±ù¶³
		Msg2Player("<#> B¹n sö dông 1<color=0xB5FDD7> Tam Thanh Khİ, khiÕn kÎ ®Şch quanh b¹n bŞ ®ãng b¨ng.")	
end

function add507()
		CastSkill(507, 1 )	--È«ÌåÖĞ¶¾
		Msg2Player("<#> B¹n sö dông 1<color=0xB5FDD7> Tam Thanh Khİ, khiÕn kÎ ®Şch quanh b¹n bŞ tróng ®éc.")	
end

function add508()
		CastSkill(508, 1 )	--È«Ìå¼õËÙ
		Msg2Player("<#> B¹n sö dông 1<color=0xB5FDD7> Tam Thanh Khİ, khiÕn kÎ ®Şch quanh b¹n bŞ gi¶m tèc.")	
end

Tab={add505,add506,add507,add508}

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

