-- 漠北草原 东门 战斗切换点

function main(sel)
	if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态，即在门内
		SetPos(1303, 2552);		-- 设置走出Trap点，目的点在门外
		SetFightState(1);		-- 转换为战斗状态
	else
		SetPos(1301, 2548);		-- 设置走出Trap点，目的点在门内	
		SetFightState(0);		-- 转换为非战斗状态
	end;
end;
	