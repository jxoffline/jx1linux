--description: ¶ëáÒÅÉÃîÈç 
--author: yuanlan	
--date: 2003/3/4
--update: Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--update: Dan_Deng(2003-07-24), ¼Ó¡°ÖØ·µÃÅÅÉ¡±ÈÎÎñ
-- Update: Dan_Deng(2003-08-12)
-- Update: Dan_Deng(2003-09-21)ÖØĞÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø£¨È¡ÏûÓë´Ë½Å±¾Ïà¹Ø²¿·İ£©
Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1);
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if (UTask_em == 20*256) and (GetLevel() >= 20) then		--½Óµ½20¼¶ÈÎÎñ
			Say("GÇn ®©y ë <color=Red>HËu s¬n s¬n ®éng<color> th­êng cã <color=Red>M·nh Hæ<color> xuÊt hiÖn, h¹i chÕt v« sè b¸ t¸nh lªn nói d©ng h­¬ng. Ta th©n lµ ®Ö tö PhËt m«n sao co thÓ m¾t lÊp tai ng¬ nh×n M·nh Hæ s¸t h¹i d©n lµnh? Muéi cã thÓ ®i thu phôc hæ d÷ kh«ng?", 2, "§ång ı!/L20_get_yes", "Lùc bÊt tßng t©m /L20_get_no")
		elseif (UTask_em == 20*256+80) then										--20¼¶ÈÎÎñ¹ı³ÌÖĞ
			L20_prise()
		elseif (UTask_em == 20*256+50) then
			Talk(1,"","CÇm tÆc tiªn cÇm v­¬ng! Muéi chØ cÇn thu phôc ®­îc <color=Red>Hæ v­¬ng <color>. Nh÷ng con hæ cßn l¹i sÏ kh«ng d¸m t¸c qu¸i. Hæ vèn cøng ®Çu, muéi ph¶i thu phôc nã <color=Red>3 lÇn <color>, nã míi biÕt khuÊt phôc thËt sù.")
		elseif (UTask_em >= 30*256) then   							--ÒÑ¾­Íê³É20¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Skill150Dialog("Muéi cã ®ñ b¶n lÜnh vµo hang Hæ thu phôc M·nh Hæ, thËt xøng danh lµ ®Ö tö Nga Mi!")
		else
			Skill150Dialog("Vâ häc vµ PhËt lı ®Òu cÇn ph¶i thÊu râ, chuyÖn trªn ®êi chØ cÇn cã lßng ¾t sÏ ®­îc thµnh tùu.")
		end
	elseif (UTask_em >= 70*256) then										--ÒÑ¾­³öÊ¦
		Skill150Dialog("Theo huÖ c¨n cña muéi, ¾t sÏ cã thµnh tùu, ®Õn lóc muéi ph¶i rêi xa tû muéi ta!")
	else
		Skill150Dialog("Vâ häc vµ PhËt lı ®Òu cÇn ph¶i thÊu râ, chuyÖn trªn ®êi chØ cÇn cã lßng ¾t sÏ ®­îc thµnh tùu.")
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

function L20_get_yes()
	Talk(1,"","CÇm tÆc tiªn cÇm v­¬ng! Muéi chØ cÇn thu phôc ®­îc <color=Red>Hæ v­¬ng <color>. Nh÷ng con hæ cßn l¹i sÏ kh«ng d¸m t¸c qu¸i. Hæ vèn cøng ®Çu, muéi ph¶i thu phôc nã <color=Red>3 lÇn <color>, nã míi biÕt khuÊt phôc thËt sù.")
	SetTask(1, 20*256+50)
	AddNote("GÆp ni c« DiÖu Nh­ ë Gi¶ng Kinh ®­êng (240, 308) , nhËn <color=red>nhiÖm vô phôc hæ<color>, ®i lªn M·nh Hæ ®éng sau nói thu phôc hæ d÷. ")
	Msg2Player("GÆp ni c« DiÖu Nh­ ë Gi¶ng Kinh ®­êng, nhËn nhiÖm vô phôc hæ, ®i lªn M·nh Hæ ®éng sau nói thu phôc hæ d÷. ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","Muéi cã ®ñ b¶n lÜnh vµo hang Hæ thu phôc M·nh Hæ, thËt xøng danh lµ ®Ö tö Nga Mi!")
	SetRank(15)
	SetTask(1, 30*256)
--	AddMagic(93)
	add_em(30)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! §· ®­îc th¨ng lµm CÈm Y Ni! Häc ®­îc Tõ Hµng Phæ §é. ")
	AddNote("Trë vÒ gi¶ng kinh ®­êng cña Nga Mi ph¸i, phôc mÖnh DiÖu Nh­, hoµn thµnh nhiÖm vô thu phôc m·nh hæ, ®­îc phong lµ: CÈm Y Ni. ")
end;
