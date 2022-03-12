Include("\\script\\activitysys\\config\\19\\valentinehead.lua")
Include("\\script\\activitysys\\config\\19\\extend.lua")


Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")

Include("\\script\\missions\\basemission\\lib.lua")
Include("\\script\\lib\\progressbar.lua")
Include("\\script\\lib\\awardtemplet.lua")

local _OnBreak = function()
	Msg2Player("Thu thËp ®øt ®o¹n")
end

local _GetAward = function(nNpcIdx, dwNpcId)
	if nNpcIdx <= 0 or GetNpcId(nNpcIdx) ~= dwNpcId then
		return 0
	end	
	
	if PlayerFunLib:CheckFreeBagCell(1,"Hµnh trang kh«ng ®ñ") ~= 1 then
		return 0
	end
	
	local nTreePickStep = GetNpcParam(nNpcIdx, TREE_PICKSTEP)
	SetNpcParam(nNpcIdx, TREE_PICKSTEP, nTreePickStep + 1)
	Msg2Player("Thu thËp kÕt thóc!")
	if nTreePickStep == 1 then
		local nAwardCount = 0
		local tbAward = {}
		if GetNpcParam(nNpcIdx, TREE_TYPE) == MEIGUIHUAZI then
			nAwardCount = floor((GetNpcParam(nNpcIdx, TREE_TASKSCORE)+4)/5)
			tbAward = {{szName = "LÔ Hép Hoa Hång", tbProp = {6, 1, 2700, 1, 0, 0}, nBindState = -2, nExpiredTime = 20110224, nCount = nAwardCount,},}
			tbAwardTemplet:GiveAwardByList(tbAward, "LÔ T×nh Nh©n n¨m 2011, thu thËp LÔ Hép Hoa Hång")
		else
			nAwardCount = floor((GetNpcParam(nNpcIdx, TREE_TASKSCORE)+9)/10)
			tbAward = {{szName = "LÔ Hép T­¬ng T­", tbProp = {6, 1, 2701, 1, 0, 0}, nBindState = -2, nExpiredTime = 20110224, nCount = nAwardCount,},}
			tbAwardTemplet:GiveAwardByList(tbAward, "LÔ T×nh Nh©n n¨m 2011, thu thËp LÔ Hép T­¬ng T­.")
		end
		AddNpcSkillState(nNpcIdx, 662,1, 1, 0)	-- ¹Ø±Õ¸ÐÌ¾ºÅ
	end
end 

function main()

	local nNpcIdx = GetLastDiagNpc()
	local dwNpcId = GetNpcId(nNpcIdx)
	local szNpcName = GetNpcName(nNpcIdx)
	
	local nTreeType = GetNpcParam(nNpcIdx, TREE_TYPE)
	local nTreeGrowStep = GetNpcParam(nNpcIdx, TREE_GROWSTEP)
	
	if nTreeGrowStep == 4 then
		
		if CheckGetAwardBelong(nNpcIdx) ~= 1 then
				return
		end
			
		local nTreePickStep = GetNpcParam(nNpcIdx, TREE_PICKSTEP)
		if nTreePickStep == 0 then -- »¹Ã»¿ªÊ¼
			SetNpcParam(nNpcIdx, TREE_PICKSTEP, nTreePickStep + 1)
			nTreePickStep = 1
		end
		
		if nTreePickStep == 1 then -- ¿ªÊ¼²ÉÕª
			
			Msg2Player("B¾t ®Çu thu ho¹ch")
			tbProgressBar:OpenByConfig(1, %_GetAward, {nNpcIdx, dwNpcId}, %_OnBreak)
			return 
		end
		
		if nTreePickStep == 2 then
			Msg2Player("§· thu ho¹ch råi")
			return
		end
		
		return
	end
	
	local nTreeTaskStep = GetNpcParam(nNpcIdx, TREE_TASKSTEP)
	
	if nTreeTaskStep <= 0 then
		local nTalkRandNumber = 0
		if nTreeType == MEIGUIHUAZI then
			nTalkRandNumber = random(1, getn(ACTIVITY_TREE_TALK_ROSE))
			lib:ShowMessage(ACTIVITY_TREE_TALK_ROSE[nTalkRandNumber])
		else
			nTalkRandNumber = random(1, getn(ACTIVITY_TREE_TALK_XIANGSI))
			lib:ShowMessage(ACTIVITY_TREE_TALK_XIANGSI[nTalkRandNumber])
		end
		return 
	end
	
	if nTreeTaskStep == 1  then
		
		if nTreeType == MEIGUIHUAZI and CheckTaskBelongMeiGuiSuc(nNpcIdx) ~= 1 then
			return
		end
		
		if nTreeType == XIANGSI and CheckTaskBelongXiangSiSuc(nNpcIdx) ~= 1 then
			return
		end
		
		local nCurTime = GetCurServerTime()
		local nTaskStart = GetNpcParam(nNpcIdx, TREE_TASKTIME)
		AddNpcSkillState(nNpcIdx, 662,1, 1, 0) -- ¹Ø±Õ¸ÐÌ¾ºÅ
	
		local nNumber = (mod(GetCurServerTime(), 10000000) + random(5, 15))*10 + random(1, nTreeGrowStep+1)
		SetNpcParam(nNpcIdx, TREE_TASKNAME, nNumber)
		local nDif = floor(GetNpcParam(nNpcIdx, TREE_TASKNAME)/10) - mod(GetCurServerTime(), 10000000)
		local nTaskId = mod(GetNpcParam(nNpcIdx, TREE_TASKNAME), 10)
		local szInfo = format("Xin h·y t¹i %sgi©y sau%s", nDif, ACTIVITY_TREE_TASK_NAME[nTaskId])
		lib:ShowMessage(szInfo)
		
		AddNpcSkillState(nNpcIdx, 764,1, 1, (90 - (nCurTime - nTaskStart))*18 )	-- ¿ªÆôÎÊºÅ
	
		SetNpcParam(nNpcIdx, TREE_TASKSTEP, nTreeTaskStep + 1)
		return
	end
	
	if nTreeTaskStep == 2 then
		
		if nTreeType == MEIGUIHUAZI and CheckTaskBelongMeiGuiSuc(nNpcIdx) ~= 1 then
			return
		end 
		
		if nTreeType == XIANGSI and CheckTaskBelongXiangSiSuc(nNpcIdx) ~= 1 then
			return
		end
		
		local tbDailog = DailogClass:new(szNpcName)
		G_ACTIVITY:OnMessage("ClickNpc", tbDailog)
		local nTaskId = mod(GetNpcParam(nNpcIdx, TREE_TASKNAME), 10)
		tbDailog.szTitleMsg = format("<#><npc>b©y giê %s?", ACTIVITY_TREE_TASK_NAME[nTaskId])
		tbDailog:AddOptEntry("X¸c nhËn", TaskSure, {nNpcIdx})
		tbDailog:AddOptEntry("§îi mét l¸t")
		tbDailog:Show()
	end
	
end

function TaskSure(nNpcIdx)	
	local nDif = abs(floor(GetNpcParam(nNpcIdx, TREE_TASKNAME)/10) - mod(GetCurServerTime(), 10000000))
	local nScore = GetNpcParam(nNpcIdx, TREE_TASKSCORE)
	if nDif <= 1 then
		nScore = nScore + 10
	elseif nDif <= 3 then
		nScore = nScore + 8
	elseif nDif <= 5 then 
		nScore = nScore + 7
	elseif nDif <= 8 then
		nScore = nScore + 6
	elseif nDif <= 9 then
		nScore = nScore + 5
	end
	AddNpcSkillState(nNpcIdx, 764,1, 1, 0)
	SetNpcParam(nNpcIdx, TREE_TASKSCORE, nScore)
	SetNpcParam(nNpcIdx, TREE_TASKSTEP, -1)
	SetNpcParam(nNpcIdx, TREE_TASKNAME, -1)
end



function CheckTaskBelongXiangSiSuc(nNpcIdx)
	
	if CheckValentineLevel() ~= 1 then
		return 0
	end
	
	local szBelongPlayerIdx = NPC_DATA[nNpcIdx]
	
	if GetName() ~= szBelongPlayerIdx then
		lib:ShowMessage("Ng­¬i kh«ng ph¶i chñ nh©n cña c©y nµy!")
		return 0
	end
	
	return 1
end

function CheckTaskBelongMeiGuiSuc(nNpcIdx)
	
	if CheckValentineLevel() ~= 1 then
		return 0
	end
	
	local nTeamSize = GetTeamSize()
	if nTeamSize ~= 2 then
		Msg2Player("Xin h·y duy tr× 2 ng­êi cïng ®éi ngò")
		return 0
	end
	
	local szPlayerName = NPC_DATA[nNpcIdx]
	local nTreeOwner = SearchPlayer(szPlayerName)
	if nTreeOwner < 0 then
		return 0
	end
	
	local nPlayer1Idx = GetTeamMember(1)
	local nPlayer2Idx = GetTeamMember(2)
	
	if nTreeOwner ~= nPlayer1Idx and nTreeOwner ~= nPlayer2Idx then
		lib:ShowMessage("Xin h·y ®¶m b¶o chñ nh©n trång c©y ®ang ë trong tæ ®éi!")
		return 0
	end
	
	local szBelongPlayerName = NPC_DATA[nNpcIdx]
	
	local nBelongPlayerIdx = SearchPlayer(szBelongPlayerName)
	if nBelongPlayerIdx < 0 then
		return 0
	end
	
	if szBelongPlayerName == GetName() then
		Msg2Player("Xin h·y mêi ng­êi cã duyªn hoÆc phèi ngÉu cña ng­¬i ®Õn hoµn thµnh nhiÖm vô!")
		return 0
	end
	
	
	local szLoverName = DynamicExecuteByPlayer(nBelongPlayerIdx, "", "GetMateName")
	local szCurPlayerName = GetName()
	if szCurPlayerName == szLoverName then
		return 1
	else
		
		local nPlayer1Sex = DynamicExecuteByPlayer(nPlayer1Idx, "", "GetSex")
		local nPlayer2Sex = DynamicExecuteByPlayer(nPlayer2Idx, "", "GetSex")
		if (nPlayer1Sex + nPlayer2Sex ~= 1) or (nPlayer1Sex * nPlayer2Sex ~= 0) then
			lib:ShowMessage("CÇn ph¶i nam n÷ tæ ®éi víi nhau míi cã thÓ lµm nhiÖm vô")
			return 0
		end
		
		local nFlag1 = CallPlayerFunction(nPlayer1Idx, PlayerFunLib.CheckItemInBag, PlayerFunLib, {tbProp={6,1,2696,1,0,0},}, 1, "")
	 	if nFlag1 ~= 1 then
			lib:ShowMessage("Xin h·y x¸c nhËn ng­êi cã duyªn víi ng­¬i còng cã D©y Hång råi h·y ®Õn lµm nhiÖm vô!")
			return 0
		end
		
		local nFlag2 = CallPlayerFunction(nPlayer2Idx, PlayerFunLib.CheckItemInBag, PlayerFunLib, {tbProp={6,1,2696,1,0,0},}, 1, "")
	 	if nFlag2 ~= 1 then
			lib:ShowMessage("Xin h·y x¸c nhËn ng­êi cã duyªn víi ng­¬i còng cã D©y Hång råi h·y ®Õn lµm nhiÖm vô!")
			return 0
		end
		
		local nValentinePlayerIdx = ((nPlayer1Idx == nBelongPlayerIdx) and nPlayer2Idx or nPlayer1Idx)
		local nOwnerNumber = DynamicExecuteByPlayer(nBelongPlayerIdx, "", "pActivity.TaskGroup:GetTask", TASK_VALENTINENUMBER)
		local nValentinePlayerNumber = DynamicExecuteByPlayer(nValentinePlayerIdx, "", "pActivity.TaskGroup:GetTask", TASK_VALENTINENUMBER)
		if NumberIsEven(nValentinePlayerNumber + nOwnerNumber) ~= 1 then
			Msg2Player("Ng­¬i kh«ng ph¶i lµ nh©n duyªn hoÆc phèi ngÉu cña chñ nh©n c©y nµy!")
			return 0
		end
		return 1
	end
	
	return 0
end

function CheckGetAwardBelong(nNpcIdx)
	
	if CheckValentineLevel() ~= 1 then
		return 0
	end
	
	local szBelongPlayerIdx = NPC_DATA[nNpcIdx]
	if szBelongPlayerIdx ~= GetName() then
		Msg2Player("§©y kh«ng ph¶i lµ c©y cña b¹n")
		return 0
	end
	return 1
end