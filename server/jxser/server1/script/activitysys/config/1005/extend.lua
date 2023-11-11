Include("\\script\\activitysys\\config\\1005\\head.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
Include("\\script\\lib\\awardtemplet.lua")
IncludeLib("SETTING")
Include("\\script\\activitysys\\config\\1005\\check_func.lua")


function pActivity:CheckMaxBitTaskValue(tbBitTask)
	if %tbPVLB_Check:IsNewPlayer() ~= 1 then
		return
	end
	if tbVNG_BitTask_Lib:isMaxBitTaskValue(tbBitTask) == 1 then
		return nil
	end
	return 1
end

function pActivity:CheckNewPlayer()
	if %tbPVLB_Check:IsNewPlayer() ~= 1 then
		return nil
	end
	return 1
end
--Reset c¸c bit cña nh÷ng nhiÖm vô ®· bá
function pActivity:PlayerOnLogin()
	if tbVNG_BitTask_Lib:getBitTask(%tbBITTASK_RESET_TASK_NOT_IN_USE) == 1 then
		return
	end
	tbVNG_BitTask_Lib:setBitTask(%tbBITTASK_RESET_TASK_NOT_IN_USE, 1)
	--Bang héi tiÕp nhËn t©n thñ
	SetTask(3097, 0) --reset nhËn th­ëng ngµy
	SetTask(3096, 0)--exp ®· nhËn
	tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_DONATE_ITEM_LIMIT, 0)--nép t©n thñ lÖnh
	--phÇn th­ëng ®¹t mèc lv
	for i = 9, 20 do
		tbVNG_BitTask_Lib:setBitTask({nTaskID = 3098,nStartBit =  i,nBitCount = 1,nMaxValue = 1}, 0)
	end
	--reset task l­u nhiÖm vô ®ang tiÕn hµnh
	tbVNG_BitTask_Lib:setBitTask(%tbBITTASK_QUEST_ON_PROCCESS, 0)
	
	SetBitTask(3098, 5, 1, 0)
	SetBitTask(3098, 6, 1, 0)
	SetBitTask(3098, 7, 1, 0)
	
	--c¸c task nhiÖm vô
	local tb = {
		{3087,6},
		{3087,7},
		{3087,8},
		{3087,9},
		{3087,10},
		{3087,11},
		{3087,12},
		{3087,13},
		{3087,14},
		{3087,15},
		{3087,16},
		{3087,17},
		{3087,18},
		{3087,19},
		{3087,20},
		{3087,21},
		{3087,22},
		{3087,23},
		{3087,24},
		{3087,25},
		{3087,26},
		{3087,27},
		{3087,28},
		{3087,29},
		{3087,30},
		{3089,25},
		{3089,26},
		{3089,27},
		{3089,28},
		{3089,29},
		{3089,30},
		{3098,21},
		{3098,22},
		{3098,23},
		{3098,24},
		{3098,25},
		{3098,26},
		{3098,27},
		{3098,28},
		{3098,29},
		{3098,30},
		{3083,1},
		{3083,2},
		{3083,3},
		{3083,4},
		{3083,5},
		{3083,6},
		{3083,7},
		{3083,8},
		{3083,9},
		{3083,10},
		{3083,11},
		{3083,12},
		{3083,13},
		{3083,14},
		{3083,15},
		{3083,16},
		{3083,17},
		{3083,18},
		{3083,19},
		{3083,20},
		{3083,21},
		{3083,22},
		{3083,23},
		{3083,24},
		{3083,25},
		{3083,26},
		{3083,27},
		{3083,28},
		{3083,29},
		{3083,30},
		{3085,1},
		{3085,2},
		{3085,3},
	}
	for i = 1, getn(tb) do
		local tbTmpBitTsk = {nTaskID = tb[i][1],nStartBit =  tb[i][2],nBitCount = 1,nMaxValue = 1}
		tbVNG_BitTask_Lib:setBitTask(tbTmpBitTsk, 0)
	end
end

--auto completion quest
function pActivity:CanAutoFinishQuest(nQuestType)
--reset task
	local nCurDate = tonumber(GetLocalDate("%y%m%d"))
	local nLastDate = tbVNG_BitTask_Lib:getBitTask(%tbBITTSK_AUTO_COMPLETE_QUEST_RECORD_DATE)
	if nCurDate ~= nLastDate then
		tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_AUTO_COMPLETE_QUEST_RECORD_DATE, nCurDate)
		tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_1, 0)
		tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_2, 0)
		tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_3, 0)
		tbVNG_BitTask_Lib:setBitTask(%tbBITTSK_AUTO_COMPLETE_QUEST_ITEM_4, 0)
	end	
	
	local nCheckQuest = DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\1005\\personal_quest.lua", "tbPVLB_Quest:AutoQuest_Check", nQuestType)
	 return nCheckQuest
end

function pActivity:AutoFinishQuest(nQuestType)
	DynamicExecuteByPlayer(PlayerIndex, "\\script\\activitysys\\config\\1005\\personal_quest.lua", "tbPVLB_Quest:AutoQuest_UseItem", nQuestType)
end