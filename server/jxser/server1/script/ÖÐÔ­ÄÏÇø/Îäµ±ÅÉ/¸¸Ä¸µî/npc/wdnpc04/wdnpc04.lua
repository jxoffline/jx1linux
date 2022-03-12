--description: Îäµ±ÅÉÒ¦Ê¯ÃÅ¡¡Îäµ±20¼¶ÈÎÎñ¡¢ÖØ·µÃÅÅÉÈÎÎñ
--author: yuanlan	
--date: 2003/5/14
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
--Dan_Deng(2003-07-24), ¼ÓÈëÖØ·µÃÅÅÉÈÎÎñ
-- Update: Dan_Deng(2003-08-17)
-- Update: Dan_Deng(2003-09-21)ÖØÐÂÉè¼ÆÖØ·µÃÅÅÉÓëÕòÅÉ¾øÑ§Ïà¹Ø£¨È¡ÏûÓë´Ë½Å±¾Ïà¹Ø²¿·Ý£©


-- ÐÞ¸ÄºóÓëÐ°½ÌÖ÷ÏßÏà¹ØµÄÎäµ±ÅÉÒ¦Ê¯ÃÅÖé½Å±¾
-- Edited by peres
-- 2005/01/18

Include("\\script\\task\\newtask\\newtask_head.lua");
Include("\\script\\task\\newtask\\lib_setmembertask.lua");
Include("\\script\\task\\newtask\\master\\xiepai\\maintask.lua");

Include("\\script\\global\\skills_table.lua");

function main()

-- ÐÂÈÎÎñÏµÍ³ÓëÐ°½ÌÖ÷ÏßÏà¹ØµÄ½Å±¾ --

local myTaskValue = GetTask(1003)
local myCamp = nt_getCamp()


	if (myTaskValue==170) then -- À´µ½Îäµ±ÅÉºóÓëÒ¦Ê¯ÃÅµÄ¶Ô»°
		task_level40_01();
		return
	elseif (myTaskValue==209) then -- Íæ¼ÒµÈ¼¶²»¹» 40 ¼¶£¬ÔÙ´Î»ØÀ´Ê±
		task_level40_02();
		return
	elseif (myTaskValue==210) then 
		Say("Hy väng ng­¬i cã thÓ gióp gióp vâ l©m dÑp trõ ®¹i n¹n nµy.",0);
		return
	elseif (myTaskValue==220) then
		task_level40_06();
		return 
	end
		
	
-- ÐÂÈÎÎñÏµÍ³ÓëÐ°½ÌÖ÷ÏßÏà¹ØµÄ½Å±¾ --



	UTask_wd = GetTask(5);
	if (GetFaction() == "wudang") and (GetSeries() == 4) then
--		Îª¼ÆÊ±Æ÷´íÎó´ò²¹¶¡£¬±äÁ¿ÖµÎª35¡¢Ñ§»áÁËÎäµ±½£·¨(151)¡¢Î´Ñ§´¿ÑôÐÄ·¨(156)µÄ£¬Ò²¿ÉÒÔ½Ó20¼¶ÈÎÎñ£¨ÒÑÈ¡Ïû£©
--		if ((UTask_wd == 20*256) or (((UTask_wd == 35) or (UTask_wd >= 30*256)) and (HaveMagic(151) >= 0) and (HaveMagic(156) == -1))) and (GetLevel() >= 20) then
		if (UTask_wd == 20*256) and (GetLevel() >= 20) then
			Say("Ta ®­îc s­ phô nu«i d­ìng thµnh ng­êi, d¹y ta vâ c«ng, ®èi víi ta ¬n träng nh­ nói. MÊy ngµy n÷a lµ tíi lÔ thä 80 tuæi cña s­ phô,ta ®· lÊy tßan bé tiÒn dµnh dôm ®Ó mua <color=Red>Thiªn Tµm §¹o Bµo<color> ë T­¬ng D­¬ng, ®Þnh biÕu s­ phô lµm lÔ ", 2, "Gióp ®ì t×m kiÕm/L20_get_yes", "Ta bËn råi/L20_get_no")
		elseif (UTask_wd == 20*256+20) then
			if (HaveItem(66) == 1) then
				SetTask(5, 20*256+40)
				AddNote("Trë vÒ Phô MÉu ®iÖn, biÕt ®­îc cã thÓ ®Õn T­¬ng D­¬ng gÆp «ng chñ t¹p hãa t×m c¸ch v¸ §¹o bµo.")
				Msg2Player("§i T­¬ng D­¬ng gÆp «ng chñ t¹p hãa t×m c¸ch v¸ §¹o bµo.")
				Talk(2, "", "ThËt xui qu¸! §¹o bµo ®· bÞ Sãi ®á c¾n r¸ch, ph¶i lµm sao ®©y?", "§¹o bµo nµy mua ë tiÖm t¹p hãa T­¬ng D­¬ng, ta ®i <color=Red>T­¬ng D­¬ng<color> t×m <color=Red>chñ tiÖm t¹p hãa <color> nghÜ c¸ch.")
			else
				Talk(1,"","Ta nhí <color=Red>Thiªn Tµm §¹o Bµo<color> bÞ ®¸nh r¬i ë <color=Red>Háa Lang ®éng<color>.")
			end
		elseif (UTask_wd == 20*256+80) and (HaveItem(68) == 1) then
			L20_prise()
		elseif (UTask_wd == 20*256+40) and (HaveItem(66) == 0) then		-- ÈÎÎñÖÐÎïÆ·¶ªÊ§µÄÈÝ´í´¦Àí
			AddEventItem(66)
			Msg2Player("T×m ®­îc 'Thiªn Tµm §¹o bµo bÞ r¸ch'.")
			Talk(1,"","Ng­¬i nãi ®Õn t×m chñ tiÖm t¹p hãa söa ®¹o bµo, sao l¹i kh«ng mang theo ®¹o bµo?")
		elseif (UTask_wd >= 20*256+40) and (UTask_wd < 30*256) then					--ÒÑ¾­½Óµ½20¼¶ÈÎÎñ£¬ÉÐÎ´Íê³É
			Talk(2,"","Kh«ng cã Thiªn Tµm §¹o Bµo, ta lÊy g× ®Ó lµm sao chóc thä S­ phô?","Ta ®Õn T­¬ng D­¬ng t×m tiÖm t¹p hãa nghÜ c¸ch.")
		else
			Talk(1,"","Ta thÊy vâ c«ng s­ phô ngµy cµng th©m hËu kh«ng thÓ l­êng ®­îc,c¶ ®êi ta häc còng kh«ng næi.")
		end
	elseif (UTask_wd >= 70) then								--ÒÑ¾­³öÊ¦
		Talk(1,"","S­ phô th­êng nãi 'H¶i n¹p b¸ch xuyªn, h÷u dung t¾c ®¹i, bÝch lËp thiªn nhÉn, v« dôc t¾c c­¬ng', ta muèn tÆng c©u nµy cho ng­¬i!")
	else
		Talk(1,"","S­ phô ®èi víi ta ©n träng nh­ nói, yªu th­¬ng ta nh­ cha mÑ ta!")
	end
end;

function L20_get_yes()
	Talk(1,"","Hay l¾m! Xin ®a t¹! Ta nhí <color=Red>Thiªn Tµm §¹o Bµo<color> bÞ r¬i <color=Red>Háa Lang ®éng<color>.")
	SetTask(5, 20*256+20)
	AddNote("GÆp §µo Th¹ch M«n, nhËn nhiÖm vô §¹o bµo, ®Õn Háa Lang §éng t×m Thiªn Tµm §¹o bµo.")
	Msg2Player("GÆp §µo Th¹ch M«n, nhËn nhiÖm vô §¹o bµo, ®Õn Háa Lang §éng t×m Thiªn Tµm §¹o bµo.")
end;

function L20_get_no()
	Talk(1,"","Ta ®µnh tù ®i t×m th«i!.")
end;

function L20_prise()
	Talk(1,"","Qu¶ nhiªn söa ®­îc råi! Hay qu¸! ThËt c¶m ¬n!")
	DelItem(68)
	SetRank(9)
	SetTask(5, 30*256)
--	AddMagic(159)
	add_wd(30)			-- µ÷ÓÃskills_table.luaÖÐµÄº¯Êý£¬²ÎÊýÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! B¹n ®· ®­îc th¨ng lµm Thanh Tu §¹o Nh©n! Häc ®­îc ThÊt Tinh TrËn!")
	AddNote("Trë vÒ Phô MÉu ®iÖn, ®em Thiªn Tµm §¹o bµo giao cho §µo Th¹ch M«n, hoµn thµnh nhiÖm vô §¹o bµo. §­îc phong lµ Thanh Tu §¹o Nh©n.")
end;
