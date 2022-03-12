IncludeLib("SETTING")
Include("\\script\\vng_lib\\taskweekly_lib.lua")
Include("\\script\\lib\\log.lua")
Include("\\script\\task\\metempsychosis\\translife_6.lua")

ITEM_PROP = {6,1,30467}
tbSKILL_4_FOR_SELECTING = {TB_SKILL_4[1], TB_SKILL_4[2], TB_SKILL_4[3], TB_SKILL_4[4],}
--{1123, 10, "Vò Uy ThuËt"},{1124, 10, "Nh­îc Thñy ThuËt"},{1125, 10, "TrÊn Nh¹c ThuËt"},{1126, 10, "Yªn Ba ThuËt"}

function main(nItemIdx)
	if tbVnTL4SelectiveSkill:CheckCondition(4) ~= 1 then
		return 1
	end
	
	local nTransLifeCount = ST_GetTransLifeCount()
	local tbOpt = {}
	if nTransLifeCount >= 4 then
		tinsert(tbOpt, format("%s/#%s","KÜ n¨ng trïng sinh 4", "tbVnTL4SelectiveSkill:SelectSkill4()"))
	end
	
--	if nTransLifeCount >= 6 then
--		tinsert(tbOpt, format("%s/#%s","KÜ n¨ng trïng sinh 6", "tbVnTL4SelectiveSkill:SelectSkill6()"))
--	end
	
	tinsert(tbOpt, format("%s/#%s","Ta kh«ng muèn häc n÷a", "tbVnTL4SelectiveSkill:Close()"))
	Say("Ng­¬i muèn häc kÜ n¨ng nµo?", getn(tbOpt), tbOpt)
	
	return 1
end

tbVnTL4SelectiveSkill = {}

function tbVnTL4SelectiveSkill:Close()
end

function tbVnTL4SelectiveSkill:SelectSkill4()
	local tbOpt = {}
	for i = 1, getn(tbSKILL_4_FOR_SELECTING) do
		tinsert(tbOpt, format("%s/#tbVnTL4SelectiveSkill:LearnTL4Skill(%d)", tbSKILL_4_FOR_SELECTING[i][3], i))
	end
	tinsert(tbOpt, format("%s/#%s","Ta kh«ng muèn häc n÷a", "tbVnTL4SelectiveSkill:Close()"))
	Say("Xin chän kü n¨ng:", getn(tbOpt), tbOpt)
end

function tbVnTL4SelectiveSkill:CheckCondition(nNeedTLCount)
	local nTransLifeCount = ST_GetTransLifeCount()
	if nTransLifeCount < nNeedTLCount then
		Talk(1, "", format("Trïng sinh %d trë lªn míi cã thÓ sö dông ®¹o cô nµy!", nNeedTLCount))
		return 0
	end
	return 1
end

function tbVnTL4SelectiveSkill:GetSkill(nSelectedIDX, nLevel)
	if CalcEquiproomItemCount(%ITEM_PROP[1], %ITEM_PROP[2], %ITEM_PROP[3], -1) <= 0 then
		return
	end	
	local tbSkill = tbSKILL_4_FOR_SELECTING[nSelectedIDX]
	if HaveMagic(tbSkill[1]) < 0 then
		local nUsedSkillPoint = GetTask(2899)
		if nUsedSkillPoint > 0 and nLevel == 0 then
			Talk(1, "", "CÇn ph¶i tÈy ®iÓm kü n¨ng trïng sinh 4 hoÆc 5 tr­íc råi míi häc kü n¨ng míi! H·y ®Õn gÆp B¾c §Èu L·o Nh©n ®Ó ®­îc gióp ®ì.")
			return 0
		end

		for i = 1, getn(TB_SKILL_4) do
			if HaveMagic(TB_SKILL_4[i][1]) >= 0 then
				DelMagic(TB_SKILL_4[i][1])
			end
		end
		AddMagic(tbSkill[1], nLevel)
		if HaveMagic(tbSkill[1]) < 0 then
			return 0
		end
	end
	ConsumeEquiproomItem(1, %ITEM_PROP[1], %ITEM_PROP[2], %ITEM_PROP[3], -1)
	Msg2Player(format("Chóc mõng b¹n ®· lÜnh héi ®­îc vâ c«ng <color=green>%s<color>", tbSkill[3]))
	tbLog:PlayerActionLog("SuDungThienThuKyCong", tbSkill[3])
	return 1
end

function tbVnTL4SelectiveSkill:LearnTL4Skill(nSelectedIDX)
	if self:CheckCondition(4) ~= 1 then
		return
	end
	self:GetSkill(nSelectedIDX, 0)
end

function tbVnTL4SelectiveSkill:LearnTL6Skill()
--Closing for now
do return end
	if self:CheckCondition(6) ~= 1 then
		return
	end
	self:GetSkill(TB_SKILL_6, 20)
end