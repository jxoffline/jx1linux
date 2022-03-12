
function add462()
		level = random(2,10);
		AddSkillState(462, level, 0, 12 )	--增加玩家血量
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> h錳 ph鬰 sinh l鵦 trong n鯽 gi﹜"..(level*500).."<#> 甶觤")	
end

function add464()
		level = random(1,10);
		AddSkillState(464, level, 0, 540 )	--增加玩家血量持续恢复
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> 30 gi﹜ h錳 ph鬰 sinh l鵦, h錳 ph鬰 m鏸 n鯽 gi﹜"..(level*100).."<#> 甶觤")	
end

function add488()
		level = random(10,20);
		AddSkillState(488, level, 0, 540 )	--增加玩家血量上限
		Msg2Player("<#> B筺 nh薾 頲 <color=0xB5FDD7> m鴆 sinh l鵦 30 gi﹜ t╪g:"..(level*100).."<#> 甶觤")	
end

Tab={add462,add464,add488}

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

