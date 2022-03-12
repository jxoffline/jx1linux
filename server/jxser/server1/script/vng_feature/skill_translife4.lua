IncludeLib("SETTING")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\task\\metempsychosis\\translife_6.lua")
TSK_WEEKLY_SJ = 2716 --Sè trËn tèng kim trong tuÇn
TSK_WEEKLY_COT = 2717 --Sè trËn v­ît ¶i trong tuÇn
WEEKLY_SJ_REQUIRE = 10
WEEKLY_COT_REQUIRE = 6
ITEM_PROP = {6,1,30126}

function main(nItemIdx)
	if tbVnTL4Skill:CheckCondition(4) ~= 1 then
		return 1
	end
	
	local nTransLifeCount = ST_GetTransLifeCount()
	local tbOpt = {}
	if nTransLifeCount >= 4 then
		tinsert(tbOpt, format("%s/#%s","KÜ n¨ng trïng sinh 4", "tbVnTL4Skill:LearnTL4Skill()"))
	end
	
	if nTransLifeCount >= 6 then
		tinsert(tbOpt, format("%s/#%s","KÜ n¨ng trïng sinh 6", "tbVnTL4Skill:LearnTL6Skill()"))
	end
	
	tinsert(tbOpt, format("%s/#%s","Ta kh«ng muèn häc n÷a", "tbVnTL4Skill:Close()"))
	Say("Ng­¬i muèn häc kÜ n¨ng nµo?", getn(tbOpt), tbOpt)
	
	return 1
end

tbVnTL4Skill = {}

function tbVnTL4Skill:Close()
end

function tbVnTL4Skill:CheckCondition(nNeedTLCount)
	local nTransLifeCount = ST_GetTransLifeCount()
	if nTransLifeCount < nNeedTLCount then
		Talk(1, "", format("Trïng sinh %d trë lªn míi cã thÓ sö dông ®¹o cô nµy!", nNeedTLCount))
		return 0
	end
	local nSJ_count = %VngTaskWeekly:GetWeeklyCount(%TSK_WEEKLY_SJ)
	local nCOT_count = %VngTaskWeekly:GetWeeklyCount(%TSK_WEEKLY_COT)
	--if nSJ_count < %WEEKLY_SJ_REQUIRE or nCOT_count < %WEEKLY_COT_REQUIRE then
	--	Talk(1, "", format("Mçi tuÇn ph¶i tham gia Ýt nhÊt 10 trËn Tèng Kim v?6 lÇn V­ît ¶i míi ®­îc s?dông vËt phÈm nµy. S?lÇn tham gia cña c¸c h? Tèng Kim: <color=yellow>%d<color> - V­ît ¶i: <color=yellow>%d<color>", nSJ_count, nCOT_count))
	--	return 0
	--end
	
	return 1
end

function tbVnTL4Skill:GetSkill(SkillTable, nLevel)
	if CalcEquiproomItemCount(%ITEM_PROP[1], %ITEM_PROP[2], %ITEM_PROP[3], -1) <= 0 then
		return
	end
	local nRand = self:RandomSkill(SkillTable)
	if nRand <= 0 or nRand > 8 then
		return 0
	end
	local tbSkill = SkillTable[nRand]
	if HaveMagic(tbSkill[1]) < 0 then
		local nUsedSkillPoint = GetTask(2899)
		if nUsedSkillPoint > 0 and nLevel == 0 then
			Talk(1, "", "CÇn ph¶i tÈy ®iÓm kü n¨ng trïng sinh 4 hoÆc 5 tr­íc råi míi häc kü n¨ng míi! H·y ®Õn gÆp B¾c §Èu L·o Nh©n ®Ó ®­îc gióp ®ì.")
			return 0
		end

		for i = 1, getn(SkillTable) do
			if HaveMagic(SkillTable[i][1]) >= 0 then
				DelMagic(SkillTable[i][1])
			end
		end
		AddMagic(tbSkill[1], nLevel)
		if HaveMagic(tbSkill[1]) < 0 then
			return 0
		end
	end
	ConsumeEquiproomItem(1, %ITEM_PROP[1], %ITEM_PROP[2], %ITEM_PROP[3], -1)
	Msg2Player(format("Chóc mõng b¹n ®· lÜnh héi ®­îc vâ c«ng <color=green>%s<color>", tbSkill[3]))
	tbLog:PlayerActionLog("SuDungBatThuatChanKinh", tbSkill[3])
	return 1
end

function tbVnTL4Skill:LearnTL4Skill()
	if self:CheckCondition(4) ~= 1 then
		return
	end
	self:GetSkill(TB_SKILL_4, 0)
end

function tbVnTL4Skill:LearnTL6Skill()
	if self:CheckCondition(6) ~= 1 then
		return
	end
	self:GetSkill(TB_SKILL_6, 20)
end

function tbVnTL4Skill:RandomSkill(SkillTable)
	local nTotal = 10000000
	local nCur = random(1, nTotal)
	local nStep = 0
	for i = 1, getn(SkillTable) do
		nStep = nStep + floor(SkillTable[i][2]*nTotal/100)
		if nCur < nStep then
			return i
		end
	end
end
