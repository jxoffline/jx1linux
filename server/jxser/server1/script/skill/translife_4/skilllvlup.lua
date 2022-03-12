-- ÎÄ¼şÃû¡¡£ºskilllvlup.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£ºËÄ×ªÏà¹Ø¼¼ÄÜµÄ 8 ¸ö¼¼ÄÜµÄÉı¼¶
-- ´´½¨Ê±¼ä£º2011-07-30 17:50:05

Include("\\script\\task\\metempsychosis\\npc_saodiseng.lua")

tbZhuansheng_4_Skill = {}

function tbZhuansheng_4_Skill.skilllvelup(nSkillId)
	local mlvl = HaveMagic(nSkillId)
	local nMaxLevel = GetSkillMaxLevel(nSkillId)
	local szSkillName = GetSkillName(nSkillId)
	if mlvl > nMaxLevel then
		Msg2Player(format(" [%s] cña b¹n ®· ®Õn tèi ®a, kh«ng thÓ tiÕp tôc th¨ng cÊp ®­îc!", szSkillName))
		return 0
	end 
	
	updataSkillPoint_4()		-- ¸üĞÂÊ£Óà¿ÉÓÃµÄ¼¼ÄÜµã
	
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	if nLeaveSkillPoint < 1 then
		Msg2Player("Ng­¬i kh«ng cã ®iÓm kü n¨ng trïng sinh 4, kü n¨ng kh«ng thÓ n©ng lªn.")
		return 0
	end
	
	nLeaveSkillPoint = nLeaveSkillPoint - 1
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint) -- ¼õÉÙ¿ÉÊ¹ÓÃµÄ¼¼ÄÜµãÁ¿
	SetTask(TSK_USED_SKILL_POINT_4, (GetTask(TSK_USED_SKILL_POINT_4) + 1))	-- Ôö¼ÓÒÑÊ¹ÓÃµÄ¼¼ÄÜµãÖµ
	AddMagic(nSkillId, mlvl + 1)
	Msg2Player(format("Tu luyÖn [%s]cña ng­¬i ®· ®­îc th¨ng cÊp, VÉn cã thÓ sö dông ®iÓm kü n¨ng trïng sinh 4 lµ %d.", szSkillName, nLeaveSkillPoint))
	return 1
end
