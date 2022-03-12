--参战玩家死亡时的回调函数
--外部引用本文件时，必须定义下列函数
--GetBonus(); --需要外部定义该函数，用于奖励Launcher玩家。
Include("\\script\\missions\\csbattlelib\\csbattlehead.lua");

function OnDeath(Launcher)
	curcamp = GetCurCamp();
	DelMSPlayer(2,GetCurCamp());
	--删除角色在MissionGroup后会自动调用Mission的OnLeave()函数，而该函数作了完全清除玩家特殊状态的功能
	--在扬州竞技场有点不同，他没有真得退出地图，所以需要将重生点设为需要用RevID等
	if (curcamp ~= 4) then 
		SetLogoutRV(1);
	end;
	

	PlayerIndex1 = NpcIdx2PIdx(Launcher); -- murder凶手
	OrgPlayer  = PlayerIndex; --死者
	DeathName = GetName();

	SetFightState(1)
	if (PlayerIndex1 > 0) then
		PlayerIndex = PlayerIndex1;
		LaunName = GetName();

		pkcount = GetTaskTemp(PLAYER_KILLCOUNT) + 1; --计算当前的pk人数
		pkcount1 = GetTask(PLAYER_KILLCOUNT) + 1; --统计总共的pk人数
		SetTaskTemp(PLAYER_KILLCOUNT, pkcount);
		SetTask(PLAYER_KILLCOUNT, pkcount1);
		

		if ( curcamp == 1) then
			str  = "<#> phe V祅g:"..LaunName.."<#> tr鋘g thng r錳 ["..DeathName.."<#> ], PK 頲 "..pkcount;
		elseif (curcamp == 2) then
			str  = "<#> phe T輒:"..LaunName.."<#> tr鋘g thng r錳 ["..DeathName.."<#> ], PK 頲 "..pkcount;
		elseif (curcamp == 4) then 
			str = LaunName.."<#> tr鋘g thng r錳 ["..DeathName.."<#> ], PK 頲 "..pkcount;
		end;
		
		GetBonus(); --该函数由外部填加，用于奖励玩家
		
		Msg2MSAll(2,str);
		PlayerIndex = OrgPlayer;
	end;
	SetTaskTemp(PLAYER_KILLCOUNT, 0);
	
	if (curcamp == 4) then 
		SetCurCamp(GetCamp())
		SetPunish(1)--设置PK惩罚
		SetPKFlag(0)--关闭PK开关
		SetTaskTemp(JOINSTATE, 0);
		ForbidChangePK(0);
		SetLogoutRV(0);--设置重生点
		SetCreateTeam(1);
		SetDeathScript("");--设置死亡脚本为空
		SetRevPos(99,43);
	else
		SetCurCamp(0);
	end;
		
	dcount = GetTaskTemp(PLAYER_DEATHCOUNT) + 1; --计算当前的死亡次数
	dcount1 = GetTask(PLAYER_DEATHCOUNT) + 1; --统计总共的死亡总次数
	SetTaskTemp(PLAYER_DEATHCOUNT, dcount);
	SetTask(PLAYER_DEATHCOUNT, dcount1);
	SetTaskTemp(JOINSTATE, 0);
end;
