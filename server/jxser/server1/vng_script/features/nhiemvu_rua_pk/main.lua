Include("\\script\\lib\\log.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\misc\\eventsys\\type\\npc.lua")
Include("\\script\\dailogsys\\dailogsay.lua")

Include("\\vng_script\\features\\nhiemvu_rua_pk\\head.lua")

function tbVngRuaPK:main()	
	local OldPlayerIdx = PlayerIndex
	DynamicExecuteByPlayer(PlayerIndex, "\\vng_script\\vng_lib\\reset_daily_task.lua", "tbCheckTaskDaily2ReSet:OnLogin", 0)
	PlayerIndex = OldPlayerIdx
	local szMsg = format("<npc>\n<color=yellow>Nh×n ng­¬i ®»ng ®»ng s¸t khÝ t×m ta cã viÖc g×?.<color>\n\n")
	if tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID) > 0 then
		local nID = tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID)
		szMsg = szMsg..format("HiÖn t¹i ng­¬i ®ang nhËn nhiÖm vô t×m 1 c¸i: <color=yellow>%s<color> vÒ ®©y cho ta.",tbVngRuaPK.tbItemQuest[nID].szName)
	end
	local tbOpt = {}	
	tinsert(tbOpt, {format("NhËn nhiÖm vô gi¶m pk"), self.AddQuestPK, {self}})
	tinsert(tbOpt, {format("Tr¶ nhiÖm vô"), self.Complete_QuestPK_UI, {self}})	
	tinsert(tbOpt, {format("Hñy nhiÖm vô"), self.Cancel_QuestPK, {self}})	
	tinsert(tbOpt, {"Hñy bá "})
	CreateNewSayEx(szMsg, tbOpt)
end
--nhan nhiem vu
function tbVngRuaPK:AddQuestPK()	
	if GetLevel() < 50 then 
		Talk(1,"","ChØ míi ra giang hå  ®· tËp thãi s¸t nh©n. Ta sÏ ®i b¸o quan ngay lËp tøc.")
		return
	end
	if GetPK() <= 0  then
		Talk(1,"","Ng­¬i lµ ng­êi tèt, kh«ng cÇn ph¶i gÆp ta. Cø thÕ mµ ph¸t huy.")
		return
	end
	local nCurTime = GetCurServerTime()
	local nLastTime = GetTask(self.TASK_TIME)
	if (nCurTime - nLastTime) <  self.WAIT_TIME then
		local nWaitM = (floor((self.WAIT_TIME -(nCurTime - nLastTime))/60))
		local nWaitS = mod(self.WAIT_TIME -(nCurTime - nLastTime),60)		
		Talk(1,"",format("Sau khi hñy 15 phót ng­¬i míi cã thÓ nhËn nhiÖm vô tiÕp ®­îc. Cßn ph¶i ®îi <color=yellow>%dph:%ds<color> n÷a",nWaitM,nWaitS))
		return
	end		
	if  tbVNG_BitTask_Lib:getBitTask(self.BITTASK_NUM_QUEST) >= 20 then
		Talk(1,"","Mçi ngµy ng­¬i chØ nhËn ®­îc 20 nhiÖm vô. H«m nµy ®· nhËn råi.")
		return
	end	
	if  tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID) > 0 then
		Talk(1,"","Ch¼ng ph¶i ng­êi ®ang cã nhiÖm vô råi ®ã sao.")
		return
	end
	local nQuestID = random(1,20)
	local tbQuestInfo = self.tbItemQuest[nQuestID]
	local szQuestName = tbQuestInfo.szName	
	tbVNG_BitTask_Lib:setBitTask(self.BITTASK_QUEST_ID, nQuestID)
	tbVNG_BitTask_Lib:addTask(self.BITTASK_NUM_QUEST, 1)
	Talk(1,"",format("NhËn ®­îc nhiÖm vô ®i t×m 1 c¸i: <color=yellow>%s<color> vÒ ®©y cho ta.",szQuestName))
	return
end
--Hoan thanh nhiem vu
function tbVngRuaPK:Complete_QuestPK_UI()
	local nQuestID = tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID)
	if not nQuestID or nQuestID <= 0 then
		Talk(1,"",format("HiÖn t¹i ng­¬i kh«ng cã nhiÖm vô."))
		return
	end	
	local strDesc = "VËt phÈm ta yªu cÇu, ng­êi ®· kiÕm ®­îc ch­a? §©u ®­a ta xem."	
	g_GiveItemUI("Nép vËt phÈm", strDesc, {self.Complete_QuestPK, {self}}, nil, 1)
end
function tbVngRuaPK:Complete_QuestPK(nCount)
	if (nCount ~= 1) then 
		Talk(1, "", "Mçi lÇn chØ cã thÓ bá vµo ®­îc mét vËt phÈm!!!")
		return
	end
	local nQuestID = tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID)
	if not nQuestID or nQuestID <= 0 then
		Talk(1,"",format("HiÖn t¹i ng­¬i kh«ng cã nhiÖm vô."))
		return
	end
	
	local tbQuestInfo = self.tbItemQuest[nQuestID]
	local nItemIndex = GetGiveItemUnit(nCount)	
	local tbProp = self:Pack(GetItemProp(nItemIndex))
	local tbPropNeed = tbQuestInfo.tbProp
	if self:Check_ItemComplete_QuestPK(tbProp,tbPropNeed) ~= 1 then		
		return Talk(1,"",format("VËt phÈm ng­¬i bá vµo kh«ng ®óng yªu cÇu, khi nµo t×m ®­îc råi quay l¹i."))
	end
	local CurPKval = GetPK()
	if CurPKval > 0 then
		tbVNG_BitTask_Lib:setBitTask(self.BITTASK_QUEST_ID, 0)	 		
		SetTask(self.TASK_TIME,0)
		RemoveItemByIndex(nItemIndex)
		SetPK(CurPKval-1)
		Msg2Player("Hoµn thµnh nhiÖm vô vµ gi¶m ®­îc 1®iÓm pk.")
		return Talk(1,"",format("Hoµn thµnh nhiÖm vô vµ gi¶m ®­îc 1 ®iÓm pk."))
	end	
end
function tbVngRuaPK:Check_ItemComplete_QuestPK(tbPropHave,tbPropNeed)
	local nCheck = 1
	for i=1, 4 do		
		if tbPropHave[i] ~= tbPropNeed[i] then
			nCheck = 0
			break
		end	
	end
	return nCheck
end
--Huy nhiem vu
function tbVngRuaPK:Cancel_QuestPK()
	local nQuestID = tbVNG_BitTask_Lib:getBitTask(self.BITTASK_QUEST_ID)
	if not nQuestID or nQuestID <= 0 then
		Talk(1,"",format("HiÖn t¹i ng­¬i kh«ng cã nhiÖm vô."))
		return
	end
	tbVNG_BitTask_Lib:setBitTask(self.BITTASK_QUEST_ID, 0)	 
	 local nCurTime = GetCurServerTime()
	SetTask(self.TASK_TIME,nCurTime)
	Msg2Player("Ng­¬i ®· hñy nhiÖm vô lÇn nµy, 15 phót sau míi nhËn l¹i ®­îc tiÕp.")
end

function tbVngRuaPK:Pack(...)
	return arg
end
EventSys:GetType("AddNpcOption"):Reg("TÜnh T©m §¹i S­","NhiÖm vô gi¶m PK", tbVngRuaPK.main,{tbVngRuaPK})


