Include("\\script\\activitysys\\config\\1005\\check_func.lua")
Include("\\script\\vng_lib\\bittask_lib.lua")
IncludeLib("SETTING")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\vng_feature\\checkinmap.lua")
Include("\\script\\vng_lib\\VngTransLog.lua")
Include("\\script\\vng_lib\\files_lib.lua")
Include("\\script\\global\\autoexec_head.lua")
tbPVLB_Quest = {}

tbPVLB_Quest.tbQuest = {}

tbPVLB_Quest.tbQuestName = {
	[1] = "Hoµn thµnh NV D· TÈu",
	[2] = "NV Vâ L©m Minh Chñ",
	[3] ="Tiªu diÖt boss s¸t thñ 90" ,
	[4] = "V­ît qua ¶i 10",
	[5] = "Tèng Kim 500 ®iÓm",
	[6] = "NV thu thËp Truy C«ng LÖnh",
	[7] = "V­ît ¶i 3 Viªm §Õ",
	[8] = "NhiÖm vô Trång C©y",	
}

tbPVLB_Quest.tbTSK_QuestCount = {
	[1] = tbBITTASK_YESOU_QUEST_COUNT,
	[2] = tbBITTASK_VLMC_QUEST_COUNT,
	[3] =tbBITTASK_KILLER_BOSS_QUEST_COUNT,
	[4] = tbBITTASK_COT_QUEST_COUNT,
	[5] = tbBITTASK_SONGJIN_QUEST_COUNT,
	[6] = tbBITTASK_FLD_QUEST_COUNT,
	[7] = tbBITTASK_YDBZ_QUEST_COUNT,
	[8] = tbBITTASK_TREE_QUEST_COUNT,	
}

tbPVLB_Quest.tbItemAwardList = {
	[1] = {
		{szName="M¶nh b¶n ®å s¬n hµ x· t¾c (1000 m¶nh)",tbProp={6,1,2514,1,0,0},nCount=1,nBindState=-2},
	},
	[2] = {
		{szName="NhÊt Kû Cµn Kh«n Phï",tbProp={6,1,2126,1,0,0},nCount=1,nBindState=-2,nExpiredTime=201600},
		{szName="B«n Tiªu",tbProp={0,10,6,1,0,0},nCount=1,nExpiredTime=86400,nBindState=-2},
		{szName="Håi thµnh phï (lín) ",tbProp={6,1,1083,1,0,0},nCount=1,nBindState=-2,nExpiredTime=86400},
		{szName="BÝ quyÕt kü n¨ng cÊp 120",tbProp={6,1,1125,1,0,0},nCount=1,nBindState=-2,nExpiredTime=20160},
		{szName="Phi phong Kinh L«i (X¸c suÊt hãa gi¶i s¸t th­¬ng)",tbProp={0,3471},nCount=1,nQuality = 1,nBindState=-2,nExpiredTime=43200,},
		{szName="Phong V©n Chiªu Binh LÖnh",tbProp={6,1,30083,1,0,0},nCount=10,nBindState=-2,nExpiredTime=43200},
		{szName = "Cöu niªn trïng phïng lÖnh bµi - Kim ¤ B¶o R­¬ng", tbProp={6,1,30281,1,0,0}, nCount = 1, nBindState = -2,tbParam = {11,0,0,0,0,86400}, nExpiredTime=10080},
		{szName="ThiÕu L©m BÝ KÝp",tbProp={6,1,2959,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="Thiªn V­¬ng BÝ KÝp",tbProp={6,1,2960,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="§­êng M«n BÝ KÝp ",tbProp={6,1,2961,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="Ngò §éc BÝ KÝp",tbProp={6,1,2962,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="Nga Mi BÝ KÝp",tbProp={6,1,2963,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="Thóy Yªn BÝ KÝp",tbProp={6,1,2964,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="C¸i Bang BÝ KÝp",tbProp={6,1,2965,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="Thiªn NhÉn BÝ KÝp",tbProp={6,1,2966,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="Vâ §ang BÝ KÝp ",tbProp={6,1,2967,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="C«n L«n BÝ KÝp",tbProp={6,1,2968,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="§¹i Thµnh BÝ KÝp 90",tbProp={6,1,2424,1,0,0},nCount=1,nBindState=-2,nExpiredTime=2880},
		{szName="S¸t thñ gi¶n CÊp 90",tbProp={6,1,400,90,0,0},nCount=10,nBindState=-2,nExpiredTime=43200},
		{szName="Anh Hïng ThiÕp",tbProp={6,1,1604,1,0,0},nCount=5,nBindState=-2,nExpiredTime=43200},
	},
	[3] = {
		{szName="Ch©n Nguyªn §¬n (tiÓu)",tbProp={6,1,30227,1,0,0},nCount=1000,nBindState=-2,nExpiredTime=43200},
		{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=500,nBindState=-2,nExpiredTime=43200},
	},
	[4] = {		
		{szName = "Cöu niªn trïng phïng lÖnh bµi - B¹ch Hæ B¶o R­¬ng", tbProp={6,1,30282,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
	},
	[5] = {
		{szName = "Cöu niªn trïng phïng lÖnh bµi - B¹ch Hæ B¶o R­¬ng", tbProp={6,1,30282,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080},
		{szName="Ch©n Phong Thñy T¸c NghiÖp",tbProp={6,1,30440,1,0,0},nCount=1,nExpiredTime=86400, nJustNewRole = 1},
	},
	[6] = {
		{szName="Ch©n Nguyªn §¬n (tiÓu)",tbProp={6,1,30227,1,0,0},nCount=2000,nBindState=-2,nExpiredTime=43200},
		{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=1000,nBindState=-2,nExpiredTime=43200},
	},	
	[7] = {
		{szName = "Cöu niªn trïng phïng lÖnh bµi - XÝch L©n B¶o R­¬ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080, nJustNewRole = 1},
	},
	[8] = {
		{szName = "Cöu niªn trïng phïng lÖnh bµi - XÝch L©n B¶o R­¬ng", tbProp={6,1,30388,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,7,0,0,0,0}, nExpiredTime=10080, nJustNewRole = 1},
		{szName="Ch©n Gi¸c Kinh T¸c Vò",tbProp={6,1,30441,1,0,0},nCount=1,nExpiredTime=86400, nJustNewRole = 1},
	},
	[9] = {
		{szName="Ch©n Nguyªn §¬n (tiÓu)",tbProp={6,1,30227,1,0,0},nCount=5000,nBindState=-2,nExpiredTime=43200},
		{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=1000,nBindState=-2,nExpiredTime=43200},
	},
	[10] = {
		{szName = "Cöu niªn trïng phïng lÖnh bµi - B¹ch Hæ B¶o R­¬ng", tbProp={6,1,30282,1,0,0}, nCount = 1, nBindState = -2,tbParam = {0,0,0,0,0,0}, nExpiredTime=10080}
	},
	[11] = {
		{szName="Ch©n Nguyªn §¬n (tiÓu)",tbProp={6,1,30227,1,0,0},nCount=1000,nBindState=-2,nExpiredTime=43200},
		{szName="Hé M¹ch §¬n",tbProp={6,1,3203,1,0,0},nCount=500,nBindState=-2,nExpiredTime=43200},
		{szName = "400 ®iÓm danh väng", nRepute = 400},
	},
}

function LoadQuestOnStart()
	tbPVLB_Quest.tbQuest = {}
	local tbPattern = {}
	for i = 1, 18 do
		tinsert(tbPattern, "*w")
	end
	local tb = tbVngLib_File:TableFromFile("settings/vng/batnienhoingo/", "quest.txt", tbPattern)
	for i = 1, getn(tb) do
		local nQuestID = tonumber(tb[i][1])		
		tbPVLB_Quest.tbQuest[nQuestID] = {}
		local tbQuest = tbPVLB_Quest.tbQuest[nQuestID]
		tbQuest.tbRequirement = {}
		for j = 1, getn(tbPVLB_Quest.tbQuestName) do
			tbQuest.tbRequirement[j] = tonumber(tb[i][j+4])
		end
		tbQuest.tbCondition = {}
		tbQuest.tbCondition.nTS = tonumber(tb[i][2])
		tbQuest.tbCondition.nMinLevel = tonumber(tb[i][3])
		tbQuest.tbCondition.nMaxLevel = tonumber(tb[i][4])
		tbQuest.tbAward = {}
		tbQuest.tbAward.nLevel = tonumber(tb[i][13])
		tbQuest.tbAward.tbItem = {}
		local nTmpExp = tonumber(tb[i][14])
		if nTmpExp then
			tinsert(tbQuest.tbAward.tbItem, {szName = "§iÓm kinh nghiÖm", nExp = nTmpExp, nCount = 1})
		end
		local nMoney = tonumber(tb[i][15])
		if nMoney then
			tinsert(tbQuest.tbAward.tbItem, {szName = "Ng©n l­îng", nJxb = nMoney, nCount = 1})
		end
		local nItemAwardID = tonumber(tb[i][16])
		if nItemAwardID and tbPVLB_Quest.tbItemAwardList[nItemAwardID] then
			for z = 1, getn(tbPVLB_Quest.tbItemAwardList[nItemAwardID]) do
				tinsert(tbQuest.tbAward.tbItem, tbPVLB_Quest.tbItemAwardList[nItemAwardID][z])
			end
		end
		tbQuest.tbBitTask = {nTaskID = tonumber(tb[i][17]),nStartBit = tonumber(tb[i][18]),nBitCount = 1,nMaxValue = 1}
		tbQuest.strLog = "Quest_"..i
	end	
end

function tbPVLB_Quest:GetQuestID()
	local nTransLife = ST_GetTransLifeCount()	
	if nTransLife < 2 or nTransLife >= 5 then
		return nil
	end
	local nLevel = GetLevel()
	local tbCondition = nil
	for i = 1, getn(self.tbQuest) do
		tbCondition = self.tbQuest[i].tbCondition
		if nTransLife == tbCondition.nTS and nLevel >= tbCondition.nMinLevel and nLevel <= tbCondition.nMaxLevel then
			return i			
		end
	end
	return nil
end

--reset sè lÇn tham gia c¸c tÝnh n¨ng tr­íc khi nhËn nhiÖm vô míi
function tbPVLB_Quest:ResetTask()
	for i = 1, getn(self.tbTSK_QuestCount) do
		tbVNG_BitTask_Lib:setBitTask(self.tbTSK_QuestCount[i], 0)
	end	
end

function tbPVLB_Quest:Main()	
	local nCurQuest = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_QUEST_ON_PROCCESS)
	if nCurQuest ~= 0 then
		self:QuestOnProccess(nCurQuest)
	else
		self:HaveNoQuest()
	end	
end

function tbPVLB_Quest:QuestOnProccess(nQuestID)
	local strTittle = "NhiÖm vô ®ang tiÕn hµnh:\n\n"
	local tbOpt = {}
	local tbTempQuest = self.tbQuest[nQuestID]
	local nIsComplete = 1
	local nIsCancel = 0
	if tbTempQuest then
		local tbRequirement = tbTempQuest.tbRequirement
		strTittle = strTittle..format("\t\t\t\t%-30s%s\n", "Yªu cÇu", "T×nh tr¹ng<color=yellow>")
		for i = 1, getn(self.tbQuestName) do
			if tbRequirement[i] then
				local nCurCount = tbVNG_BitTask_Lib:getBitTask(self.tbTSK_QuestCount[i])
				local nRequire = tbRequirement[i]
				local str1 = ""
				local str0 = self.tbQuestName[i]
				if nCurCount >= nRequire then
					nCurCount = nRequire
					str1 = "<color=green>"..nCurCount.."/"..nRequire.."<color>"
				else
					nIsComplete = 0
					str1 = "<color=red>"..nCurCount.."/"..nRequire.."<color>"
				end
				strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0, str1)
			end
		end

		--trïng sinh
		
		local nTransCount = ST_GetTransLifeCount()
		local nTransLifeRequire = tbTempQuest.tbCondition.nTS
		local str1 = ""
		local str0 = "Trïng sinh "
		if nTransCount == nTransLifeRequire then
			nTransCount = nTransLifeRequire
			str1 = "<color=green>§· hoµn thµnh<color>"
		else
			nIsComplete = 0
			nIsCancel = 1
			if nTransCount > nTransLifeRequire then
				str1 = "<color=red>V­ît giíi h¹n<color>"
			else
				str1 = "<color=red>Ch­a hoµn thµnh<color>"
			end
		end
		strTittle = strTittle..format("\t\t\t\t%-30s%s\n", str0..nTransLifeRequire, str1)
			
	end
	if nIsComplete == 1 then
		tinsert(tbOpt, {"Hoµn thµnh nhiÖm vô", tbPVLB_Quest.CompleteQuest, {tbPVLB_Quest, tbTempQuest}})
	else
		if nIsCancel == 1 then
			tinsert(tbOpt, {"Hñy nhiÖm vô", tbPVLB_Quest.CancelQuest, {tbPVLB_Quest, tbTempQuest}})
		end
	end
	tinsert(tbOpt, {"§ãng"})
	CreateNewSayEx(strTittle, tbOpt)
end

function tbPVLB_Quest:HaveNoQuest()
	local strTittle = "NhiÖm vô cã thÓ nhËn:\n\n"
	local tbOpt = {}
	
	local nQuestID = self:GetQuestID()
	--Kh«ng cã nhiÖm vô
	if not nQuestID then
		strTittle = strTittle.."<color=red>\t\t\t\tKh«ng cã nhiÖm vô nµo<color>\n"
	else		
		local tbTempQuest = self.tbQuest[nQuestID]
		if tbTempQuest then
			--®· hoµn thµnh nhiÖm vô
			if tbVNG_BitTask_Lib:getBitTask(tbTempQuest.tbBitTask) == 1 then
				strTittle = strTittle.."\t\t\t\t<color=red>§· hoµn thµnh<color>\n"
			else --ch­a nhËn nhiÖm vô
				strTittle = strTittle..format("\t\t\t\t%-30s%s\n", "Yªu cÇu", "Sè l­îng<color=yellow>")
				--m« t¶ nhiÖm vô
				local tbRequirement = tbTempQuest.tbRequirement
				for i = 1, getn(self.tbQuestName) do
					if tbRequirement[i] then
						strTittle = strTittle..format("\t\t\t\t%-30s%d\n", self.tbQuestName[i], tbRequirement[i])
					end
				end
				--trïng sinh
				strTittle = strTittle..format("\t\t\t\t%-30s%d\n", "Trïng sinh "..tbTempQuest.tbCondition.nTS, 1)
				strTittle = strTittle.."<color>"
				tinsert(tbOpt, {"NhËn nhiÖm vô", tbPVLB_Quest.AcceptQuest, {tbPVLB_Quest, nQuestID}})
			end
		end
	end
	
	tinsert(tbOpt, {"§ãng"})
	CreateNewSayEx(strTittle, tbOpt)
end

function tbPVLB_Quest:AcceptQuest(nID)
	self:ResetTask()
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_QUEST_ON_PROCCESS, nID)
	local tbTempQuest = self.tbQuest[nID]
	tbLog:PlayerActionLog(strLOG_HEAD, "Nhan"..tbTempQuest.strLog)
end

function tbPVLB_Quest:CompleteQuest(tbTempQuest)
	if PlayerFunLib:VnCheckInCity () ~= 1 then		
		return
	end
	if tbTempQuest.tbAward.tbItem and CalcFreeItemCellCount() < 59 then
		Talk(1, "", "Xin h·y dän trèng hµnh trang råi h·y nhËn th­ëng.")
		return
	end	
	tbVNG_BitTask_Lib:setBitTask(tbTempQuest.tbBitTask, 1)
	local nCurQuest = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_QUEST_ON_PROCCESS)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_QUEST_ON_PROCCESS, 0)
	local tbAward = tbTempQuest.tbAward
	local strLog = "HoanThanh"..tbTempQuest.strLog
	if tbAward.nLevel and tbAward.nLevel > GetLevel() then
		ST_LevelUp(tbAward.nLevel - GetLevel())
		tbLog:PlayerActionLog(strLOG_HEAD, strLog, "ThangDangCap: "..GetLevel())
	end	
	if tbAward.tbItem then
		local nIsNewRole = tbPVLB_Check:IsNewRole()				
		for i = 1, getn(tbAward.tbItem) do
			if tbAward.tbItem[i].nJustNewRole == 1 then
				if nIsNewRole == 1 then
					tbAwardTemplet:Give(tbAward.tbItem[i], 1, {strLOG_HEAD, strLog})
				else
					Msg2Player("Kh«ng ph¶i lµ nh©n vËt míi t¹o nªn kh«ng nhËn ®­îc phÇn th­ëng "..tbAward.tbItem[i].szName)
				end
			else
				tbAwardTemplet:Give(tbAward.tbItem[i], 1, {strLOG_HEAD, strLog})
			end
		end		
	end	
end

function tbPVLB_Quest:CancelQuest(tbTempQuest)
	tbVNG_BitTask_Lib:setBitTask(tbBITTASK_QUEST_ON_PROCCESS, 0)
end

function tbPVLB_Quest:AddTreeQuest()
	tbVNG_BitTask_Lib:addTask(tbBITTASK_TREE_QUEST_COUNT, 1)
end

--auto compete quest
function tbPVLB_Quest:AutoQuest_Check(nQuestType)
	if tbPVLB_Check:IsNewPlayer() ~= 1 then
		Talk(1, "", "C¸c h¹ kh«ng tham gia Cöu Niªn Trïng Phïng kh«ng cÇn sö dông vËt phÈm nµy.")
		return nil
	end
	local nCurQuest = tbVNG_BitTask_Lib:getBitTask(tbBITTASK_QUEST_ON_PROCCESS)
	if nCurQuest == 0 then
		Talk(1, "", "Ch­a nhËn nhiÖm vô kh«ng thÓ sö dông vËt phÈm nµy.")
		return nil
	end
	tbCurQuestReq = self.tbQuest[nCurQuest].tbRequirement	
	if not tbCurQuestReq[nQuestType] or tbCurQuestReq[nQuestType] <= tbVNG_BitTask_Lib:getBitTask(self.tbTSK_QuestCount[nQuestType]) then
		Talk(1, "", "HiÖn t¹i kh«ng cÇn sö dông vËt phÈm nµy")
		return nil
	end
	return 1
end

function tbPVLB_Quest:AutoQuest_UseItem(nQuestType)
	tbVNG_BitTask_Lib:addTask(self.tbTSK_QuestCount[nQuestType], 1)
	Msg2Player("Sö dông vËt phÈm thµnh c«ng, sè lÇn "..self.tbQuestName[nQuestType].." hiÖn t¹i lµ "..tbVNG_BitTask_Lib:getBitTask(self.tbTSK_QuestCount[nQuestType]))
end

AutoFunctions:Add(LoadQuestOnStart)