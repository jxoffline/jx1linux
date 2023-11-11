IncludeLib("FILESYS")

--show_riddle(0, "√’Ã‚»Áœ¬£∫<enter>" )

tbRiddle = {}

-- œ‘ æµ∆√’Œ Ã‚
tbRiddle.PlayerData = {}
function tbRiddle:Show(szFile, nTotalCount, caption, szMsg, szFunFinalOk, szFunStepOk, szFunStepFail, count)
--	print(format("g_count:%d", g_count))

	if szFile then
		self.PlayerData[PlayerIndex] = 
		{
			szFile = szFile,
			nTotalCount = nTotalCount,
			szMsg = szMsg,
			pFunFinalOk = (szFunFinalOk ~= nil and szFunFinalOk ~= "") and FunctionClass:new(szFunFinalOk,{nil}) or nil,
			pFunStepOk = (szFunStepOk ~= nil and szFunStepOk ~= "") and FunctionClass:new(szFunStepOk,{nil}) or nil,
			pFunStepFail = (szFunStepFail ~= nil and szFunStepFail ~= "") and FunctionClass:new(szFunStepFail,{nil}) or nil, 
		}
	elseif self.PlayerData[PlayerIndex] then
		szFile = self.PlayerData[PlayerIndex].szFile
		nTotalCount = self.PlayerData[PlayerIndex].nTotalCount
		szMsg = self.PlayerData[PlayerIndex].szMsg
		pFunFinalOk = self.PlayerData[PlayerIndex].pFunFinalOk
		pFunStepOk = self.PlayerData[PlayerIndex].pFunStepOk
		pFunStepFail = self.PlayerData[PlayerIndex].pFunStepFail
	else
		return
	end
	
	
	file = "\\settings\\event\\riddle\\"..szFile
	count = count or 0
	
	TabFile_Load(file, file)
	local row_count = TabFile_GetRowCount(file) - 1
	if (row_count > 1) then
		local row = random(2, row_count)
		local answer = TabFile_GetCell(file, row, 2)
		local question = format("%s%s", caption, TabFile_GetCell(file, row, 3))
		local options = {}
		local tbi = {}
		
		for i = 1, 4 do
			local szOption = TabFile_GetCell(file, row, 3 + i)
			if szOption ~= nil and szOption ~= "" then
				if (i==1) then
					tinsert(options,format("%s/#tbRiddle:answer_ok(%d)", szOption, count))
				else
					tinsert(options,format("%s/#tbRiddle:answer_fail()", szOption))
				end
			end
		end
		self:ReSort(options)
		tinsert(options,"HÒy b· /OnCancel")
		Describe(question, getn(options), options )
	end
end

function tbRiddle:ReSort(options)
	local count = getn(options)
	for i = 1, count do
		j = random(1, count)
		local tmp = options[i]
		options[i] = options[j]
		options[j] = tmp  
	end
	
	for i = 1, count do
		options[i] = format("%s. %s",i, options[i])
	end
end

-- µ∆√’ªÿ¥’˝»∑
function tbRiddle:answer_ok(count)
	if not self.PlayerData[PlayerIndex] then
		return
	end
	if (count + 1 >= self.PlayerData[PlayerIndex].nTotalCount) then
		
		local szMsg = self.PlayerData[PlayerIndex].szMsg
		
		if (self.PlayerData[PlayerIndex].pFunFinalOk ~= nil) then
				self.PlayerData[PlayerIndex].pFunFinalOk:GetGlobal()
				self.PlayerData[PlayerIndex].pFunFinalOk:exec()
		end
		
		Talk(1, "", szMsg)
		
		self.PlayerData[PlayerIndex] = nil
		
	else
	
		if (self.PlayerData[PlayerIndex].pFunStepOk ~= nil) then 
				self.PlayerData[PlayerIndex].pFunStepOk:GetGlobal()
				if (self.PlayerData[PlayerIndex].pFunStepOk:exec() == 0) then
					return
				end
		end
		
		tbRiddle:Show(nil, nil,"ThÀt xu t sæc! Xin ti’p tÙc! <enter>", nil, nil, nil, nil, count + 1)
	end
end

-- µ∆√’ªÿ¥¥ÌŒÛ
function tbRiddle:answer_fail()
	if (self.PlayerData[PlayerIndex].pFunStepFail ~= nil) then  
			self.PlayerData[PlayerIndex].pFunStepFail:GetGlobal()
			if (self.PlayerData[PlayerIndex].pFunStepFail:exec() == 0) then
				return
			end
	end
	tbRiddle:Show(nil, nil, "Sai rÂi! Xin ti’p tÙc! <enter>", nil, nil, nil, nil, 0)
end

