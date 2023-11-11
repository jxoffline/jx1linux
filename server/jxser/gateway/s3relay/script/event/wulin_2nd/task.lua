Include("\\script\\event\\wulin_2nd\\head.lua")

function ascend(tb_lg1, tb_lg2)--jiang
	if (tb_lg1[2] == tb_lg2[2]) then
		return (tb_lg1[3] < tb_lg2[3])
	else
		return (tb_lg1[2] > tb_lg2[2])
	end
end


function TaskShedule()
	TaskName("武林大会预选")
	OutputMsg("武林大会预选")
	--下个2分钟后启动
	if (tonumber(date("%M")) + 2 >= 60) then
		if (date("%H") + 1 >= 24) then
			TaskTime(0, 2)
		else
			TaskTime(tonumber(date("%H")) + 1, 2)
		end
	else
		TaskTime(tonumber(date("%H")), tonumber(date("%M")) + 2)
	end
	TaskCountLimit(0);	--无限启动
	TaskInterval(10);	--间隔10分钟

	if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 0 and tonumber(date("%m%d%H%M")) >= WULIN_TB_TIME.register.open) then
		gb_SetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH, 1)
	end
end

function TaskContent()
	local curdate = tonumber(date("%m%d%H%M"))
	wulin_msg2subworld(curdate)
	if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 1) then
		local tb_elector = wulin_sort_elector()--排序竞投选手
		if (tb_elector == nil) then
			return
		end
		if (curdate >= WULIN_TB_TIME.register.close) then
			gb_SetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH, 2)
			--给与资格 gb_SetTask(WULIN_GB_NAME, 1, 3)
			wulin_sort_finalelector(tb_elector)
		end
	elseif (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) == 3 and curdate >= WULIN_TB_TIME.leader.close) then
		--排序领队选票
		wulin_sort_finalleader()
		gb_SetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH, 4)
	end
end

function wulin_sort_elector()
	local tb_elector = {}
	local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_ELECTOR)
	if (FALSE(n_lid)) then
	_msg("the first league return")
		return
	end
	while(not FALSE(n_lid)) do
		n_money = LG_GetLeagueTask(n_lid, WULIN_LGTASK_MONEY)
		n_date = LG_GetLeagueTask(n_lid, WULIN_LGTASK_DATE) * 10000 + LG_GetLeagueTask(n_lid, WULIN_LGTASK_TIME)
		s_name = LG_GetLeagueInfo(n_lid)
		s_account = LG_GetLeagueInfo(LG_GetLeagueObjByRole(WULIN_LGTYPE_ACCOUNT, s_name))
		tb_elector[getn(tb_elector) + 1] = {n_lid, n_money, n_date, s_name, s_account}
		n_lid = LG_GetNextLeague(WULIN_LGTYPE_ELECTOR, n_lid)
	end
	sort(tb_elector, ascend)
	local logfilename = "relay_log\\wulin_2nd\\wulin_member"..date("%d")..".log"
	WriteStringToFile(logfilename, date().."\n")
	for i = 1, getn(tb_elector) do
		LG_ApplySetLeagueTask(WULIN_LGTYPE_ELECTOR, tb_elector[i][4], WULIN_LGTASK_RANK, i)
		WriteStringToFile(logfilename, tb_elector[i][4].."\trank:"..i.."\tmoney:"..tb_elector[i][2].."\tdate:"..tb_elector[i][3].."\n")
	end
	return tb_elector
end

function wulin_sort_finalelector(tb_elector)
	if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH) ~= 2) then
		_msg("do return wulin_sort_finalelector(tb_elector)")
		return
	end
	local n_register = gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_REGCNT)
	local n_elector = WULIN_MAXMEMBER - n_register
	if (n_elector > getn(tb_elector)) then
		n_elector = getn(tb_elector)
	end
	local n_count = 0
	while(n_elector > 0) do
		n_count = n_count + 1
		local rolename = tb_elector[n_count][4]
		local roleaccount = tb_elector[n_count][5]
		local n_lid = LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, rolename)
		if (FALSE(n_lid)) then	--如果战队还未建立，现在创建
			wulin_creatNewmember(WULIN_LGTYPE_REGISTER, rolename, roleaccount)
			local n_level = LG_GetLeagueTask(tb_elector[n_count][1], WULIN_LGTASK_LEVEL)
			local n_faction = LG_GetLeagueTask(tb_elector[n_count][1], WULIN_LGTASK_FACTION)
			LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_FACTION, n_faction)
			LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_LEVEL, n_level)
			n_elector = n_elector - 1
		end
	end
	gb_SetTask(WULIN_GB_NAME, WULIN_GBTASK_SWITH, 3)

	local logfilename = WULIN_FILE_MEMBERS_ALL
	local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_REGISTER)
	while(not FALSE(n_lid)) do
		local rolename = LG_GetLeagueInfo(n_lid)
		local roleaccount = LG_GetLeagueInfo(LG_GetLeagueObjByRole(WULIN_LGTYPE_ACCOUNT, rolename))
		local n_level = LG_GetLeagueTask(n_lid, WULIN_LGTASK_LEVEL)
		local n_faction = LG_GetLeagueTask(n_lid, WULIN_LGTASK_FACTION)
		WriteStringToFile(logfilename, rolename.."\t"..roleaccount.."\t"..n_level.."\t"..n_faction.."\n")
		n_lid = LG_GetNextLeague(WULIN_LGTYPE_REGISTER, n_lid)
	end
end

function wulin_sort_finalleader()
	local tb_leader = {}
	local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_REGISTER)
	if (FALSE(n_lid)) then
		return
	end
	local n_count = 0
	while(not FALSE(n_lid)) do
		local n_vote = LG_GetLeagueTask(n_lid, WULIN_LGTASK_VOTEDCNT)
		if (not FALSE(n_vote)) then
			n_count = n_count + 1
			local leaguename = LG_GetLeagueInfo(n_lid)
			local n_date = LG_GetLeagueTask(n_lid, WULIN_LGTASK_DATE) * 10000 + LG_GetLeagueTask(n_lid, WULIN_LGTASK_TIME)
			tb_leader[n_count] = {n_lid, n_vote, n_date, leaguename}
		end
		n_lid = LG_GetNextLeague(WULIN_LGTYPE_REGISTER, n_lid)
	end
	sort(tb_leader, ascend)
	local logfilename = WULIN_FILE_TONGMASTER

	for i = 1, getn(tb_leader) do
		if (i >= 1 and i <= WULIN_MAXLEADER) then
			LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, tb_leader[i][4], WULIN_LGTASK_LEADER, i)
		end
		WriteStringToFile(logfilename, tb_leader[i][4].."\tRank:"..i.."\tdate:"..tb_leader[i][3].."\tvote:"..tb_leader[i][2].."\n")
	end
end

function wulin_msg2subworld(curdate)
	if (curdate <= WULIN_TB_TIME.register.close) then
		str = WULIN_FutureMsg.register
	elseif (curdate <= WULIN_TB_TIME.elector.close) then
		str = WULIN_FutureMsg.elector
	elseif (curdate <= WULIN_TB_TIME.leader.close) then
		str = WULIN_FutureMsg.leader
	else
		return
	end
	GlobalExecute(format("dw Msg2SubWorld([[%s]])", str));
end

function wulin_registercount()
	local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_REGISTER)
	local count = 0
	while(not FALSE(n_lid)) do
		count = count + 1
		n_lid = LG_GetNextLeague(WULIN_LGTYPE_REGISTER, n_lid)
	end
	return count
end

function wulin_sort_refinalelector(tb_elector)
	if (gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_REVOTESWITH) ~= 1) then
		_msg("do return wulin_sort_refinalelector(tb_elector)")
		return
	end
	local n_register = wulin_registercount()--gb_GetTask(WULIN_GB_NAME, WULIN_GBTASK_REGCNT)
	local n_elector = WULIN_MAXMEMBER - n_register
	if (n_elector > getn(tb_elector)) then
		n_elector = getn(tb_elector)
	end
	local n_count = 0
	while(n_elector > 0) do
		n_count = n_count + 1
		local rolename = tb_elector[n_count][4]
		local roleaccount = tb_elector[n_count][5]
		local n_lid = LG_GetLeagueObj(WULIN_LGTYPE_REGISTER, rolename)
		if (FALSE(n_lid)) then	--如果战队还未建立，现在创建
			wulin_creatNewmember(WULIN_LGTYPE_REGISTER, rolename, roleaccount)
			local n_level = LG_GetLeagueTask(tb_elector[n_count][1], WULIN_LGTASK_LEVEL)
			local n_faction = LG_GetLeagueTask(tb_elector[n_count][1], WULIN_LGTASK_FACTION)
			WriteStringToFile("relay_log\\wulin_2nd\\wulin_remember.log", rolename.."\t"..roleaccount.."\t"..n_level.."\t"..n_faction.."\n")
			LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_FACTION, n_faction)
			LG_ApplySetLeagueTask(WULIN_LGTYPE_REGISTER, rolename, WULIN_LGTASK_LEVEL, n_level)
			n_elector = n_elector - 1
		end
	end
	gb_SetTask(WULIN_GB_NAME, WULIN_GBTASK_REVOTESWITH, 2)

	local logfilename = "relay_log\\wulin_2nd\\wulin_refinalmember.log"
	local n_lid = LG_GetFirstLeague(WULIN_LGTYPE_REGISTER)
	while(not FALSE(n_lid)) do
		local rolename = LG_GetLeagueInfo(n_lid)
		local roleaccount = LG_GetLeagueInfo(LG_GetLeagueObjByRole(WULIN_LGTYPE_ACCOUNT, rolename))
		local n_level = LG_GetLeagueTask(n_lid, WULIN_LGTASK_LEVEL)
		local n_faction = LG_GetLeagueTask(n_lid, WULIN_LGTASK_FACTION)
		WriteStringToFile(logfilename, rolename.."\t"..roleaccount.."\t"..n_level.."\t"..n_faction.."\n")
		n_lid = LG_GetNextLeague(WULIN_LGTYPE_REGISTER, n_lid)
	end
end

function GameSvrConnected(dwGameSvrIP)
end
function GameSvrReady(dwGameSvrIP)
end
