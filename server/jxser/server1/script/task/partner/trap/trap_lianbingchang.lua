-- 云中道 练兵场 战斗切换点

function main(sel)
	if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态
		SetPos(1744,3236);		-- 设置走出Trap点，目的点在战斗区域
		SetFightState(1);		-- 转换为战斗状态
	else
		SetPos(1741,3240);		-- 设置走出Trap点，目的点在非战斗区域
		SetFightState(0);		-- 转换为非战斗状态
	end;
end;