Include("\\script\\lib\\common.lua")
Include("\\script\\misc\\taskmanager.lua");
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\lib\\awardtemplet.lua")
Include("\\script\\global\\judgeoffline_limit.lua");
Include("\\script\\event\\jiefang_jieri\\201004\\main.lua")

function FreedomEvent2010:UsePlantTool(nIdx, szTool)
	if (nIdx > 0) then
		local tree = FreedomTreeList2010:FindNpc(nIdx)
		if (tree) then
			tree:UsePlantTool(szTool);
		end
	end
end

function FreedomEvent2010:GetTreeAward(nIdx)
	if (nIdx > 0) then
		local tree = FreedomTreeList2010:FindNpc(nIdx)
		if (tree) then
			tree:GetAward();
		end
	end
end

--------------------NpcList--------------------
NpcList = {
	m_List = {}
}

function NpcList:AddNpc(index, npc)
	self.m_List[index] = npc
end

function NpcList:DelNpc(index)
	local npc = self.m_List[index]
	if (npc) then
		self.m_List[index] = nil
	end
end

function NpcList:FindNpc(index)
	return self.m_List[index]
end

FreedomTreeList2010 = clone(NpcList)

--------------------Tree--------------------
FreedomTree2010 = {}
FreedomTree2010.AWARD_SCORE = 304;
FreedomTree2010.PLANT_TOOL = 
{
	["Tói Ph©n Bãn"] = {prop={6, 1, 2295}, scoreOp="*2"},
	["Thïng N­íc"] = {prop={6, 1, 2296}, scoreOp="+2"},
	["Thuèc Trõ S©u"] = {prop={6, 1, 2297}, scoreOp="-2"},
}

function FreedomTree2010:Timeout()
	if (self.m_NpcIndex > 0) then
		DelNpc(self.m_NpcIndex);
		FreedomTreeList2010:DelNpc(self.m_NpcIndex);
		self.m_NpcIndex = 0;
	end
end

function FreedomTree2010:Dialog()
	local szPlayer = GetName();
	local tbSay = {};
	if (szPlayer ~= self.m_Owner) then
		tbSay[1] = format("<color=yellow>%s<color> trång <color=green>%s<color>. <color=red> Chµo mõng ngµy ®Êt n­íc ®­îc gi¶i phãng!<color>",
											self.m_Owner, self.m_TreeType);
	else
		tbSay[1] = format("Ng­¬i ®·  trång <color=green>%s<color> vµ ®· nhËn ®­îc <color=green>%d<color> ®iÓm. Khi nµo ®iÓm tÝch lòy b»ng <color=green>%d<color> th× cã thÓ nhËn th­ëng ®­îc råi!",
											self.m_TreeType, self.m_Score, self.AWARD_SCORE);
		if (self.m_bAward == 0) then
			if (self.m_Score ~= self.AWARD_SCORE) then
				tinsert(tbSay, format("Bãn ph©n (§iÓm tÝch lòy hiÖn t¹i gÊp 2 lÇn)/#FreedomEvent2010:UsePlantTool(%d,'%s')",self.m_NpcIndex, "Tói Ph©n Bãn"))
				tinsert(tbSay, format("T­íi n­íc (§iÓm tÝch lòy hiÖn t¹i céng 2 lÇn)/#FreedomEvent2010:UsePlantTool(%d,'%s')",self.m_NpcIndex, "Thïng N­íc"))
				tinsert(tbSay, format("GiÕt s©u bä (§iÓm tÝch lòy hiÖn t¹i trõ 2 lÇn)/#FreedomEvent2010:UsePlantTool(%d,'%s')",self.m_NpcIndex, "Thuèc Trõ S©u"))
			else
				tinsert(tbSay, format("Ta muèn nhËn th­ëng/#FreedomEvent2010:GetTreeAward(%d)",self.m_NpcIndex))
			end
		end

	end
	
	tinsert(tbSay, "Rêi khái/OnExit");
	CreateTaskSay(tbSay);
end

function FreedomTree2010:GetAward()
		tbAwardTemplet:GiveAwardByList(self.m_tbAward, format("Ho¹t ®éng ­¬m mÇm hµnh phóc \tPhÇn th­ëng %s", self.m_TreeType));
		self.m_bAward = 1;
end

function FreedomTree2010:GetScore()
	return self.m_Score;
end

function FreedomTree2010:AddScore(nScore)
		self.m_Score = self.m_Score + nScore;
end

function FreedomTree2010:SetScore(nScore)
		self.m_Score = nScore;
end

function FreedomTree2010:UsePlantTool(szTool)
	local tbTool = self.PLANT_TOOL[szTool];
	if (tbTool) then
		if ConsumeEquiproomItem(1,tbTool.prop[1], tbTool.prop[2], tbTool.prop[3], -1) == 1 then
			self:SetScore(dostring(format("return %d%s", self.m_Score,tbTool.scoreOp)));
			Talk(1, "", format("Ng­¬i ®·  trång <color=green>%s<color> vµ ®· nhËn ®­îc <color=green>%d<color> ®iÓm. Khi nµo ®iÓm tÝch lòy b»ng <color=green>%d<color> th× cã thÓ nhËn th­ëng ®­îc råi!",
											self.m_TreeType, self.m_Score, self.AWARD_SCORE));
		else
			Talk(1, "", format("H×nh nh­ c¸c h¹ quªn ®em <color=yellow>%s<color>!",szTool));
		end
	end
end

function OnTreeTimeout(index, id)
	local tree = FreedomTreeList2010:FindNpc(index)
	if (tree) then
		tree:Timeout();
	end
	return 0;
end
--------------------PlantTreeTask--------------------
tbPlantTree_TaskGroup = TaskManager:Create(5, 1);
tbPlantTree_TaskGroup.TSK_USE_SEED_DATE = 1;
tbPlantTree_TaskGroup.TSK_USE_SEED_COUNT = 2;

function tbPlantTree_TaskGroup:ResetTaskForDay()
	local nCurDate = tonumber(GetLocalDate("%Y%m%d"))
	if self:GetTask(self.TSK_USE_SEED_DATE) ~= nCurDate then
		self:SetTask(self.TSK_USE_SEED_DATE, nCurDate)
		self:SetTask(self.TSK_USE_SEED_COUNT, 0)
	end
end

function tbPlantTree_TaskGroup:GetPlantCount()
	self:ResetTaskForDay()
	return self:GetTask(self.TSK_USE_SEED_COUNT)
end

function tbPlantTree_TaskGroup:SetPlantCount(nCount)
	self:ResetTaskForDay()
	return self:SetTask(self.TSK_USE_SEED_COUNT, nCount)
end

function tbPlantTree_TaskGroup:AddPlantCount(nCount)
	self:ResetTaskForDay()
	return self:AddTask(self.TSK_USE_SEED_COUNT, nCount)
end

--------------------Seed--------------------
FreedomSeed2010 = {}
FreedomSeed2010.EVENT_START_DATE = 20100426
FreedomSeed2010.EVENT_END_DATE 	= 20100531
FreedomSeed2010.USE_MINLEVEL 	= 50
FreedomSeed2010.USE_CHARGED 	= 1
FreedomSeed2010.USE_DAILY_LIMIT 	= 4
FreedomSeed2010.TREE_TIME_LIMIT 	= 15*60 -- µ¥Î»Ãë
FreedomSeed2010.SCRIPT_TREEDLG = "\\script\\event\\jiefang_jieri\\201004\\plant\\tree.lua"
FreedomSeed2010.DAILY_TIME_LIMIT =
{
	{1300,1600},
	{1830,2130},
}

FreedomSeed2010.TREE_TEMPLET = 
{
	{1552, "Thiªn TuÕ An Lµnh"},
	{1551, "Thiªn TuÕ Hßa B×nh"},
	{1550, "Thiªn TuÕ §éc LËp"},
	{1555, "Thiªn TuÕ Tù Do"},
	{1554, "Thiªn TuÕ H¹nh Phóc"},
	{1553, "Thiªn TuÕ ThÞnh V­îng"},
}

FreedomSeed2010.tbTreeRate = {
	[1]	= 20,
	[2] = 20,
	[3] = 20,
	[4] = 20,
	[5] = 10,
	[6] = 10,
}

FreedomSeed2010.tbAward = 
{
	{nExp=5000000},
	{nExp=10000000},
	{nExp=20000000},
	{nExp=30000000},
	{nExp=40000000},
	{nExp=300000000},
}
FreedomSeed2010.tbBaseScoreRate = {
	[1]	= 3,
	[2] = 3,
	[3] = 3,
	[4] = 3,
	[5] = 3,
	[6] = 3,
	[7]	= 3,
	[8] = 3,
	[9] = 3,
	[10] = 3,
	[11] = 3,
	[12] = 3,
	[13] = 3,
	[14] = 3,
	[15] = 3,
	[16] = 3,
	[17] = 3,
	[18] = 2,
	[19] = 2,
	[20] = 3,
	[21] = 3,
	[22] = 3,
	[23] = 3,
	[24] = 3,
	[25] = 3,
	[26] = 3,
	[27] = 3,
	[28] = 3,
	[29] = 3,
	[30] = 3,
	[31] = 3,
	[32] = 3,
	[33] = 3,
	[34] = 3,
}

function FreedomSeed2010:CheckTime(now)
	if (now >= self.EVENT_END_DATE or now < self.EVENT_START_DATE) then
		return 0;
	end
	return 1;
end

function FreedomSeed2010:IsCityTongMap(dwMapID)
	if (dwMapID == 11 or 
		dwMapID == 1 or 
		dwMapID == 37 or 
		dwMapID == 176 or 
		dwMapID == 78 or 
		dwMapID == 80 or 
		dwMapID == 162 or 
		dwMapID == 174 or 
		dwMapID == 121 or 
		dwMapID == 153 or 
		dwMapID == 101 or 
		dwMapID == 99 or 
		dwMapID == 100 or 
		dwMapID == 20 or 
		dwMapID == 53 or 
		dwMapID == 54 or 
		dwMapID == 175 or 
		dwMapID == 55) then
			
		return 1
	end
	
	return 0;
end

function FreedomSeed2010:CheckLimit()
	local now = tonumber(GetLocalDate("%H%M"));
	local bInTime = 0;
	for i=1,getn(self.DAILY_TIME_LIMIT) do
		if (self.DAILY_TIME_LIMIT[i][1] <= now and now <= self.DAILY_TIME_LIMIT[i][2]) then
			bInTime = 1;
			break;
		end
	end
	
	if (bInTime ~= 1) then
		Talk(1, "","Ho¹t ®éng b¾t ®Çu vµo mçi ngµy tõ 13:00 ®Õn 16:00, 18:30 ®Õn 21:30.");
		return 0;
	end
	
	if (offlineCheckPermitRegion() ~= 1 or self:IsCityTongMap(SubWorldIdx2ID(SubWorld)) ~= 1 or GetFightState() ~= 0) then
		Talk(1, "","Kh«ng ®­îc sö dông vËt phÈm nµy t¹i ®©y");
		return 0;
	end
	
	local nDailyUse = tbPlantTree_TaskGroup:GetPlantCount();
	if (PlayerFunLib:CheckLevel(self.USE_MINLEVEL, "default", ">=") == 1 and
			(self.USE_CHARGED ~= 1 or PlayerFunLib:IsCharged("default"))) then
			
			if (nDailyUse < self.USE_DAILY_LIMIT) then
				if (GetFightState() > 0) then
					Talk(1, "", "Khu vùc thµnh thÞ th«n trÊn phi chiÕn ®Êu míi cã thÓ sö dông");
				else
					return 1;
				end
			else
				Talk(1, "", format("Mçi ngµy mçi nh©n vËt chØ ®­îc sö dông %d lÇn", self.USE_DAILY_LIMIT));
			end
	end
	
	return 0;
end

function FreedomSeed2010:GetPos()
	local _, x, y = GetWorldPos()
	local map = SubWorld
	x = x * 32
	y = y * 32
	return map, x, y
end

function FreedomSeed2010:CreateTree(szOwner)
	local map, x, y = self:GetPos()
	local nTreeType = random_range(self.tbTreeRate);
	local nNpcIdx = AddNpc(self.TREE_TEMPLET[nTreeType][1], 1, map, x, y, 1, format("%s,%s",self.TREE_TEMPLET[nTreeType][2],szOwner))
	if (nNpcIdx <= 0) then
		return 0;
	else
		if (nTreeType == 6) then
			LG_ApplyDoScript(1, "", "", "\script\event\msg2allworld.lua", "battle_msg2allworld", 
			format("Chóc mõng <color=yellow>%s<color> ®· trång ®­îc <color=yellow>%s<color>",szOwner,self.TREE_TEMPLET[nTreeType][2]), "", "");
		end
		WriteLog(format("[Ho¹t ®éng ­¬m mÇm h¹nh phóc \tSö dông %s]\t%s\t%s\t%s","H¹t Thiªn TuÕ",GetAccount(),GetName(),self.TREE_TEMPLET[nTreeType][2]));
		SetNpcScript(nNpcIdx, self.SCRIPT_TREEDLG)
		local tbTree = clone(FreedomTree2010)
		tbTree.m_TreeType = self.TREE_TEMPLET[nTreeType][2];
		tbTree.m_Owner = szOwner			-- ËùÓÐÕß
		tbTree.m_NpcIndex = nNpcIdx		-- NPCË÷Òý
		tbTree.m_Score = random_range(self.tbBaseScoreRate);
		tbTree.m_tbAward = self.tbAward[nTreeType];
		tbTree.m_bAward = 0;
		tbTree.m_TimerId = AddTimer(self.TREE_TIME_LIMIT * 18, "OnTreeTimeout", nNpcIdx)
		FreedomTreeList2010:AddNpc(nNpcIdx, tbTree)
		return nNpcIdx;
	end
end

function FreedomSeed2010:Use()
	local szOwner = GetName();
	if (self:CheckLimit() == 1) then
		local nIdx = self:CreateTree(szOwner);
		if (nIdx > 0) then
			tbPlantTree_TaskGroup:AddPlantCount(1);
			return 1;
		end
	end
	return 0;
end

function OnExit()

end;