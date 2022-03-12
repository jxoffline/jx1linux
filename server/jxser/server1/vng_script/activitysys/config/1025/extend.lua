Include("\\vng_script\\activitysys\\config\\1025\\variables.lua")
Include("\\vng_script\\activitysys\\config\\1025\\head.lua") --!!!!!
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\functionlib.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\vng_script\\activitysys\\config\\1025\\onlinedef.lua")
Include("\\script\\lib\\log.lua")

pActivity.nPak = curpack()


pActivity.TIME_ONLINE = 5*60 --5phut moi nhan duoc 1 tui qua


function pActivity:GetOnlineTime()
	local nNowTime = GetCurServerTime()
	local nOnlineTime = 0
	local nLastLogInTime = GetTask(tbAccOnlineTime.TSK_LAST_ONLINETIME)
	local nTodayTime = tbAccOnlineTime:ConvertTMToTime(tonumber(GetLocalDate("%Y%m%d")))
	if(nTodayTime > nLastLogInTime) then --qua ngay reset tich lòy time
		SetTask(self.TSK_SAVE_TIME, 0)
		SetTask(tbAccOnlineTime.TSK_LAST_ONLINETIME, GetCurServerTime())
		--print("-----GetOnlineTime Reset  TSK_SAVE_TIME: "..GetTask(self.TSK_SAVE_TIME))
	end
	--print("-----GetOnlineTime - nLastLogInTime 1: "..nLastLogInTime)
	--print("-----GetOnlineTime - nTodayTime 1: "..nTodayTime)
	if(nTodayTime <= nLastLogInTime) then
		nOnlineTime = GetTask(tbAccOnlineTime.TSK_SAVE_TIME)+ (nNowTime - nLastLogInTime)
		--print("-----GetOnlineTime - nOnlineTime 1: "..nOnlineTime)
	else
		nOnlineTime = nNowTime - nTodayTime
		--print("-----GetOnlineTime - nOnlineTime 2: "..nOnlineTime)
	end	
	return  nOnlineTime
end

function pActivity:GetAwardOnline()
	local nToTalTime= self:GetOnlineTime()
	--print("-----GetAwardOnline - nToTalTime: "..nToTalTime) 
	local nNumAward  =  floor(nToTalTime/self.TIME_ONLINE)	
	if nNumAward > 0 then
		local nNewTimeOnline = nToTalTime - nNumAward*self.TIME_ONLINE
		SetTask(tbAccOnlineTime.TSK_LAST_ONLINETIME, GetCurServerTime())
		SetTask(tbAccOnlineTime.TSK_SAVE_TIME,nNewTimeOnline)
		--print("-----GetAwardOnline - nNumAward: "..nNumAward)
		--print("-----GetAwardOnline - nNewTimeOnline: "..nNewTimeOnline)		
		local ItemTuiNL		= {szName="Tói Nguyªn LiÖu", tbProp={6,1,30266,1,0,0},nBindState=-2, nExpiredTime=DATE_END}
		PlayerFunLib:GetItem(ItemTuiNL,nNumAward,EVENT_LOG_TITLE,"NhanThuongOnlineTuiNL")
		return
	end
	return Talk(1,"","Thêi gian tÝch lòy ch­a ®ñ ®Ó nhËn th­ëng.")
end


function pActivity:ShowOnlineTime()
	local nToTalTime= self:GetOnlineTime()
	local nMin = floor(nToTalTime/60)
	local nSec = nToTalTime - nMin*60	
	Talk(1, "", format("Thêi gian Online trong ngµy lµ <color=yellow>%s<color> phót <color=yellow>%s<color> gi©y.",nMin,nSec))
end


