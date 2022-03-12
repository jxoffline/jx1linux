--西北南区 华山 战斗状态切换点2
--2004.1.5
--by Suyu
-- 2004-05-01(Dan_Deng)

function main(sel)
	if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态，即在城内
		SetPos(2551, 3471)		-- 设置走出Trap点，目的点在城外	
		SetFightState(1)		-- 转换为战斗状态
	else			       		-- 玩家处于战斗状态，即在城外
		SetPos(2557, 3483)		-- 设置走出Trap点，目的点在城内	
		SetFightState(0)		-- 转换为非战斗状态
	end;
end;
