Include("\\script\\vng_event\\traogiai\\vlmc2011\\vlmc2011_globalvar.lua")
Include("\\script\\vng_lib\\extpoint.lua")
IncludeLib("TITLE")
Include("\\script\\lib\\log.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")

function tbVLMC2011_Tittle:AddDialog(tbDialog)
	if self:IsActive() ~= 1 then
		return
	end
	tbDialog:AddOptEntry("NhËn vßng hµo quang Vâ L©m Minh Chñ", tbVLMC2011_Tittle.ShowDialog, {tbVLMC2011_Tittle})
end

function tbVLMC2011_Tittle:ShowDialog()
	local strTittle = "Ta phô tr¸ch trao th­ëng vßng hµo quang Vâ L©m Minh Chñ vµ ThËp ®¹i cao thñ, ng­¬i t×m ta cã viÖc g×?"
	Describe(strTittle, 2, "Ta muèn nhËn th­ëng/#tbVLMC2011_Tittle:GetTittle()", "§ãng/OnCancel")
end

function tbVLMC2011_Tittle:IsActive()
	local now = tonumber(GetLocalDate("%Y%m%d"));
	if (now >= self.nEND_DATE or now < self.nSTART_DATE) then
		return 0;
	end
	local strPlayerAccount = GetAccount()
	if not self.tbAccount[strPlayerAccount] then		
		return 0;
	end
	if tbExtPointLib:GetBitValue(self.nEXTPOINT_ID, self.nEXTPOINT_BIT) == 1 and tbVNG_BitTask_Lib:getBitTask(self.tbBitTSK_Limit_Check) == 0  then
		return 0;
	end
	return 1;
end

function tbVLMC2011_Tittle:GetTittle()	
	if (tbExtPointLib:GetBitValue(self.nEXTPOINT_ID, self.nEXTPOINT_BIT) == 1) and tbVNG_BitTask_Lib:getBitTask(self.tbBitTSK_Limit_Check) == 0 then		
		return
	end
	local nTittleType = self.tbAccount[GetAccount()]
	if nTittleType ~= 1 and nTittleType ~= 2 then
		return
	end
	if tbExtPointLib:GetBitValue(self.nEXTPOINT_ID, self.nEXTPOINT_BIT) == 0 then
		if (tbExtPointLib:SetBitValue(self.nEXTPOINT_ID, self.nEXTPOINT_BIT, 1) ~= 1)then
			return
		end
		tbVNG_BitTask_Lib:setBitTask(self.tbBitTSK_Limit_Check, 1)
	end
	local tbTittleSet = self.tbTITTLE_SETS[nTittleType]	
	
	local nCurActiveTitle = Title_GetActiveTitle()
	if nCurActiveTitle == tbTittleSet.nTittleID then
		Talk(1, "", format("C¸c h¹ ®ang së h÷u vßng hµo quang %s råi, kh«ng thÓ nhËn thªm.", Title_GetTitleName(nCurActiveTitle)))
		return
	end
	
	local nTime = GetCurServerTime() + floor(self.nTITTLE_EXPIREDTIME/18)
	nTime = tonumber(FormatTime2String("%m%d%H%M", nTime))
	Title_RemoveTitle(tbTittleSet.nTittleID)
	Title_AddTitle(tbTittleSet.nTittleID,2,nTime);
	Title_ActiveTitle(tbTittleSet.nTittleID)
	SetTask(self.nTSK_ACTIVE_TITTLE, tbTittleSet.nTittleID)
	if tbTittleSet.tbExtSkill then
		local tbSkills = tbTittleSet.tbExtSkill
		for i = 1, getn(tbSkills) do	
			RemoveSkillState(tbSkills[i].nID)	
			AddSkillState(tbSkills[i].nID, tbSkills[i].nLevel, 2, nTime, 1)
		end
	end
	local nTittleName = Title_GetTitleName(tbTittleSet.nTittleID)
	Msg2Player(format("B¹n ®· nhËn danh hiÖu <color=green>%s<color> thµnh c«ng",nTittleName ))
	tbLog:PlayerActionLog("VLMC2012","NhanHaoQuang", "Tittle:  "..nTittleName)
end

function OnCancel()
end