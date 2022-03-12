-- 华山派 东门 战斗切换点

function main(sel)
	if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态，即在派内
		SetPos(1534, 3187);		-- 设置走出Trap点，目的点在派外
		SetFightState(1);		-- 转换为战斗状态
	else
		SetPos(1532, 3184);		-- 设置走出Trap点，目的点在派内	
		SetFightState(0);		-- 转换为非战斗状态
	end;
end;
	