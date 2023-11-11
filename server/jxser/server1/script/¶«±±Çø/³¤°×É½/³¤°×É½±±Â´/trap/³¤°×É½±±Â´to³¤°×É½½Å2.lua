-- 东北区\长白山\长白山北麓\trap\长白山北麓to长白山脚2.lua
-- TrapId 2
-- by liukuo @20040915

function main(sel)
	
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if nSubWorldId == 923 or nSubWorldId == 924 then
		local nW, nX, nY = RevID2WXY(GetPlayerRev());
		NewWorld(nW, nX/32, nY/32);
		return
	end
	
	SetFightState(1);
	NewWorld(320,1570,2337);
end;