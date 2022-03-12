-- Îå¶¾ Â·ÈËNPC ½ðÉßÕ¯Ö÷ÔÆ²»Ð° 40¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-05)
-- update by: xiaoyang(2004\4\13) ¼ÓÈë90¼¶ÃÅÅÉÈÎÎñ

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")


Include("\\script\\global\\skills_table.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>Ngò §éc Gi¸o chóng ta cã v« vµn ®éc d­îc, cã mét sè ®éc d­îc lµ dïng hµng tr¨m lo¹i ®éc vËt mµ luyÖn chÕ, lo¹i ®éc bÝ truyÒn nµy, chØ cÇn ch¹m nhÑ mét chót th«i, th× sÏ chÕt kh«ng cã vÕt tÝch"
	G_TASK:OnMessage("Ngò §éc", tbDailog, "DialogWithNpc")
	tbDailog:AddOptEntry("Ta ®Õn t×m «ng cã viÖc kh¸c", main2)
	tbDailog:Show() 
end

function main2()
	UTask_wu = GetTask(10)
	Uworld124 = GetTask(124)
	if(GetSeries() == 1) and (GetFaction() == "wudu") then
		if((UTask_wu == 40*256+10) and (HaveItem(143) == 1)) then		-- ÈÎÎñ½øÐÐÖÐ
			L40_prise()
		elseif((UTask_wu == 40*256) and (GetLevel() >= 40)) then		--40¼¶ÈÎÎñ
			Say("Ng­¬i h·y ®i ®Õn Kim Xµ HuyÕt tr¹ch b¾t cho ta mét con Nh·n KÝnh V­¬ng M·ng Xµ,ta muèn uèng m¸u cña nã ®Ó t¨ng c­êng c«ng lùc ",2,"Tu©n lÖnh!/L40_get_yes","Thuéc h¹ vÉn cßn mét chuyÖn kh¸c. /L40_get_no")
		else							-- ³£¹æ¶Ô»°
			Skill150Dialog("§©y lµ mét thÕ giíi c­êng gi¶ sinh tån, muèn tiÕp tôc sèng th× h·y nhanh nhanh mµ ®i luyÖn c«ng ®i!")
		end
	elseif (Uworld124 == 10) then
		Talk(9,"Uworld_envelop","V©n BÊt Tµ!","Ai da! Tr«ng thËt lµ ®Ñp trai! Ng­¬i t×m tiÓu V©n nµy cã viÖc g×?","Mau ®­a thuèc gi¶i ¢m D­¬ng TiÕu ra ®©y!","Th× ra lµ ng­¬i muèn lµ ah hïng! §­îc th«i! ChØ cÇn ng­¬i chÞu ë l¹i ®©y víi ta th× muèn g× còng ®­îc"," Ph×! Ng­¬i lµ mét kÎ nham hiÓm ®éc ¸c, nÕu kh«ng ®­a thuèc gi¶i ra ®©y, th× sÏ kh«ng ai cßn nhËn ra bé d¹ng cña ng­¬i n÷a!","Hõ! C¸i tªn kh«ng biÕt tèt xÊu lµ g×! §­îc! ë ®©y ta cã mét bøc th­, ng­¬i h·y mang gióp ta ®Õn §­êng M«n giao cho TuyÖt Xu©n TÈu §­êng D·. Råi ng­¬i sÏ cã c¸i ng­¬i muèn. ","Ta dùa vµo ®©u ®Ó tin ng­¬i?","L·o tö ®©y mÆc dï tiÕng t¨m trªn giang hå cã h¬i xÊu. Nh­ng mµ ng­¬ih·y cø thö ®i hái xem, cã ph¶i ta lµ ng­êi lu«n biÕt gi÷ ch÷ TÝn hay kh«ng","T¹m thêi tin ng­¬i mét lÇn")
	elseif (Uworld124 == 20 ) and (HaveItem(385) == 0) then
      Talk(1,"","B»ng h÷u! §õng cã véi vµng nh­ vËy! Th­ ta vÉn cßn ch­a ®­a,ng­¬i lµm sao cã thÓ ®i gÆp §­êng D· ")
      AddEventItem(385)
      Msg2Player("TiÕp nhËn th­ tÝn cña V©n BÊt Tµ ")
	elseif (Uworld124 == 30) and (HaveItem(386) == 1) then
		DelItem(386)
		SetTask(124,35)
      Talk(5,"Uworld124_jump","Sao h¶?","Çy! §· bÞ h¾n ph¸t hiÖn ra trong th­ cã ®éc!","Sao l¹i thÕ ®­îc! Ta bá ®éc rÊt bÝ mËt cÈn thËn h¾n lµm sao cã thÓ ®iÒu tra ra ®­îc! §­a l¹i cho ta!","A!...Trªn th­ nµy l¹i cã mét lo¹i kÞch ®éc kh¸c!","V©n BÊt Tµ! H¹i ng­êi th× còng sÏ ®Õn lóc bÞ ng­êi h¹i! Ng­¬i sèng kh«ng hÕt ngµy h«m nay ®©u!")        
	elseif (Uworld124 == 35) then
		Talk(1,"Uworld124_jump","Qua ®©y! Cïng ch¬i víi tiÓu V©n ®i!")
	elseif (Uworld124 == 40) and (HaveItem(387) == 0) then
		SetTask(124,35)
		Talk(2,"Uworld124_jump","V©n l·o tÆc! Mau ®­a mét phÇn thuèc gi¶i ra ®©y!","Ph×! Lóc n·y ta cã h¬i s¬ suÊt nªn míi tróng kÕ cña ng­¬i! §õng cã qu¸ väng t­ëng! Xem ®©y! ")
	elseif (Uworld124 >= 40) then			-- ÈÎÎñÍê³É
		Talk(1,"","Ng­¬i. ThËt qu¸ ¸c ®éc! ")
	else
		Skill150Dialog("Ngò §éc Gi¸o chóng ta cã v« vµn ®éc d­îc, cã mét sè ®éc d­îc lµ dïng hµng tr¨m lo¹i ®éc vËt mµ luyÖn chÕ, lo¹i ®éc bÝ truyÒn nµy, chØ cÇn ch¹m nhÑ mét chót th«i, th× sÏ chÕt kh«ng cã vÕt tÝch")
	end
end;

function Skill150Dialog(szTitle)
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = format("<npc>%s", szTitle)
	G_TASK:OnMessage("Ngò §éc", tbDailog, "DialogWithNpc")
	tbDailog:Show()
end

function L40_get_yes()
	Talk(1,"","§­îc råi! H·y nhí lµ ph¶i ®i t×m mét miÕng 'x¹ h­¬ng' tr­íc, nÕu kh«ng ng­¬i sÏ kh«ng thÓ khèng chÕ ®­îc r¾n")
	SetTask(10,40*256+10)
	AddNote("§i ®Õn Kim Xµ huyÕt tr¹ch ®Ó b¾t mét con Nh·n KÝnh v­¬ng M·ng Xµ cho V©n BÊt Tµ ")
	Msg2Player("§i ®Õn Kim Xµ huyÕt tr¹ch ®Ó b¾t mét con Nh·n KÝnh v­¬ng M·ng Xµ cho V©n BÊt Tµ ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","Ng­¬i lµ mét trong sè nh÷ng ng­êi ®· vµo trong Kim Xµ tr¹ch mµ cßn sèng sãt trë vÒ. Xem ra th× b¶n lÜnh cña ng­¬i qu¶ kh«ng tÇm th­êng chót nµo")
	SetTask(10,50*256)
	DelItem(143)
	SetRank(53)
--	AddMagic(356)
--	AddMagic(73)
	add_wu(50)			-- µ÷ÓÃskills_table.luaÖÐµÄº¯Êý£¬²ÎÊýÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n!: §· ®­îc th¨ng lµm: V« §æng La S¸t! Häc ®­îc vâ c«ng: Xuyªn Y Ph¸ Gi¸p, V¹n §éc Thùc T©m ")
	AddNote("TiÕn vµo Kim Xµ tr¹ch b¾t ®­îc Nh·n KÝnh v­¬ng M·ng Xµ, ®­îc th¨ng lµ V« ¦u La S¸t ")
end;

function Uworld_envelop()
	AddEventItem(385)
	SetTask(124,20)
	Msg2Player("TiÕp nhËn th­ tÝn cña V©n BÊt Tµ. ")
	AddNote("TiÕp nhËn th­ tÝn cña V©n BÊt Tµ, ®i t×m §­êng D·. ")
end

function Uworld124_jump()
	SetFightState(1)
	NewWorld(234,1616,3195)
end
