-- Îå¶¾ Â·ÈËNPC ¶¾ÏÉ×Ó°×Ó¨Ó¨ 20¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-05)

Include("\\script\\task\\150skilltask\\g_task.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\global\\skills_table.lua")
Include("\\script\\misc\\eventsys\\eventsys.lua")

function main()
	local nNpcIndex = GetLastDiagNpc()
	local szNpcName = GetNpcName(nNpcIndex)
	if NpcName2Replace then
		szNpcName = NpcName2Replace(szNpcName)
	end
	local tbDailog = DailogClass:new(szNpcName)
	tbDailog.szTitleMsg = "<npc>Lu«n lu«n cã kÎ ngu ngèc kh«ng biÕt sèng chÕt lµ g×, kh«ng lÏ trÎ ®Ñp nh­ bæn tiªn tö ta ®©y l¹i lµ mét ®iÒu sai tr¸i hay sao?"
	G_TASK:OnMessage("Ngò §éc", tbDailog, "DialogWithNpc")
	EventSys:GetType("AddNpcOption"):OnEvent(szNpcName,tbDailog , nNpcIndex)
	if getn(tbDailog.tbOptionList) > 0 then
		tbDailog:AddOptEntry("Ta ®Õn t×m «ng cã viÖc kh¸c", old_main)
		tbDailog:Show()
	else
		old_main()
	end
end

function old_main()
	UTask_wu = GetTask(10)
	Uworld50 = GetTask(50)
	if (Uworld50 == 20) then			-- µãÐÑÐìÖÐÔ­ÈÎÎñ
		Talk(6,"Uworld50_20","B¹ch c« n­¬ng! X­a nay ch¸nh tµ ®Òu kh«ng dung hîp, Tõ §¹i Nh¹c hy väng c« sÏ rêi xa Tõ Trung Nguyªn ","Rêi xa anh Êy th× ta sèng cßn ý nghÜa g×? Còng v× muèn ®­îc suèt ®êi sèng bªn c¹nh anh Êy mµ ta ®· thay ®æi rÊt nhiÒu, t¹i sao c¸c ng­êi kh«ng nh×n thÊy ®­îc nh÷ng ®iÒu nµy?","C« thËt sù lµ muèn kh¸ng l¹i sù quyÕt ®Þnh cña lÖnh t«n sao?","Ta chØ muèn sím ®­îc thµnh th©n víi Trung Nguyªn ®¹i ca, sau ®ã sÏ rót lui khái giang hå chuyªn t©m nu«i chång nu«i con, kh«ng mµng g× ®Õn thÕ sù lo¹n l¹c n÷a. Nh­ vËy th× cã g× nªn téi chø?","Cã thËt sù nh­ vËy kh«ng","Trêi xanh chøng gi¸m, nÕu nh­ tiÓu n÷ cã nöa lêi gi¶ dèi, xin h·y næi sÊm sÐt ®¸nh chÕt t­¬i ngay. TiÓu n÷ kh«ng hÒ o¸n tr¸ch")
	elseif (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 20*256+10) then
			i = GetItemCount(85)				-- ÈËÍ·
			if (i >= 7) then
				Talk(1,"L20_prise","Tiªn tö! Thuéc h¹ ®· mang 7 c¸i ®Çu cña 'La Tiªu S¬n ThÊt Quû 'vÒ ®©y råi ")
			else
				Talk(1,"","Ch¼ng ph¶i lµ ng­¬i ®· ®i La Tiªu s¬n råi ­? T¹i sao vÉn cßn cã mÆt ë ®©y?")
			end
		elseif ((UTask_wu == 20*256) and (GetLevel() >= 20)) then		--20¼¶ÈÎÎñ
			Talk(4,"L20_get","Çy! Võa míi ®Õn! Cã nhí quy t¾c kh«ng vËy? §· l©u qu¸ råi, t¹i sao vÉn ch­a giao 'Nh©n §Çu Tr¸ng' ra ®©y","Nh©n §Çu Tr¸ng lµ c¸i g×?","§ã lµ nh÷ng c¸i ®Çu bän nghÞch ph¶n víi Ngò §éc Gi¸o ","Thuéc h¹ ngu ®Çn! Xin tiªn tö chØ d¹y thªm lÇn n÷a")
		else							-- ³£¹æ¶Ô»°
			Skill150Dialog("Lu«n lu«n cã kÎ ngu ngèc kh«ng biÕt sèng chÕt lµ g×, kh«ng lÏ trÎ ®Ñp nh­ bæn tiªn tö ta ®©y l¹i lµ mét ®iÒu sai tr¸i hay sao?")
		end
	else
		Skill150Dialog("§èi víi bæn tiÓu th­ mµ nãi, c¸i lo¹i gäi lµ nam nh©n th× kh«ng mêi hä hä còng dÉn x¸c ®Õn, ®èi xö tèt víi hä mét chót, th× mét tªn hai tªn ®ang b¸n m¹ng cho ta ®ã th«i.")
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


function L20_get()
	Say("C¸i bän La Tiªu S¬n ®ã rÊt thÌm kh¸t s¾c ®Ñp cña tiªn tö nµy! Hõ! Cãc thèi mµ ®ßi ¨n thÞt thiªn nga! Ng­¬i h·y chÞu khã lªn La Tiªu S¬n lÇn n÷a, giÕt s¹ch hÕt bän chóng cho ta",2,"D¹! Thuéc h¹ sÏ lËp tøc ®i lÊy ®Çu bän chóng. /L20_get_yes","Thuéc h¹ vâ c«ng kÐm cái, e r»ng. /L20_get_no")
end;

function L20_get_yes()
	Talk(1, "", "VËy th× ta sÏ ®îi ®Ó nghe tin tèt cña ng­¬i nhÐ!")
	SetTask(10,20*256+10)
	AddNote("V× B¹ch Doanh Doanh, ®Õn La Tiªu s¬n ®Ô giÕt La Tiªu ThÊt Quû ")
	Msg2Player("V× B¹ch Doanh Doanh, ®Õn La Tiªu s¬n ®Ô giÕt La Tiªu ThÊt Quû ")
end;

function L20_get_no()
	Talk(1,"","Ta ®· vèn biÕt ng­¬i chØ lµ mét tªn tiÓu quû nh¸t gan. ThËt lµ thø v« dông!")
end;

function L20_prise()
	Talk(1,"","Hahaha! ThËt vui qu¸! Ng­¬i thËt rÊt cã b¶n lÜnh! §­îc! Tiªn tö ta gi÷ lêi th¨ng ng­¬i lµ Th«i MÖnh Sø Gi¶ ")
	i = GetItemCount(85)				-- ÈËÍ·
	for j = 1,i do DelItem(85) end
	SetTask(10,30*256)
	SetRank(51)
--	AddMagic(70)
--	AddMagic(66)
	add_wu(30)			-- µ÷ÓÃskills_table.luaÖÐµÄº¯Êý£¬²ÎÊýÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n! §· ®­îc th¨ng lµ Ngò §éc Gi¸o Th«i mÖnh sø gi¶ SÏ ®­îc häc vâ c«ng: XÝch DiÖm Thùc Thiªn, T¹p Nan D­îc Kinh ")
	AddNote("V× B¹ch Doanh Doanh, ®i giÕt La Tiªu s¬n thÊt quû, ®­îc th¨ng lµ: Th«i MÖnh Sø Gi¶ ")
end;

function Uworld50_20()
	SetTask(50,30)
	Msg2Player("Nghe nh÷ng lêi cña B¹ch Doanh Doanh, b¹n còng c¶m thÊy ®ång c¶m, th­¬ng xãt, nh­ng kh«ng biÕt lµm c¸ch nµo ®Ó gióp ®ì ")
end
