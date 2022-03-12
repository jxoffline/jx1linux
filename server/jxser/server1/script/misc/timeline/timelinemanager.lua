Include("\\script\\misc\\timeline\\head.lua")
Include("\\script\\misc\\timeline\\timeline.lua")
Include("\\script\\misc\\timeline\\timelinelist.lua")

if not tbTimeLineManager then
	tbTimeLineManager = tbBaseClass:new()
	tbTimeLineManager.tbTimeEventTempletList = {}
	tbTimeLineManager.tbTimeLineList = {}
end

function tbTimeLineManager:AddTimeLine(strName, tbData)
	if (type(tbData) ~= "table" or type(strName) ~= "string" or 
		strName == "" or self.tbTimeLineList[strName] ~= nil) then
		return nil;
	end
	
	local tbBeginEventTemplet = nil;
	local tbEndEventTemplet = nil;
	
	if (type(tbData.tbTimeLineData) == "table") then
		if (type(tbData.tbTimeLineData.strBeginEventType) == "string") then
			tbBeginEventTemplet = self.tbTimeEventTempletList[tbData.tbTimeLineData.strBeginEventType];
		end
		if (type(tbData.tbTimeLineData.strEndEventType) == "string") then
			tbEndEventTemplet = self.tbTimeEventTempletList[tbData.tbTimeLineData.strEndEventType];
		end
	end
	
	-- 初始化timelinelist
	local tbTimeLineParam = {};
	
	if (type(tbTimeLineClass.tbData) == "table") then
		for varKey, varValue in tbTimeLineClass.tbData do
			tbTimeLineParam[varKey] = varValue;
		end
	end
	
	if (type(tbData.tbTimeLineData) == "table") then
		for varKey, varValue in tbData.tbTimeLineData do
			tbTimeLineParam[varKey] = varValue;
		end
	end
	
	local tbTL = tbTimeLineClass:new(clone(tbTimeLineParam));
	tbTL.strName = strName;
	
	--初始化TimeEvent
	local tbBeginEvent = nil;
	local tbEndEvent = nil;
	
	if (tbBeginEventTemplet ~= nil) then
		local tbBeginTimeEventParam = {};
		if (type(tbBeginEventTemplet.tbData) == "table") then
			for varKey, varValue in tbBeginEventTemplet.tbData do
				tbBeginTimeEventParam[varKey] = varValue;
			end
		end
		
		if (type(tbData.tbBeginEventData) == "table") then
			for varKey, varValue in tbData.tbBeginEventData do
				tbBeginTimeEventParam[varKey] = varValue;
			end
		end
		
		tbTL.tbBeginEvent = tbBeginEventTemplet:new(clone(tbBeginTimeEventParam));
	end
	
	if (tbEndEventTemplet ~= nil) then
		local tbEndTimeEventParam = {};
		if (type(tbEndEventTemplet.tbData) == "table") then
			for varKey, varValue in tbEndEventTemplet.tbData do
				tbEndTimeEventParam[varKey] = varValue;
			end
		end
		
		if (type(tbData.tbEndEventData) == "table") then
			for varKey, varValue in tbData.tbEndEventData do
				tbEndTimeEventParam[varKey] = varValue;
			end
		end
		
		tbTL.tbEndEvent = tbEndEventTemplet:new(clone(tbEndTimeEventParam));
	end
	
	-- 加载timeline
	if (type(tbTL.Load) == "function" and tbTL:Load() == 1) then
		self.tbTimeLineList[strName] = tbTL;
		return self.tbTimeLineList[strName];
	else
		return nil;
	end
	
	return nil
end

function tbTimeLineManager:GetTimeLine(strName)
	return self.tbTimeLineList[strName];
end

function tbTimeLineManager:DeleteTimeLine(strName)
	if (self.tbTimeLineList[strName] ~= nil) then
		self.tbTimeLineList[strName] = nil;
		return 1;
	end
	
	return 0;
end

function tbTimeLineManager:GetTimeLineCount()
	return getn(self.tbTimeLineList);
end

function tbTimeLineManager:RegEventTemplete(tbTimeEventTemplete)
	self.tbTimeEventTempletList[tbTimeEventTemplete.strType] = tbTimeEventTemplete;
end

function tbTimeLineManager:LoadAllTimeLine(tbList)
	if (tbList == nil or type(tbList) ~= "table") then
		return 0;
	end
	
	local nCount = 0;
	
	for i=1, getn(tbList) do
		if (self:AddTimeLine(tbList[i].strName, tbList[i]) ~= nil) then
			nCount = nCount + 1;
		else
			WriteLog(format("[TimeLine] Load %s failed!", tbList[i].strName or tbList[i].strType));
		end
	end
	
	return nCount;
end

function tbTimeLineManager:GM_LoadTimeLines()
	tbTimeLineManager:LoadAllTimeLine(tbTimeLineList);
end

function tbTimeLineManager:GM_GetOpenLeftDay(strName)
	local tbTL = tbTimeLineManager:GetTimeLine(strName);
	if (tbTL ~= nil) then
		Msg2Player(tbTL:GetOpenLeftDay())
	end
end

function tbTimeLineManager:GM_GetOpenDay(strName)
	local tbTL = tbTimeLineManager:GetTimeLine(strName);
	if (tbTL ~= nil) then
		Msg2Player(tbTL:GetOpenDay())
	end
end

function tbTimeLineManager:GM_GetOpenTime(strName)
	local tbTL = tbTimeLineManager:GetTimeLine(strName);
	if (tbTL ~= nil) then
		Msg2Player(tbTL:GetOpenTime())
	end
end

function tbTimeLineManager:GM_GetEndLeftDay(strName)
	local tbTL = tbTimeLineManager:GetTimeLine(strName);
	if (tbTL ~= nil) then
		Msg2Player(tbTL:GetEndLeftDay())
	end
end

function tbTimeLineManager:GM_GetEndDay(strName)
	local tbTL = tbTimeLineManager:GetTimeLine(strName);
	if (tbTL ~= nil) then
		Msg2Player(tbTL:GetEndDay())
	end
end

function tbTimeLineManager:GM_GetServerOpen()
	RemoteExc("\\script\\misc\\timeline\\serveropentimeevent.lua", "GetServerOpenTime", {},
			"\\script\\misc\\timeline\\timelinemanager.lua", "tbTimeLineManager:_GM_GetServerOpen", {});
end

function tbTimeLineManager:_GM_GetServerOpen(nTime)
	Msg2Player(tbTimeLineClass:ConvertTimeToTM(nTime))
end

function tbTimeLineManager:GM_SetServerOpen(nDate)
	RemoteExc("\\script\\misc\\timeline\\serveropentimeevent.lua", "SetServerOpenTime", {tbTimeLineClass:ConvertTMToTime(nDate)},
			"\\script\\misc\\timeline\\timelinemanager.lua", "tbTimeLineManager:GM_GetServerOpen", {});
end