-- 国战宋金任务变量：此任务变量存在国战宋金专用数据中。

TASKNO_NW_CONGRATULATION 		= 2602				-- 玩家任务变量：最低字节（第一个字节）保存朝贺次数，第二三四个字节time_t/(24 * 3600)

NW_TASKNO_WARRESULT				= 0					-- 国战宋金结果：1为宋赢，0为金赢
NW_TASKNO_CONGRATULATION 		= 1					-- 上次开启普天同庆的时间
NW_TASKNO_LEVY 			 		= 2					-- 上次募捐的时间
NW_TASKNO_ABSOLVE		 		= 3					-- 上次大赦天下的时间
NW_TASKNO_MESSAGETIME			= 4					-- 上次发布诏书的时间
NW_TASKNO_MESSAGECOUNT			= 5					-- 本周发布诏书的次数
NW_TASKNO_FORBIDCHATTIME		= 6					-- 上次行使禁言权利的时间
NW_TASKNO_GETDOMAINRING			= 7					-- 是否领取了帝皇之戒
NW_TASKNO_GETEMPIRERING			= 8					-- 是否领取了天子之戒
NW_TASKNO_GETEMPIRESEAL			= 9					-- 是否领取了天子玉玺
NW_TASKNO_NATIONALTITLE			= 10				-- 是否已经设置过国号

NW_MAXLEN_NATIONTITLE 			= 20					-- 国号长度限制
NW_MAXLEN_CONGRATULATIONWORDS 	= 48				-- 普天同庆贺词长度限制
NW_MAXLEN_MESSAGE				= 79				-- 诏书最长字节
NW_MINLEN_MESSAGE				= 4					-- 诏书最少字节
NW_MAXCOUNT_MESSAGE				= 10				-- 一周可以发送的诏书的最大数目

NWPOSITION_NONE					= 0					-- 国战宋金职位：无
NWPOSITION_EMPEROR				= 1					-- 国战宋金职位：天子
NWPOSITION_KING					= 2					-- 国战宋金职位：国王（帮主担任，不可任免）
NWPOSITION_MINISTER				= 3					-- 国战宋金职位：大丞相
NWPOSITION_MARSHAL				= 4					-- 国战宋金职位：兵马元帅
NWPOSITION_PIONEER				= 5					-- 国战宋金职位：先锋官

SECONDS_ONEWEEK 				= 7 * 24 * 3600		-- 一周的秒数
SECONDS_ONEDAY					= 24 * 3600			-- 一天的秒数
SECONDS_ONEHOUR					= 3600				-- 一小时的秒数

CITYIDX_LINAN					= 7					-- 临安城市索引
CITYIDX_BIANJING				= 4					-- 汴京城市索引

SKILLID_STATE_EMPEROR			= 957				-- 天子光环
SKILLID_STATE_KING				= 956				-- 国主光环
SKILLID_STATE_MINISTER			= 955				-- 大丞相光环
SKILLID_STATE_MARSHAL			= 954				-- 兵马大元帅光环
SKILLID_STATE_PIONEER			= 953				-- 先锋官光环

SKILLID_SKILL_EMPEROR			= 962				-- 天子技能
SKILLID_SKILL_KING				= 961				-- 国主技能
SKILLID_SKILL_MINISTER			= 960				-- 大丞相技能
SKILLID_SKILL_MARSHAL			= 959				-- 兵马大元帅技能
SKILLID_SKILL_PIONEER			= 958				-- 先锋官技能


TAB_TOKEN = {
	[CITYIDX_LINAN] = {6, 1, 2057},
	[CITYIDX_BIANJING] = {6, 1, 2058},
}

-- 清空任务变量
function nw_clear_task()
	
	NW_SetTask(NW_TASKNO_WARRESULT, 0)
	NW_SetTask(NW_TASKNO_CONGRATULATION, 0)
	NW_SetTask(NW_TASKNO_LEVY, 0)
	NW_SetTask(NW_TASKNO_ABSOLVE, 0)
	NW_SetTask(NW_TASKNO_MESSAGETIME, 0)
	NW_SetTask(NW_TASKNO_MESSAGECOUNT, 0)
	NW_SetTask(NW_TASKNO_FORBIDCHATTIME, 0)
	NW_SetTask(NW_TASKNO_GETDOMAINRING, 0)
	NW_SetTask(NW_TASKNO_GETEMPIRERING, 0)
	NW_SetTask(NW_TASKNO_GETEMPIRESEAL, 0)
	NW_SetTask(NW_TASKNO_NATIONALTITLE, 0)
	
end