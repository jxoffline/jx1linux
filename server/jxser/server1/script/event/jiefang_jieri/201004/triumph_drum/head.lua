-- 凯旋鼓声 头文件
--Include("\\script\\misc\\taskmanager.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

tbTriumphDrum = 
{
	nStartDate = 20100426,		-- 开始日期（前包）
	nCloseDate = 20201231, 		-- 结束日期（后闭）
	
	nStartTime = 1900,			-- 开始时间（前包）
	nCloseTime = 2000,			-- 结束时间（后包）
--Fix tr鑞g kh秈 ho祅 - Modified By DinhHQ - 20111202
	--nTaskGroupId = 8,			-- 任务变量组
	--nCurrentVersion = 1,		-- 版本号
	--nTaskID_LastAward = 1,		-- 上次领取日期
	--nTaskID_AwardCount = 2,		-- 领取次数
	nTaskID_DailyAwardLimit = 3084,
		
	nLimit_Level  = 80,			-- 等级限制
	nLimit_Money  = 3040000,	-- 金钱
	nLimit_DayUse = 1,			-- 每天允许使用的个数
	nLimit_DayAward = 120,		-- 每天允许奖励次数
	
	nNPCID		  = 1556,		-- NPC模版ID
	nTimerOut	  = 10*18,		-- Timer 间隔 10秒
	nTimerCount   = 180,		-- Timer 次数
	nTimerShow	  = 180,		-- Timer 显示的次数
	nSercherRange = 16,			-- 搜索范围
}

--tbTriumphDrum.tbTaskGroup = TaskManager:Create(tbTriumphDrum.nTaskGroupId, tbTriumphDrum.nCurrentVersion);

-- 活动是否举行
function tbTriumphDrum:IsCarryOn()
	local nDate = tonumber(GetLocalDate("%Y%m%d"));
	if nDate < self.nStartDate or nDate >= self.nCloseDate then
		 return 0;
	else	
		 return 1;
	end
end

-- 确认买鼓权限
function tbTriumphDrum:CheckCondition_BuyDrum()
	
	if tbTriumphDrum:IsCarryOn() ~= 1 then
		return 0;
	end
	
	if GetLevel() < self.nLimit_Level then
		return 0;
	end 
	
	local szTongName, nTongId = GetTongName();
	if nTongId == 0 then
		return 0;
	end
	
	local nFigure = GetTongFigure();
	if nFigure ~= 0 and nFigure ~= 1 then
		return 0;
	end
	
	return 1;
end

-- 获取获得的经验
function tbTriumphDrum:GetExp(nCount)
	if nCount <= 0 then
		return 0;
	elseif nCount <= 10 then
		return 100000;
	elseif nCount <= 30 then
		return 250000;
	elseif nCount <= 40 then
		return 300000;
	elseif nCount <= 50 then
		return 350000;
	elseif nCount <= 60 then
		return 400000;
	else
		return 500000;
	end
end

function clone(obj)
	local otype = type(obj)
	if (otype == "number") then
		return obj
	elseif (otype == "string") then
		local ret = obj
		return ret
	elseif (otype == "nil") then
		return obj
	elseif (otype == "table") then
		local ret = {}
		for key, val in obj do
			ret[clone(key)] = clone(val)
		end
		return ret
	else
		return obj
	end
end