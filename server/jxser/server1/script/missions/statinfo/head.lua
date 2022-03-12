
---------------------------------------------------------
MSID_STAT_GOODS_SALE		= 32 -- 物品销售统计- Mission ID
TMID_STAT_GOODS_SALE		= 60 -- 物品销售统计- 定时器ID
INTERVAL_STAT_GOODS_SALE	= 60*60*18 -- 60分钟统计一次
---------------------------------------------------------

-- 统计战队信息
LGTYPE_STATINFO 			= 10000 -- 战队类型
LGNAME_STAT_GOODS_SALE 		= "stat_goodssale" -- 战队名称

---------------------------------------------------------
-- 统计项目任务变量ID定义
LG_STATITEM_TASKID_TOTAL	= 0; -- 总统计记数(LeagueMember TaskID)
LG_STATITEM_TASKID_TODAY	= 1; -- 当天统计记数(LeagueMember TaskID)
-- 1 ~ 12 12个月份的统计记数
	-- 2005年：501~512
	-- 2006年：601~612

LG_STAT_TASKID_CURDATE		= 0; -- 当前统计日期(League TaskID)
---------------------------------------------------------
-- 货币类型
CURRENCYTYPE_MONEY			= 1; -- 剑侠币
CURRENCYTYPE_FUYUAN			= 2; -- 福缘
CURRENCYTYPE_COIN			= 3; -- 铜钱
CURRENCYTYPE_SCORE			= 4; -- 积分

-- 统计数据类型
STATDATA_LATECACHE 		= 0; -- 最近缓存
STATDATA_TOTALFORSTART	= 1; -- 从服务器启动后的总数
