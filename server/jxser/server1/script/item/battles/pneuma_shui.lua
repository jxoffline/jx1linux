IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add466()
		level = random(1,4);
		AddSkillState(466, level, 0, 1080 )	--ÕÊº“ªÒµ√ ‹…À∂Ø◊˜ºı…Ÿ
		Msg2Player("<#> Bπn nhÀn Æ≠Óc <color=0xB5FDD7> 1 phÛt gi∂m th‰ th≠¨ng"..(level*10).."<#> %")	
end

function add469()
		level = random(1,4);
		AddSkillState(469, level, 0, 1080 )	--ÕÊº“ªÒµ√—£‘Œ ±º‰ºı…Ÿ
		Msg2Player("<#> Bπn nhÀn Æ≠Óc <color=0xB5FDD7> 1 phÛt gi∂m thÍi gian bﬁ cho∏ng:"..(level*10).."<#> %")	
end

Tab={add466,add469}

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
		return 0;	-- …æ≥˝ŒÔ∆∑
	end
end

