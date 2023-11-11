--选手名单
IL("LEAGUE")
Include("\\script\\event\\wulin_2nd\\data.lua")
Include("\\script\\lib\\gb_taskfuncs.lua")
Include("\\script\\lib\\common.lua")

CP_TASKID_TITLE = 1085
WULIN_TASK_LOGIN = 1570
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

--得到对话Npc名称
function wulin_npcname()
	return "武林大会官员"
end

--Describe对话
function wlls_descript(str, ...)
	str = "<link=image[0,1]:\\spr\\npcres\\passerby\\passerby092\\passerby092_st.spr>"..wulin_npcname().."<link>\n　　"..str
	if (type(arg[1]) == "table") then
		arg = arg[1]
	end
	if (getn(arg) <= 0) then
		Describe(str, 1, "结束对话/OnCancel")
	else
		Describe(str, getn(arg), arg)
	end
end

--如果为nil或0，返回1，否则返回0
function FALSE(nValue)
	if (nValue == nil or nValue == 0 or nValue == "") then
		return 1
	else
		return nil
	end
end

--获得区服ID
function wl_GetZone()
	return WULIN_TB_ZONEID[GetGateWayClientID()]
end

function wl_GetMember()
	return WULIN_TB_ROLES[GetGateWayClientID()].n
end

function ascend(tb_lg1, tb_lg2)--jiang
	if (tb_lg1[2] == tb_lg2[2]) then
		if (tb_lg1[3] == nil) then
			return nil
		else
			return (tb_lg1[3] < tb_lg2[3])
		end
	else
		return (tb_lg1[2] > tb_lg2[2])
	end
end