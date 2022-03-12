--宋金 宋金报名点to朱仙镇
--Trap ID：宋金报名点 1
IncludeLib("BATTLE")
function main(sel)
	local nMode = GetTripMode()
	if nMode == 2 then
		return
	end
	BT_LeaveBattle()
	SetFightState(1)
	NewWorld(100, 1406, 3486);
end;
