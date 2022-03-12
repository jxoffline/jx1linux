Include("\\script\\missions\\citywar_arena\\head.lua");
function main()
	SetCurCamp(GetCamp());
	SetFightState(0);
	SetRevPos(99,43);
	SetLogoutRV(0);
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	SetTaskTemp(200, 0);
	NewWorld(GetLeavePos());
end;