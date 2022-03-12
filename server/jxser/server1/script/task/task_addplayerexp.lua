-------------------------------------------------------------------------
-- FileName		:	task_addplayerexp.lua
--  Author		:	xiaoyang
-- CreateTime	:	2005-08-22 13:08:05
-- Desc			:	给玩家累加经验脚本[忽略等级限制]
-------------------------------------------------------------------------
IncludeLib( "FILESYS" );
IncludeLib("SETTING");
TabFile_Load("\\settings\\npc\\player\\level_exp.txt","TL_UPLEVELEXP") -- 升级所需的经验表
Include("\\script\\task\\metempsychosis\\task_head.lua")

-- 获取级别对应的升级经验
function tl_getUpLevelExp(nLevel, nTransCont)
	local myNeedExp = 0
	local strNeedExp = ""
	if (not nTransCont or (nTransCont < 0 or nTransCont > %NTRANSLIFE_MAX)) then
		nTransCont = 0;
	end
	
	-- 防止参数错误
	if nLevel<=1 or nLevel>200 then
		return 0;
	end;

	myNeedExp = tonumber(TabFile_GetCell("TL_UPLEVELEXP", nLevel, 2));
	strNeedExp = TabFile_GetCell("TL_UPLEVELEXP", nLevel, 3 + nTransCont);
	if (strNeedExp ~= "") then
		myNeedExp = myNeedExp + (tonumber(strNeedExp) * 10000)
	end

	return myNeedExp;		
end

-- 计算从旧等级升级到玩家目前的等级需要多少经验值
function tl_countuplevelexp(myOldLevel,myOldExp, nTransCont)

local i
local myLevel = GetLevel()
local myExp = GetExp()
local nNowExp = tl_getUpLevelExp(myLevel + 1, nTransCont) -- 当前等级所需的经验

local myTotalExp = 0

	if (myOldLevel<myLevel) then
	
		for i=myOldLevel,myLevel do
			myTotalExp = myTotalExp + tl_getUpLevelExp(i + 1, nTransCont)
		end
		
		myTotalExp = (myTotalExp - myOldExp) - (nNowExp - myExp)
	
		return myTotalExp
	else
		return myExp - myOldExp
	end

end

-- 用于累加玩家经验的函数
function tl_addPlayerExp(myExpValue)

local myOwnExp = 0
local myNeedExp = 0
local myPayExp = 0
local nNextLevel = 0
local nTransCont = ST_GetTransLifeCount();

	-- LLG_MODIFY_20060603
	-- 预防死循环，最多升100级
	--while (myExpValue>0) do
	local i = 0;
	for i = 0, 180 do
		if (myExpValue <= 0) then
			return
		end
		myOwnExp = GetExp()
		nNextLevel = GetLevel()+1
		myNeedExp = tl_getUpLevelExp(nNextLevel, nTransCont);
		
		myNeedExp = myNeedExp - myOwnExp
		
		if (myNeedExp <= 0) then
			break
		end
		
		if (myExpValue<=myNeedExp) then
			AddOwnExp(myExpValue)
			myExpValue = 0
		else
			myExpValue = myExpValue - myNeedExp
			AddOwnExp(myNeedExp)
		end
		
	end
end

-- 有等级限制的增加玩家经验，如果 nLimitLevel 为 0 则不限制
function tl_addPlayerExpForLimit(myExpValue, nLimitLevel)

local myOwnExp = 0;
local myNeedExp = 0;
local myPayExp = 0;
local nNextLevel = 0;
local nUpLevel = 0; -- 已经升级的级数
local nTransCont = ST_GetTransLifeCount();

	while (myExpValue>0) do
	
		if nUpLevel>=nLimitLevel and nLimitLevel>0 then
			break;
		end;
	
		myOwnExp = GetExp();
		nNextLevel = GetLevel() +1;
		myNeedExp = tl_getUpLevelExp(nNextLevel, nTransCont);
	
		myNeedExp = myNeedExp - myOwnExp
		if (myNeedExp < 0) then
			break
		end
			
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
