--特点：适应于这样的应用。
--一等奖共10名，其中有1人得某种奖品，另4人得某种奖品，另5人又得某种奖品
--二等奖共50名，其中20人得某种奖，30人得其它奖品
--某种奖的发奖数据，比如第一级别奖的情况，
TASK_LW_TYPECOUNT = 1 --
TASK_LW_AWARD_MAX = 2 --当前的奖品总数
TASK_LW_AWARD_USED = 3 --当前的奖品已发出去多少
TASK_LW_AWARD_TOTAL = 4 --当前最大的中奖人数
TASK_LW_AWARD_CURPOS = 5 --当前已经有多少人领过奖了
--tab = 
--{
--	leagueid, 站队id
--	"awardinfo" = { 奖品类别
--	{awardUSED已有多少发出去了, total, {{type1max,type1cur}, {type2max,type2cur}, {type3max, type3cur}}},
--	{awardused, total,{type1max,type1cur}, {type2max,type2cur}},
--	},
--}

--在RELAY产生新的有限奖励数据（战队）
function limit_create_info(tab)
	leagueid = tab["leaguetype"]
	for i = 1, getn(tab["awardinfo"]) do 
		local some_tab = tab["awardinfo"][i]
		local leaguename = tostring(i)
		local lid = LG_GetLeagueObj(leagueid, leaguename) ;
		if (lid == 0 or lid == nil) then
			lid = LG_CreateLeagueObj()
			LG_SetLeagueInfo(lid, leagueid, leaguename)
			LG_ApplyAddLeague(lid)
			LG_ApplySetLeagueTask(leagueid, leaguename, TASK_LW_TYPECOUNT , getn(some_tab[3]) )
			LG_ApplySetLeagueTask(leagueid, leaguename, TASK_LW_AWARD_TOTAL , some_tab[2] )
			LG_ApplySetLeagueTask(leagueid, leaguename, TASK_LW_AWARD_CURPOS , some_tab[1] )
			for j = 1, getn(some_tab[3]) do 
				local membername = "type"..j
				local memberObj = LGM_CreateMemberObj()
				LGM_SetMemberInfo(memberObj,membername, 0, leagueid, leaguename)
				--LG_AddMemberToObj(lid, memberObj)
				LGM_ApplyAddMember(memberObj)
				LG_ApplySetMemberTask(leagueid, leaguename, membername, TASK_LW_AWARD_MAX, some_tab[3][j][1])
				LG_ApplySetMemberTask(leagueid, leaguename, membername, TASK_LW_AWARD_USED, some_tab[3][j][2])
			end
			LG_FreeLeagueObj(lid)
		end
	end
end 

function limit_show_info(leagueid, msgfun)
	local levelcount = limit_getcount(leagueid)
	msgfun("---------------LIMITED_AWARD REPORT------------------")
	msgfun("AWARD LEVEL COUNT:"..levelcount)
	for i = 1, levelcount do 
		local awardcount, curpos, total = limit_get_level_awardinfo(leagueid, i)
		msgfun(i..":CHILD AWARD COUNT "..awardcount.." CURRENT GOT & TOTAL:"..curpos.."/"..total);
		for j = 1, awardcount do 
			local awardused, awardmax = limit_get_one_awardinfo(leagueid,i,j)
			msgfun("	["..j.."]:GOT & MAX:"..awardused.."/"..awardmax)
		end
	end
	msgfun("------------------------------------------------------")
end

function limit_clear_awardinfo(award_leaguetype)
	local count = 0
	local n_lid = LG_GetFirstLeague(award_leaguetype)
	while (n_lid ~= 0 and n_lid ~= nil) do
		
		name = LG_GetLeagueInfo(n_lid)
		if (name~= "") then 
			LG_ApplyRemoveLeague(award_leaguetype, name)
			count = count + 1
		end
		n_lid = LG_GetFirstLeague(award_leaguetype)
	end
	return count	
end

--获得某种类型奖的情况
function limit_get_level_awardinfo(award_leaguetype, awardlevel)
	local lid = LG_GetLeagueObj(award_leaguetype, tostring(awardlevel)) ;
	if (lid ~= 0 and lid ~= nil) then 
		local curpos = LG_GetLeagueTask(lid,	TASK_LW_AWARD_CURPOS)
		local total = LG_GetLeagueTask(lid,		TASK_LW_AWARD_TOTAL)
		local typecount = LG_GetLeagueTask(lid,	TASK_LW_TYPECOUNT)
		return typecount, curpos, total
	end
	return -1, -1, -1
end

function limit_get_one_awardinfo(award_leaguetype, awardlevel, awardnum)
	local awardmax = LG_GetMemberTask(award_leaguetype, tostring(awardlevel), "type"..awardnum, TASK_LW_AWARD_MAX) ;
	local awardused = LG_GetMemberTask(award_leaguetype, tostring(awardlevel), "type"..awardnum, TASK_LW_AWARD_USED) ;
	return awardused, awardmax
end

function limit_getcount(award_leaguetype)
	local count = 0
	local n_lid = LG_GetFirstLeague(award_leaguetype)
	while (n_lid ~= 0 and n_lid ~= nil) do
		count = count + 1
		n_lid = LG_GetNextLeague(award_leaguetype, n_lid)
	end
	return count
end

function limit_append_award(award_leaguetype, awardlevel, awardnum)
	LG_ApplyAppendMemberTask(award_leaguetype, tostring(awardlevel), "type"..awardnum, TASK_LW_AWARD_USED, 1)
end

function limit_append_curcount(award_leaguetype, awardlevel, appendnum)
	LG_ApplyAppendLeagueTask(award_leaguetype, tostring(awardlevel), TASK_LW_AWARD_CURPOS, appendnum)
end

-----------------------------------------------------------------
--[1]->leaguename 战队名 一类奖励
--typecount = 3 一类奖励有3种奖品
--maxcount = 10 最多送出10个奖品
--total = 10000
--curpos = 100
--
--	[type1]member 一类的第一种奖品
--	max = 1	一类的第一种奖品最多送出一份
--	cur = 0 目前送出几份了

--	[type2]member 一类的第二种奖品
--	max = 4
--	cur = 0
	
--	[type3]member 一类的第三种奖品
--	max = 5
--	cur = 0

--[2]						战队名 二类奖励
--typecount = 2
--maxcount = 50
--	[type1]			成员名
--	max=20
--	cur=0
--	[type2]			成员名
--	max=30
--	cur=0
--。。。
--。。。
-------------------------------------------------------------------