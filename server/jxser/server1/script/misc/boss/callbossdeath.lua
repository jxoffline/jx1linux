
TSK_PLAYER_BOSSKILLED = 2598 -- 玩家击杀BOSS数量统计

function OnDeath( nNpcIndex )
    -- BOSS击杀统计
	local nCount = GetTask(TSK_PLAYER_BOSSKILLED);
	nCount = nCount + 1;
	SetTask(TSK_PLAYER_BOSSKILLED, nCount);
end;