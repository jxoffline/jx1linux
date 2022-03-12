
-- ====================== 文件信息 ======================

-- 剑侠情缘online 2006 农历春节活动头文件
-- Edited by peres
-- 2006/01/09 PM 15:00

-- 如果有过幸福
-- 幸福只是瞬间的片断，一小段一小段
-- 房间里的黑暗就犹如大海，童年的时候她和父母一起坐船去海岛
-- 夜晚的船在风浪里颠簸，她躺在小小的铺位上感觉自己随着潮水漂向世界的尽头
-- 而那一刻，世界是不存在的
-- 只有他和她两个人。他们相爱

-- ======================================================

-- 任务系统库支持
IncludeLib("TASKSYS");

-- 随机任务的处理支持
Include("\\script\\task\\random\\task_head.lua");

ID_GETDOUBLEEXP_DATE = 2342;  -- 领取双倍的日期

ID_GETTASKBOOK_DATE  = 2343;  -- 领取任务卷轴的日期

ID_MOREEXP_ONLINETIME        = 2344;  -- 储存玩家在线时间
ID_MOREEXP_DATE              = 2345;  -- 记录玩家上次领取经验的日期

-- 所有奖励领取次数的总记录，按 byte 记
-- b1 记录双倍次数  b2 记录卷轴次数  b3 记录经验次数  b4 记录除夕之夜领取奖励次数
ID_NUMRECORD                 = 2346;

aryTalk = {

	[60127] = "明天晚上就是除夕之夜了哦！可有想好跟谁一起过春节呢？",
	[60128] = "哈哈，今天晚上就是<color=yellow>除夕之夜<color>了哦！今晚的团圆饭吃什么呢？有没有“守岁”的打算呀？",
	[60129] = "新年好啊！今天是<color=yellow>正月初一<color>，按习俗早餐可是要吃素的哦！祝你新的一年有新的开始！",
	[60130] = "新年好啊！今天是<color=yellow>正月初二<color>，可是探亲访友的好日子哦！",
	[60131] = "新年好啊！今天是<color=yellow>正月初三<color>，最近有什么新的打算呢？",
	[60201] = "新年好啊！今天是<color=yellow>正月初四<color>，有没有给别人拜年呀？",
	[60202] = "新年好啊！今天是<color=yellow>正月初五<color>，又准备开始新一年的忙活了吧？",
	[60203] = "新年好啊！今天是<color=yellow>正月初六<color>，这可是古人传说“送穷神”的日子哦！祝你今年财源滚滚来。",

}

-- 判断是否处于春节的期间
function isSpringTime()

-- 活动日期数组：2006 年 1 月 27 日 ~ 2006 年 2 月 3 日
local aryDate = {60127, 60128, 60129, 60130, 60131, 60201, 60202, 60203};

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));

local i=0;

	for i=1, getn(aryDate) do
		if aryDate[i]==nDate then
			return 1;
		end;
	end;

	return 0;
	
end;

-- 判断是否处于除夕的两个小时内
function isNewYearEve()

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));

-- 取得整点时间
local nHour = tonumber(GetLocalDate("%H"));

	if (nDate==60128 and nHour==23) or (nDate==60129 and nHour==0) then
		return 1;
	end;
	
	return 0;

end;

-- 礼官处的主对话
function mainTalk()

local szName = GetName();
local szSpeWord = "";

	-- 如果是新年活动其间，获取新年贺词
	if isSpringTime()==1 then 
		szSpeWord = aryTalk[tonumber(GetLocalDate("%y%m%d"))]; 
	else
		Say("礼官：不好意思，目前不是处于春节活动期间哦！春节活动是从 <color=yellow>2006年1月27日<color> 开始至 <color=yellow>2006年2月3日<color> 截止的。", 0);
		return
	end;

	Say("礼官："..szName.."，"..szSpeWord.."闲话少说，我就不耽搁您的时间了，您想领取那一种新春礼品呢？", 6,
		"领取除夕之夜庆贺新年的丰厚奖励/getNewYearEveAward",
		"领取每日的八小时双倍经验/getDoubleExp",
		"领取每日的经验奖励/getMoreExp_Confirm",
		"领取每日的任务卷轴/getTaskBook",
		"有关白驹丸的新消息/getBaijuInfo",
		"离开/OnExit");

end;


-- 领取除夕之夜的奖励
function getNewYearEveAward()

local nResult = 0;

	if isNewYearEve()~=1 then
		Say("礼官：呵呵，除夕之夜的新年贺礼只能在<color=yellow>大年三十晚<color>的<color=yellow>子时（23:00 - 01:00）<color>领取哦！", 0);
		return
	end;
	
	-- 如果等级未达到 80 级
	if GetLevel()<80 then
		Say("礼官：只有 80 级以上的人才能领取这份厚礼哦！", 0);
		return
	end;
	
	if getAwardTime(4)>=1 then
		Say("礼官：呵呵，新年快乐！你已经领过了除夕之礼藏宝图了哦！", 0);
		return
	end;
	
	-- 记录一次
	setAwardTime(4, 1);
	
	-- 产生一张藏宝图
	nResult = CreateTreasureMap();
	
	Msg2Player("您得到了一张礼官藏宝图，祝您<color=yellow>新年快乐，万事如意！<color>");
	
	Say("您得到了一张礼官藏宝图，祝您<color=yellow>新年快乐，万事如意！<color>", 0);
	
	WriteTaskLog("在除夕奖励中领取了一张藏宝图，索引为："..nResult);
	
	return

end;


-- 领取每日八小时的双倍经验
function getDoubleExp()

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isSpringTime()==0 then
		Say("礼官：实在不好意思，现在不是春节活动时间，春节活动时间是从 <color=yellow>2006年1月27日<color> 开始至 <color=yellow>2006年2月3日<color> 截止的。", 0);
		return
	end;

	-- 如果等级未达到 80 级
	if GetLevel()<80 then
		Say("礼官：只有 80 级以上的人才能领取双倍经验哦！", 0);
		return
	end;

	if nDate~= GetTask(ID_GETDOUBLEEXP_DATE) then
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		setAwardTime(1, 1);
		
	elseif getAwardTime(1)>=1 then
	
		Say("你今天已经领取过了双倍经验了哦！", 0);
		return
		
	else
	
		SetTask(ID_GETDOUBLEEXP_DATE, nDate);
		setAwardTime(1, 1);

	end;
	
	-- 80 级以上的人每天可以领取一次 8 小时经验双倍
	if GetLevel()>=80 then
	
		AddSkillState(531,10,1,8*60*60*18);
		AddSkillState(461,1, 1,8*60*60*18);
		
		Msg2Player("您得到了<color=green> 8 小时的双倍经验！<color>");
		WriteTaskLog("得到了 8 小时的双倍经验！");
		
	else
		Say("礼官：只有 80 级以上的人才能领取双倍经验哦！", 0);
	end;

end;


-- 领取每日的任务卷轴
function getTaskBook()

local nRandomTaskID, nRandomItemIndex = 0, 0;

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));

-- 玩家已经领取的任务卷轴个数
local nTimes = getAwardTime(2);
	
	-- 如果日期不对，直接返回
	if isSpringTime()==0 then
		Say("礼官：实在不好意思，现在不是春节活动时间，春节活动时间是从 <color=yellow>2006年1月27日<color> 开始至 <color=yellow>2006年2月3日<color> 截止的。", 0);
		return
	end;
	
	-- 如果是非冲卡用户
	if IsCharged()==0 then
		Say("礼官：本次春节活动只有冲卡用户才能参与哦！", 0);
		return
	end;
	
	-- 如果等级未达到 80 级
	if GetLevel()<80 then
		Say("礼官：只有 80 级以上的人才能领取这个任务卷轴哦！", 0);
		return
	end;
	
	if nTimes>=3 then
	
		Say("礼官：在春节活动期间每人只能领取<color=yellow>三个<color>任务卷轴哦！", 0);
		return
		
	end;
		
	if nDate~= GetTask(ID_GETTASKBOOK_DATE) then
	
		SetTask(ID_GETTASKBOOK_DATE, nDate);
		setAwardTime(2, nTimes + 1);
		
	elseif nDate==GetTask(ID_GETTASKBOOK_DATE) then
		
		Say("礼官：你今天已经领取过任务卷轴了哦，还是等明天再来吧！", 0);
		return
		
	end;
	
	-- 选择一个第二层的随机任务
	nRandomTaskID = TaskNo(selectNextTask());
		
	-- 生成一个任务卷轴
	nRandomItemIndex = AddItem(6, 2, 2, 0, 1, 0, 0);
	SetItemMagicLevel(nRandomItemIndex, 1, nRandomTaskID);
	
	-- 同步物品魔法属性
	SyncItem(nRandomItemIndex);

	Msg2Player("您得到了<color=green>任务卷轴一个！<color>");
	
	WriteTaskLog("得到了一个任务卷轴，编号为："..nRandomTaskID);
	
end;


-- 获得白驹丸的信息
function getBaijuInfo()

	Say("您在 <color=yellow>2006年1月27日至2006年2月3日<color> 每天<color=red>0：00~18：00<color>，使用白驹丸挂机获得的经验将翻倍、技能白驹丸挂机获得熟练度将翻 1.5 倍。", 0);
	return

end;



-- 领取每日的经验确认
function getMoreExp_Confirm()

	Say("礼官：你现在想要领取新年活动的赠送经验吗？", 2,
		"是的/getMoreExp",
		"不了/mainTalk");
	return
	
end;


-- 领取每日的经验
function getMoreExp()

local nExp = countMoreExpNum();

-- 取得日期
local nDate  = tonumber(GetLocalDate("%y%m%d"));
	
	-- 如果日期不对，直接返回
	if isSpringTime()==0 then
		Say("礼官：实在不好意思，现在不是春节活动时间，春节活动时间是从 <color=yellow>2006年1月27日<color> 开始至 <color=yellow>2006年2月3日<color> 截止的。", 0);
		return
	end;
	
	-- 如果是非冲卡用户
	if IsCharged()==0 then
		Say("礼官：本次春节活动只有冲卡用户才能参与哦！", 0);
		return
	end;
	
	if canGetMoreExp()==1 then
		if GetLevel()<50 then
			addPlayerExpForLimit(nExp, 5); -- 限制只能升 5 级
		else
			addPlayerExpForLimit(nExp, 0); -- 不限制
		end;
		
		Msg2Player("您得到了春节活动的经验奖励：<color=yellow>"..nExp.."<color> 点经验！");
		
		writeMoreExpData();  -- 记录领取经验的相关数据
	
		WriteTaskLog("得到每日的奖励经验："..nExp);
		
	else
		Say("礼官：你现在的条件不能够领取每日的经验，在1月27日至2月3日期间，每天来我这里都可获赠大批经验。<color=yellow>这些经验每天能领一次、一共可以领三天<color>，但两次领取经验之间相隔需要<color=yellow>在线超过1小时<color>哦！", 0);
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

local nGetTimes   = getAwardTime(3);

	if nGetTimes==0 then return 1; end;  -- 一次也没领过的话可以直接领

	if (nTime - nLateTime >= 60*60) and (nDate~=nLateDate) and nGetTimes<3 then
		return 1;
	else
		return 0;
	end;

end;



-- 计算玩家该得多少经验
function countMoreExpNum()

local nGetTimes   = getAwardTime(3);
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
local nGetTimes   = getAwardTime(3);

	SetTask(ID_MOREEXP_ONLINETIME, nTime);
	SetTask(ID_MOREEXP_DATE, nDate);
	setAwardTime(3, nGetTimes + 1);

end;


-- 有等级限制的增加玩家经验，如果 nLimitLevel 为 0 则不限制
function addPlayerExpForLimit(myExpValue, nLimitLevel)

local myOwnExp = 0;
local myNeedExp = 0;
local myPayExp = 0;

local nUpLevel = 0; -- 已经升级的级数

	while (myExpValue>0) do
	
		myOwnExp = GetExp();
		myNeedExp = tonumber(TabFile_GetCell("TL_UPLEVELEXP", GetLevel()+1, 2)) - myOwnExp;
	
		if nUpLevel>=nLimitLevel and nLimitLevel>0 then
			break;
		end;
		
		if (myExpValue<myNeedExp) then
			AddOwnExp(myExpValue);
			myExpValue = 0;
		else
			myExpValue = myExpValue - myNeedExp;
			AddOwnExp(myNeedExp);
			
			nUpLevel = nUpLevel + 1;
			
		end;
	end;

end;


-- 记录领取奖励的次数
-- b1 记录双倍次数  b2 记录卷轴次数  b3 记录经验次数  b4 记录除夕之夜领取奖励次数
function setAwardTime(nType, nNum)
	SetTask(ID_NUMRECORD, SetByte(GetTask(ID_NUMRECORD), nType, nNum));
end;

-- 获取领取奖励的次数
-- b1 记录双倍次数  b2 记录卷轴次数  b3 记录经验次数  b4 记录除夕之夜领取奖励次数
function getAwardTime(nType)
	return GetByte(GetTask(ID_NUMRECORD), nType);
end;


-- 任务系统的写入 LOG 过程
function WriteTaskLog(strMain)

	-- 如果是空值则不写入
	if strMain==nil then return end;

	WriteLog("[2006农历新年活动]"..date("[%y年%m月%d日%H时%M分]").."[账号："..GetAccount().."][角色："..GetName().."]"..strMain);
end;


function OnExit()

end;