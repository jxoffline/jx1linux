Include("\\script\\missions\\citywar_arena\\head.lua");

function OnDeath(Launcher)
	curcamp = GetCurCamp();
	DelMSPlayer(MISSIONID,	curcamp);

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

		if (curcamp == 1) then
			str  = GetMissionS(2).."<#> k誸 th骳"..LaunName.."<#> tr鋘g thng r錳 ["..DeathName.."<#> ], PK 頲 "..pkcount;
			SetMissionV(MS_TONG2VALUE, GetMissionV(MS_TONG2VALUE) + 1);
		elseif (curcamp == 2) then
			str  = GetMissionS(1).."<#> k誸 th骳"..LaunName.."<#> tr鋘g thng r錳 ["..DeathName.."<#> ], PK 頲 "..pkcount;
			SetMissionV(MS_TONG1VALUE, GetMissionV(MS_TONG1VALUE) + 1);
		elseif (curcamp == 4) then 
			str = LaunName.."<#> tr鋘g thng r錳 ["..DeathName.."<#> ], PK 頲 "..pkcount;
		end;
		
		--GetBonus(); --该函数由外部填加，用于奖励玩家
		
		Msg2MSAll(MISSIONID, str);
		PlayerIndex = OrgPlayer;
	end;

	SetTask(MS_TOTALKO, GetTask(MS_TOTALKO) + 1); --记录总死亡次数
	SetCurCamp(GetCamp())
	SetPunish(1)--设置PK惩罚
	SetPKFlag(0)--关闭PK开关
	ForbidChangePK(0);
	SetLogoutRV(0)
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	SetRevPos(20,10);
	SetTaskTemp(JOINSTATE, 0);
	SetFightState(0);
	NewWorld(WORLDIDXBEGIN + GetMissionV(MS_ARENAID),1633,3292)
end;
