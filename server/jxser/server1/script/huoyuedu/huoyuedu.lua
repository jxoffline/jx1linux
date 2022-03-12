IncludeLib("FILESYS")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\log.lua")

tbHuoYueDu = {}
tbHuoYueDu.szFilePath = "\\settings\\huoyuedu\\huoyuedu.txt"
-- 活跃度的最高值，需要和\UI\UI3\uiactivityguide\activityinfo.ini中的MaxHuoyuedu值保持一致
tbHuoYueDu.nMaxHuoYueDu = 100	

tbHuoYueDu.TSK_TotalHuoYueDu = 2880 --记录玩家每天在所有活动里获得总活跃度
tbHuoYueDu.TSK_Award = 2882 --记录活跃度领奖

OPENED = 1	-- 活跃度开启状态
CLOSED = 2  -- 活跃度关闭状态
STATE = OPENED -- 活跃度是否开始，1为开启，其他均为关闭

tbActivity2ID = {
	["luanzhanjiuzhou"] = 25,
	["shijiandetiaozhan"] = 3,
	["fenglingdu"] = 2,
	["songjin"] = 4,
	["yandibaozang"] = 5,
	["qichengdazhan"] = 6,
	["wulinliansai"] = 7,
	["xinshirenwu"] = 10,
	["shashourenwu"] = 11,
	["yesourenwu"] = 12,
	["huangchengsixunlianying"] = 26,
	["BOSS"] = 1,
	["huihuangzhiguo"] = 8,
	["huashandengmi"] = 9,
	["fenghuoliancheng"] = 13,
	["tianziguozhan"] = 14,
	}

function tbHuoYueDu:LoadTable(szPath)
	if (TabFile_Load(szPath, szPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return
	end
	local nRowCount = TabFile_GetRowCount(szPath)
	self.tbActivity = self.tbActivity or {}
	local number = 1
	for i=1, (nRowCount - 1) do
		self.tbActivity[i] = self.tbActivity[i] or {}
		self.tbActivity[i]["nTaskId"] = tonumber(TabFile_GetCell(szPath, i + 1, 3))
		local nColumn = 4
		local nCount = tonumber(TabFile_GetCell(szPath, i + 1, nColumn))
		self.tbActivity[i]["nCount"] = nCount
		self.tbActivity[i]["tbValue"] = self.tbActivity[i]["tbValue"] or {}
		number = number + 1
		for j=1, nCount do
			self.tbActivity[i]["tbValue"][j] = tonumber(TabFile_GetCell(szPath, i + 1, nColumn + j))
		end
	end
end

function tbHuoYueDu:AddHuoYueDu(szActivity)
	local nActivityId = tbActivity2ID[szActivity]
	if not nActivityId then
		return 
	end
	local tbActivity = self.tbActivity[nActivityId]
	local nResult = self:CheckTimes(nActivityId)
	if nResult ~= 1 then
		return
	end

	self:AddTaskDaily(nActivityId)
	local nTime = self:GetTaskDailyCount(nActivityId)
	local nAddedValue = tbActivity["tbValue"][nTime]
	
	if nAddedValue == nil or type(nAddedValue) ~= "number" or nAddedValue <= 0 then
		return
	end
	
	local nTaskValue = PlayerFunLib:GetTaskDailyCount(self.TSK_TotalHuoYueDu)
	if nAddedValue > (self.nMaxHuoYueDu - nTaskValue) then
		nAddedValue = self.nMaxHuoYueDu - nTaskValue
	end
	if nAddedValue > 0 then
		Msg2Player(format("Ch骳 m鮪g ngi nh薾 頲 %d 甶觤 n╪g ng",nAddedValue))
		PlayerFunLib:AddTaskDaily(self.TSK_TotalHuoYueDu, nAddedValue)
		G_ACTIVITY:OnMessage("Huoyuedu", nTaskValue + nAddedValue)
		local szLog = format("Player Get HuoYueDu, szKey:%s, nValue:%d", szActivity, nAddedValue)
		tbLog:PlayerActionLog(szLog)
	end
end

function tbHuoYueDu:AddTaskDaily(nActivityId)
	if self.tbActivity[nActivityId] == nil then
		return
	end
	PlayerFunLib:AddTaskDaily(self.tbActivity[nActivityId]["nTaskId"], 1)
end

function tbHuoYueDu:GetTaskDailyCount(nActivityId)
	if self.tbActivity[nActivityId] == nil then
		return
	end
	local nResult = PlayerFunLib:GetTaskDailyCount(self.tbActivity[nActivityId]["nTaskId"])
	return nResult
end

function tbHuoYueDu:AddHuoYueDuAll(tbPlayer, szActivity)
	for i=1,getn(tbPlayer) do
		CallPlayerFunction(tbPlayer[i], self.AddHuoYueDu, self, szActivity)
	end
end

function tbHuoYueDu:CheckTimes(nActivityId)
	if STATE ~= OPENED then
		return 
	end
	
	if self.tbActivity[nActivityId] == nil then
		return 
	end
	
	if PlayerFunLib:CheckTaskDaily(self.TSK_TotalHuoYueDu, self.nMaxHuoYueDu, "", ">=") == 1 then
		Msg2Player("觤 n╪g ng c馻 ngi h玬 nay  y, 甶觤 n╪g ng l莕 n祔 kh玭g t輓h v祇 trong")
		return 
	end
	
	local tbActivity = self.tbActivity[nActivityId]
	local nTaskId = self.tbActivity[nActivityId]["nTaskId"]
	local nCount = self.tbActivity[nActivityId]["nCount"]
	
	if PlayerFunLib:CheckTaskDaily(nTaskId, nCount, "", ">=") == 1 then
		return 
	end
	return 1
end

function tbHuoYueDu:ClearAll()
	for _,value in tbActivity2ID do
		local nTaskId = self.tbActivity[value]["nTaskId"]
		SetTask(nTaskId,0);
	end
	SetTask(self.TSK_Award, 0)
	SetTask(self.TSK_TotalHuoYueDu, 0)
end

tbHuoYueDu:LoadTable(tbHuoYueDu.szFilePath)

