--西北北区 沙漠迷宫to快活林
--TrapID：沙漠迷宫1

function main(sel)
	
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if nSubWorldId == 919 or nSubWorldId == 920 then
		local nW, nX, nY = RevID2WXY(GetPlayerRev());
		NewWorld(nW, nX/32, nY/32);
		return
	end
	
	SetFightState(1);
	NewWorld(136, 1716, 3144)
	AddTermini(195)			-- 虽然所有人都留返回点记录，但只有80级以上才能直接走进来
end;
