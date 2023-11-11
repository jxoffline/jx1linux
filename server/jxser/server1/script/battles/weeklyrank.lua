Include("\\script\\lib\\objbuffer_head.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

function sj_UpdateScore(tbPlayerList)
	for i=1,getn(tbPlayerList) do
		local tbPlayer = tbPlayerList[i]
		if tbPlayer.nIndex ~= nil and tbPlayer.nIndex > 0 then
			local nScore = CallPlayerFunction(tbPlayer.nIndex, GetTask, 751)
			if nScore >= 0 then
				local szName = CallPlayerFunction(tbPlayer.nIndex, GetName)
				local hParam = OB_Create()
				ObjBuffer:PushObject(hParam, szName)
				ObjBuffer:PushObject(hParam, nScore)
				RemoteExecute("\\script\\battle\\weeklyrank.lua", "tbSJ_WeeklyRank:s_AddScore", hParam)
				OB_Release(hParam)
			end
		end
		
	end
end

function sj_weekly_rank_update(tbPlayerList)
	local nTime = tonumber(GetLocalDate("%H%M"))
	if nTime > 2100 and nTime < 2300 then
		sj_UpdateScore(tbPlayerList)
	end
end

function sj_GetRankTop10()
	local hParam = OB_Create()
	local szName = GetName()
	ObjBuffer:PushObject(hParam, szName)
	RemoteExecute("\\script\\battle\\weeklyrank.lua", "tbSJ_WeeklyRank:s_GetRank", hParam, "sj_GetRankTop10_CallBack", 0)
	OB_Release(hParam)
end

function sj_GetRankTop10_CallBack(Param, hResult)

	if OB_IsEmpty(hResult) == 1 then
		return
	end

	local szName = ObjBuffer:PopObject(hResult)
	local nPlayerIndex = SearchPlayer(szName)
	
	if nPlayerIndex <= 0 then
		OB_Release(hResult)
		return
	end
	
	local nCount = ObjBuffer:PopObject(hResult)
	local szTitle = "Danh s∏ch x’p hπng TËng Kim tu«n tr≠Ìc nh≠ sau:"
	local szText, nScore
	
	for i=1, nCount do
		szName = ObjBuffer:PopObject(hResult)
		nScore = ObjBuffer:PopObject(hResult)
		szText = format("<enter>\thπng%d: \t%16s\t%d Æi”m", i, szName, nScore)
		szTitle = szTitle .. szText
	end
	
	tbOpt = {
		[1]={"Ta muËn nhÀn ph«n th≠Îng Long HÊ TËng Kim tu«n tr≠Ìc", sj_GetWeeklyRank},
		--BÊ sung ph«n th≠Îng chÿ nhÀn exp, kh´ng nhÀn hµo quang - modified by DinhHQ - 20130701
		[2]={"Ta muËn nhÀn ph«n th≠Îng Long HÊ TËng Kim tu«n tr≠Ìc (chÿ nhÀn kinh nghi÷m)", sj_GetWeeklyRank_2},
		[3]={" ß„ng",}
	}
	CallPlayerFunction(nPlayerIndex, CreateNewSayEx, szTitle, tbOpt)
	
end

function sj_close()
end

function sj_GetWeeklyRank()
	local nTime = tonumber(GetLocalDate("%H%M"))
	local nWeekDay = tonumber(GetLocalDate("%w"))
	
	if nWeekDay ~= 1 or nTime < 0100 then
		Talk(1, "", "Hi÷n tπi kh´ng ph∂i thÍi gian nhÀn, ng≠¨i h∑y ÆÓi Æ’n 01:00 Æ’n 24:00 ngµy th¯ 2 nhÀn ph«n th≠Îng nh–.")
		return
	end
	
	local szName = GetName()
	local hParam = OB_Create()
	ObjBuffer:PushObject(hParam, szName)
	
	RemoteExecute("\\script\\battle\\weeklyrank.lua", "tbSJ_WeeklyRank:s_GetRankAward", hParam, "sj_GetWeeklyRank_CallBack", 0)
	
	OB_Release(hParam)

end

function sj_GetWeeklyRank_CallBack(Param, hResult)
	if OB_IsEmpty(hResult) == 1 then
		return
	end
	
	local szName = ObjBuffer:PopObject(hResult)
	local nRank = ObjBuffer:PopObject(hResult)
	local nPlayerIndex = SearchPlayer(szName)
	
	if nPlayerIndex <= 0 then
		OB_Release(hResult)
		return
	end
	
	CallPlayerFunction(nPlayerIndex, sj_GiveRankAward, nRank)
	
end

local tbRankAward = {
	[1]={Exp=500000000, nTitle=255},
	[2]={Exp=400000000, nTitle=256},
	[3]={Exp=300000000, nTitle=257},
	[4]={Exp=200000000, nTitle=258},

}

function sj_GiveRankAward(nRank)
	if not nRank then
		Talk(1, "", "Xin l≠Óng th¯, ng≠¨i kh´ng c„ trong b∂ng x’p hπng tu«n tr≠Ìc.")
		return
	end
	
	if nRank == 0 then
		Talk(1, "", "ßπi hi÷p Æ∑ nhÀn ph«n th≠Îng rÂi, kh´ng th” nhÀn th™m.")
		return
	end
	
	Msg2Player(format("ChÛc mıng Æπi hi÷p Æ∑ nhÀn Æ≠Óc Æi”m TËng Kim x’p hπng %d.", nRank))
	
	if nRank > 4 then
		nRank = 4
	end
	
	local nDate = mod(FormatTime2Number(GetCurServerTime() + 7*24*60*60), 100000000)

	Title_RemoveTitle(%tbRankAward[nRank].nTitle)
	Title_AddTitle(%tbRankAward[nRank].nTitle, 2, nDate) --≥÷–¯“ª÷‹
	Title_ActiveTitle(%tbRankAward[nRank].nTitle)

	SetTask(1122, %tbRankAward[nRank].nTitle)
	tbAwardTemplet:GiveAwardByList({nExp_tl = %tbRankAward[nRank].Exp}, "battle rank top10")

end


--------BÊ sung ph«n th≠Îng chÿ nhÀn exp, kh´ng nhÀn hµo quang - modified by DinhHQ - 20130701--------

function sj_GetWeeklyRank_2()
	local nTime = tonumber(GetLocalDate("%H%M"))
	local nWeekDay = tonumber(GetLocalDate("%w"))
	
	if nWeekDay ~= 1 or nTime < 0100 then
		Talk(1, "", "Hi÷n tπi kh´ng ph∂i thÍi gian nhÀn, ng≠¨i h∑y ÆÓi Æ’n 01:00 Æ’n 24:00 ngµy th¯ 2 nhÀn ph«n th≠Îng nh–.")
		return
	end
	
	local szName = GetName()
	local hParam = OB_Create()
	ObjBuffer:PushObject(hParam, szName)
	
	RemoteExecute("\\script\\battle\\weeklyrank.lua", "tbSJ_WeeklyRank:s_GetRankAward", hParam, "sj_GetWeeklyRank_CallBack_2", 0)
	
	OB_Release(hParam)

end

function sj_GetWeeklyRank_CallBack_2(Param, hResult)
	if OB_IsEmpty(hResult) == 1 then
		return
	end
	
	local szName = ObjBuffer:PopObject(hResult)
	local nRank = ObjBuffer:PopObject(hResult)
	local nPlayerIndex = SearchPlayer(szName)
	
	if nPlayerIndex <= 0 then
		OB_Release(hResult)
		return
	end
	
	CallPlayerFunction(nPlayerIndex, sj_GiveRankAward_2, nRank)
	
end

function sj_GiveRankAward_2(nRank)
	if not nRank then
		Talk(1, "", "Xin l≠Óng th¯, ng≠¨i kh´ng c„ trong b∂ng x’p hπng tu«n tr≠Ìc.")
		return
	end
	
	if nRank == 0 then
		Talk(1, "", "ßπi hi÷p Æ∑ nhÀn ph«n th≠Îng rÂi, kh´ng th” nhÀn th™m.")
		return
	end
	
	Msg2Player(format("ChÛc mıng Æπi hi÷p Æ∑ nhÀn Æ≠Óc Æi”m TËng Kim x’p hπng %d.", nRank))
	
	if nRank > 4 then
		nRank = 4
	end	
	
	tbAwardTemplet:GiveAwardByList({nExp_tl = %tbRankAward[nRank].Exp}, "battle rank top10 only exp")

end
