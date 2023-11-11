IncludeLib("BATTLE")
Include("\\script\\battles\\battlehead.lua")
Include("\\script\\item\\battles\\addmarshalpoint.lua")

function add483()
		level = random(10,20);
		AddSkillState(483, level, 0, 1080 )	--增加玩家内雷伤害
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> L玦 s竧 n閕 c玭g trong 1 ph髏 t╪g:"..(level*10).."<#> 甶觤")	
end

function add499()
		level = random(10,30);
		AddSkillState(499, level, 0, 1080 )	--增加玩家外雷伤害
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> L玦 s竧 ngo筰 c玭g trong 1 ph髏 t╪g:"..(level*10).."<#> 甶觤")	
end

Tab={add483,add499}

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

