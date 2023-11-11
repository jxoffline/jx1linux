IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add481()
		level = random(10,20);
		AddSkillState(481, level, 0, 1080 )	--增加玩家内冰伤害
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> B╪g s竧 n閕 c玭g trong 1 ph髏 t╪g:"..(level*10).."<#> 甶觤")	
end

function add486()
		level = random(1,10);
		AddSkillState(486, level, 0, 1080 )	--增加玩家外冰伤害
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> B╪g s竧 ngo筰 c玭g trong 1 ph髏 t╪g:"..(level*10).."<#> 甶觤")	
end

Tab={add481,add486}

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
		return 0;	-- 删除物品
	end
end

