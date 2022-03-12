--两湖区 天王帮北码头 战斗状态切换Trap

function main(sel)

if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态，即在城内
	SetPos(1897, 2941)		-- 设置走出Trap点，目的点在野外	
	SetFightState(1)		-- 转换为战斗状态
else			       		-- 玩家处于战斗状态，即在城外
	SetPos(1901, 2938)		-- 设置走出Trap点，目的点在码头	
	SetFightState(0)		-- 转换为非战斗状态
end;

end;