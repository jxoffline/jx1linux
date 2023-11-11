--citydefence_newworld.lua

Include("\\script\\global\\newworld\\donewworldparam.lua")
function OnNewWorld(szParam)
	SetPKFlag(0)
	ForbidChangePK(1);
	ForbidEnmity(1);
	SetTaskTemp(200,1);
	DoNewWorldParam(szParam, 1)
end

function OnLeaveWorld(szParam)
	ForbidChangePK(0);
	SetTaskTemp(200,0);
	ForbidEnmity(0);
	DoNewWorldParam(szParam, 0)
end
