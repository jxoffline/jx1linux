Include("\\script\\activitysys\\config\\26\\head.lua")
Include("\\script\\activitysys\\config\\26\\variables.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
local szRemoteScript = "\\script\\event\\2011dayanqunxia\\event.lua"

function pActivity:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nRecordDate = self:GetTask(TSK_DATE_A)
	
	if nCurDate ~= nRecordDate then
		self:SetTask(TSK_DATE_A, nCurDate)
		self:SetTask(TSK_EXP_A, 0)
	end
end

function pActivity:AddTaskA(TSK_EXP_A, TSK_DATE_A, nAddValue)
	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:AddTask(TSK_EXP_A, nAddValue)	
end

function pActivity:GetTaskA(TSK_EXP_A, TSK_DATE_A)
	self:ResetTaskA(TSK_EXP_A, TSK_DATE_A)
	return self:GetTask(TSK_EXP_A)
end

function pActivity:CheckTaskA(TSK_EXP_A, TSK_DATE_A, nUpExpA, szMsgA, nNumber)
	local nCurExpA = self:GetTaskA(TSK_EXP_A, TSK_DATE_A)
	if nCurExpA >= nUpExpA then
		if szMsgA ~= nil then
			Talk(1, "", szMsgA)
		end
		return
	end
	return 1
end

function pActivity:CheckTaskB(TSK_B, szMsg, szOption)
	local nValue = self:GetTask(TSK_B)
	if szOption == "==" then
		if nValue == 0 then
			return 1
		end
	elseif szOption == "~=" then
		if nValue ~= 0 then
			return 1
		end
	end
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	return self:CheckTask(TSK_B, nCurDate, szMsg, szOption)
end

function pActivity:GiveEatAward(TSK_EXP_A, TSK_DATE_A, TSK_EXP_B, nNumber)
	local tbAward = 
	{
		{nExp_tl = 1000000, nRate = 40, 
			pFun = function(tbItem, nItemCount, szLogTitle)
				Talk(1, "", "Ng≠¨i ®n mÈt mi’ng ' S≠Ín Xµo Chua Ng‰t'  nhÀn Æ≠Óc  1.000.000 kinh nghi÷m")
				%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, nItemCount * 1000000 / %nNumber)
				%self:AddTask(%TSK_EXP_B, nItemCount * 1000000 / %nNumber)
			end
		},
		{nExp_tl = 2000000, nRate = 30,
			pFun = function(tbItem, nItemCount, szLogTitle)
				Talk(1, "", "Ng≠¨i gæp mÈt mi’ng 'C∏ Ch–p Kho Om' ®n ngon lµnh, nhÀn Æ≠Óc 2.000.000 kinh nghi÷m")
				%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, nItemCount * 2000000 / %nNumber)
				%self:AddTask(%TSK_EXP_B, nItemCount * 2000000 / %nNumber)
			end
		},
		{nExp_tl = 3000000, nRate = 20,
			pFun = function(tbItem, nItemCount, szLogTitle)
				Talk(1, "", "Ng≠¨i l y mÈt mi’ng 'Gµ TrËng T¨' ®n ngon lµnh, nhÀn Æ≠Óc 3.000.000 kinh nghi÷m")
				%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, nItemCount * 3000000 / %nNumber)
				%self:AddTask(%TSK_EXP_B, nItemCount * 3000000 / %nNumber)
			end
		},
		{nExp_tl = 5000000, nRate = 10, 
			pFun = function(tbItem, nItemCount, szLogTitle)
				Talk(1, "", "Ng≠¨i c«m l™n mÈt mi’ng ' Heo S˜a Quay' ®n mÈt mi’ng ngon lµnh, nhÀn Æ≠Óc 5.000.000 kinh nghi÷m")
				%self:AddTaskA(%TSK_EXP_A, %TSK_DATE_A, nItemCount * 5000000 / %nNumber)
				%self:AddTask(%TSK_EXP_B, nItemCount * 5000000 / %nNumber)
			end
		},
	}
	tbAwardTemplet:GiveAwardByList(tbAward, "ßπi Y’n Qu«n Hi÷p n®m 2011, ®n th¯c ®n nhÀn Æ≠Óc kinh nghi÷m.", 1)
end

function pActivity:CheckNotGetDrunk(nSkillId, szMsg)
	if GetSkillState(nSkillId) == -1 then
		return 1
	end
	Talk(1, "", szMsg)
end

function pActivity:CheckGetDrunk(nSkillId, szMsg)
	local nValue = self:CheckNotGetDrunk(nSkillId)
	if nValue ~= 1 then
		return 1
	end
	Talk(1, "", szMsg)
end

function pActivity:DrinkOneRound(TSK_A, TSK_B, TSK_Time, TSK_Round, TSK_AwardB, TSK_AwardC, TSK_Date, nSkillId, szKind, nDetailId)

	local nAddValueA = nil
	local nAddValueB = nil
	if szKind == "small" then
		nAddValueA = random(1, 6)
		nAddValueB = 3
	elseif szKind == "middle" then
		nAddValueA = random(2, 12)
		nAddValueB = 7
	elseif szKind == "big" then
		nAddValueA = random(3, 18)
		nAddValueB = 11
	end
	--TSK_AwardB:∂∑æ∆≥…π¶Ω±  TSK_AwardC:∞≤ŒøΩ±
	self:AddTask(TSK_A, nAddValueA)--æ∆“‚
	self:AddTask(TSK_B, nAddValueB)--æ∆¡ø
	
	local nValueA = self:GetTask(TSK_A)
	local nValueB = self:GetTask(TSK_B)
	
	if nValueA >= 100 then
		self:SetTask(TSK_AwardC, 1) --”–∞≤ŒøΩ±“™¡Ï
		self:AddTaskDaily(TSK_Time, 1)--≥° ˝º”1
		self:SetTask(TSK_Round, 0)--¬÷ ˝«Â¡„
		self:SetTask(TSK_A, 0)--æ∆“‚«Â¡„
		self:SetTask(TSK_B, 0)--æ∆¡ø«Â¡„
		PlayerFunLib:AddSkillState(nSkillId, 1, 3, 30 * 60 * 18, 1)
		Talk(1, "", "Ng≠¨i Æ∑ uËng say rÂi, „i mˆa ra c∂ Æ t kia k◊a, nhanh Æi nhÀn th≠Îng an Òi Æi")
	else
		self:AddTask(TSK_Round, 1)--¬÷ ˝º”1
		local nRound = self:GetTask(TSK_Round)
		if nRound >= 12 then
			self:SetTask(TSK_AwardB, 1) --”–∂∑æ∆≥…π¶Ω±“™¡Ï
			self:AddTaskDaily(TSK_Time, 1)--≥° ˝º”1
			self:SetTask(TSK_Round, 0)--¬÷ ˝«Â¡„
			self:SetTask(TSK_A, 0)--æ∆“‚«Â¡„
			self:AddJiuLiang(nValueB)
			self:SetTask(TSK_B, 0)--æ∆¡ø«Â¡„
			local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
			self:SetTask(TSK_Date, nCurDate)			
			Talk(1, "", "TrÀn Æ u r≠Óu l«n nµy ng≠¨i thµnh c´ng rÂi!")
		else
			self:ExecActivityDetail(nDetailId)
		end
	end
	
end

function pActivity:AddJiuLiang(nValue)
	local obj = ObjBuffer:New()
	local szName = GetName()
	obj:Push(szName)
	obj:Push(nValue)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	obj:Push(nCurDate)
	RemoteExecute(%szRemoteScript, "tbQunXia:g2s_AddJiuLiang", obj.m_Handle)
	obj:Destroy()	
end

function pActivity:GetTitle(TSK_A, TSK_B, TSK_C)
	local nValueA = self:GetTask(TSK_A)
	local nValueB = self:GetTask(TSK_B)
	local nValueC = self:GetTask(TSK_C)
	local szTitle = "TrÀn Æ u r≠Óu l«n nµy ng≠¨i ph∂i uËng h’t 12 l≠Ót r≠Óu, ng≠¨i Æ∑ uËng %d l≠Ót r≠Óu, ÆÈ say xÿn tr≠Ìc mæt cÒa ng≠¨i lµ %d, trÀn Æ u r≠Óu l«n nµy ng≠¨i Æ∑ nhÀn Æ≠Óc tˆu l≠Óng lµ %d, uËng 1 b∏t r≠Óu nh· sœ lµm t®ng 1-6 ÆÈ say xÿn, uËng mÈt b∏t r˘Óu trung sœ lµm t®ng 2-12 ÆÈ say xÿn, t®ng 7 l≠Óng tˆu l≠Óng, uËng mÈt b∏t r≠Óu lÌn sœ lµm t®ng 3-18 ÆÈ say xÿn, t®ng 11 l≠Óng tˆu l≠Óng."
	szTitle = format(szTitle, nValueA, nValueB, nValueC)
	return szTitle
end

function pActivity:Lose(TSK_A, TSK_B, TSK_C, TSK_D, TSK_E)
	--TSK_A:≥° ˝  TSK_B£∫¬÷ ˝   TSK_C£∫◊Ì“‚  TSK_D: ∞≤ŒøΩ±
	self:AddTaskDaily(TSK_A, 1)--≥° ˝º”1
	self:SetTask(TSK_B, 0)--¬÷ ˝«Â¡„
	self:SetTask(TSK_C, 0)--◊Ì“‚«Â¡„
	self:SetTask(TSK_D, 1)--”–∞≤ŒøΩ±¡Ï
	self:SetTask(TSK_E, 1)--æ∆¡ø«Â¡„
end

function pActivity:AddDialogNpc(szNpcName, nNpcId, tbNpcPos)
	self:AddNpc(szNpcName, nNpcId, tbNpcPos,  "\\script\\activitysys\\npcdailog.lua")
end

function pActivity:AddNpc(szNpcName, nNpcId, tbNpcPos, szLuaFile)
	for i=1, getn(tbNpcPos) do
		local pPos = tbNpcPos[i]
		local nMapIndex = SubWorldID2Idx(pPos[1])
		if nMapIndex > 0 then
			local nNpcIndex = AddNpc(nNpcId, 1, nMapIndex, pPos[2] * 32, pPos[3] * 32, 0, szNpcName);
			if szLuaFile ~= nil then
				SetNpcScript(nNpcIndex, szLuaFile)
			end
		end		
	end
end

function pActivity:AddNpcFromFile(szNpcName, nNpcId, szPosPath, nMapId)
	if (TabFile_Load(szPosPath, szPosPath) == 0) then
		print("Load TabFile Error!"..szPosPath)
		return 0
	end	
	local tbNpcPos = {}
	local nRowCount = TabFile_GetRowCount(szPosPath)
	for nRow = 2, nRowCount do
		tbNpcPos[nRow - 1] = {}
		tbNpcPos[nRow - 1][1] = nMapId
		local nX = TabFile_GetCell(szPosPath, nRow, 1)
		local nY = TabFile_GetCell(szPosPath, nRow, 2)
		tbNpcPos[nRow - 1][2] = nX
		tbNpcPos[nRow - 1][3] = nY
	end
	self:AddNpc(szNpcName, nNpcId, tbNpcPos)
end

function pActivity:AddMulNpc(tbNpcInfos, szNpcName, nNpcId)
	local nCount = getn(tbNpcInfos)
	for i = 1, nCount do
		self:AddNpcFromFile(szNpcName, nNpcId, tbNpcInfos[i]["szPosPath"], tbNpcInfos[i]["nMapId"])
	end
end

function pActivity:DisplayCurJiuLiang()
	local obj = ObjBuffer:New()
	local szName = GetName()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	obj:Push(szName)	
	obj:Push(nCurDate)
	DynamicExecute("\\script\\activitysys\\config\\26\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbQunXia:g2s_QueryPlayerJiuLiang", obj.m_Handle, "pActivity:ReceiveCurJiuLiang", 0)
	obj:Destroy()
end

function pActivity:ReceiveCurJiuLiang(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nJiuLiang = ObjBuffer:PopObject(ResultHandle)
	local szMsg = format("%-32s%-10d\n", szName, nJiuLiang)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex > 0 then
		local szTitle = format("%-32s%-10s\n", "T™n", "Tˆu L≠Óng h´m nay")
		CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szTitle..szMsg, {{"K’t thÛc ÆËi thoπi"}})
	end
end

function pActivity:JieJiu(nSkillId)
	RemoveSkillState(nSkillId)
end

function pActivity:CheckDrinkTime(nStartHour, nEndHour, szMsg)
	local nCurHour = tonumber(GetLocalDate("%H"))
	if (nCurHour >= nStartHour and nCurHour <= nEndHour) then
		return 1
	end
	Talk(1, "", szMsg)
end

function pActivity:GetDrinkAward(TSK_EXP_A, nUpExpA, nAddExpA, szMsg, szOption, nNumber, szLogTitle)
	if self:CheckTask(TSK_EXP_A, nUpExpA, szMsg, szOption) ~= 1 then
		return
	end
	PlayerFunLib:AddExp(nAddExpA, 1, szLogTitle)
	self:AddTask(TSK_EXP_A, nAddExpA / nNumber)
	return 1
end

function pActivity:GetPaiMingAward()
	local nDate = self:GetTask(%TSK_LastTimeDate)
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if nDate == 0 or nDate >= nCurDate then
		Talk(1, "", "Thi’u Hi÷p tr≠Ìc mæt ng≠¨i v…n ch≠a c„ ph«n th≠Îng Æ” nhÀn")
		return
	end
	self:GetFixCountData(nDate, 10, GetName())
end

function pActivity:GetFixCountData(nDate, nCount, szName)
	local obj = ObjBuffer:New()
	obj:Push(nDate)
	obj:Push(nCount)
	obj:Push(szName)
	DynamicExecute("\\script\\activitysys\\config\\26\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbQunXia:g2s_LoadFixCountData", obj.m_Handle, "pActivity:ReceiveFixCountData", 0)
	obj:Destroy()	
end

function pActivity:ReceiveFixCountData(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	local nResult = DynamicExecuteByPlayer(nPlayerIndex, "\\script\\activitysys\\config\\26\\extend.lua", "pActivity:CheckTaskB", %TSK_LastTimeDate, "Thi’u Hi÷p ng≠¨i Æ∑ nhÀn ph«n th≠Îng x’p hπng rÂi", "~=")
	if  nResult ~= 1 then
		return
	end
	
	local tbTopTen = ObjBuffer:PopObject(ResultHandle)
	local nCount = 0
	if tbTopTen ~= nil then
		nCount = getn(tbTopTen)
	end
	if nCount == 0 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Thi’u Hi÷p ng≠¨i tπm thÍi ch≠a c„ ph«n th≠Îng Æ” nhÀn")
		return
	end
	local nPos = -1
	for i = 1, nCount do
		if tbTopTen[i] ~= nil and tbTopTen[i][1] ~= nil then
			if tbTopTen[i][1] == szName then
				nPos = i
				break
			end
		end
	end
	if nPos == -1 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Thi’u Hi÷p ng≠¨i tπm thÍi ch≠a c„ ph«n th≠Îng Æ” nhÀn")
		return
	end
	local nAddExpA = 0
	if nPos == 1 then
		nAddExpA = %tbPaiMingExp[1]
	elseif nPos == 2 then
		nAddExpA = %tbPaiMingExp[2]
	elseif nPos == 3 then
		nAddExpA = %tbPaiMingExp[3]
	else
		nAddExpA = %tbPaiMingExp[4]
	end
	local bFlag = DynamicExecuteByPlayer(nPlayerIndex, "\\script\\activitysys\\config\\26\\extend.lua", "pActivity:GetDrinkAward", 
		%TSK_TotalDrinkExp, %nTotalDrinkUpExp, nAddExpA, "Thi’u Hi÷p ng≠¨i tham gia Æ u r≠Óu nhÀn Æ≠Óc kinh nghi÷m Æ∑ Æπt Æ’n giÌi hπn, kh´ng th” ti’p tÙc nhÀn nh˜ng ph«n th≠Îng c„ li™n quan Æ’n Æ u r≠Óu", "<", %nNumber, "ßπi Y’n Qu«n Hi÷p n®m 2011, nhÀn ph«n th≠Îng x’p hπng Æ u r≠Óu.")
	DynamicExecuteByPlayer(nPlayerIndex, "\\script\\activitysys\\config\\26\\extend.lua", "pActivity:SetTask", %TSK_LastTimeDate, 0)
	if bFlag == 1 then
		local szMsg = ""
		if nPos >= 4 then
			szMsg = "ß∑ nhÀn ph«n th≠Îng x’p hπng Æ u r≠Óu x’p hπng tı 4-10 thµnh c´ng."
		else
			szMsg = format("ß∑ nhÀn ph«n th≠Îng x’p hπng Æ u r≠Óu x’p hπng c p th¯ %d( x’p hπng th¯ %d) thµnh c´ng", nPos, nPos)
		end
		CallPlayerFunction(nPlayerIndex, Msg2Player, szMsg)
	end
end

function pActivity:GetYDate()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local nTime = GetCurServerTime() - 24*60*60
	local tbYDate = Time2Tm(nTime)
	local nYDate = tbYDate[1] * 10000 + tbYDate[2] * 100 + tbYDate[3]
	return nYDate
end

function pActivity:DisplayCurTopTen()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	local szName = GetName()
	local obj = ObjBuffer:New()
	obj:Push(nCurDate)
	obj:Push(szName)
	DynamicExecute("\\script\\activitysys\\config\\26\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbQunXia:g2s_QueryTopTen", obj.m_Handle, "pActivity:ReceiveTopTen", 0)
	obj:Destroy()	
end

function pActivity:DisplayYTopTen()
	local nTime = tonumber(GetLocalDate("%H%M"))
	if nTime >= 0 and nTime <= 5 then
		Talk(1, "", "Tr≠Ìc mæt v…n ch≠a c„ x’p hπng")
		return
	end	
	local nYDate = self:GetYDate()
	local szName = GetName()
	local obj = ObjBuffer:New()
	obj:Push(nYDate)
	obj:Push(szName)
	DynamicExecute("\\script\\activitysys\\config\\26\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbQunXia:g2s_QueryTopTen", obj.m_Handle, "pActivity:ReceiveTopTen", 0)
	obj:Destroy()		
end

function pActivity:ReceiveTopTen(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local tbTopTen = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	local szMsg = "Tr≠Ìc mæt v…n ch≠a c„ x’p hπng"
	if tbTopTen ~= nil then
		local nCount = getn(tbTopTen)
		if nCount == 0 then
			CallPlayerFunction(nPlayerIndex, Talk, 1, "", szMsg)
			return
		end
		local szPaiMing = format("%-32s%-10s\n", "T™n", "Tˆu L≠Óng")
		for i = 1, nCount do
			local szTemp = format("%-32s%-10d\n", tbTopTen[i][1], tbTopTen[i][2])
			szPaiMing = szPaiMing..szTemp
		end
		CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szPaiMing, {{"K’t thÛc ÆËi thoπi"}})
	else
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", szMsg)
	end
end

function pActivity:DisplayPlayerPaiMing(nDate, szFun)
	local szName = GetName()
	local obj = ObjBuffer:New()
	obj:Push(szName)	
	obj:Push(nDate)
	DynamicExecute("\\script\\activitysys\\config\\26\\extend.lua",
		"RemoteExecute", %szRemoteScript, "tbQunXia:g2s_QueryPlayerPaiMing", obj.m_Handle, szFun, 0)
	obj:Destroy()		
end

function pActivity:DisplayYPlayerPaiMing()
	local nTime = tonumber(GetLocalDate("%H%M"))
	if nTime >= 0 and nTime <= 5 then
		Talk(1, "", "Tr≠Ìc mæt v…n ch≠a c„ x’p hπng")
		return
	end	
	local nYDate = self:GetYDate()	
	self:DisplayPlayerPaiMing(nYDate, "pActivity:ReceivePlayerPaiMing")
end

function pActivity:ReceivePlayerPaiMing(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPaiMing = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	if nPaiMing == nil then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Thi’u Hi÷p tr≠Ìc mæt ng≠¨i ch≠a c„ x’p hπng Tˆu L≠Óng cÒa ngµy h´m tr≠Ìc")
		return
	end
	local szPaiMing = format("%-32s%-10d\n", szName, nPaiMing)
	local szTitle = format("%-32s%-10s\n", "T™n", "X’p hπng ngµy h´m tr≠Ìc")
	CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szTitle..szPaiMing, {{"K’t thÛc ÆËi thoπi"}})
end

function pActivity:CheckPaiMing()
	local nResult = self:CheckTaskB(%TSK_LastTimeDate, nil, "==")
	if nResult ~= 1 then
		local nDate = self:GetTask(%TSK_LastTimeDate)
		self:DisplayPlayerPaiMing(nDate, "pActivity:CheckRePaiMing")
	else
		self:pCreateDialog()
	end
end

function pActivity:CheckRePaiMing(nParam, ResultHandle)
	local szName = ObjBuffer:PopObject(ResultHandle)
	local nPaiMing = ObjBuffer:PopObject(ResultHandle)
	local nPlayerIndex = SearchPlayer(szName)
	if nPlayerIndex == nil or nPlayerIndex <= 0 then
		return
	end
	if nPaiMing ~= nil and nPaiMing >= 1 and nPaiMing <= 10 then
		CallPlayerFunction(nPlayerIndex, Talk, 1, "", "Tr≠Ìc khi tham gia trÀn Æ u r≠Óu nµy c«n ph∂i nhÀn h’t t t c∂ ph«n th≠Îng cÒa trÀn Æ u r≠Óu tr≠Ìc( ph«n th≠Îng an Òi, ph«n th≠Îng Æ u r≠Óu thµnh c´ng, ph«n th≠Îng x’p hπng ) xin h∑y Æi nhÀn h’t nh˜ng ph«n th≠Îng nµy Æi rÂi h∑y Æ’n tham gia nh–")	
	else
		DynamicExecuteByPlayer(nPlayerIndex, "\\script\\activitysys\\config\\26\\extend.lua", "pActivity:SetTask", %TSK_LastTimeDate, 0)
		DynamicExecuteByPlayer(nPlayerIndex, "\\script\\activitysys\\config\\26\\extend.lua", "pActivity:pCreateDialog")
	end
end

function pActivity:pCreateDialog()
	local tbDailog = DailogClass:new()
	tbDailog.szTitleMsg = self:GetTitle(%TSK_DrinkRound, %TSK_ZuiYi, %TSK_JiuLiang)
	tbDailog:AddOptEntry("UËng mÈt b∏t r≠Óu nh·", self.GotoDetail, {self, 6, {tbDailog}})
	tbDailog:AddOptEntry("UËng 1 B∏t R≠Óu Trung", self.GotoDetail, {self, 7, {tbDailog}})
	tbDailog:AddOptEntry("UËng mÈt b∏t r≠Óu lÌn", self.GotoDetail, {self, 8, {tbDailog}})
	tbDailog:AddOptEntry("Ta uËng h’t nÁi rÂi, trÀn ß u R≠Óu nµy ta chﬁu thua", self.GotoDetail, {self, 9, {tbDailog}})
	tbDailog:Show()
end

function pActivity:BeginDrink()
	if self:CheckDate() ~= 1 then
		return
	end
		
	if self:CheckDrinkTime(9, 23, "Thi’u Hi÷p b©y giÍ kh´ng ph∂i lµ thÍi gian Æ u r≠Óu, ngµy mai vµo lÛc 9h-24h h∑y Æ’n chÁ cÒa ta Æ u r≠Óu nh–") ~= 1 then
		return
	end
	
	if self:CheckTaskDaily(%TSK_DrinkTimes, 3, "H´m nay Æ∑ uËng ÆÒ 3 trÀn r≠Óu rÂi, ngµy mai h∑y quay lπi nh–", "<") ~= 1 then
		return
	end
	
	if self:CheckNotGetDrunk(1020, "Thi’u Hi÷p ng≠¨i Æ∑ uËng say rÂi, ÆÓi tÿnh r≠Óu rÂi lπi Æ’n nh–") ~= 1 then
		return
	end
	
	if self:CheckTask(%TSK_WinDrink, 0, "Tr≠Ìc khi tham gia trÀn Æ u r≠Óu nµy c«n ph∂i nhÀn h’t t t c∂ ph«n th≠Îng cÒa trÀn Æ u r≠Óu tr≠Ìc( ph«n th≠Îng an Òi, ph«n th≠Îng Æ u r≠Óu thµnh c´ng, ph«n th≠Îng x’p hπng ) xin h∑y Æi nhÀn h’t nh˜ng ph«n th≠Îng nµy Æi rÂi h∑y Æ’n tham gia nh–", "==") ~= 1 then
		return
	end
	
	if self:CheckTask(%TSK_AnWei, 0, "Tr≠Ìc khi tham gia trÀn Æ u r≠Óu nµy c«n ph∂i nhÀn h’t t t c∂ ph«n th≠Îng cÒa trÀn Æ u r≠Óu tr≠Ìc( ph«n th≠Îng an Òi, ph«n th≠Îng Æ u r≠Óu thµnh c´ng, ph«n th≠Îng x’p hπng ) xin h∑y Æi nhÀn h’t nh˜ng ph«n th≠Îng nµy Æi rÂi h∑y Æ’n tham gia nh–", "==") ~= 1 then
		return
	end
	
	self:CheckPaiMing()
end







