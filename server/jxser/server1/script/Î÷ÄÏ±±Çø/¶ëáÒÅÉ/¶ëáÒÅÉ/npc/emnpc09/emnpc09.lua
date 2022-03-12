--description: ¶ëáÒÅÉÄÂÔÆ´È 
--author: yuanlan	
--date: 2003/3/5
--update: Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Update: Dan_Deng(2003-08-12)
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 30*256+50) then				-- 30¼¶ÈÎÎñÖĞ
			if (HaveItem(120) == 1) then		-- ÈÎÎñÍê³É
				L30_prise()
			else
				Talk(1,"","PhiÒn muéi ®Õn<color=Red>bê hå ë hËu s¬n<color>t×m xem. <color=Red>Háa hå<color>thİch ¨n<color=Red>®ïi gµ<color>nhÊt.H·y dïng ®ïi gµ ®Ó dô nã trë vÒ, nÕu kh«ng nã sÏ kh«ng ®i víi kÎ l¹ mÆt ®©u.")
			end
		elseif (UTask_em == 30*256) and (GetLevel() >= 30) then		-- 30¼¶ÈÎÎñÆô¶¯
			Say("<color=Red>Háa hå<color> cña ta kh«ng thÊy n÷a, muéi cã thÓ gióp ta t×m kh«ng?", 2, "T×m gióp /L30_get_yes", "Kh«ng cßn thêi gian n÷a /L30_get_no")
		elseif (UTask_em >= 40*256) then   							--ÒÑ¾­Íê³É30¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Skill150Dialog("TiÓu s­ muéi, c¸m ¬n muéi gióp ta!")
		else
			Skill150Dialog("Háa Hå ®©u, Háa Hå ng­¬i ë ®©u, ng­¬i ch¹y ®©u råi h¶? Nhanh ra ®©y mau!")
		end
	elseif (UTask_em == 70*256) then								--ÒÑ¾­³öÊ¦
		Skill150Dialog("TiÓu s­ muéi ph¶i h¹ s¬n µ? Ta vµ háa hå sÏ rÊt nhí muéi.")
	else
		Skill150Dialog("Háa Hå cña ta ®· th«ng linh råi, kh«ng thÓ nµo lµ ng­êi bÊt l­¬ng ®­îc.")
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
	G_TASK:OnMessage("Nga Mi", tbDailog, "DialogWithNpc")
	tbDailog:Show() 
end

function L30_get_yes()
	Talk(1,"","Tèt l¾m! PhiÒn muéi ®Õn <color=Red>bê hå ë hËu s¬n<color> t×m xem. Háa hå thİch ¨n <color=Red>®ïi gµ<color>. H·y dïng ®ïi gµ ®Ó dô nã trë vÒ, nÕu kh«ng nã sÏ kh«ng ®i víi kÎ l¹ mÆt ®©u.")
	SetTask(1, 30*256+50)
	AddNote("ë gÇn hËu ®­êng Nga Mi ph¸i (242, 305) gÆp Môc V©n T­, nhËn <color=red>nhiÖm vô Ho¶ Hå<color>, ®i ®Õn ph¸i sau nói Ng¹c Ng­ t×m Ho¶ Hå. ")
	Msg2Player("TiÕp nhËn nhiÖm vô Ho¶ Hå cña Môc V©n T­, ®i ®Õn phİa sau nói Ng¹c Ng­ t×m Ho¶ Hå. ")
end;

function L30_get_no()
end;

function L30_prise()
	Talk(1,"","Háa hå µ! Muéi thËt lµ ®å tinh ranh, lÇn sau kh«ng ®Ó ng­¬i ch¹y lung tung n÷a! C¶m ¬n muéi ®· gióp ta!")
	DelItem(120)
	SetRank(16)
	SetTask(1, 40*256)
--	AddMagic(385)
--	AddMagic(82)
--	AddMagic(89)
	add_em(40)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! §­îc phong lµ: B¹ch Liªn Tiªn Tö ")
	AddNote("Mang Ho¶ Hå giao cho Môc V©n Tõ, hoµn thµnh nhiÖm vô Ho¶ Hå, ®­îc phong lµ: B¹ch Liªn Tiªn Tö ")
end;	
