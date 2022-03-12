--Include( "\\script\\tong\\map\\spacenorth_trap.lua" )
function main(sel)
	if ( GetFightState() == 0 ) then	-- 玩家处于非战斗状态，即在门内
		SetPos(1649, 3156);		-- 设置走出Trap点，目的点在门外
		SetFightState(1);		-- 转换为战斗状态
		SetTempRevPos(SubWorldIdx2ID(SubWorld),1660 * 32,3257 * 32)
	else
		SetPos(1643, 3167);		-- 设置走出Trap点，目的点在门内	
		SetFightState(0);		-- 转换为非战斗状态
		SetRevPos(GetPlayerRev())
		SetCurCamp(GetCamp())
	end;
end;