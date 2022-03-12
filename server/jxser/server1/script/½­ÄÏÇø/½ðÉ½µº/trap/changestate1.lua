-- 金山岛  战斗切换点1 右方

function main(sel)
	if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态，即在门内
		SetPos(1421, 2754);		-- 设置走出Trap点，目的点在门外print (45472/32,88128/32)
		SetFightState(1);		-- 转换为战斗状态
	else
		SetPos(1416, 2764);		-- 设置走出Trap点，目的点在门内	print(45312/32,88448/32)
		SetFightState(0);		-- 转换为非战斗状态
	end;
end;

