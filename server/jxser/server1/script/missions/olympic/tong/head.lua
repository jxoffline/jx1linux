--退出游戏后的重生点ID,也就是报名的那个地方吧
CS_RevId = 176
CS_RevData = 67;

--加入双方阵营时的位置
CampPos1 = {1536 , 3223 }; 	--黄色
CampPos2 = {1563 , 3195 }; 	--紫色

FRAME2TIME = 18;
--游戏的最大人数
MAX_MEMBER_COUNT = 16;
MS_STATE = 1;
V_ID = 2; --胜利的阵营
MS_TONG1ID = 1;--两个帮会的帮会ID
MS_TONG2ID = 2;

MS_TOTALPK = 250;--记录玩家打死其它玩家的总次数

MS_ARENAID = 15;

TIME_NO3 = 25;		-- 帮会定时触发器

TIMER_1 = 20 * FRAME2TIME; --20秒公布一下战况
GO_TIME = 6 ; -- 入场时间为2分钟
END_TIME = 9 ; -- 比赛时间3分钟

MS_NEWSVALUE = 9; --任务中存放新闻变量的地方
JOINSTATE = 242;
MISSIONID = 13;

TONGSCORE = 625;	-- 任务变量 

function GetLeavePos()
	return GetTask(300), GetTask(301), GetTask(302);
end;

-------------------------------------------------------------------------
--玩家要求离开游戏
function LeaveGame()
	camp = GetCamp();--恢复原始阵营
	SetRevPos(CS_RevId, CS_RevData)
	SetPunish(1)--设置PK惩罚
	SetPKFlag(0)--关闭PK开关
	SetTaskTemp(JOINSTATE, 0);
	ForbidChangePK(0);
	ForbitTrade(0);
	SetFightState(0);
	
	SetCurCamp(camp);
	SetLogoutRV(0);--设置重生点
	SetCreateTeam(1);
	SetDeathScript("");--设置死亡脚本为空
	NewWorld(GetLeavePos())
end;

function GameOver()
	PTab = {};
	for i = 1, 500 do 
		idx , pidx = GetNextPlayer(MISSIONID, idx, 0);
		if (idx == 0 ) then 
			break
		end
		PTab[i] = pidx;
	end
	
	PCount = getn(PTab);
	OldPlayer = PlayerIndex;
	for i  = 1, PCount do 
		PlayerIndex = PTab[i]
		if (GetCurCamp() == GetMissionV(V_ID)) then
			SetTask(TONGSCORE,1)
		end;
		LeaveGame()
	end;
	PlayerIndex = OldPlayer;
end;
-------------------------------------------------------------------------

