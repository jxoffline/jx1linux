

Include("\\script\\lib\\string.lua")
IncludeLib("SETTING")
IncludeLib("FILESYS")
G_ActivityAward = {}

lib = {}

function lib:Split(str,splitor)
	if(splitor==nil) then
		splitor=","
	end
	local strArray={}
	local strStart=1
	local splitorLen = strlen(splitor)
	local index=strfind(str,splitor,strStart)
	if(index==nil) then
		strArray[1]=str
		return strArray
	end
	local i=1
	while index do
		strArray[i]=strsub(str,strStart,index-1)
		i=i+1
		strStart=index+splitorLen
		index = strfind(str,splitor,strStart)
	end
	strArray[i]=strsub(str,strStart,strlen(str))
	return strArray
end

function lib:OptionFunction(nValue1, nValue2, szOption)
	return dostring("return "..nValue1..szOption..nValue2)
end

function lib:ParseAward(szAwardMsg)
	
	if type(szAwardMsg) == "table" then
		return szAwardMsg
	end
	szAwardMsg = gsub(szAwardMsg, "<enter>", "\n")
	szAwardMsg = gsub(szAwardMsg, "<tab>", "\t")
	
	return dostring(szAwardMsg)
end

function lib:WriteLog(szEventName, szAction, szItemName, szItemCode)
	local event_name = szEventName or ""
	local action = szAction
	local quantity = szQuantity or 1
	local item_name = szItemName
	local item_code = szItemCode
	local tong_name = GetTongName()
	local bug_desc =  ""
	local string_1 = ""
	local string_2 = ""
	local string_3 = ""
	if quantity == "" then
		quantity = 1
	end
	local strLogs = "["..event_name.."]".."\t"..GetAccount().."\t"..GetName().."\t"..action.."\t"..quantity.."\t"..item_name.."\t"..item_code.."\t"..tong_name.."\t"..bug_desc.."\t"..string_1.."\t"..string_2.."\t"..string_3;	
	WriteLog(strLogs)
end

function lib:ParseAwardTable(nAwardTableId, nExpTaskId, szOption)
	if not G_ActivityAward[nAwardTableId] then		
		local tbAward = {}
		local szPath = "\\settings\\activitysys\\awardtable\\"..nAwardTableId..".txt"
		if TabFile_Load(szPath, szPath) == 0 then
			WriteLog(format("Load %s is fail", szPath))

			return 0;
		end
		local nTableRowCount = TabFile_GetRowCount(szPath)
		for nRow=1, nTableRowCount do
			if tonumber(TabFile_GetCell(szPath, nRow, "TableId")) == nAwardTableId then
				local szLuaBuff = TabFile_GetCell(szPath, nRow, "LuaBuff")
				local ItemCount = tonumber(TabFile_GetCell(szPath, nRow, "Count"))
				local ItemRate = tonumber(TabFile_GetCell(szPath, nRow, "Rate"))
				local szItemName = TabFile_GetCell(szPath, nRow, "AwardName")
				local szNews = TabFile_GetCell(szPath, nRow, "News")
				szLuaBuff = gsub(szLuaBuff, "\\\"", "<DoubleQuote>")
				szLuaBuff = gsub(szLuaBuff, "\"", "")
				szLuaBuff = gsub(szLuaBuff, "<DoubleQuote>", "\"")
				if not strfind(szLuaBuff, "return") then
					szLuaBuff = "return "..szLuaBuff
				end
				
				local tbItem = self:ParseAward(szLuaBuff)
				
				
				tbItem.szNews = szNews
				
				tbItem.nCount = ItemCount
				if ItemRate ~= 100 then
					tbItem.nRate = ItemRate
				end
				tbItem.szName = szItemName
				if tbItem.nExp and nExpTaskId and nExpTaskId ~= ""  then
					if (szOption) then
						local pExpValue = format(szOption, tbItem.nExp * tbItem.nCount)
						pExpValue = self:NumberParamTrans(pExpValue)
						local pExpFun = function ()
							PlayerFunLib:AddTask(%nExpTaskId, %pExpValue)
						end
					end
					
					local tbExp = {tbItem, {pFun = pExpFun}}
					tbExp.nRate = tbItem.nRate
					tbItem.nRate = nil
					tinsert(tbAward, tbExp)	
				else
					tinsert(tbAward, tbItem)	
				end
				
			end
		end
		G_ActivityAward[nAwardTableId] = tbAward
	end
	return G_ActivityAward[nAwardTableId]
end


function lib:CheckBit(pValue, nBit, nExpectedValue, szFailMsg)
	local nValue = pValue
	if type(pValue) == "string" then
		local pf = FunctionClass:new(pValue)
		nValue = pf:exec()
	elseif type(pValue) == "number" then
		nValue = pValue
	else
		Talk(1, "", "have a error")
		return 
	end
	
	if GetBit(nValue, nBit) == nExpectedValue then
		return 1
	else
		lib:ShowMessages(szFailMsg)
	end	
	
end

function lib:SetBit(pValue, nBit, nExpectedValue, szFailMsg)
	local nValue = pValue
	if type(pValue) == "string" then
		
		local pf = FunctionClass:new(pValue)
		nValue = pf:exec()
	elseif type(pValue) == "number" then
		nValue = pValue
	else
		Talk(1, "", "have a error")
		return 
	end
	
	return SetBit(nValue, nBit, nExpectedValue)	
end


function lib:CheckInList(szList, Target)
	local tbList = split(szList, ",")
	
	for i=1, getn(tbList) do
		if strfind(tbList[i], "-") then
			local tbSubList = split(tbList[i], "-")
			tbSubList[1] = tonumber(tbSubList[1])
			tbSubList[2] = tonumber(tbSubList[2])
			if tbSubList[1] <= Target and Target <= tbSubList[2] then
				return 1
			end
			
		else
			if type(Target) == "number" then
				tbList[i] = tonumber(tbList[i])
			end
			if tbList[i] == Target then
				return 1
			end	
		end
	end
	
	return nil
end

function lib:GetListTable(szList)
	local tbList = split(szList, ",")
	local tbResult = {}
	for i=1, getn(tbList) do
		if strfind(tbList[i], "-") then
			local tbSubList = split(tbList[i], "-")
			tbSubList[1] = tonumber(tbSubList[1])
			tbSubList[2] = tonumber(tbSubList[2])
			for j=tbSubList[1], tbSubList[2] do
				tinsert(tbResult, j)
			end
		else
			
			tbList[i] = tonumber(tbList[i]) or tbList[i]
			tinsert(tbResult, tbList[i])
		end
	end
	
	return tbResult
end

function lib:NumberParamTrans(pParam)
	
	if type(pParam) == "number" then
		return pParam
	elseif type(pParam) == "string" then
		return dostring("return "..pParam)
	end
end

function lib:StringParamTrans(pParam)
	local si,sn = 1,1
	local szParam = nil
	si, sn, szParam = strfind(pParam, "<lua (.-)/>")
	while( szParam ) do
		szValue = dostring("return ".. szParam)
		pParam = format("%s%s%s",strsub(pParam, 1, si-1),tostring(szValue),strsub(pParam, sn+1))
		si, sn, szParam = strfind(pParam, "<lua (.-)/>", si)
	end
	return pParam
	
end

function lib:ShowMessage(szMsg)
	if szMsg == nil or szMsg == "nomsg" or szMsg == ""then
		return
	end
	szMsg = self:StringParamTrans(szMsg)
	if strfind(szMsg, "<msg>") then
		local szFailMsg = gsub(szMsg, "<msg>", "")
		Msg2Player(szFailMsg)
	else
		Talk(1, "", szMsg)
	end
end


function lib:ShuffleTable(tb, nStart, nEnd)
	
	for i=nStart, nEnd - nStart do
		
		local j = random(i, nEnd)
		
		tb[i], tb[j] = tb[j], tb[i]
		
	end
	return tb
end

function lib:CheckDay(nStartDate, nEndDate, szMessage)
	
	local nCruDate = tonumber(GetLocalDate("%Y%m%d"));
	if (nStartDate <= nCruDate and nCruDate < nEndDate) then
		return 1;
	end
	
	lib:ShowMessage(szMessage);
end

function lib:CheckTime(tbAllowTime, szMessage)
	
	local nCruTime = tonumber(GetLocalDate("%H%M%S"));
	
	for i = 1,getn(tbAllowTime) do 
		if (tbAllowTime[i][1] <= nCruTime and nCruTime < tbAllowTime[i][2]) then
			return 1;
		end
	end

	lib:ShowMessage(szMessage);
end


function lib:CheckTimeAndWeekDay(nStartTime, nEndTime, szWeekDayList, szMessage)
	local nCurTime = tonumber(GetLocalDate("%H%M"));
	local nCurWeekDay = tonumber(GetLocalDate("%w"));
	
	if (nStartTime <= nCurTime and nCurTime <= nEndTime and self:CheckInList(szWeekDayList, nCurWeekDay)) then
		return 1
	end
	
	if (szMessage ~= nil and szMessage ~= "") then
		lib:ShowMessage(szMessage);
	end
end

function lib:CopyTB1(tb)
	local tbCopy	= {};
	for k, v in tb do
		tbCopy[k]	= v;
	end;
	return tbCopy;
end;

function lib:Pack(...)
	return arg
end


function lib:DoFunByPlayer(nPlayerIndex, fun, ...)	
	local nOldPlayer = PlayerIndex;
	PlayerIndex = nPlayerIndex
	local re = self:Pack(call(fun, arg));
	PlayerIndex = nOldPlayer;
	return unpack(re)
end


--
function lib:DoFunInWorld(nSubWorld, fun, ...)
	local nOldSubWorld = SubWorld;
	SubWorld = nSubWorld
	local re = self:Pack(call(fun, arg));
	SubWorld = nOldSubWorld;
	return unpack(re)
end

function lib:Include(szFile)
	Include(szFile)
	return 1
end

function lib:DoFunByTeam(nPlayerIndex, fun, ...)
	
	local nTeamSize = self:DoFunByPlayer(nPlayerIndex, GetTeamSize)
	if nTeamSize > 0 then
		for i=1, nTeamSize do
			local nTeamPlayerIndex = self:DoFunByPlayer(nPlayerIndex, GetTeamMember,i)
			self:DoFunByPlayer(nTeamPlayerIndex, fun, unpack(arg))
		end
	else
		self:DoFunByPlayer(nPlayerIndex, fun, unpack(arg))
	end
end
