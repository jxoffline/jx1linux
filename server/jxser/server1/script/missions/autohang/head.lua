-- AEXP - Auto Experience
FRAME2TIME 		= 18;	--18帧游戏时间相当于1秒钟
AEXP_FREQ		= 10;	-- 10分钟
AEXP_UPDATETIME		= AEXP_FREQ * 60 * FRAME2TIME; --300秒(5分钟)调整一次经验值
AEXP_MISSIONID		= 9;
AEXP_TIMERID		= 19;
AEXP_TASKID			= 136;
AEXP_OLTIME_TASKID	= 140; -- 记录离开岛时的在线时间的任务变量

AEXP_NEEDLEVEL		= 50;  		-- 挂机等级需求

AEXP_HOUR_MAX		= 24;		-- 最多可同时使用24小时

AEXP_TIME_ONE		= 60;		-- 一粒的分钟数(可用一小时)
AEXP_TIME_UPDATE	= AEXP_TIME_ONE * AEXP_FREQ / 60;  -- 每调整一次所扣的分钟数(根据调整时间间隔)
AEXP_TIME_MAX		= AEXP_TIME_ONE * AEXP_HOUR_MAX;  -- 最多可同时使用24小时

AEXP_TICKET			= 1800; -- 进入桃花岛的门票费用

AEXP_STAT_FREQ		= 1 * AEXP_TIME_ONE / AEXP_FREQ;	-- 统计频率(每一小时统计一次)

-- 免费加倍经验挂机时段
AEXP_FREEDATE_BEGIN 	= 20040813 	-- 包括当天
AEXP_FREEDATE_END 		= 20040830 	-- 当天服务器更新为止
AEXP_SVRUPDATE_TIME		= 9 		-- 服务器更新时间
AEXP_FREEDATE_EXPFACTOR	= 1;	   	-- 经验增强倍数

-- 是否免费双经验
function AEXP_IsFreeTimeDoubleExp()
--	return 1; -- 天天免费，不再收费
--	nCurDate = tonumber(date("%Y%m%d"));
--	nHour = tonumber(date("%H"))
--	if (nCurDate >= AEXP_FREEDATE_BEGIN and nCurDate <= AEXP_FREEDATE_END) then-- 免费双经验日子
--		if (nCurDate == AEXP_FREEDATE_END and nHour >= AEXP_SVRUPDATE_TIME) then -- 已到最后一天之后的更新时间
--			return 0;
--		end

--		return 1;
--	end
	return 0;
end;
