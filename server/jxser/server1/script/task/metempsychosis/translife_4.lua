-- ÎÄ¼şÃû¡¡£ºtranslife_4.lua
-- ´´½¨Õß¡¡£ºwangjingjun
-- ÄÚÈİ¡¡¡¡£º4×ªÏà¹Ø¶Ô»°ºÍº¯Êı
-- ´´½¨Ê±¼ä£º2011-08-01 14:15:10

Include("\\script\\task\\metempsychosis\\task_func.lua")
Include("\\script\\lib\\log.lua")

function calSkillPoint(nCurLevel)
	local nResult = 0
	if nCurLevel < NSTARTLEVEL_4 then
		nResult = 0
	else
		nResult = floor((nCurLevel - NSTARTLEVEL_4) / NPERPOINTNEEDLEVEL) + 1
	end
	return nResult
end

function updataSkillPoint_4()
	local ntranscount = ST_GetTransLifeCount()
	
	if ntranscount < 4 then
		return
	end
	
	-- µ±Ç°µÈ¼¶¿ÉÒÔ»ñµÃµÄµÈ¼¶½±Àø
	
	if ntranscount == 4 then
		local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
		local nLastUpLevel = GetTask(TSK_LAST_UP_LEVEL_4)
		local nCurLevel = GetLevel()
		local nAddPoint = calSkillPoint(nCurLevel) - calSkillPoint(nLastUpLevel)
		SetTask(TSK_LAST_UP_LEVEL_4, nCurLevel)
		SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint + nAddPoint)
		
	elseif ntranscount >= 5 then
		local nTotalPoint = calSkillPoint(200) - calSkillPoint(1)
		local nUsedPoint = GetTask(TSK_USED_SKILL_POINT_4)
		SetTask(TSK_LEAVE_SKILL_POINT_4, nTotalPoint - nUsedPoint)
	end
	
end

function sureGetTranslifeTask_4()
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount ~= 3 then
		CreateTaskSay({"<dec><npc>".."HiÖn t¹i ng­¬i kh«ng ph¶i lµ chuyÓn sinh 3, kh«ng thÓ tiÕp nhËn nhiÖm vô!", " BiÕt råi!/OnCancel"})
		return 
	end
	
	local nCurLevel = GetLevel()
	if nCurLevel < 200 then
		CreateTaskSay({"<dec><npc>".."§¼ng cÊp cña ng­¬i ch­a ®Õn cÊp 200!", " BiÕt råi!/OnCancel"})
		return 
	end
	
	SetTask(TSK_TRANSLIFE_4, 1)
	Msg2Player("Ng­¬i ®· nhËn nhiÖm vô thµnh c«ng, h·y nhanh ch©n ®i thu thËp Tİch LŞch §¬n ®i")end

function wantGetTranslifeTask_4()
	CreateTaskSay({"<dec><npc>ChØ cã nh÷ng cao thñ nµo cã sè lÇn chuyÓn sinh lµ 3 lÇn, h¬n n÷a ®¼ng cÊp ph¶i ®¹t ®Õn cÊp 200 míi cã thÓ nhËn nhiÖm vô nµy, ng­¬i x¸c ®Şnh muèn nhËn kh«ng?",
		" Sö dông/sureGetTranslifeTask_4",
		"§Ó ta suy nghÜ l¹i/OnCancel"})
end

function querySkillPoint_4()
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount < 4 then
		CreateTaskSay({"<dec><npc>Ng­¬i vÉn ch­a chuyÓn sinh 4, kh«ng cã ®iÓm kü n¨ng ®Ó kiÓm tra!", " BiÕt råi!/OnCancel"})
		return 
	end
	updataSkillPoint_4()		-- ¸üĞÂÊ£Óà¿ÉÓÃµÄ¼¼ÄÜµã
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nUsedSkillPoint = GetTask(TSK_USED_SKILL_POINT_4)
	CreateTaskSay({format("<dec><npc>HiÖn t¹i ng­¬i cã thÓ sö dông ®iÓm kü n¨ng chuyÓn sinh 4 d­ l¹i lµ %d, ®· sö dông lµ %d ®iÓm", nLeaveSkillPoint, nUsedSkillPoint),
		 " BiÕt råi!/OnCancel"})
	return 
end

function wantClearSkillPoint_4()
	--§iÒu chØnh gi¸ tÈy ®iÓm kü n¨ng TS4 - Modified by DinhHQ - 20110813
	CreateTaskSay({format("<dec><npc>TÈy ®iÓm kü n¨ng trïng sinh 4, cÇn cã %d l­îng vµ 1 <color=red>[B¾c §Èu TÈy Tñy §¬n]<color>, ng­¬i x¸c ®Şnh lµ tÈy l¹i hay kh«ng?",CLEAR_SKILL_4_PRICE ),
		"X¸c nhËn/sureClearSkillPoint_4",
		"§Ó ta suy nghÜ l¹i/OnCancel"})
end

function sureClearSkillPoint_4()
	-- Î´4×ª
	local ntranscount = ST_GetTransLifeCount()
	if ntranscount < 4 then
		CreateTaskSay({"<dec><npc>Ng­¬i vÉn ch­a chuyÓn sinh 4, kh«ng cÇn tÈy ®iÓm kü n¨ng nµy!", " BiÕt råi!/OnCancel"})
		return 
	end
	-- Ç®²»¹»	
	--§iÒu chØnh gi¸ tÈy ®iÓm kü n¨ng TS4 - Modified by DinhHQ - 20110813
	if GetCash() < CLEAR_SKILL_4_PRICE or CalcItemCount(3, 6, 1, 30127, -1) <= 0 then
		CreateTaskSay({format("<dec><npc>TÈy ®iÓm kü n¨ng trïng sinh 4 cÇn cã <color=yellow> %d <color> l­îng vµ 1 <color=yellow>[B¾c §Èu TÈy Tñy §¬n]<color>, h·y chuÈn bŞ ®Çy ®ñ råi ®Õn gÆp ta",CLEAR_SKILL_4_PRICE), "BiÕt råi/OnCancel"})
		return 
	end
	
	updataSkillPoint_4()
	
	local nLeaveSkillPoint = GetTask(TSK_LEAVE_SKILL_POINT_4)
	local nUsedSkillPoint = GetTask(TSK_USED_SKILL_POINT_4)
	-- Ã»ÓĞÊ¹ÓÃ¼¼ÄÜµã
	if nUsedSkillPoint <= 0 then
		CreateTaskSay({"<dec><npc>Ng­¬i ®· ph©n phèi ®iÓm kü n¨ng chuyÓn sinh 4 lµ 0, kh«ng cÇn tÈy ®iÓm!", " BiÕt råi!/OnCancel"})
		return 
	end
	
	--§iÒu chØnh gi¸ tÈy ®iÓm kü n¨ng TS4 - Modified by DinhHQ - 20110813
	if ConsumeItem(3, 1, 6, 1, 30127, -1) ~= 1 then
		CreateTaskSay({"<dec><npc>Ng­¬i nãi cã B¾c §Èu TÈy Tñy §¬n sao ta kh«ng thÊy?", "§Ó ta ®i t×m/OnCancel"})
		return 
	end
	Pay(CLEAR_SKILL_4_PRICE)
	for i=1,getn(TB_SKILL_4) do
		if HaveMagic(TB_SKILL_4[i][1]) > 0 then
		SetSkillLevel(TB_SKILL_4[i][1],0)		-- ½«¼¼ÄÜµÈ¼¶¶¼±ä³É0
		end
	end
	
	nLeaveSkillPoint = nLeaveSkillPoint + nUsedSkillPoint
	nUsedSkillPoint = 0
	SetTask(TSK_LEAVE_SKILL_POINT_4, nLeaveSkillPoint)
	SetTask(TSK_USED_SKILL_POINT_4, nUsedSkillPoint)
	CreateTaskSay({format("<dec><npc>Ng­¬i ®· tÈy thµnh c«ng ®iÓm kü n¨ng chuyÓn sinh 4, hiÖn t¹i ng­¬i cã thÓ sö dông ®iÓm kü n¨ng chuyÓn sinh 4 d­ l¹i lµ %d, ®· sö dông lµ %d ®iÓm", nLeaveSkillPoint, nUsedSkillPoint),
		 " BiÕt råi!/OnCancel"})
	tbLog:PlayerActionLog("clear_4_turn_skill_point")
end