
function add477()
		level = random(1,7);
		AddSkillState(477, level, 0, 1080 )	--增加玩家雷防
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> t╪g ph遪g l玦 trong 1 ph髏"..(level*10).."<#> %")	
end

Tab={add477}

function IsPickable( nItemIndex, nPlayerIndex )
	return 1;
end

function PickUp( nItemIndex, nPlayerIndex )
	if( IsMyItem( nItemIndex ) ) then
		i = random(getn(Tab))
		Tab[i]();
		return 0;	-- 删除物品
	end
end