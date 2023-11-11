
-- ====================== 文件信息 ======================

-- 剑侠情缘online 2006 元旦活动头文件
-- Edited by peres
-- 2005/12/21 PM 19:42

-- 烟花。那一夜的烟花。
-- 她记得他在大雨的人群中，站在她的背后拥抱住她。
-- 他温暖的皮肤，他熟悉的味道。烟花照亮她的眼睛。
-- 一切无可挽回……

-- ======================================================

ID_GETDOUBLEEXP_DATE = 2334;  -- 领取双倍的日期
ID_GETDOUBLEEXP_NUM  = 2335;  -- 领取双倍的次数

ID_GETTASKBOOK_DATE  = 2336;  -- 领取任务卷轴的日期
ID_GETTASKBOOK_NUM   = 2337;  -- 领取任务卷轴的次数

ID_MOREEXP_ONLINETIME        = 2338;  -- 储存玩家在线时间
ID_MOREEXP_DATE              = 2339;  -- 记录玩家上次领取经验的日期
ID_MOREEXP_TIMES             = 2340;  -- 记录玩家领取的次数


IncludeLib( "FILESYS" );

Include("\\script\\task\\task_addplayerexp.lua")  --给玩家累加经验的公共函数

--TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- 升级所需的经验表

-- 判断是否元旦日期的主函数
function isNewYearTime()

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));

	-- 元旦活动时间：2005/12/30 ~ 2006/1/1
	if (nDate==51230 or nDate==51231 or nDate==60101) then
		return 1;
	else
		return 0;
	end;

end;

-- 玩家上线后自动获得武林盟主的诏书
function autoGetCard()

local nCount = CalcEquiproomItemCount(6,1,1011,-1);
	
	-- 如果玩家身上没有，并且是在元旦其间，就给他加一个
	if nCount<1 and isNewYearTime()==1 then
		AddItem(6, 1, 1011, 1, 0, 0, 0);
		return
	else
		return
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
local aryExp = {[0]=10000000, [1]=15000000, [2]=20000000};

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
	tl_addPlayerExpForLimit(myExpValue, nLimitLevel)
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

	WriteLog("[2006年元旦活动]"..date("[%y年%m月%d日%H时%M分]").."[账号："..GetAccount().."][角色："..GetName().."]"..strMain);
end;

-- 加入开始的过程中
if login_add then login_add(autoGetCard, 0); end;