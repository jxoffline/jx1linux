MISSION_MATCH	= 21	-- 比赛mission
TIMER_MATCH		= 37	-- 比赛定时器
TIMER_BOARD		= 38	-- 通告定时器
INTERVAL_BOARD	= 1		-- 通报间隔（分钟）：每分钟通报一次
LIMIT_SIGNUP	= 300	-- 报名时间期限（秒）：5分钟
BOAT_POSX		= 1628	-- 玩家被传送到龙舟的x坐标
BOAT_POSY		= 3247	-- 玩家被传送到龙舟的y坐标

VARV_NPC_BATCH 		= 1		-- 怪的批次
VARV_NPC_COUNT 		= 2		-- 怪的数量
VARV_PLAYER_COUNT	= 3		-- 玩家的数量
VARV_STATE 			= 4		-- mission状态，1表示报名，2表示比赛
VARV_SIGNUP_WORLD	= 5		-- 报名地图
VARV_SIGNUP_POSX	= 6		-- 报名地点的X坐标
VARV_SIGNUP_POSY	= 7		-- 报名地点的Y坐标 
VARS_TEAM_NAME		= 8		-- 队伍名称
VARV_BOARD_TIMER	= 9		-- 比赛进行的时间（秒）

SCRIPT_NPC_DEATH 	= "\\script\\missions\\dragonboat\\npc_death.lua"
SCRIPT_PLAYER_DEATH = "\\script\\missions\\dragonboat\\player_death.lua"

-- 龙舟比赛地图ID
map_map = {
	416,
	417,
	418,
	419,
	420,
	421,
	422,
	423,
	424,
	425,
	426,
	427,
	428,
	429,
	430,
	431,
	432,
	433,
	434,
	435,
	436,
	437,
	438,
	439,
	440,
	441,
	442,
	443,
	444,
	445,
	446,
	447,
	448,
	449,
	450,
	451,
	452,
	453,
	454,
	455,
	456,
	457,
	458,
	459,
	460,
	461,
	462,
	463
};

-- 对应地图是否高级比赛
map_isadvanced = {
	[416] = 0,
	[417] = 0,
	[418] = 0,
	[419] = 0,
	[420] = 0,
	[421] = 0,
	[422] = 0,
	[423] = 0,
	[424] = 1,
	[425] = 1,
	[426] = 1,
	[427] = 1,
	[428] = 1,
	[429] = 1,
	[430] = 1,
	[431] = 1,
	[432] = 1,
	[433] = 1,
	[434] = 1,
	[435] = 1,
	[436] = 1,
	[437] = 1,
	[438] = 1,
	[439] = 1,
	[440] = 0,
	[441] = 0,
	[442] = 0,
	[443] = 0,
	[444] = 0,
	[445] = 0,
	[446] = 0,
	[447] = 0,
	[448] = 1,
	[449] = 1,
	[450] = 1,
	[451] = 1,
	[452] = 1,
	[453] = 1,
	[454] = 1,
	[455] = 1,
	[456] = 1,
	[457] = 1,
	[458] = 1,
	[459] = 1,
	[460] = 1,
	[461] = 1,
	[462] = 1,
	[463] = 1
};

-- 广播
function broadcast(msg)
	AddGlobalNews(msg);
end

-- 把玩家踢回报名点
function kickout()
	local index = 0;
	local player = 0;
	local players = {}
	local i = 1
	while (1) do
		index, player = GetNextPlayer(MISSION_MATCH, index, 0);
		if (player > 0) then
			players[i] = player
			i = i + 1
		end
		if (index == 0) then
			break;
		end	
	end
	
	local world = GetMissionV(VARV_SIGNUP_WORLD);
	local pos_x = GetMissionV(VARV_SIGNUP_POSX);
	local pos_y = GetMissionV(VARV_SIGNUP_POSY); 
	local OldPlayerIndex = PlayerIndex;
	for i = 1, getn(players) do 
		PlayerIndex = players[i];
		DelMSPlayer(MISSION_MATCH,1);
		SetLogoutRV(0);
		NewWorld(world, pos_x, pos_y);
	end
	PlayerIndex = OldPlayerIndex;
end

-- 启动通告定时器
function start_board_timer()
	StartMissionTimer(MISSION_MATCH, TIMER_BOARD, INTERVAL_BOARD * 60 * 18);
end

-- 关闭通告定时器
function close_board_timer()
	StopMissionTimer(MISSION_MATCH, TIMER_BOARD);
end

