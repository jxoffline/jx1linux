-- 炎帝宝藏
-- by 小浪多多
-- 2007.10.24
-- 我..
-- 正在尝试着..
-- 寻找着属于我的天地..
Include("\\script\\missions\\yandibaozang\\head.lua")

-- 广播
function broadcast(msg)
	AddGlobalNews(msg);
end
--

-- 恢复报名时的状态
function YDBZ_clearitem()
	for i=1,getn(YDBZ_ZUANYONG_ITEM) do
		local g = YDBZ_ZUANYONG_ITEM[i][2]
		local d = YDBZ_ZUANYONG_ITEM[i][3]
		local p = YDBZ_ZUANYONG_ITEM[i][4]
		local numzimu = CalcItemCount(-1,g,d,p,-1)
		--local numbeibao = CalcItemCount(23,g,d,p,-1)
	
		 	-- 删除
		--if numbeibao > 0 then
		 		--ConsumeItem(23,numbeibao,g,d,p,-1)
		--end
		if numzimu > 0 then
				ConsumeItem(-1,numzimu,g,d,p,-1)
		end
	end
end

function YDBZ_restore(player_index,mission,nteam)
	local old_index = PlayerIndex;
	PlayerIndex = player_index;
	AddSkillState(461,1, 1,0,1) --清炎帝令
  --清玄天异果
	AddSkillState(458,2,0,0,1)
	AddSkillState(459,2,0,0,1)
	LeaveTeam()
	YDBZ_clearitem()	--清除物品
	SetCurCamp(GetCamp());
	SetFightState(0);
	SetPunish(1);
	SetCreateTeam(1);
	SetPKFlag(0)
	ForbidChangePK(0);
	SetDeathScript("");
	--SetTask(YDBZ_TEAMS_TASKID, 0)
	DisabledUseTownP(0)
	ForbitTrade(0)
	ForbidEnmity(0)
	SetTaskTemp(200,0)
	SetDeathType(0)
	PlayerIndex = old_index;
end
--
---- 把玩家踢回报名点
function YDBZ_kickout()
	local index = 0;
	local player = 0;
	local players = {}
	local i = 1
	while (1) do
		index, player = GetNextPlayer(YDBZ_MISSION_MATCH, index, 0);
		if (player > 0) then
			players[i] = player
			i = i + 1
		end
		if (index == 0) then
			break;
		end	
	end
	
	local world = GetMissionV(YDBZ_SIGNUP_WORLD);
	local pos_x = GetMissionV(YDBZ_SIGNUP_POSX);
	local pos_y = GetMissionV(YDBZ_SIGNUP_POSY); 
	local OldPlayerIndex = PlayerIndex;
	for i = 1, getn(players) do 
		PlayerIndex = players[i];
		local nteam = GetCurCamp()
		--DelMSPlayer(YDBZ_MISSION_MATCH,nteam);
		DelMSPlayer(YDBZ_MISSION_MATCH,PlayerIndex,nteam)
		--YDBZ_restore(PlayerIndex,YDBZ_MISSION_MATCH,nteam);
		NewWorld(world, pos_x, pos_y);
		SetLogoutRV(0);
	end
	PlayerIndex = OldPlayerIndex;
end
--

---- 结束比赛
function YDBZ_close_match()
	local oldsubworld = SubWorld
	-- 把玩家踢出地图
	YDBZ_kickout();

	-- 清理地图
	SubWorld = oldsubworld
	world = SubWorldIdx2ID(SubWorld);
	ClearMapNpc(world, 1);	-- 也清理玩家
	ClearMapTrap(world); 
	ClearMapObj(world);
	
	--CloseMission()
end
--
--
-- 从文件中读取NPC位置
function YDBZ_get_file_pos(file, line, column)
	x = YDBZ_GetTabFileData(file, line, column);
	y = YDBZ_GetTabFileData(file, line, column + 1);
	return x, y;
end
function YDBZ_GetTabFileData(mapfile, row, col)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFile Error!"..mapfile)
		return 0
	else
		return tonumber(TabFile_GetCell(mapfile, row, col))
	end
end
--
--
--根据trapfile的文件的坐标集合表，产生所有的trap点，并关联scriptfile的脚本		
function YDBZ_bt_addtrap(trapfile, scriptfile)
	local count = YDBZ_GetTabFileHeight(trapfile);
	local ID = SubWorldIdx2ID(SubWorld);
	
	for i = 1, count do
		local x = YDBZ_GetTabFileData(trapfile, i + 1, 1); 
		local y = YDBZ_GetTabFileData(trapfile, i + 1, 2);
		AddMapTrap(ID, x,y, scriptfile)
	end;
end;	


--关闭第十关,添加第十关障碍
--添加障碍
function YDBZ_bt_addZhangai(trapfile)
	local count = YDBZ_GetTabFileHeight(trapfile);
	local ID = SubWorldIdx2ID(SubWorld);
	
	for i = 1, count do
		local x = YDBZ_GetTabFileData(trapfile, i + 1, 1); 
		local y = YDBZ_GetTabFileData(trapfile, i + 1, 2);
		AddObstacleObj(469,ID, x,y)
	end;
end

--清除障碍点
function YDBZ_bt_clearzhangai(trapfile)
	local count = YDBZ_GetTabFileHeight(trapfile);
	--scriptid = FileName2Id(scriptfile);
	
	local ID = SubWorldIdx2ID(SubWorld);
	
	for i = 1, count do
		local x = YDBZ_GetTabFileData(trapfile, i + 1, 1); 
		local y = YDBZ_GetTabFileData(trapfile, i + 1, 2);
		--print(ID,x,y,scriptfile)
		ClearObstacleObj(ID,x,y)
	end;
end;	

function YDBZ_GetTabFileHeight(mapfile)
	if (TabFile_Load(mapfile, mapfile) == 0) then
		print("Load TabFileError!"..mapfile);
		return 0
	end
	return TabFile_GetRowCount(mapfile) - 1
end;

--任务变量字节增加
function YDBZ_sdl_addTaskByte(The_Task_ID,theByte,Inc_Num)
	SetTask(The_Task_ID,SetByte(GetTask(The_Task_ID),theByte,GetByte(GetTask(The_Task_ID),theByte)+Inc_Num));
end

--任务变量字节获得
function YDBZ_sdl_getTaskByte(The_Task_ID,theByte)
	return GetByte(GetTask(The_Task_ID),theByte);
end

--任务变量字节设置
function YDBZ_sdl_setTaskByte(The_Task_ID,theByte,nValue)
	SetTask(The_Task_ID,SetByte(GetTask(The_Task_ID),theByte,nValue));
end

function YDBZ_return_onlymap(map)
	for i = 1, getn(map) do
		index = SubWorldID2Idx(map[i]);
		if (index >= 0) then
			return index
		end
	end
end