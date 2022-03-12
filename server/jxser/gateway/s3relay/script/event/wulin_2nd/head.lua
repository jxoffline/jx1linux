Include("\\script\\lib\\common.lua")
Include("\\script\\gb_taskfuncs.lua")

--Const Value--
WULIN_LGTYPE_REGISTER = 7
WULIN_LGTYPE_ELECTOR = 8
WULIN_LGTYPE_ACCOUNT = 9
WULIN_FILE_MEMBERS_REGISTER = "relay_log\\wulin_2nd\\register.log"
WULIN_FILE_MEMBERS_ALL = "relay_log\\wulin_2nd\\wulin_finalmember.log"
WULIN_FILE_TONGMASTER = "relay_log\\wulin_2nd\\wulin_tongmaster.log"
WULIN_MAXMEMBER = 100		--每组服务器共100名选手
WULIN_MAXLEADER = 8		--帮主及长老
WULIN_GB_NAME = "第二届武林大会"
WULIN_MONEYBASE = 1000000
WULIN_TB_TIME = {
	register = {open = 03030000, close = 03162400},	--确认资格时间
	elector = {open = 03100000, close = 03162400},		--竞选时间
	leader = {open = 03162400, close = 03232400}		--票选总领队
}

--LG Value--ELECTOR		--竞投的相关信息
WULIN_LGTASK_MONEY = 1	--投注金额
WULIN_LGTASK_RANK = 3	--当前排名
WULIN_LGTASK_DATE = 4	--投注日期
WULIN_LGTASK_TIME = 5	--投注时间

--LG Value--REGISTER
WULIN_LGTASK_VOTEDCNT = 1
WULIN_LGTASK_CANVOTE = 2
WULIN_LGTASK_LEADER = 3
WULIN_LGTASK_DATE = 4	--投注日期
WULIN_LGTASK_TIME = 5	--投注时间
WULIN_LGTASK_FACTION = 6	--门派Number
WULIN_LGTASK_LEVEL = 7	--等级

--GB Value--
WULIN_GBTASK_SWITH = 1	--执行过程 0未开始，1开始报名及竞投，2报名结束可以开始选取竞投成功选手，3武林大会选手名单已确定可以开始选领队
WULIN_GBTASK_REGCNT = 2	--提前入选已报名人数

WULIN_FutureMsg = {
		register = "<color=yellow>3月3日~3月16日<color>期间，全区全服第二届武林大会提前入围选手可以在<color=yellow>临安武林大会官员(202/202)<color>处，确定报名参加，以取得第二届武林大会选手资格。提前入围选手详情请参见官网。",
		elector = "<color=yellow>3月10日~3月16日<color>期间，全区全服第二届武林大会选手资格竞投开始，玩家可以在<color=yellow>临安武林大会官员(202/202)<color>处，参与暗标竞投，以取得第二届武林大会选手资格。详情请参见官网。",
		leader = "<color=yellow>3月17日~3月23日<color>期间，全区全服第二届武林大会区服总领队票选开始，武林大会参赛选手可以在<color=yellow>临安武林大会官员(202/202)<color>处，投票选出武林大会服务器本区服(帮会)的总领队(帮主)以及帮会长老。详情请参见官网。",
}

--如果为nil或0，返回1，否则返回0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

function _msg(...)
	local str = ""
	for i=1,getn(arg) do
	str = str.."\t"..arg[i]
	end
	OutputMsg(str)
end

function wulin_creatNewmember(n_lgtype, pname, paccount)
	--创建战队
	local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
	LG_SetLeagueInfo(nNewLeagueID, n_lgtype, pname)	--设置社团信息(类型、名称)
	LG_ApplyAddLeague(nNewLeagueID, "", "")
	LG_FreeLeagueObj(nNewLeagueID)

	--加入战队
	--将account做为另一个战队
	--WULIN_LGTYPE_ACCOUNT
	--roleaccount
	if (FALSE(LG_GetLeagueObj(WULIN_LGTYPE_ACCOUNT, paccount))) then
		local nNewLeagueID = LG_CreateLeagueObj()	--生成社团数据对象(返回对象ID)
		LG_SetLeagueInfo(nNewLeagueID, WULIN_LGTYPE_ACCOUNT, paccount)	--设置社团信息(类型、名称)
		LG_ApplyAddLeague(nNewLeagueID, "", "")
		LG_FreeLeagueObj(nNewLeagueID)
	end
		
	--加入战队以账号
	local nMemberID = LGM_CreateMemberObj()	--生成社团成员数据对象(返回对象ID)
	--设置社团成员的信息(角色名、职位、社团类型、社团名称)
	LGM_SetMemberInfo(nMemberID, pname, 0, WULIN_LGTYPE_ACCOUNT, paccount)
	LGM_ApplyAddMember(nMemberID, "", "")
	LGM_FreeMemberObj(nMemberID)
end