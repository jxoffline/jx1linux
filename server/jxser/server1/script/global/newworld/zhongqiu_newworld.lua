LANTERN_STATE_DATE = 050916
LANTERN_END_DATE = 050918

function OnNewWorld()
	local nday = tonumber(GetLocalDate("%y%m%d"))
	if ( nday >= LANTERN_STATE_DATE and nday <= LANTERN_END_DATE ) then
		SetFightState(1)
		SetPKFlag(0)
		ForbidChangePK(1);
		ForbidEnmity(1);
		SetTaskTemp(200,1);
	end
end

function OnLeaveWorld()
	ForbidChangePK(0);
	SetTaskTemp(200,0);
	ForbidEnmity(0);
end
