

Include("\\script\\activitysys\\ladderfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\dailogsys\\dailogsay.lua")
DailogClass = {}


function DailogClass:new(szNpcName)
	local tb = {}
	for k, v in self do 
		tb[k] = v
	end
	tb:_init(szNpcName)
	return tb
end

function DailogClass:_init(szNpcName)
	self.szNpcName = szNpcName
	self.tbOptionList = {}
	self.szTitleMsg = "<npc>Chµo mõng b¹n ®Õn víi <color=yellow>Vâ L©m TruyÒn Kú Offline<color=yellow><enter>- <color=Red>https://fb.com/groups/volamquan <color><enter>- Edit tæng hîp By <color=Green>Eurofun<color>"
	self.szPreDailogName = ""
end



function DailogClass:TransTitleMsg(nPlayerIndex)
	
	local szTitleMsg = self.szTitleMsg
	if nPlayerIndex > 0 then
		szTitleMsg = lib:StringParamTrans(szTitleMsg)
	end

	return szTitleMsg
end

function DailogClass:GetDailogOpt(nCurDate)
	local tbOpt = {}
	for key = 1, getn(self.tbOptionList) do
		tbDialogOpt = self.tbOptionList[key]
		
		if tbDialogOpt and key ~= "n" then
--			if tbDialogOpt.DateRange:CheckDate(nCurDate) then
--				
--				local _,_, nMapIndex = GetPos()
--				local nMapId = SubWorldIdx2ID(nMapIndex)
--				if tbDialogOpt.pLimitFun ~= nil and tbDialogOpt.pLimitFun() == 1 then
--					
					
					tinsert(tbOpt, {tbDialogOpt.szMsg, tbDialogOpt.pCallBack, tbDialogOpt.tbCallBackParam})
--					
--				elseif tbDialogOpt.pLimitFun == nil and (tbDialogOpt.szMapList == nil or tbDialogOpt.szMapList == "" or lib:CheckInList(tbDialogOpt.szMapList, nMapId)) then
--					
--					tinsert(tbOpt, {tbDialogOpt.szMsg, tbDialogOpt.pCallBack, tbDialogOpt.tbCallBackParam})
--				end
--			end
		end
	end
	
	if self.pPreDailog then
		
		tinsert(tbOpt, {"Trë vÒ", self.pPreDailog.Show, {self.pPreDailog}})
	end
	tinsert(tbOpt, {"KÕt thóc ®èi tho¹i"})
	return tbOpt
end

function DailogClass:Show()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local tbOpt = self:GetDailogOpt(nCurDate)
	
	CreateNewSayEx(self:TransTitleMsg(PlayerIndex), tbOpt)
end


function DailogClass:AddOptEntry(szMsg, pFun, tbParam)
	local Opt = {}
	Opt.szMsg = szMsg
	Opt.pCallBack = pFun
	Opt.tbCallBackParam = tbParam
	Opt.pLimitFun = pLimitFun
	self:AddOpt(Opt)
end

function DailogClass:AddOpt(tbOpt)
	
	if not self:IsOptExist(tbOpt) then
		tbOpt.pDailog = self
		tinsert(self.tbOptionList, tbOpt)
	end
end

function DailogClass:InsertOpt(tbOpt, nIdx)
	
	if not self:IsOptExist(tbOpt) then
		tbOpt.pDailog = self
		tinsert(self.tbOptionList, nIdx, tbOpt)
	end
end


function DailogClass:IsOptExist(tbOpt)
	for i, tbOptionList in self.tbOptionList do
		
		if i ~= "n" and tbOptionList and tbOptionList.szMsg == tbOpt.szMsg then
			return 1
		end
	end
end

