Include("\\script\\event\\other\\caipiao\\head_gs.lua")

function tbCaiPiao:ShowAllInfo(tbNumberList, tbNumberNameList)
	for nNumber, nCount in tbNumberList do
		local tbName	= tbNumberNameList[nNumber]
		local szMsg		= ""
		for k, v in tbName do
			if v then
				szMsg = szMsg.." "..k
			end
		end
		szMsg = format("Sè <color=yellow>%s<color> ®· chän <color=yellow>%s<color> lÇn, ng­êi chän <color=green>%s<color>", nNumber, nCount, szMsg)
		Msg2Player(szMsg)
	end
end

function tbCaiPiao:ApplyStartRound(nWeekDay)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nWeekDay)	
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_StartRound", handle)
	OB_Release(handle)
end

function tbCaiPiao:SetStage(nStage)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nStage)	
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_SetStage", handle)
	OB_Release(handle)
end

function tbCaiPiao:ApplyGetInfo(nWeekDay)
	local handle = OB_Create()
	ObjBuffer:PushObject(handle, nWeekDay)
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_ApplyGetInfo", handle, "tbCaiPiao_ApplyGetInfo_CallBack")
	OB_Release(handle)
end

function tbCaiPiao:AutoTest(nWeekDay, nOnlyWager)
	local handle = OB_Create()
	nWeekDay = nWeekDay or 0
	nOnlyWager = nOnlyWager or 0
	ObjBuffer:PushObject(handle, nWeekDay)
	ObjBuffer:PushObject(handle, nOnlyWager)
	self:RemoteExecute(PlayerIndex, "tbCaiPiao_AutoTest", handle)
	OB_Release(handle)
end

function tbCaiPiao:GM(nWeekDay)
	local szTitle = "ChØ lÖnh"	
	nWeekDay = nWeekDay or 15
	local tbOpt = 
	{
		{"×Ô¶¯²âÊÔ", self.AutoTest, {self}},
		{"×Ô¶¯²âÊÔÄ³Ìì", self.AutoTest, {self, nWeekDay}},
		{"×Ô¶¯¾ºÍ¶Ä³Ìì", self.AutoTest, {self, nWeekDay, 1}},
		{"Xem th«ng tin chän sè", self.ApplyGetInfo, {self, nWeekDay} },
		{"¾ºÍ¶", self.OpenInputUI, {self}},
		{"NhËn l·nh phÇn th­ëng", self.ApplyGetAward, {self, nWeekDay}},
		{"Xem kÕt qu¶", self.QueryResult, {self, nWeekDay}},
		{"ÔÊÐíÍ¶×¢", self.SetStage, {self, 1}},
		{"B¾t ®Çu tÝnh tróng th­ëng", self.SetStage, {self, 2}},
		
		
		{"ÖØÔØ½Å±¾head_gs", LoadScript, {[[\script\event\other\caipiao\head_gs.lua]]}},
		{"ÖØÔØ½Å±¾GM", LoadScript, {[[\script\event\other\caipiao\testcomand.lua]]}},
		{"KÕt thóc ®èi tho¹i"},
	}
	
	
	CreateNewSayEx(szTitle, tbOpt)
end

--relay »Øµ÷
local _CheckPlayer = function(nPlayerIndex)
	if nPlayerIndex <= 0 then
		return 
	end
	local szOldName = tbCaiPiao.tbTempCallBack[nPlayerIndex]
	local szCurName = lib:DoFunByPlayer(nPlayerIndex, GetName)
	if szOldName ~= nil and szCurName ~= nil and szOldName == szCurName then
		tbCaiPiao.tbTempCallBack[nPlayerIndex] = nil
		return 1
	end
end

function tbCaiPiao_ApplyGetInfo_CallBack(nParam, ResultHandle)

	if %_CheckPlayer(nParam) ~= 1 then
		return 
	end
	local szMsg = ObjBuffer:PopObject(ResultHandle)
	
	lib:DoFunByPlayer(nParam, Msg2Player, szMsg)
end

