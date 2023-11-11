Include("\\script\\missions\\hsbattle\\hshead.lua");

function OnDeath(Launcher)
	curcamp = GetCurCamp();
	DelMSPlayer(MISSIONID,	curcamp);
	SetLogoutRV(1);

	PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder凶手
	OrgPlayer  = PlayerIndex; --死者
	DeathName = GetName();
	
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();

		pkcount = GetTaskTemp(MS_TOTALPK) + 1; --计算当前的pk人数
		SetTask(MS_TOTALPK, GetTask(MS_TOTALPK) + 1); --统计总共的pk人数
		SetTaskTemp(MS_TOTALPK, pkcount);

		if ( curcamp == 1) then
			str  = GetMissionS(2).."<#> k誸 th骳"..LaunName.."<#> tr鋘g thng r錳 ["..DeathName.."<#> ], PK 頲 "..pkcount;
			SetMissionV(MS_TONG2VALUE, GetMissionV(MS_TONG2VALUE) + PKWINBONUS);
			SetMissionV(MS_TONG1VALUE, GetMissionV(MS_TONG1VALUE) - LOSEBONUS);
		elseif (curcamp == 2) then
			str  = GetMissionS(1).."<#> k誸 th骳"..LaunName.."<#> tr鋘g thng r錳 ["..DeathName.."<#> ], PK 頲 "..pkcount;
			SetMissionV(MS_TONG1VALUE, GetMissionV(MS_TONG1VALUE) + PKWINBONUS);
			SetMissionV(MS_TONG2VALUE, GetMissionV(MS_TONG2VALUE) - LOSEBONUS);
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
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	SetLogoutRV(0);--设置重生点
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	SetRevPos(99,43);
		
	SetTaskTemp(JOINSTATE, 0);
end;
