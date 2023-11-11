Include("\\script\\missions\\hsbattle\\hshead.lua");
function main()
	SetCurCamp(GetCamp());
	SetFightState(0);
	SetRevPos(99,43);
	NewWorld(GetLeavePos());
end;