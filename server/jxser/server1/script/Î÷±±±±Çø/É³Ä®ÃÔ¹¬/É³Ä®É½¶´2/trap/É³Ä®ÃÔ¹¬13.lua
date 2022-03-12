-- 沙漠迷宫传送点（全随机传送）
-- By Dan_Deng(2004-04-01)

function main(sel)
	local n_mapid = GetWorldPos();
	
	if (n_mapid == 875) then		-- 如果是从黑沙洞出来，则传送到南岳洞口
		SetFightState(0);
		NewWorld(54,1732,3154)
		return
	end
	
	-- 如果是从沙漠山洞2出来，则执行原规则
	i = random(0,120)
--	Msg2Player("i = "..i)	-- 调试信息
	if (i < 5) then					-- 地表，共25%几率
		SetFightState(1);
		NewWorld(224,1591,3013)
	elseif (i < 10) then
		SetFightState(1);
		NewWorld(224,1781,2908)
	elseif (i < 15) then
		SetFightState(1);
		NewWorld(224,1711,2804)
	elseif (i < 20) then
		SetFightState(1);
		NewWorld(224,1640,2960)
	elseif (i < 25) then
		SetFightState(1);
		NewWorld(224,1530,2933)
	elseif (i < 30) then
		SetFightState(1);
		NewWorld(224,1870,2986)
	elseif (i < 50) then				-- 山洞1，共33%几率
		SetFightState(1);
		NewWorld(225,1476,3274)
	elseif (i < 70) then
		SetFightState(1);
		NewWorld(225,1579,3186)
	elseif (i < 80) then				-- 山洞2，共33%几率
		SetFightState(1);
		NewWorld(226,1553,3173)
	elseif (i < 90) then
		SetFightState(1);
		NewWorld(226,1813,3415)
	elseif (i < 100) then
		SetFightState(1);
		NewWorld(226,1763,3155)
	elseif (i < 110) then
		SetFightState(1);
		NewWorld(226,1690,3246)
	elseif (i < 115) then			-- 山洞3，共8.33%几率
		SetFightState(1);
		NewWorld(227,1530,3270)
	else
		SetFightState(1);
		NewWorld(227,1583,3240)
	end
end
