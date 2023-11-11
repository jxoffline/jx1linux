Include( "\\script\\leaguematch\\head.lua" )

-- 各种类型各套场地当前的分配情况
WLLS_GROUPS_STATE	= {}

--供GameServer调用的，尝试进入准备场的函数
function wlls_want2join(szParam)
	local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
	local n_type = WLLS_SEASON_TB[n_sid][1]
	local n_groups = WLLS_TYPE[n_type].groups
	
	_M("DO: wlls_want2join ("..szParam..")")
	--拆分传入参数
	local aryParam = split(szParam, " ")
	local n_mtype = tonumber(aryParam[1])
	local str_playername = aryParam[2]

	if (GetGblInt(RLGLB_WLLS_PHASE) ~= 4) then	--不是准备时间
		wlls_send_join(str_playername, 1)
		return
	end
	
	local n_matchid = GetGblInt(RLGLB_WLLS_MATCHID)
	local n_leagueid = LG_GetLeagueObjByRole(WLLS_LGTYPE, str_playername)
	if (FALSE(n_leagueid)) then	--找不到战队
		wlls_send_join(str_playername, 2)
		return
	end

	local n_minid = WLLS_SEASON_TB[n_sid][2]*100	--本赛季MatchID基础值
	local n_lastmatch = LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_LAST)
	local str_lgname = LG_GetLeagueInfo(n_leagueid)
	local nGroupID = 0;
	local n_memstate = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_playername, WLLS_LGMTASK_STATE)
	_M("wlls_want2join n_memstate="..n_memstate)

	if (n_lastmatch == n_matchid) then	--进入过本场比赛
		_M("wlls_want2join = already in!")
		nGroupID = LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_SVRID)
		_M("wlls_want2join in nGroupID="..nGroupID)
		local n_join = LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_JOIN)
		_M("wlls_want2join in n_join="..n_join)
		if (n_join > 0) then	--已经有队友进入场内
			local n_mscamp = LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_MSCAMP)
			_M("wlls_want2join "..str_lgname.." still in ["..n_mscamp.."]")
			if (n_mscamp == 0) then	--队友正在进入
				wlls_send_join(str_playername, 5)
				return
			elseif (n_memstate == 0) then	--自己没有进入
				wlls_SetMemberTask(str_lgname, str_playername, WLLS_LGMTASK_STATE, 1)
				LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_JOIN, 1)
			end
			wlls_send_join(str_playername, n_mtype, nGroupID, n_mscamp)
			return
		end
		--队友不在，尝试分配到上一次的服务器
		if (WLLS_GROUPS_STATE[n_mtype][nGroupID][1] <= 0) then	--没有空位，重新分配
			n_group = 0
		end
	elseif (n_lastmatch > 0 and n_lastmatch < n_minid) then	--以前的赛季进来的，要清空数据
		wlls_lg_clear_one(n_leagueid)
	elseif wlls_CheckMatchCount(n_leagueid, n_sid) ~= 1 then	--参赛次数达到限制
		wlls_send_join(str_playername, 4)
		return
	end
	
	if (nGroupID <= 0) then	--需要分配服务器
		_M("wlls_want2join = need new svr!")
		local nAllFree = 0	--一共有多少空位
		local tbGsFree = {}	--每套赛场的空位
		if (not WLLS_GROUPS_STATE[n_mtype]) then
			OutputMsg("wlls_want2join ERROR!!! no server for n_mtype="..n_mtype)
		else
			for nGrpID = 1, n_groups do
				local tbGroup	= WLLS_GROUPS_STATE[n_mtype][nGrpID]
				if (not tbGroup) then
					tbGsFree[nGrpID]	= 0
				else
					if (tbGroup[1] <= 0) then
						tbGsFree[nGrpID]	= 0
					else
						tbGsFree[nGrpID]	= tbGroup[2]
						nAllFree = nAllFree + tbGroup[2]
					end
					_M("wlls_want2join tbGsFree["..nGrpID.."] = ("..tbGroup[1]..")"..tbGroup[2])
				end
			end
		end
		_M("wlls_want2join nAllFree="..nAllFree)
		if (nAllFree <= 0) then	--一个空位都没有，不能进场
			wlls_send_join(str_playername, 3)
			return
		end
		--随机从空的位子中取一个出来
		local n_radseed = Random(nAllFree) + 1
		_M("wlls_want2join n_radseed="..n_radseed)
		for i = 1, getn(tbGsFree) do
			n_radseed = n_radseed - tbGsFree[i]
			if (n_radseed <= 0) then
				nGroupID = i
				break
			end
		end
		
		if (nGroupID <= 0) then	--异常！有空位，但是找不出来~@_@
			OutputMsg("wlls_want2join ERROR!!!")
			wlls_send_join(str_playername, 6)
			return
		end
	end
	
	wlls_DecGroupFree(n_mtype, nGroupID, 1)
	
	--初始化战队入场信息
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_JOIN, 1)	--第一个人进入
	wlls_SetMemberTask(str_lgname, str_playername, WLLS_LGMTASK_STATE, 1)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_LAST, n_matchid)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_SVRID, nGroupID)
	wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_MSCAMP, 0)
	wlls_send_join(str_playername, n_mtype, nGroupID, 0)
end

--供GameServer调用的，离开准备场的函数
function wlls_onleave(szParam)
	local n_sid = GetGblInt(RLGLB_WLLS_SEASONID)
	local n_type = WLLS_SEASON_TB[n_sid][1]
	local n_groups = WLLS_TYPE[n_type].groups
	
	_M("DO: wlls_onleave ("..szParam..")")
	--拆分传入参数
	local aryParam = split(szParam, " ")
	local n_mtype = tonumber(aryParam[1])
	local nGroupID = tonumber(aryParam[2])
	local str_playername = aryParam[3]

	if (GetGblInt(RLGLB_WLLS_PHASE) ~= 4) then	--不是准备时间
		return
	end	
	
	local n_matchid = GetGblInt(RLGLB_WLLS_MATCHID)

	local n_leagueid = LG_GetLeagueObjByRole( WLLS_LGTYPE, str_playername )
	if (FALSE(n_leagueid)) then	--异常：找不到战队
		OutputMsg("wlls_onleave ERROR!!! FALSE(n_leagueid)")
		return
	end
	if (LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_LAST) ~= n_matchid) then	--异常：战队没有参赛
		OutputMsg("wlls_onleave ERROR!!! WLLS_LGTASK_LAST ~= n_matchid")
		return
	end
	local str_lgname = LG_GetLeagueInfo(n_leagueid)
	local n_memstate = LG_GetMemberTask(WLLS_LGTYPE, str_lgname, str_playername, WLLS_LGMTASK_STATE)
	_M("wlls_onleave n_memstate="..n_memstate)
	if (n_memstate ~= 1) then	--异常：自己不在准备场
		OutputMsg("wlls_onleave ERROR!!! n_memstate ~= 1")
		return
	end
	
	local n_join = LG_GetLeagueTask(n_leagueid, WLLS_LGTASK_JOIN) - 1

	if (n_join <= 0) then	--本战队已经全部离开准备场
		_M("wlls_onleave "..str_lgname.." all gone!")
		wlls_DecGroupFree(n_mtype, nGroupID, -1)
		wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_JOIN, 0)
		wlls_SetLeagueTask(str_lgname, WLLS_LGTASK_MSCAMP, 0)
	else
		LG_ApplyAppendLeagueTask(WLLS_LGTYPE, str_lgname, WLLS_LGTASK_JOIN, -1)
	end
	wlls_SetMemberTask(str_lgname, str_playername, WLLS_LGMTASK_STATE, 0)
end

--供GameServer调用的，统计当前服务器负载的函数
function wlls_GsState(szParam)
	_M("DO: wlls_GsState("..szParam..")")

	local nSId		= GetGblInt(RLGLB_WLLS_SEASONID)	-- 赛季ID
	local nSType	= WLLS_SEASON_TB[nSId][1]			-- 赛季联赛类型
	local nGroups	= WLLS_TYPE[nSType].groups			-- 此联赛类型中，为每一种参赛类型准备的场地数
	
	local tbParam	= split(szParam," ")
	local nPlayerCount	= tonumber(tbParam[1])
	local tbGroups	= split(tbParam[2])
	local bFirst	= tbParam[3]
	
	local nFreeCount	= floor((800-nPlayerCount)/getn(tbGroups))
	if (nFreeCount <= 0) then
		nFreeCount	= 1
	end
	
	for i = 1, getn(tbGroups) do
		local nGroupIdx	= tonumber(tbGroups[i])
		local nMType	= ceil(nGroupIdx/nGroups)	-- 参赛类型
		local nGroupID	= mod(nGroupIdx-1, nGroups)+1
		if (bFirst) then
			if (not WLLS_GROUPS_STATE[nMType]) then
				WLLS_GROUPS_STATE[nMType]	= {}
			end
			WLLS_GROUPS_STATE[nMType][nGroupID]	= {WLLS_MAX_COUNT, nFreeCount}
		else
			WLLS_GROUPS_STATE[nMType][nGroupID][2]	= nFreeCount
		end
	end
end

function wlls_DecGroupFree(nMType, nGroupID, nDec)
	_M("wlls_DecGroupFree ", nMType, nGroupID, nDec)
	local tbGroup	= WLLS_GROUPS_STATE[nMType][nGroupID]
	tbGroup[1] = tbGroup[1] - nDec
	tbGroup[2] = tbGroup[2] - nDec
	if (tbGroup[1] < 0 or tbGroup[1] > WLLS_MAX_COUNT) then
		OutputMsg("wlls_DecGroupFree ERROR!!! tbGroup[1] = "..tbGroup[1])
		if (tbGroup[1] < 0) then
			tbGroup[1] = 0
		else
			tbGroup[1] = WLLS_MAX_COUNT
		end
	end
	if (tbGroup[2] <= 0) then
		tbGroup[2]	= 1
	end
end

--返回是否可以进入准备场的信息
function wlls_send_join(...)
	arg[1] = wlls_safestr(arg[1])
	_M("wlls_send_join("..join(arg)..")")
	GlobalExecute("dw wlls_player_join("..join(arg)..")")
end
