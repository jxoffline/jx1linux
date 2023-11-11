IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add466()
		level = random(1,4);
		AddSkillState(466, level, 0, 1080 )	--Íæ¼Ò»ñµÃÊÜÉË¶¯×÷¼õÉÙ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 1 phót gi¶m thä th­¬ng"..(level*10).."<#> %")	
end

function add467()
		level = random(1,4);
		AddSkillState(467, level, 0, 1080 )	--Íæ¼Ò»ñµÃÖÐ¶¾Ê±¼ä¼õÉÙ
		Msg2Player("<#> B¹n nhËn ®­îc <color=0xB5FDD7> 1 phót gi¶m thêi gian tróng ®éc:"..(level*10).."<#> %")	
end

Tab={add466,add467}

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
		return 0;	-- É¾³ýÎïÆ·
	end
end

