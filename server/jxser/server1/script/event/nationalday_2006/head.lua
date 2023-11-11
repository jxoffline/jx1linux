
-- ====================== 文件信息 ======================

-- 剑侠情缘online 2006 年国庆节活动头文件
-- Edited by peres
-- 2006/09/26 PM 14:52

-- 就如同她的笑从来都不是代表快乐，
-- 她的哭泣也没有任何意味。
-- 她说，好了。
-- 我们说会儿话吧。
-- 拿了裙子和内衣，非常沉静地一件一件穿上。
-- 态度有明显的生疏，仿佛想退回到她的世界里去。

-- ======================================================


ID_GETDOUBLEEXP_DATE = 2502;  -- 领取双倍的日期
ID_GETDOUBLEEXP_NUM  = 2503;  -- 领取双倍的次数

ID_GETTASKBOOK_DATE  = 2504;  -- 领取任务卷轴的日期
ID_GETTASKBOOK_NUM   = 2505;  -- 领取任务卷轴的次数

ID_MOREEXP_ONLINETIME        = 2506;  -- 储存玩家在线时间
ID_MOREEXP_DATE              = 2507;  -- 记录玩家上次领取经验的日期
ID_MOREEXP_TIMES             = 2508;  -- 记录玩家领取的次数

Include("\\script\\task\\task_addplayerexp.lua");

-- 判断是否国庆节日期的主函数
function isNationalDay()

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));

	-- 国庆节活动时间：2006/10/01 ~ 2006/10/03
	if (nDate==61001 or nDate==61002 or nDate==61003) then
		return 1;
	else
		return 0;
	end;

end;


-- 判断玩家是否能获取赠送的经验
function canGetMoreExp()

local nLevel = GetLevel();

local nTime       = GetGameTime();
local nLateTime   = GetTask(ID_MOREEXP_ONLINETIME);

local nDate       = tonumber(GetLocalDate("%y%m%d"));
local nLateDate   = GetTask(ID_MOREEXP_DATE);

local nGetTimes   = GetTask(ID_MOREEXP_TIMES);

	if nGetTimes==0 then return 1; end;  -- 一次也没领过的话可以直接领

	if (nTime - nLateTime >= 60*60) and (nDate~=nLateDate) and nGetTimes<3 then
		return 1;
	else
		return 0;
	end;

end;

-- 计算玩家该得多少经验
function countMoreExpNum()

local nGetTimes   = GetTask(ID_MOREEXP_TIMES);
local aryExp = {[0]=5000000, [1]=10000000, [2]=15000000};

	if nGetTimes<3 then
		return aryExp[nGetTimes];
	else
		return 0;
	end;

end;


-- 玩家领取经验后写入的数据
function writeMoreExpData()

local nTime       = GetGameTime();
local nDate       = tonumber(GetLocalDate("%y%m%d"));
local nGetTimes   = GetTask(ID_MOREEXP_TIMES);

	SetTask(ID_MOREEXP_ONLINETIME, nTime);
	SetTask(ID_MOREEXP_DATE, nDate);
	SetTask(ID_MOREEXP_TIMES, nGetTimes + 1);

end;


-- 有等级限制的增加玩家经验，如果 nLimitLevel 为 0 则不限制
function addPlayerExpForLimit(myExpValue, nLimitLevel)

	tl_addPlayerExpForLimit(myExpValue, nLimitLevel);

end;


--判断玩家是否充过卡
function IsCharged()
	if( GetExtPoint( 0 ) >= 1 ) then
		return 1;
	else
		return 0;
	end;
end;

-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)

	-- 如果是空值则不写入
	if strMain==nil then return end;

	WriteLog("[2006年国庆节活动]"..date("[%y年%m月%d日%H时%M分]").."[账号："..GetAccount().."][角色："..GetName().."]"..strMain);
end;

