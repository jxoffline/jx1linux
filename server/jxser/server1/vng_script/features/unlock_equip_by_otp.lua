Include("\\script\\activitysys\\npcdailog.lua")
Include("\\script\\misc\\eventsys\\type\\player.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\vng_script\\features\\dispose_equip.lua")
Include("\\vng_script\\vng_lib\\extpoint.lua")

tbUnlockEqOpt = {}

tbUnlockEqOpt.TSK_LIFE_TIME_OTP = 2771
tbUnlockEqOpt.LIFE_TIME = 10*60 --10ph
tbUnlockEqOpt.EXTPOINT_OTP  =  {nID = 3, nBit = 14, nVer = 2} 
tbUnlockEqOpt.KEYLOG = "LOG_FEATURE_CTC"
function tbUnlockEqOpt:ShowUnlockOptUI()
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(tbUnlockEqOpt.EXTPOINT_OTP)
	if nCheckOTP ~= 1 then
		Talk(1,"","H·y kÝch ho¹t m· OPT chøc n¨ng më khãa trang bÞ nhanh tr­íc.")
		return
	end
	if tbUnlockEqOpt:OnUpdateStateOTP() ~= 1 then
		return
	end
	local strDesc = "H·y bá nh÷ng trang bÞ cÇn th¸o khãa vµo."	
	g_GiveItemUI("Th¸o khãa", strDesc, {self.DoUnlockEqByOtp, {self}}, nil, 1)
end

function tbUnlockEqOpt:DoUnlockEqByOtp(nCount)	
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(tbUnlockEqOpt.EXTPOINT_OTP)
	if nCheckOTP ~= 1 then
		Talk(1,"","H·y kÝch ho¹t m· OPT chøc n¨ng më khãa trang bÞ nhanh tr­íc.")
		return
	end
	--KiÓm tra ®iÒu kiÖn th¸o khãa
	for i=1, nCount do		
		local nItemIdx = GetGiveItemUnit(i)	
		if (nItemIdx <= 0) then
			return
		end
		local nCheck = self:check_StateEquip(nItemIdx)			
		if nCheck ~= 1 then
			Msg2Player("Cã trang bÞ kh«ng ®ñ ®iÒu kiÖn ®Ó th¸o khãa, h·y kiÓm tra l¹i.")
			return
		end
	end		
	--Th¸o khãa
	for i=1, nCount do		
		local nItemIdx = GetGiveItemUnit(i)	
		if (nItemIdx <= 0) then
			return
		end
		local nCheck = self:check_StateEquip(nItemIdx)			
		if nCheck ~= 1 then
			Msg2Player("Cã trang bÞ kh«ng ®ñ ®iÒu kiÖn ®Ó th¸o khãa, h·y kiÓm tra l¹i.")
			return
		end
		SetItemBindState(nItemIdx,0)
		SyncItem(nItemIdx)
		local szItemName = GetItemName(nItemIdx)
		Msg2Player(format("Më khãa trang bÞ: <color=yelow>%s<color> thµnh c«ng.",szItemName))
		tbLog:PlayerActionLog(self.KEYLOG.." UNLOCK EQUIP - "..szItemName)
	end	
	VngExtPointLib:SetBitValueByVersion(self.EXTPOINT_OTP, 0)	
	KickOutSelf()
end

function tbUnlockEqOpt:check_StateEquip(nItemIdx)
	
	local nBindState = GetItemBindState(nItemIdx)	
	
	if nBindState <= 0 and nBindState ~= -1  then	
		Talk(1,"",format("- Trang bÞ khãa vÜnh viÔn kh«ng thÓ më khãa.\n - Trang bÞ ®· khãa b¶o hiÓm hoÆc ®ang më khãa b¶o hiÓm míi cã thÓ më khãa."))
		return 0
	end
	--kiem tra trang bi xep chong
	if IsItemStackable(nItemIndex) == 1 then
		Talk(1,"","Trang bÞ xÕp chång kh«ng thÓ kh«ng thÓ më khãa")
		return 0
	end
	if (itemgenre == 7) then 
		Say("Trang bÞ h­ h¹i kh«ng thÓ më khãa")
		return	0
	end
	if IsMyItem(nItemIdx) ~= 1 then
		Talk(1,"","ThËt thµ míi lµ ®øc tÝnh tèt!!!")
		tbLog:PlayerActionLog(self.KEYLOG.." UNLOCK EQUIP - Nghi van hack -  item bo vao khong o trong hanh trang")
		return 0
	end
	return 1
end

function tbUnlockEqOpt:OnUpdateStateOTP()
	print("=====OnLogin/Logout tbUnlockEqOpt:OnUpdateStateOTP()=====")
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(self.EXTPOINT_OTP)
	--chua kich hoat ma OTP
	if nCheckOTP ~= 1 then		
		SetTask(self.TSK_LIFE_TIME_OTP,0)
		return 0
	end	
	local nCurTimeSv = GetCurServerTime()
	local nCurTimeOTP = GetTask(self.TSK_LIFE_TIME_OTP)
	
	if nCurTimeOTP == 0 then --ghi nhan thoi gian dau tien sau khi kich hoat OTP		
		SetTask(self.TSK_LIFE_TIME_OTP,nCurTimeSv)
		print("=====tbUnlockEqOpt:OnUpdateStateOTP() TSK_LIFE_TIME_OTP: ====="..GetTask(self.TSK_LIFE_TIME_OTP))
		return 1
	elseif (nCurTimeSv - nCurTimeOTP) >= self.LIFE_TIME then --het thoi gian ton tai 10ph
		Msg2Player(format("<color=yellow>Thêi gian hiÖu lùc cña m· OTP më khãa trang bÞ nhanh ®· hÕt.<color>")		)
		VngExtPointLib:SetBitValueByVersion(self.EXTPOINT_OTP, 0)
		SetTask(self.TSK_LIFE_TIME_OTP,0)
		print("=====tbUnlockEqOpt:OnUpdateStateOTP() TSK_LIFE_TIME_OTP: ====="..GetTask(self.TSK_LIFE_TIME_OTP))
		return 0
	end
	return 1
end

--Kiem tra OTP ton tai 10ph
function tbUnlockEqOpt:OnLogin(bExchangeIn)
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(tbUnlockEqOpt.EXTPOINT_OTP)
	if nCheckOTP ~= 1 then		
		return
	end	
	if(bExchangeIn == 1 or ST_GetOffliveState() == 1)then
		return
	end	
	self:OnUpdateStateOTP()
end
function tbUnlockEqOpt:OnLogout(bExchangeIn)
	local nCheckOTP = VngExtPointLib:GetBitValueByVersion(tbUnlockEqOpt.EXTPOINT_OTP)
	if nCheckOTP ~= 1 then		
		return
	end	
	if(bExchangeIn == 1 or ST_GetOffliveState() == 1)then
		return
	end	
	self:OnUpdateStateOTP()
end

EventSys:GetType("OnLogin"):Reg(0, tbUnlockEqOpt.OnLogin, tbUnlockEqOpt)
EventSys:GetType("OnLogout"):Reg(0, tbUnlockEqOpt.OnLogout, tbUnlockEqOpt)
