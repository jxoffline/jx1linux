Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

BonusOnlineSurvey2011 = {}

BonusOnlineSurvey2011.nEndDate = 20111207

BonusOnlineSurvey2011.EXTPOINT_BONUS_ATM = 3

BonusOnlineSurvey2011.BIT_AWARD = 11
 
BonusOnlineSurvey2011.BIT_GET_AWARD = 12


function BonusOnlineSurvey2011:GetAward()
	
	if (self:IsActive() ~= 1) then
		Talk(1,"","Ho¹t ®éng ®· kÕt thóc!")
		return
	end
	
	if (self:CheckAccount() ~=1) then
		Talk(1,"","§¹i hiÖp kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng!")
		return
	end

	if (GetExtPoint(self.EXTPOINT_BONUS_ATM) < 0) then
		Talk(1,"","§¹i hiÖp ch­a thÓ nhËn th­ëng lóc nµy,  xin h·y  liªn hÖ Bang Qu¶n TrÞ")
		return
	end
	
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_GET_AWARD) ~= 0 ) then
 		Talk(1,"","§¹i hiÖp ®· nhËn th­ëng råi")
 		return
 	end
	
	 if (tbExtPointLib:SetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_GET_AWARD, 1) ~= 1) then
	 	return
	 end
	 
	 local tbAward = {szName = "§iÓm kinh nghiÖm", nExp_tl = 100000000}
 	tbAwardTemplet:Give(tbAward, 1,{"BonusOnlineSurvey2011","NhanThuongBonusOnlineSurvey2011"})
end

function BonusOnlineSurvey2011:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate <= self.nEndDate) then
		return 1
	else
		return 0
	end
end

function BonusOnlineSurvey2011:CheckAccount()
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_BONUS_ATM, self.BIT_AWARD) ~= 1) then
 		return 0
	else
		return 1
	end
end

local pEventType = EventSys:GetType("AddNpcOption")
if (BonusOnlineSurvey2011:IsActive() ~= 0) then
	nId = pEventType:Reg("LÔ Quan", "NhËn th­ëng ch­¬ng tr×nh thu thËp ý kiÕn", BonusOnlineSurvey2011.GetAward,{BonusOnlineSurvey2011})
end	