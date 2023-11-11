if (not __TONG_AWORD_HEAD__) then
	__TONG_AWORD_HEAD__ = 1;
	
Include("\\script\\tong\\tong_header.lua");
Include("\\script\\tong\\contribution_entry.lua");


TASKID_TONG_RECORDTEMP		=	153;		--用于记录宋金等活动的玩家获得的积分辅助变量；
TASKID_TONG_TASKLINKTEMP	=	154;		--用于记录野叟任务价值量
TASKID_TONG_WUSHENBLESS		=	2509;		--武神赐福实效


function FALSE(param)
	if (param == nil or param == "" or param == 0) then
		return 1;
	end;
	return 0;
end;

--宋金战场帮会周目标。
function tongaward_battle(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 0.03 * COEF_CONTRIB_TO_VALUE;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_SOJIN);
end;

--信使任务贡献度奖励
function tongaward_message(nRecord)
	if (FALSE(nRecord) == 1) then
		return
	end;
	local nValue = nRecord * 0.15 * COEF_CONTRIB_TO_VALUE;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_XINSHI);
end;

--闯关任务贡献度奖励
function tongaward_challengeoutoftime(nPhaseID)
	local nValue = 0;
	if (nPhaseID > 0 and nPhaseID <= 10) then
		nValue = 4 * COEF_CONTRIB_TO_VALUE;
	elseif (nPhaseID > 10 and nPhaseID <= 20) then
		nValue = 8 * COEF_CONTRIB_TO_VALUE;
	elseif (nPhaseID > 20 and nPhaseID <= 28) then
		nValue = 10 * COEF_CONTRIB_TO_VALUE;
	end;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_CHUNGGUAN);
end;

--野叟任务贡献度奖励
function tongaward_tasklink(nMainValue)
	if (FALSE(nMainValue) == 1) then
		return
	end;
	local nValue = floor(nMainValue / 8);
	if (FALSE(nValue) == 1) then
		return
	end;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_YESHOU);	
end;

--武林联赛贡献度奖励
function tongaward_league()
	local nValue = 25 * COEF_CONTRIB_TO_VALUE;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_WULIN);	
end;

--烽火连城贡献度奖励
function tongaward_citywar(isWin)
--	local nValue = 100 * COEF_CONTRIB_TO_VALUE;
--	if (nType == 1) then
--		nValue = 300 * COEF_CONTRIB_TO_VALUE;
--	end;
--	ContriValueEntryLogic(nValue, EVE_FENGHUO);	
end;

--猜花灯贡献度奖励
function tongaward_riddle()
--	local nValue = 4 * COEF_CONTRIB_TO_VALUE;
--	nValue = extong_double_award(nValue);
--	ContriValueEntryLogic(nValue, EVE_HUADENG);	
end;

--辉煌之种贡献度奖励
function tongaward_goldenseed()
	local nValue = 35 * COEF_CONTRIB_TO_VALUE;
	nValue = extong_double_award(nValue);
	ContriValueEntryLogic(nValue, EVE_ZHONGZI);	
end;

--随机事件贡献度奖励
function tongaward_randomevent()
--	local nValue = 50 * COEF_CONTRIB_TO_VALUE;
--	ContriValueEntryLogic(nValue, EVE_SHUIJI);	
end;

--同伴修炼任务贡献度奖励
function tongaward_partner_xiulian()
--	local nValue = 20 * COEF_CONTRIB_TO_VALUE;
--	ContriValueEntryLogic(nValue, EVE_XIULIAN);	
end;

--同伴剧情任务贡献度奖励
function tongaward_partner_juqing(nType)
--	local nValue = 50 * COEF_CONTRIB_TO_VALUE;
--	if (nType == 1) then
--		nValue = 100 * COEF_CONTRIB_TO_VALUE;
--	end;
--	ContriValueEntryLogic(nValue, EVE_JUQING);	
end;

--杀手boss贡献度奖励
function tongaward_killer()
	ContriValueEntryLogic(10 * COEF_CONTRIB_TO_VALUE, EVE_KILLER);	
end;

--风陵渡渡船贡献度奖励
function tongaward_fenglingdui()
	ContriValueEntryLogic(50 * COEF_CONTRIB_TO_VALUE, EVE_FENGLINGDU);	
end;

--龙脉贡献度奖励
function tongaward_longmai()
--	ContriValueEntryLogic(24 * COEF_CONTRIB_TO_VALUE, EVE_LONGMAI);	
end;

--是否有翻倍贡献度收益
function extong_double_award(nvalue)
	local nCurTime = GetCurServerTime();
	local nMyTime = GetTask(TASKID_TONG_WUSHENBLESS);
	if (nMyTime > nCurTime) then
		nvalue = nvalue * 2;
	end;
	return nvalue;
end;
	
end;	--// end of __TONG_AWORD_HEAD__
