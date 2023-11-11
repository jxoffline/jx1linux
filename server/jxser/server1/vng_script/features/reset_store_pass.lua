Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\features\\dispose_equip.lua")
--mo khoa trang bi bang ma OTP
Include("\\vng_script\\features\\unlock_equip_by_otp.lua")

ResetStorePass = {}

ResetStorePass.TSK_TIME_ASSIGN = 2784

ResetStorePass.WAIT_DATE = 3

ResetStorePass.TBMONTH =  {31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31}

ResetStorePass.LOG_TITLE = "LOG_FEATURE_CTC"

ResetStorePass.ITEM_REQUIE = {szName="Ph¸ khãa c«ng cô",tbProp={6,1,30591,1,0,0},}

function main()
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "Trªn ®êi nµy kh«ng g× ta kh«ng lµm ®­îc, ng­¬i cã khã kh¨n g× t×m ta."		
	tbDailog:AddOptEntry("Gióp ta vÊn ®Ò vÒ r­¬ng chøa ®å", ResetStorePass.ShowDialog, {ResetStorePass} )
	tbDailog:AddOptEntry("Gióp ta vÊn ®Ò hñy trang bÞ khãa", DisposeEquip.ShowDisposeUI, {DisposeEquip} )
	
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(tbUnlockEqOpt.EXTPOINT_OTP)
	if nCheckOTP == 1 then	
		tbDailog:AddOptEntry("Më khãa nhanh trang bÞ", tbUnlockEqOpt.ShowUnlockOptUI, {tbUnlockEqOpt} )
	end
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName, tbDailog, nNpcIndex)	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex)
	tbDailog:Show()
end

function ResetStorePass:ShowDialog()
	local tbOpt = {}
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	self:CheckExpiredDate()
	
	if (GetTask(self.TSK_TIME_ASSIGN) <= 0) then
		tinsert(tbOpt ,"§¨ng ký hñy mËt khÈu r­¬ng/#ResetStorePass:AssignResetStorePass()")
	end
	if (GetTask(self.TSK_TIME_ASSIGN) > 0) then
		if (self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN),  self.WAIT_DATE) == nCurDate) then
			tinsert(tbOpt ,"X¸c nhËn hñy mËt khÈu r­¬ng/#ResetStorePass:ConfirmResetStorePass()")
		end	
		tinsert(tbOpt ,"Xem thêi gian hoµn thµnh hñy mËt khÈu r­¬ng/#ResetStorePass:ShowTimeResetStorePass()")
		tinsert(tbOpt, "Bá ®¨ng ký hñy mËt khÈu r­¬ng/#ResetStorePass:CancelResetStorePass()")
	end
	tinsert(tbOpt, "Tho¸t/nothing")
	Say("§¹i hiÖp t×m ta cã viÖc g×?", getn(tbOpt), tbOpt)	
end

function ResetStorePass:AssignResetStorePass()
	local tbProp = self.ITEM_REQUIE.tbProp
	if (ConsumeEquiproomItem(1, tbProp[1], tbProp[2], tbProp[3], tbProp[4]) ~= 1) then			
		return Talk(1,"",format("Muèn ta më kho¸, cÇn ®­a cho ta 1 vËt phÈm<color=yellow> Ph¸ khãa c«ng cô<color>. Ng­¬i kh«ng cã c¸i ta cÇn, h·y ®i kiÕm råi vÒ gÆp ta."))
	end
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	SetTask(self.TSK_TIME_ASSIGN, nCurDate)
	self:ShowTimeResetStorePass()
	tbLog:PlayerActionLog(self.LOG_TITLE.."- Reset Pass R­¬ng - §¨ng Ký")
	Msg2Player("§¨ng ký më khãa mËt khÈu thµnh c«ng, chó ý 3 ngµy sau x¸c nhËn më khãa.")	
end

function ResetStorePass:CancelResetStorePass()
	SetTask(self.TSK_TIME_ASSIGN, 0)
	Msg2Player("Bá ®¨ng ký hñy mËt khÈu r­¬ng thµnh c«ng!")
	tbLog:PlayerActionLog(self.LOG_TITLE.."- Reset Pass R­¬ng - Hñy §¨ng Ký")
end

function ResetStorePass:ShowTimeResetStorePass()
	local nDate =  self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN),  self.WAIT_DATE)
	local szDate = mod(nDate, 100) .. "-" .. mod(floor(nDate/100), 100) .. "-" .. floor(nDate/10000)
	Talk(1, "", "<color=yellow>§· d¨ng ký më mËt khÈu r­¬ng.<color>\nMËt khÈu r­¬ng sÏ ®­îc hñy vµo ngµy <color=yellow>" .. szDate  .. "<color>\nNÕu sau 24h ngµy <color=yellow>" .. szDate .. " <color>®¹i hiÖp kh«ng x¸c nhËn hñy mËt khÈu r­¬ng th× viÖc ®¨ng ký lÇn nµy sÏ bÞ hñy bá!")
	return
end

function ResetStorePass:ConfirmResetStorePass()
	GMCancleBoxPassword()
	Msg2Player("§· xãa bá mËt khÈu r­¬ng thµnh c«ng! Vui lßng ®Æt l¹i mËt khÈu míi ®Ó ®¶m b¶o tµi s¶n.")
	SetTask(self.TSK_TIME_ASSIGN, 0)
	tbLog:PlayerActionLog(self.LOG_TITLE.."- Reset Pass R­¬ng - Thµnh C«ng hñy mËt khÈu R­¬ng")
end

function ResetStorePass:CheckExpiredDate()
	if (GetTask(self.TSK_TIME_ASSIGN) <= 0) then
		return
	end
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if (nCurDate == self:GetNextDate(GetTask(self.TSK_TIME_ASSIGN),  self.WAIT_DATE + 1)) then
		SetTask(self.TSK_TIME_ASSIGN, 0)
		Msg2Player("Ngµy x¸c nhËn hñy mËt khÈu r­¬ng ®· qu¸ h¹n, xin h·y ®¨ng ký l¹i!")
	end
end

function ResetStorePass:AnnounceResetStorePassDate()
	self:CheckExpiredDate()
	if (GetTask(self.TSK_TIME_ASSIGN) > 0) then
		self:ShowTimeResetStorePass()
	end
end

function ResetStorePass:GetNextDate(oldday, num)
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
