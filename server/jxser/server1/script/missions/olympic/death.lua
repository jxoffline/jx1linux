IncludeLib("SETTING");
Include("\\script\\missions\\olympic\\head.lua");

function OnDeath(Launcher)
	DeathName = GetName();

	pn = TableSDD_Search("olympictab",DeathName);
	pname,px,py = TableSDD_GetValue("olympictab",pn);
	
	DelMSPlayer(MISSIONID, py);
	SetLogoutRV(1);

	PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder凶手
	OrgPlayer  = PlayerIndex; --死者

	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();

		str = "战况报告："..LaunName.."<#> 在比赛中击败了 "..DeathName.."<#>。";
		Msg2MSAll(MISSIONID, str);

		PlayerIndex = OrgPlayer;
	end;
	
	SetCurCamp(GetCamp())
	SetPunish(1)--设置PK惩罚
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	ForbitTrade(0);
	SetFightState(0);
	SetLogoutRV(0);--设置重生点
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	SetTaskTemp(JOINSTATE, 0);
end;
