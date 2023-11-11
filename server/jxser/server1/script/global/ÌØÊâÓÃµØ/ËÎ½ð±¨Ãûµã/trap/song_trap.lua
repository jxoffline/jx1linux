--宋金 宋金报名点to襄阳
--Trap ID：宋金报名点 1
IncludeLib("BATTLE")
function main(sel)
	local nMode = GetTripMode()
	if nMode == 2 then
		return
	end
	BT_LeaveBattle()
	SetFightState(1)
	NewWorld(78, 1768, 3098);
end;
