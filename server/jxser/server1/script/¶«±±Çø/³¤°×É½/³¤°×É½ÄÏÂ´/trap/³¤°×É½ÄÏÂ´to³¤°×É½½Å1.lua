-- 东北区\长白山\长白山南麓\trap\长白山南麓to长白山脚1.lua
-- TrapId 1
-- by liukuo @20040915

function main(sel)
	
	local nSubWorldId = SubWorldIdx2ID(SubWorld);
	if nSubWorldId == 921 or nSubWorldId == 922 then
		local nW, nX, nY = RevID2WXY(GetPlayerRev());
		NewWorld(nW, nX/32, nY/32);
		return
	end
	
	SetFightState(1);
	NewWorld(320, 1393, 3156);
end;