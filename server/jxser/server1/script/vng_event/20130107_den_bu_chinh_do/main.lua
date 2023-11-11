-- ============================================

--§Òn bï gamer Chinh §å
--Created by DinhHQ - 20130107

-- ======================================================
Include("\\script\\vng_event\\20130107_den_bu_chinh_do\\translife_func.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\vng_event\\20130107_den_bu_chinh_do\\items_skills_award.lua")
function tbZhengtuCompensate:AddDialog()
	if not self:IsActive() then
		return
	end
	local pEventType = EventSys:GetType("AddNpcOption")
	nId = pEventType:Reg("ChiÕn T©m T«n Gi¶", "NhËn ®Òn bï Chinh §å", tbZhengtuCompensate.main,{tbZhengtuCompensate})
end

function tbZhengtuCompensate:main()
	if not self:IsActive() then
		Talk(1, "", "HiÖn t¹i ®· qu¸ thêi gian nhËn th­ëng, xin ®¹i hiÖp th«ng c¶m.")
		return
	end	
	local tbTemp = self.tbExtpointList
	if not self:Get_TL_AccType_By_BitTSK() and not tbZhengtuCompensate:Get_ItemSkill_AccType() and tbExtPointLib:GetBitValue(tbTemp[1].nExtPoint, tbTemp[1].nBit) == 0 and tbExtPointLib:GetBitValue(tbTemp[2].nExtPoint, tbTemp[2].nBit) == 0 then
		Talk(1, "", "Xin lçi, c¸c h¹ kh«ng ®ñ ®iÒu kiÖn nhËn th­ëng.")
		return
	end
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbMainDialog = DailogClass:new(szNpcName)	
	tbMainDialog:AddOptEntry("NhËn phÇn th­ëng trïng sinh", ZhTCompensate_Translife_Begin, {nil})
	tbMainDialog:AddOptEntry("NhËn ®¼ng cÊp trïng sinh 4", ZhTCompensate_Translife4_GetLevel, {nil})
	tbMainDialog:AddOptEntry("KiÓm tra sè lÇn trïng sinh", ZhTCompensate_Translife_Check, {nil})
	tbMainDialog:AddOptEntry("NhËn vËt phÈm vµ kü n¨ng", tbItemSkillAward.Skill90_SelectSkillMax, {tbItemSkillAward})
	tbMainDialog:AddOptEntry("KÝch ho¹t nhËn l¹i phÇn th­ëng ®Òn bï trang bÞ", tbZhengtuCompensate.ReUpdateBitTSKValue, {tbZhengtuCompensate})
	tbMainDialog.szTitleMsg = "Ta phô tr¸ch trao phÇn th­ëng ®Òn bï cho c¸c nh©n sü Chinh §å, nÕu ng­¬i tháa ®iÒu kiÖn h·y mau mau nhËn th­ëng"
	tbMainDialog:Show()
end

function tbZhengtuCompensate:ReUpdateBitTSKValue()
	if tbVNG_BitTask_Lib:getBitTask(self.tbBitTSKGetItem) == 1 then
		Talk(1, "", "Nh©n vËt ®· nhËn th­ëng råi.")
		return
	end
	if tbExtPointLib:GetBitValue(self.tbExtpointList[2].nExtPoint, self.tbExtpointList[2].nBit) == 1 then
		self:UpdateBitTSKValue()
		tbLog:PlayerActionLog("DenBuChinhDo", "KichHoatLaiPhanThuongDenBuTrangBi")	
	end
end

if tbZhengtuCompensate:IsActive() then
	tbZhengtuCompensate:AddDialog()
end