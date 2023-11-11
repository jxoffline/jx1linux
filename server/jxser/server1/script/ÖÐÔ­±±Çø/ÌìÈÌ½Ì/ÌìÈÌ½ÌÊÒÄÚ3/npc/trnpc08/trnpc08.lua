--description: ÌìÈÌ½Ì×ó»¤·¨¶ËÄ¾î£
--author: yuanlan	
--date: 2003/5/19
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-14)

-- ÓëĞÂÈÎÎñÏµÍ³Ïà¹ØĞŞ¸Ä¹ıºóµÄ¶ËÄ¾î£½Å±¾
-- Edited by peres
-- 2005/01/20

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\item\\skillbook.lua")

Include("\\script\\global\\skills_table.lua")

function main()

-- ĞÂÈÎÎñÏµÍ³ÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄ½Å±¾ --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()

	if (myTaskValue==360) then
		task_level60_01();
		return
	end


-- ĞÂÈÎÎñÏµÍ³ÓëĞ°½ÌÖ÷ÏßÏà¹ØµÄ½Å±¾ --

	UTask_tr = GetTask(4)
	Uworld123 = GetTask(123)
	if (GetSeries() == 3) and (GetFaction() == "tianren") then
		if (UTask_tr == 50*256) and (GetLevel() >= 50) then
			Say("<color=Red>Tinh §µn §µn Chñ Phông HÊp Nh­<color> bŞ qu©n Tèng b¾t giam t¹i <color=Red>tßa th¸p s¾t<color> ë <color=Red>BiÖn Kinh<color>, nÕu qu©n Tèng moi ®­îc bİ mËt g× tõ miÖng «ng ta, sÏ lµm nguy ®Õn ®¹i nghiÖp cña bæn gi¸o, v× vËy b»ng mäi gi¸, ng­¬i ph¶i cøu ®­îc Phông HÊp Nh­ vÒ.",2, "Thuéc h¹ tu©n mÖnh/yes", "Thuéc h¹ e r»ng kh«ng ®¶m nhiÖm næi/no")
		elseif (UTask_tr == 50*256+50) then 
			L50_prise()
		elseif (UTask_tr > 50*256) and (UTask_tr < 50*256+50) then					--ÒÑ¾­½Óµ½50¼¶ÈÎÎñ£¬ÉĞÎ´Íê³É
			Talk(1,"","<color=Red>ThiÕt Th¸p ë BiÖn Kinh<color> giam <color=Red>Phông HÊp Nh­<color> cã <color=Red>ba c¬ quan<color>, më ®­îc tÊt c¶ míi cã thÓ cøu ®­îc Phông HÊp Nh­, h·y nhí b»ng bÊt cø gi¸ nµo, còng kh«ng thÓ ®Ó Phông HÊp Nh­ r¬i vµo tay qu©n Tèng!")
		else							--ÒÑ¾­Íê³É50¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦£¨È±Ê¡¶Ô»°£©
			Skill150Dialog("Nh÷ng ng­êi míi trong gi¸o lu«n lu«n cã, t×nh h×nh th¾ng b¹i lµ bÊt kh¶ thi")
		end
	elseif (Uworld123 == 60) and (HaveItem(377) == 1) then			-- ÌÆ²»È¾¡°¼Ş»öÒ»³¾¡±ÈÎÎñ
		if (GetTask(2) >= 70*256) and (GetTask(2) ~= 75*256) then			-- ÌÆÃÅµÜ×Ó»òÌÆÃÅ³öÊ¦µÄ²ÅÄÜÑ§µ½¼¼ÄÜ
			Talk(11,"Uworld123_step4a","§îi l©u nh­ vËy, cuèn s¸ch mËt cña §­êng M«n nµy qu¶ kh«ng phô ta!","A! Qu¶ nhiªn lµ kh«ng khã, ®¸ng tiÕc thiªn h¹ l¹i kh«ng ai nghÜ ra.","§oan Méc tiªn sinh, ng­êi xem cã thÓ hiÓu vâ c«ng trong cuèn s¸ch mËt §­êng M«n nµy kh«ng?","S¸ch mËt nµy viÕt qu¸ râ rµng råi, cã g× mµ kh«ng hiÓu?","Qu¶ thùc kh«ng d¸m giÊu, ta tr­íc giê xem rÊt İt s¸ch, vËy nªn kh«ng hiÓu.","NÕu ®· nh­ vËy, cã g× kh«ng hiÓu th× ng­¬i cø hái l·o phu.","............","...............… ","............","...............… ")
		else
			Talk(1,"Uworld123_step4b","§îi l©u nh­ vËy, cuèn s¸ch mËt cña §­êng M«n nµy qu¶ kh«ng phô ta!")
		end
	elseif (UTask_tr >= 70*256) then							--ÒÑ¾­³öÊ¦
		Skill150Dialog("Thµnh tùu ®¹i sù gi¶, nhu bÊt c©u tiÓu tiÖt, nÕu nh­ lµm viÖc g× mµ kh«ng quyÕt ®o¸n, nhót nh¸t, thiÕu ®Çu thiÕu ®u«i, nh­ vËy th× kh«ng lµm ®­îc trß trèng g× hÕt!")
	else
		Skill150Dialog("Vâ c«ng vèn kh«ng kh«ng cã chİnh tµ, chØ cã m¹nh yÕu, chuyÖn giang hå, n¨ng giµ=3 vŞ chi, thiªn h¹ chi thÕ, c­êng gi¶ ch­ëng chi.")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc();
	local nCurDate = tonumber(GetLocalDate("%Y%m%d%H%M"))
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("Thiªn NhÉn", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function yes()
	Talk(1,"","<color=Red>ThiÕt Th¸p ë BiÖn Kinh<color> giam <color=Red>Phông HÊp Nh­<color> cã <color=Red>ba c¬ quan<color>, më ®­îc tÊt c¶ míi cã thÓ cøu ®­îc Phông HÊp Nh­, h·y nhí b»ng bÊt cø gi¸ nµo, còng kh«ng thÓ ®Ó Phông HÊp Nh­ r¬i vµo tay qu©n Tèng!")
	SetTask(4, 50*256+20)
	Msg2Player("GÆp ®­îc T¶ Hé ph¸p §oan Méc DuÖ, nhËn nhiÖm vô cøu ng­êi, ®Õn BiÖn Kinh ThiÕt Th¸p cøu tinh ®µn chñ Phông HÊp Nh­ ®ang bŞ Tèng qu©n giam gi÷.")
	AddNote("GÆp ®­îc T¶ Hé ph¸p §oan Méc DuÖ, nhËn nhiÖm vô cøu ng­êi, ®Õn BiÖn Kinh ThiÕt Th¸p cøu tinh ®µn chñ Phông HÊp Nh­ ®ang bŞ Tèng qu©n giam gi÷.")
end;

function no()
	Talk(1,"","Ng­¬i vèn lµ Ch­ëng Kú Sø cña bæn gi¸o, mét viÖc nhá thÕ nµy lµm còng kh«ng xong, cßn lµm ®­îc g× n÷a?")
end;

function L50_prise()
	Talk(1,"","Ng­¬i tuy lµ ®Ö tö míi nh­ng cã thÓ ®¶m ®­¬ng viÖc hÖ träng, bæn gi¸o rÊt cÇn nh÷ng ng­êi ®¾c lùc nh­ ng­¬i, ta sÏ nãi víi Gi¸o chñ ®Ó s¾c phong cho ng­¬i.")
	SetRank(60)
	SetTask(4, 60*256)
	SetTask(21,0)		--ÓÃÍêºó¾Í½«¸¨Öú±äÁ¿ÇåÁã£¬±ãÓÚ½ñºóÖØ¸´ÀûÓÃ
--	AddMagic(143)
	add_tr(60)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n ®· ®­îc s¾c phong lµm Hé Gi¸o Sø cña Thiªn NhÉn Gi¸o! Häc ®­îc vâ c«ng LŞch Ma §o¹t Hån.")
	AddNote("VÒ Thiªn NhÉn Gi¸o ®Õn gÆp T¶ Hé ph¸p §oan Méc DuÖ phôc mÖnh, hoµn thµnh nhiÖm vô cøu ng­êi. Th¨ng chøc lµm Hé Gi¸o Sø.")
end;

function Uworld123_step4a()
	DelItem(377)
	if (HaveMagic(339) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
		AddMagic(339,1)
	end
	if (HaveMagic(302) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
		AddMagic(302,1)
	end
	if (HaveMagic(342) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
		AddMagic(342,1)
	end
	if (HaveMagic(351) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
		AddMagic(351)
	end
	CheckIsCanGet150SkillTask()
	Msg2Player("B¹n häc ®­îc NhiÕp Hån NguyÖt ¶nh, B¹o Vò Lª Hoa, Cöu Cung Phi Tinh, Lo¹n Hoµn Kİch!")
	Msg2Player("§oan Méc DuÖ tiÕp tôc mêi b¹n vÒ b¸o tin cho §­êng BÊt NhiÔm.")
	SetTask(123,75)
	Talk(2,"","Nhê ng­¬i thay ta chuyÓn lêi cho BÊt NhiÔm C«ng Tö, nãi §oan Méc DuÖ ta quyÕt kh«ng lµm ngµi thÊt väng. ","§­îc! T¹i h¹ còng xin ®a t¹ tiÒn bèi võa råi ®· chØ d¹y. ")
end

function Uworld123_step4b()
	DelItem(377)
	SetTask(123,70)
	Talk(1,"","RÊt tèt! nhê ng­¬i thay ta chuyÓn lêi cho BÊt NhiÔm C«ng Tö, nãi §oan Méc DuÖ ta quyÕt kh«ng lµm ngµi thÊt väng. ")
	Msg2Player("§oan Méc DuÖ tiÕp tôc mêi b¹n vÒ b¸o tin cho §­êng BÊt NhiÔm.")
end
