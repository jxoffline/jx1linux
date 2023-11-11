Include("\\script\\missions\\olympic\\tong\\head.lua");

function OnDeath(Launcher)
	curcamp = GetCurCamp();
	DelMSPlayer(MISSIONID,curcamp);

	PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder凶手
	OrgPlayer  = PlayerIndex; --死者
	DeathName = GetName();

	SetFightState(0)
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();

		pkcount = GetTaskTemp(MS_TOTALPK) + 1; --计算当前的pk人数
		SetTask(MS_TOTALPK, GetTask(MS_TOTALPK) + 1); --统计总共的pk人数
		SetTaskTemp(MS_TOTALPK, pkcount);

		if (curcamp == 3) then
			str  = GetMissionS(2).."<#>帐下"..LaunName.."<#>重伤了["..DeathName.."<#>]，PK人数增为"..pkcount;
--			SetMissionV(MS_TONG2VALUE, GetMissionV(MS_TONG2VALUE) + 1);
		elseif (curcamp == 2) then
			str  = GetMissionS(1).."<#>帐下"..LaunName.."<#>重伤了["..DeathName.."<#>]，PK人数增为"..pkcount;
--			SetMissionV(MS_TONG1VALUE, GetMissionV(MS_TONG1VALUE) + 1);
		end;
		
		Msg2MSAll(MISSIONID, str);
		PlayerIndex = OrgPlayer;
	end;

	SetCurCamp(GetCamp())
	SetPunish(1)--设置PK惩罚
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	ForbitTrade(0);
	SetLogoutRV(0)
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	SetTaskTemp(JOINSTATE, 0);
end;
