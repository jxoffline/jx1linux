Include("\\script\\vng_lib\\extpoint.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

DenBuPQCH2011 = {}

DenBuPQCH2011.nEndDate = 20111023

DenBuPQCH2011.EXTPOINT_CHECK_GET_AWARD = 5
 
DenBuPQCH2011.BIT_GET_AWARD = 1

DenBuPQCH2011.EXTPOINT_AWARD_COUNT = 6


function DenBuPQCH2011:GetAward()
	local nCountPQCH = GetExtPoint(self.EXTPOINT_AWARD_COUNT)
	
	if (GetExtPoint(self.EXTPOINT_CHECK_GET_AWARD) < 0) then
		Talk(1,"","§¹i hiÖp ch­a thÓ nhËn th­ëng lóc nµy,  xin h·y  liªn hÖ Bang Qu¶n TrÞ")
		return
	end
	
	if (nCountPQCH < 1) then
		Talk(1,"","§¹i hiÖp kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng!")
		return
	end
	 
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_CHECK_GET_AWARD, self.BIT_GET_AWARD) ~= 1 ) then
 		Talk(1,"","§¹i hiÖp ®· nhËn th­ëng råi")
 		return
 	end
 	
	if (CalcFreeItemCellCount() < 5 ) then
		Talk(1, "", "Hµnh trang §¹i hiÖp kh«ng ®ñ 5 « trèng!")
		return
	end
	
	 if (tbExtPointLib:SetBitValue(self.EXTPOINT_CHECK_GET_AWARD, self.BIT_GET_AWARD, 0) ~= 1) then
	 	return
	 end
	 local tbAward = {szName = "Tµng R­¬ng", tbProp = {6,1,30145,1,0,0}, nCount = 1, nBindState = -2, nExpiredTime = 43200, tbParam = {nCountPQCH}}
 	tbAwardTemplet:Give(tbAward, 1,{"DenBuPQCH2011",format("NhanThuongDenBu%dPQCH",nCountPQCH)})
end

function DenBuPQCH2011:IsActive()
	local nCurDate = tonumber(date("%Y%m%d"))
	if (nCurDate <= self.nEndDate) then
		return 1
	else
		return 0
	end
end

function DenBuPQCH2011:CheckAccount()
	 if (tbExtPointLib:GetBitValue(self.EXTPOINT_CHECK_GET_AWARD, self.BIT_GET_AWARD) ~= 1 or GetExtPoint(self.EXTPOINT_AWARD_COUNT) <= 0) then
 		return 0
	else
		return 1
	end
end
