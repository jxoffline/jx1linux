Include("\\script\\lib\\objbuffer_head.lua");
Include("\\script\\missions\\miniencounter\\mapmanager.lua");
Include("\\script\\missions\\miniencounter\\playermanager.lua");

-- 函数：apply_signup
-- 说明：玩家报名参加比赛，gs -> relay -> gs
-- 返回值：
function apply_signup(ParamHandle, ResultHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);
	local nPlayerMapID = ObjBuffer:PopObject(ParamHandle)
	local nSignupResult = -1;	--报名返回值：-1 - 系统错误, 1 - 成功, 2 - 已报名, 3 - 黑名单中, 4 - 已经在比赛中							 

	local tbMapList = EncounterMapManager.tbMapList;
	local nMapID	= -1;
	for i = 1, getn(tbMapList) do
		local tbMap = tbMapList[i];
		nMapID = tbMap:GetMapIDByPlayerName(szRoleName);
		if nMapID > 0 then
			break;
		end
	end

	if nSignupResult < 0 and nMapID > 0 then											-- 在比赛中
		nSignupResult = 4;
	end

	if nSignupResult < 0 and EncounterPlayerManager:IsInBlackList(szRoleName) then	  -- 在黑名单列表中
		nSignupResult = 3;
	end

	if nSignupResult < 0 and EncounterPlayerManager:IsInPrepareList(szRoleName) then	-- 在排队列表中
		nSignupResult = 2;
	end
	
	if nSignupResult < 0 then														   -- 加入排队列表
		local tbPlayer = EncounterPlayer:new(szRoleName);
		if EncounterPlayerManager:AddToPrepareList(tbPlayer) then	  
				DungeonGlobalData:PlayerInfoChange(szRoleName, {1, nPlayerMapID})
			nSignupResult = 1;
		end
	end

	-- Return Result
	ObjBuffer:PushObject(ResultHandle, szRoleName);
	ObjBuffer:PushObject(ResultHandle, nSignupResult);

		if nSignupResult == 1 then
			local hObject = OB_Create();
			ObjBuffer:PushObject(hObject, szRoleName);
			RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "AddPlayerToQueue", hObject)
			OB_Release(hObject)
		end

	-- 补充上一场玩家
	if nSignupResult > 0 and nSignupResult ~= 4 and nSignupResult ~= 3 then			 -- 报名成功或者已经报名
		replenish_player();
	end
end

function get_prepare_list_num(ParamHandle, ResultHandle)
	local nPrepareNum = 0;
	if EncounterPlayerManager.tbPrepareList ~= nil then
		nPrepareNum = getn(EncounterPlayerManager.tbPrepareList);
	end
	
	ObjBuffer:PushObject(ResultHandle, nPrepareNum);
end

-- 函数：return_map
-- 说明：玩家掉线重连比赛
function return_map(ParamHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);
	local tbMapList = EncounterMapManager.tbMapList;
	local nMapNum   = getn(tbMapList);
	local nMapID = -1;
	local tbMap  = nil;
	
	for i = 1, nMapNum do
		tbMap = tbMapList[i];
		nMapID = tbMap:GetMapIDByPlayerName(szRoleName);
		if nMapID > 0 then
			OutputMsg("return_map.."..nMapID..".."..szRoleName)
			break;
		end
	end

	local tbPlayerList = {}
	if nMapID > 0 and tbMap then
		local nCamp = tbMap:GetCampByName(szRoleName)
		tinsert(tbPlayerList, {szRoleName, nCamp})
		notify_enter_map(tbPlayerList, nMapID, 2, tbMap.nGameStartTime)
		return 1;
	end

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "return_map_msg", hObject);
	OB_Release(hObject);
end

-- 函数：cancel_signup
-- 说明：玩家取消报名操作
function cancel_signup(ParamHandle, ResultHandle)
	local szRoleName = ObjBuffer:PopObject(ParamHandle);					-- 角色名
	local tbPrepareList = EncounterPlayerManager.tbPrepareList;
	local nCancelResult = -1;	-- 取消结果：-1 系统错误，1 取消成功，0 还未报名，2 比赛中不能取消

	-- 检查是否在比赛中
	local tbMapList = EncounterMapManager.tbMapList;
	local nMapID	= -1;
	for i = 1, getn(tbMapList) do
		local tbMap = tbMapList[i];
		nMapID = tbMap:GetMapIDByPlayerName(szRoleName);
		if nMapID > 0 then
			break;
		end
	end

	if nCancelResult < 0 and nMapID > 0 then								-- 比赛中不能取消
		nCancelResult = 2;
	end

	if nCancelResult < 0 then
		if EncounterPlayerManager:IsInPrepareList(szRoleName) then		  -- 在准备队列中，可以取消报名
			if EncounterPlayerManager:DelFromPrepareList(szRoleName) then
								DungeonGlobalData:PlayerInfoChange(szRoleName, nil)
				nCancelResult = 1;
			end
		else																-- 还未报名
			nCancelResult = 0;
		end
	end

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	ObjBuffer:PushObject(hObject, nCancelResult);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "cancel_signup_msg", hObject);
	OB_Release(hObject);
	--EncounterPlayerManager:PrintPrepareList();
end

-- 函数：search_timer
-- 说明：relay启动创建timer，用于搜索准备列表，开启比赛
-- 返回值：触发器下次触发时间
function search_timer()	
	local tbPrepareList   = EncounterPlayerManager.tbPrepareList;
	local nPreparePlayerNum = getn(tbPrepareList);						  -- 等待队列中的人数

	if nPreparePlayerNum <= 0 then
		return DungeonGlobalData.SEARCH_TIMER_INTERVAL;
	end

	-- 优先补充前一场比赛的人数
	if replenish_player() then											  -- 如果本次触发补充了上一场的人数则返回
		return DungeonGlobalData.SEARCH_TIMER_INTERVAL;
	end

	-- 下次触发开启新比赛
	if nPreparePlayerNum < DungeonGlobalData.PLAY_NUM_LOWER_LIMIT then
		return DungeonGlobalData.SEARCH_TIMER_INTERVAL;
	end

	EncounterPlayerManager:ClearCheckTempList();
	local tbCheckTempList = EncounterPlayerManager.tbCheckTempList;		 -- 临时检查队列

	-- 检查角色状态条件
	local tbTempAddBlackList = {};										  -- 临时黑名单列表
	for i = 1, nPreparePlayerNum do

		local tbPlayer = tbPrepareList[i];
		if tbPlayer:CheckPlayerState() then			  -- 检查通过，先不进行删除，拷贝，直到开启比赛后从准备队列中删除
			EncounterPlayerManager:AddToCheckTempList(tbPlayer);
		else																-- 检查失败，加入临时黑名单
			tinsert(tbTempAddBlackList, tbPlayer)
		end

		if getn(tbCheckTempList) >= DungeonGlobalData.PLAY_NUM_UPPER_LIMIT then  -- 如果人数已经达到比赛人数上限则跳出
			break;
		end
	end

	-- 加入黑名单操作
	for i = 1, getn(tbTempAddBlackList) do
		local tbPlayer = tbTempAddBlackList[i];
		if tbPlayer then
			send_forbid_msg2player(tbPlayer.szRoleName);
			EncounterPlayerManager:DelFromPrepareList(tbPlayer.szRoleName);
			DungeonGlobalData:PlayerInfoChange(tbPlayer.szRoleName, nil)
			EncounterPlayerManager:AddToBlackList(tbPlayer);
		end
	end
	tbTempAddBlackList = {};

	local nCheckTempNum = getn(tbCheckTempList);
	if nCheckTempNum < DungeonGlobalData.PLAY_NUM_LOWER_LIMIT then
		EncounterPlayerManager:ClearCheckTempList();
		return DungeonGlobalData.SEARCH_TIMER_INTERVAL;
	else	-- 发送信息给玩家
		for i = 1, nCheckTempNum do
			send_prepare_fight_msg2player(tbCheckTempList[i].szRoleName);
		end
	end

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, tbCheckTempList[1].szRoleName);		  -- 临时队列第一个玩家所在gs开启(正式版本改成八台GS轮开)
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "allocate_map_dynamically", hObject);
	OB_Release(hObject);

	return DungeonGlobalData.SEARCH_TIMER_INTERVAL;
end

-- 函数：send_forbid_msg2player
-- 说明：发送拉黑信息给玩家
function send_forbid_msg2player(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "send_forbid_msg2player", hObject);
	OB_Release(hObject);
end

-- 函数：unforbid_timer
-- 说明：relay启动创建timer，用于搜索黑名单列表，解禁到时间角色
-- 返回值：触发器下次触发时间
function unforbid_timer()
	local tbBlackList = EncounterPlayerManager.tbBlackList;

	for k, v in tbBlackList do
		local nCurTime = GetSysCurrentTime();									   -- 当前服务器时间
		local szRoleName = k;
		local tbPlayer = v;

		if nCurTime >= tbPlayer.nLockTime + DungeonGlobalData.BLACK_LIST_TIME * 60 then
			EncounterPlayerManager:DelFromBlackList(tbPlayer.szRoleName);

			-- 通知玩家被解禁
			local hObject = OB_Create();
			ObjBuffer:PushObject(hObject, tbPlayer.szRoleName);
			RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "unforbid_msg", hObject);
			OB_Release(hObject);
		end
	end

	return DungeonGlobalData.UNFORBID_TIMER_INTERVAL;
end

-- 函数：allocate_map_dynamically
-- 说明：search_timer回调函数，用于开启地图
-- 返回值：无。
function allocate_map_dynamically(ParamHandle)
	local nMapID = ObjBuffer:PopObject(ParamHandle);
	if nMapID == nil or nMapID <= 0 then
		return nil;
	end

	local tbCheckTempList = EncounterPlayerManager.tbCheckTempList;				 -- 待加入比赛玩家列表
	local nCheckTempNum   = getn(tbCheckTempList);

	local tbMap = EncounterMap:Create(nMapID);
	local tbPlayerList = {}
	if tbMap then
		for i = 1, nCheckTempNum do
			local tbPlayer = tbCheckTempList[i];
			local nCamp = tbMap:AddPlayer(tbPlayer.szRoleName)
			tinsert(tbPlayerList, {tbPlayer.szRoleName, nCamp})
		end
	end
	EncounterMapManager:AddMap(tbMap);

	notify_enter_map(tbPlayerList, nMapID, 0, tbMap.nGameStartTime);				-- 通知gs拉玩家进入
	
	-- 将玩家从准备队列中删去
	for i = 1, nCheckTempNum do
		EncounterPlayerManager:DelFromPrepareList(tbCheckTempList[i].szRoleName);   -- 删除角色信息
		DungeonGlobalData:PlayerInfoChange(tbCheckTempList[i].szRoleName, nil)
	end

	EncounterPlayerManager:ClearCheckTempList();									-- 清空临时队列
end

function send_prepare_fight_msg2player(szRoleName)
	if szRoleName == nil then
		return nil;
	end

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, szRoleName);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "send_prepare_fight_msg2player", hObject);
	OB_Release(hObject);
end

-- 函数：replenish_player
-- 说明：补充上一场符离冲突战不足的人数，此函数在报名以及比赛开启触发器中被调用
-- 返回值：nil - 未进行补充或者进行补充但是补充失败，1 - 进行补充并且补充成功
function replenish_player()
	local tbPrepareList = EncounterPlayerManager.tbPrepareList;			 -- 报名准备队列
	local tbMapList	 = EncounterMapManager.tbMapList;					-- 地图队列
	
	local nMapNum = getn(tbMapList);										-- 当前开启的地图数

	local nPreparePlayerNum = getn(tbPrepareList);						  -- 当前准备队列等待人数

	OutputMsg("replenish_player.."..nMapNum..".."..nPreparePlayerNum)

	if nMapNum <= 0 or nPreparePlayerNum <= 0 then						  -- 如果没有地图开启或者准备队列中人数为空
		return nil;
	end
	
	local tbMap = tbMapList[nMapNum];									   -- 最后一场开启的比
	

	-- 如果地图合法并且在等待比赛并且人数不满
	if tbMap and tbMap:IsValid() and tbMap:IsWait() and (not tbMap:IsFull()) then

		-- 得到要补充的人数
		local nReplenish = DungeonGlobalData.PLAY_NUM_UPPER_LIMIT - tbMap:GetTotalNum();
		if nReplenish > nPreparePlayerNum then
			nReplenish = nPreparePlayerNum;
		end

		local nCounter = nReplenish;
		local tbTempAddBlackList  = {};										 -- 临时黑名单列表
		local tbTempEnterGameList = {};										 -- 临时进入游戏玩家列表

		-- 遍历准备队列，合法玩家加入临时进入游戏列表，非法玩家进入临时黑名单列表
		for i = 1, nPreparePlayerNum do
			if nCounter <= 0 then											   -- 补充到最大人数
				break;
			end

			local tbPlayer = tbPrepareList[i];
			if not tbPlayer:CheckPlayerState() then		  -- 角色状态非法，加入临时黑名单
				tinsert(tbTempAddBlackList, tbPlayer)
			else																-- 角色状态合法，加入临时进入游戏玩家列表
				tinsert(tbTempEnterGameList, tbPlayer)
				nCounter = nCounter - 1;										-- 计数减一
			end
		end

		-- 加入黑名单操作
		for i = 1, getn(tbTempAddBlackList) do
			local tbPlayer = tbTempAddBlackList[i];
			if tbPlayer then
				send_forbid_msg2player(tbPlayer.szRoleName);					-- 发送拉黑信息给玩家 relay -> gs -> client
				EncounterPlayerManager:DelFromPrepareList(tbPlayer.szRoleName); -- 从准备队列中删除
				DungeonGlobalData:PlayerInfoChange(tbPlayer.szRoleName, nil)
				EncounterPlayerManager:AddToBlackList(tbPlayer);				-- 加入黑名单列表
			end
		end

		-- 进入地图操作
		local tbPlayerList = {}
		for i = 1, getn(tbTempEnterGameList) do
			local tbPlayer = tbTempEnterGameList[i];
			if tbPlayer then
				local nCamp = tbMap:AddPlayer(tbPlayer.szRoleName)
				tinsert(tbPlayerList, {tbPlayer.szRoleName, nCamp})
				EncounterPlayerManager:DelFromPrepareList(tbPlayer.szRoleName); -- 从准备队列中删除
				DungeonGlobalData:PlayerInfoChange(tbPlayer.szRoleName, nil)
			end
		end
		
		if getn(tbPlayerList) > 0 then
			notify_enter_map(tbPlayerList, tbMap.nMapID, 1, tbMap.nGameStartTime)
			return 1;
		end
	end

	return nil;
end

function notify_enter_map(tbPlayerList, nMapID, nReason, nStartTime)
	if nMapID == nil or nMapID < 0 then
		return
	end
	
	local hObject = OB_Create()
	ObjBuffer:PushObject(hObject, tbPlayerList)
	ObjBuffer:PushObject(hObject, nMapID)
	ObjBuffer:PushObject(hObject, nReason)
	ObjBuffer:PushObject(hObject, nStartTime)
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "enter_map", hObject)
	OB_Release(hObject)
end

-- 函数：game_finish
-- 说明：比赛结束删除relay上地图信息后通知gs删除地图，gs -> relay -> gs
function game_finish(ParamHandle, ResultHandle)

	local nMapID = ObjBuffer:PopObject(ParamHandle);

	if nMapID == nil or nMapID <= 0 then
		return nil;
	end

	EncounterMapManager:DelMap(nMapID);

	local hObject = OB_Create();
	ObjBuffer:PushObject(hObject, nMapID);
	RemoteExecute("\\script\\missions\\miniencounter\\protocol.lua", "game_finish", hObject);
	OB_Release(hObject);
end

function PlayerInfoChange(ParamHandle)
	local szName = ObjBuffer:PopObject(ParamHandle)
	local bOnline = ObjBuffer:PopObject(ParamHandle)
	local nMapID = ObjBuffer:PopObject(ParamHandle)
	DungeonGlobalData:PlayerInfoChange(szName, {bOnline, nMapID})
end

AddTimer(DungeonGlobalData.SEARCH_TIMER_INTERVAL  , "search_timer"  , 0);
AddTimer(DungeonGlobalData.UNFORBID_TIMER_INTERVAL, "unforbid_timer", 0);
