-- 金山岛  战斗切换点2 左方

function main(sel)
	if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态，即在门内
		SetPos(1387, 2762);		-- 设置走出Trap点，目的点在门外print (44384/32,88384/32)
		SetFightState(1);		-- 转换为战斗状态
	else
		SetPos(1391, 2771);		-- 设置走出Trap点，目的点在门内	print (44512/32,88672/32)
		SetFightState(0);		-- 转换为非战斗状态
	end;
end;