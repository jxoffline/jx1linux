Include("\\vng_script\\activitysys\\config\\1032_questdaily\\head.lua")
Include("\\vng_script\\activitysys\\config\\1032_questdaily\\variables.lua")
Include("\\vng_script\\features\\quest_daily\\mainfuc.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\log.lua")

pActivity.nPak = curpack()

function pActivity:AddNumKillNPC(nNpcIndex)
	local nSettingIdx = GetNpcSettingIdx(nNpcIndex)
	local nTeamSize = GetTeamSize()	
	local nCurTask = tbQuestDaily.TASK_ID_MAP_KILL_NPC
	local szNpcName = GetNpcName(nNpcIndex)
	--khong co to doi danh quai
	if nTeamSize == 0 then
		local nCheck = self:CheckInMapQuestDaily(nNpcIndex)
		if nCheck == 1 then			
			tbVNG_BitTask_Lib:addTask(nCurTask, 1)			
			self:ReportNumKill(szNpcName)		
		end
		return
	end
	--to doi danh quai
	local oldPlayer = PlayerIndex	
	for i = 1, nTeamSize do		
		local nplayer = GetTeamMember(i)		
		PlayerIndex = nplayer	
		local nCheck = self:CheckInMapQuestDaily(nNpcIndex)
		if nCheck == 1 then			
			tbVNG_BitTask_Lib:addTask(nCurTask, 1)
			self:ReportNumKill(szNpcName)		
		end
	end
	PlayerIndex = oldPlayer
end
--thong bao so luong quai da tieu diet
function pActivity:ReportNumKill(szNpcName)
	local nCount = tbVNG_BitTask_Lib:getBitTask(tbQuestDaily.TASK_ID_MAP_KILL_NPC)
	if mod(nCount,10) == 0 then		
		Msg2Player(format("SË l≠Óng Æ∑ ti™u di÷t: <color=yellow>%d / 300<color>",nCount))
	end
end
--Ki”m tra nhi÷m vÙ n’u c„ mÌi ki”m tra map
function pActivity:CheckInMapQuestDaily(nNpcIndex)	
	--Ki”m tra level	
	if (GetLevel() < 110) then
		return
	end
	--Ki”m tra nhi÷m vÙ nhÀn vµ nhi÷m vÙ c„ th” nhÀn c„ giËng nhau kh´ng
	local nCurQuestID, nStateQ =  tbQuestDaily:CheckStateQuest()
	if not nCurQuestID or nStateQ ~= 1 then
		return
	end	
	--Ki”m tra Npc c„ ÆÛng tr™n map ch≠a
	local tbQuestInfo = tbQuestDaily:GetQuestInfo(nCurQuestID)	
	local nCurNpcID = GetNpcSettingIdx(nNpcIndex)		
	if nCurNpcID ~= tbQuestInfo.nNpcID then
		return
	end	
	if (NpcFunLib:CheckInMap(tbQuestInfo.szMapList,nNpcIndex) ~= 1) then
		return
	end
	--Ki”m tra Task id Æ∑ full ch≠a
	local nCurTask = tbQuestDaily.TASK_ID_MAP_KILL_NPC
	if tbVNG_BitTask_Lib:isMaxBitTaskValue(nCurTask) == 1 then
		return
	end	
	return 1	
end

