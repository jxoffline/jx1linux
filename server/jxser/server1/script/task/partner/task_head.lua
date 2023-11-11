
-- ====================== 文件信息 ======================

-- 剑侠情缘online 情义江湖同伴剧情脚本头文件
-- Edited by peres
-- 2005/09/09 PM 11:19

-- 只有他和她两个人
-- 他们相爱
-- 她记得
-- 他的手抚摩在她的皮肤上的温情
-- 他的亲吻像鸟群在天空掠过
-- 他在她身体里面的暴戾和放纵
-- 他入睡时候的样子充满纯真
-- 她记得，清晨她醒过来的一刻，他在她的身边
-- 她睁着眼睛，看曙光透过窗帘一点一点地照射进来
-- 她的心里因为幸福而疼痛

-- ======================================================

-- 同伴系统的头文件
IncludeLib("PARTNER")

-- 面向对象类的支持
Include ("\\script\\lib\\mem.lua");

-- 读入字符串处理文件
Include ("\\script\\task\\system\\task_string.lua");

-- 读入奖励头文件
Include ("\\script\\task\\partner\\task_award.lua");

PARID_TASK_MASTER_001 = 3;      -- 记录侍郎之死的进展 ID
PARID_TASK_MASTER_002 = 4;      -- 记录控蛇人之秘进展的 ID
PARID_TASK_MASTER_003 = 5;      -- 记录珠宝商人进展的 ID
PARID_TASK_MASTER_004 = 6;      -- 记录异族武士进展的 ID
PARID_TASK_MASTER_005 = 14;     -- 记录隐藏任务进展的 ID

PARID_TASK_REWIND_001 = 30;     -- 记录侍郎之死修炼篇的进展 ID
PARID_TASK_REWIND_002 = 31;     -- 记录控蛇人之秘修炼篇的进展 ID
PARID_TASK_REWIND_003 = 32;     -- 记录珠宝商人修炼篇的进展 ID
PARID_TASK_REWIND_004 = 33;     -- 记录异族武士修炼篇的进展 ID

ARY_REWIND_DATE = {
	[1] = 61, -- 记录侍郎之死修炼篇的开始日期
	[3] = 62, -- 记录珠宝商人修炼篇的开始日期
	[4] = 63, -- 记录异族武士修炼篇的开始日期
}

ARY_REWIND_NUM = {
	[1] = 64, -- 记录侍郎之死修炼篇的完成次数
	[3] = 65, -- 记录珠宝商人修炼篇的完成次数
	[4] = 66, -- 记录异族武士修炼篇的完成次数
}

CProcess = {

	-- 检查任务的开始条件是否符合，可重载
	checkCondition = function(self)
		return 1;
	end,
	
	-- 任务的具体内容，可重载
	taskEntity = function(self, nCondition)
		return 1;
	end,
	
	-- 执行任务的内容，不可重载
	-- 传入参数：int:nMode 如果为 1 则表示多人共同执行此任务
	-- 返回 0 则表示执行过程无内容，可以继续原来的脚本
	-- 返回 1 则表示有内容，应该中断下面的脚本执行
	doTaskEntity = function(self, nMode)
		
		local nPreservedPlayerIndex = PlayerIndex
		local nMemCount = GetTeamSize()
		
		local nCondition = 0;
		local nResult = 0;
		local i = 0;
		
		if nMode==nil then nMode=0; end;
		
--		if nMode==1 then
--			if (nMemCount == 0) then
--				nCondition = self:checkCondition();
--				nResult = self:taskEntity(nCondition);
--			else
--				for i = 1, nMemCount do -- 在这里开始循环遍历每个玩家
--					PlayerIndex = GetTeamMember(i);
--					-- 排除自己之外的所有玩家执行一遍
--					if PlayerIndex~=nPreservedPlayerIndex or nPreservedPlayerIndex==nil then
--						self:taskEntity(self:checkCondition());
--					end;
--				end;
--				PlayerIndex = nPreservedPlayerIndex; -- 循环结束后在这里归还主玩家 ID
				
--				-- 先在这里对自己执行一遍
--				nResult = self:taskEntity(self:checkCondition());
--			end;
--		else

		nCondition = self:checkCondition();
		nResult = self:taskEntity(nCondition);
		return nResult;
		
--		end;
--		return nResult;
	end,
	
};

-- 设置主线剧情任务的进展状态
-- 传入参数：int:nMaster 第几条主线，int:nState 任务的状态
function SetMasterTaskState(nMaster, nState)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count();
	
	-- 如果没有带同伴或者没有召唤同伴则直接返回 nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	PARTNER_SetTaskValue(partnerindex, nMaster, nState);

end;

-- 获取主线剧情任务的进展状态
-- 传入参数：int:nMaster 第几条主线
-- 返回值：int:State 任务的状态
function GetMasterTaskState(nMaster)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count();
	
	-- 如果没有带同伴或者没有召唤同伴则直接返回 nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	return PARTNER_GetTaskValue(partnerindex, nMaster);

end;


-- 设置主线修炼任务的进展状态
-- 传入参数：int:nRewind 第几条主线，int:nState 任务的状态
function SetRewindTaskState(nRewind, nState)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count();
	
	-- 如果没有带同伴或者没有召唤同伴则直接返回 nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	PARTNER_SetTaskValue(partnerindex, nRewind, nState);

end;


-- 获取主线修炼任务的进展状态
-- 传入参数：int:nRewind 第几条主线
-- 返回值：int:State 任务的状态
function GetRewindTaskState(nRewind)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count();
	
	-- 如果没有带同伴或者没有召唤同伴则直接返回 nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	return PARTNER_GetTaskValue(partnerindex, nRewind);

end;


-- 检查今天的修炼任务是否能做
-- 传入参数：int:nTask 第几个修炼任务
function CheckRewindState(nTask)

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- 取得今天的时间，年/月/日
local nOldDate = GetPartnerTask(ARY_REWIND_DATE[nTask]);
local nTimes   = GetPartnerTask(ARY_REWIND_NUM[nTask]);

	-- 如果时间不相同则可以做
	if nNowDate~=nOldDate then
		return 1;
	else
		-- 如果每天做了达到或者超过 3 次则不可以做
		if nTimes>=3 then
			return 0;
		else
			return 1;
		end;
	end;
	
end;


-- 当符合条件后开始一次新的修炼任务的处理
function SetRewindStart(nTask)

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- 取得今天的时间，年/月/日
local nOldDate = GetPartnerTask(ARY_REWIND_DATE[nTask]);

	if nNowDate~=nOldDate then
		SetPartnerTask(ARY_REWIND_DATE[nTask], nNowDate);
		SetPartnerTask(ARY_REWIND_NUM[nTask], 0);
	end;
	
end;


-- 完成一次修炼任务后调用此功能
function SetRewindFinish(nTask)

local nNowDate = tonumber(date("%y")..date("%m")..date("%d")); -- 取得今天的时间，年/月/日
local nTimes   = GetPartnerTask(ARY_REWIND_NUM[nTask]);
local i=0;

	SetPartnerTask(ARY_REWIND_DATE[nTask], nNowDate);
	SetPartnerTask(ARY_REWIND_NUM[nTask], nTimes + 1);

	-- 清空所有的奖励记录
	for i=1, 10 do
		SetTaskAwardState(ARY_REWIND_AWARD[nTask], i, 0);
	end;
	
end;


-- 设置同伴的任务变量
-- 传入参数：int:nTaskID 任务变量号，int:nTaskValue 任务变量值
function SetPartnerTask(nTaskID, nTaskValue)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count();
	
	-- 如果没有带同伴或者没有召唤同伴则直接返回 nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	PARTNER_SetTaskValue(partnerindex, nTaskID, nTaskValue);

end;

-- 获取同伴的任务变量
-- 传入参数：int:nTaskID 任务变量号
function GetPartnerTask(nTaskID)

	local partnerindex,partnerstate = PARTNER_GetCurPartner();       --获得召唤出同伴的index,同伴状态为召出或为不召出
	local NpcCount = PARTNER_Count();
	
	-- 如果没有带同伴或者没有召唤同伴则直接返回 nil
	if NpcCount==0 or partnerstate~=1 then return nil; end;
	
	return PARTNER_GetTaskValue(partnerindex, nTaskID);
	
end;

-- 对所有队员执行同一过程
function DoTeamProcess(funProcess)

local nPreservedPlayerIndex = PlayerIndex;
local nMemCount = GetTeamSize();

	if (nMemCount == 0) then
		funProcess();
	else
		for i = 1, nMemCount do -- 在这里开始循环遍历每个玩家
			PlayerIndex = GetTeamMember(i);
			funProcess();
		end;
		PlayerIndex = nPreservedPlayerIndex; -- 循环结束后在这里归还主玩家 ID
	end;
end;


function OnTaskExit()

end;
