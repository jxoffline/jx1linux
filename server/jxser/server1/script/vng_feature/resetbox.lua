
ResetBox = {}

ResetBox.TSK_TIME_ASSIGN = 2752

ResetBox.WAIT_DATE = 7

ResetBox.TBMONTH =  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}

function ResetBox:ShowDialog()
	local tbOpt = {}
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	self:CheckExpiredDate()
	
	if (GetTask(self.TSK_TIME_ASSIGN) <= 0) then
		tinsert(tbOpt ,"§¨ng ký xãa pass r­¬ng/#ResetBox:AssignResetBox()")
	end
	if (GetTask(self.TSK_TIME_ASSIGN) > 0) then
		if (self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7) == nCurDate) then
			tinsert(tbOpt ,"X¸c nhËn xãa pass r­¬ng/#ResetBox:ConfirmResetBox()")
		end	
		tinsert(tbOpt ,"Xem thêi gian hoµn thµnh xãa pass r­¬ng/#ResetBox:ShowTimeResetBox()")
		tinsert(tbOpt, "Hñy xãa pass r­¬ng/#ResetBox:CancelResetBox()")
	end
	tinsert(tbOpt, "Tho¸t/nothing")
	Say("§¹i hiÖp t×m ta cã viÖc g×?", getn(tbOpt), tbOpt)	
end

function ResetBox:AssignResetBox()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	SetTask(self.TSK_TIME_ASSIGN, nCurDate)
	local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7)
	local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
	Talk(1, "", "Pass r­¬ng sÏ ®­îc xãa vµo ngµy <color=yellow>" .. szDate  .. "<color>\nNÕu sau 24h ngµy <color=yellow>" .. szDate .. " <color>®¹i hiÖp kh«ng x¸c nhËn th× ®¨ng ký xo¸ pass r­¬ng sÏ bÞ hñy bá!")
	self:WriteLogResetBox("Reset Pass R­¬ng - §¨ng Ký")
end

function ResetBox:CancelResetBox()
	SetTask(self.TSK_TIME_ASSIGN, 0)
	Msg2Player("Hñy bá xãa pass r­¬ng thµnh c«ng!")
	self:WriteLogResetBox("Reset Pass R­¬ng - Hñy §¨ng Ký")
end

function ResetBox:ShowTimeResetBox()
	local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7)
	local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
	Talk(1, "", "Pass r­¬ng sÏ ®­îc xãa vµo ngµy <color=yellow>" .. szDate  .. "<color>\nNÕu sau 24h ngµy <color=yellow>" .. szDate .. " <color>®¹i hiÖp kh«ng x¸c nhËn th× ®¨ng ký xo¸ pass r­¬ng sÏ bÞ hñy bá!")
end

function ResetBox:ConfirmResetBox()
	GMCancleBoxPassword()
	Msg2Player("§· më pass r­¬ng thµnh c«ng!")
	SetTask(self.TSK_TIME_ASSIGN, 0)
	self:WriteLogResetBox("Reset Pass R­¬ng - Thµnh C«ng Xãa Pass R­¬ng")
end

function ResetBox:CheckExpiredDate()
	if (GetTask(self.TSK_TIME_ASSIGN) <= 0) then
		return
	end
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate == self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 8)) then
		SetTask(self.TSK_TIME_ASSIGN, 0)
		Msg2Player("Ngµy x¸c nhËn xo¸ pass r­¬ng ®· qu¸ h¹n, xin h·y ®¨ng ký l¹i!")
	end
end

function ResetBox:AnnounceResetBoxDate()
	self:CheckExpiredDate()
	if (GetTask(self.TSK_TIME_ASSIGN) > 0) then
		local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN), 7)
		local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
		Talk(1, "", "Pass r­¬ng sÏ ®­îc xãa vµo ngµy <color=yellow>" .. szDate  .. "<color>\nNÕu sau 24h ngµy <color=yellow>" .. szDate .. " <color>®¹i hiÖp kh«ng x¸c nhËn th× ®¨ng ký xo¸ pass r­¬ng sÏ bÞ hñy bá!")
	end
end

function ResetBox:GetNextDate(oldday, num)
	local nDay = tonumber(oldday)
	local nYear = floor(nDay / 10000)
	local nMonth = floor((nDay - nYear * 10000) / 100)
	nDay = nDay - nYear * 10000 - nMonth * 100 
	nDay = nDay + num
	while (nDay > self.TBMONTH[nMonth]) do
		nDay = nDay - self.TBMONTH[nMonth]
		if (nMonth == 12) then
			nMonth = 1
			nYear = nYear + 1
		else
			nMonth = nMonth + 1
		end
	end
	return (nYear * 10000 + nMonth * 100 + nDay)
end

function nothing()

end

function ResetBox:WriteLogResetBox(szLogTitle)
	WriteLog(date("%Y%m%d %H%M%S").."\t".. GetAccount().."\t"..GetName().."\t".. szLogTitle)
end