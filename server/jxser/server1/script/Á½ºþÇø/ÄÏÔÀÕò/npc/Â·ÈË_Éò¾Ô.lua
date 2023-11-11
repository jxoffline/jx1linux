-- Â·ÈË_Éò¾Ô ÄÏÔÀÕò ÂôÌØÊâÂí(80¼¶Âí)µÄNPC½Å±¾
-- By Dan_Deng(2003-11-10)

Include("\\script\\tong\\tong_header.lua");
Include("\\script\\activitysys\\g_activity.lua")
Include("\\script\\dailogsys\\g_dialog.lua")
Include("\\script\\activitysys\\playerfunlib.lua")
Include("\\script\\activitysys\\answer.lua")
Include("\\script\\activitysys\\npcfunlib.lua")

function main()
	do return end
	UWorld97 = GetTask(97)
	str, result = GetTong()	
--	if (UWorld97 >= 10) then		-- ÒÑ¾­Âò¹ı
--		Talk(1,"","Éò¾Ô£ºÄãÒ»¶¨ÒªºÃºÃ¶Ô´ıÂí¶ù£¬Ã¿ÌìÒª¸øËüÏ´Ôè£¬¶¹±ıÀïÃæÒª²ôÉÏ¾«Ãæ......")
	if (UWorld97 < 100) and (result == 1) and (GetTongFigure() == TONG_MASTER) then			-- ÊÇ°ïÖ÷£¬Ã»ÓĞÏíÊÜ¹ıÓÅ»İÂòÂí
		SetTaskTemp(17,1000)
	else								-- ÆÕÍ¨ÂòÂí
		SetTaskTemp(17,1500)
--		Talk(1,"","Éò¾Ô£ºÇ§ÀïÂí³£ÓĞ£¬¶ø²®ÀÖ²»³£ÓĞ¡£Í½ºô£¡ÄÎºÎ£¡")
	end
	
	local nNpcIndex = GetLastDiagNpc();
	local szNpcName = GetNpcName(nNpcIndex);
	if NpcName2Replace then szNpcName = NpcName2Replace(szNpcName); end
	local tbDailog = DailogClass:new(szNpcName);
	tbDailog.szTitleMsg = "<#><npc>T¹i h¹ nu«i ngùa rÊt nhiÒu n¨m, chØ cÇn xem qua lµ biÕt tèt hay kh«ng!"
	
	G_ACTIVITY:OnMessage("ClickNpc", tbDailog, nNpcIndex);
	tbDailog:AddOptEntry("Lóc n·y ng­¬i gäi ta?", horse_get);

	tbDailog:Show();
end

function horse_get()
	Talk(4,"sele_color","VŞ anh hïng nµy xin dõng b­íc ®·. ","Huynh ®µi, cã chuyÖn g× cÇn chØ gi¸o? ","T¹i h¹ lµ ThÉm C©u, hiÖn cã mét con ngùa quı, cã thÓ phi ®­îc ngµn dÆm. VŞ anh hïng ®©y phong th¸i bÊt phµm, nhÊt ®Şnh lµ 1 cao thñ. Ngùa quı cña t¹i h¹ kh«ng bao giê chŞu khuÊt phôc kÎ thÊt phu. ","§Ó ta xem thö ngùa quı cña huynh,,, ")
end

function sele_color()
	Say("Anh hïng h·y xem! ",6,"§©y kh«ng ph¶i lµ ¤ V©n §¹p TuyÕt sao! /buy_black","§©y kh«ng ph¶i lµ Xİch Thè B¶o M· sao! /buy_red","§©y kh«ng ph¶i lµ TuyÖt ¶nh sao! /buy_cyan","§©y kh«ng ph¶i lµ §İch L« sao! /buy_yellow","§©y ch¼ng ph¶i lµ ChiÕu D¹ Ngäc S­ Tö sao! /buy_white","§©y lµ ngùa g× vËy? T¹i h¹ hiÓu biÕt cßn kĞm /buy_none")
end

function buy_black()
	the_buy(1)
end

function buy_red()
	the_buy(2)
end

function buy_cyan()
	the_buy(3)
end

function buy_yellow()
	the_buy(4)
end

function buy_white()
	the_buy(5)
end

function buy_none()
	Talk(1,"","NhÊt bang chi chñ, lµ mét nh©n vËt bËc thÇy lµm sao kh«ng biÕt ®©y rèt cuéc lµ ngùa g× chø? Thø lçi, xem ra t¹i h¹ ®· nh×n lÇm ng­êi!")
end

function the_buy(i)
	SetTaskTemp(49,i)
	x = GetTaskTemp(17)
	if (x == 1000) then
		Say("Kh«ng sai! Ng­êi qu¶ thËt lµ anh hïng. T¹i h¹ vèn ch¼ng muèn b¸n con ngùa nµy ®©u, nh­ng v× ®ang cÇn gÊp 1000 l­îng b¹c, v· l¹i nh×n thÊy anh hïng còng thËt sù thİch nã nªn nĞn lßng mµ b¸n nã cho anh hïng, mong r»ng anh hïng h·y th­¬ng yªu nu«i d­ìng nã ",2,"kh«ng sao ®©u, ta nhÊt ®Şnh sÏ ®èi xö tèt víi nã mµ /buy_yes","NhÊt thêi lµm sao t×m ra ®­îc sè tiÒn nµy /buy_no")
	else
		Say("Kh«ng sai! Ng­êi qu¶ thËt lµ anh hïng. T¹i h¹ vèn ch¼ng muèn b¸n con ngùa nµy ®©u, nh­ng v× ®ang cÇn gÊp 1500 l­îng b¹c, v· l¹i nh×n thÊy anh hïng còng thËt sù thİch nã nªn nĞn lßng mµ b¸n nã cho anh hïng, mong r»ng anh hïng h·y th­¬ng yªu nu«i d­ìng nã ",2,"kh«ng sao ®©u, ta nhÊt ®Şnh sÏ ®èi xö tèt víi nã mµ /buy_yes","NhÊt thêi lµm sao t×m ra ®­îc sè tiÒn nµy /buy_no")
	end
end

function buy_yes()
	x = GetTaskTemp(17)
	if (GetCash() >= x * 10000) then
		i = GetTaskTemp(49)
		if (x == 1000) then			-- ÊÇÓÅ»İ¼ÛÂòµÄ£¬Îª±äÁ¿¸³Öµ£¬²¢ÇÒ¼Ç×¡ÂòµÄÊÇÊ²Ã´ÑÕÉ«Âí
			SetTask(97,100+i)
		end
		Pay(x * 10000)
		AddItem(0,10,5,i,0,0,0)
		Talk(1,"","Ngùa ¬i ngùa! Tõ ®©y vÒ sau ng­¬i h·y ®i theo vŞ anh hïng nµy nhĞ, nhÊt ®Şnh ph¶i ngoan ngo·n ®ã!")
	else
		Talk(1,"","Ta hiÖn giê trong ng­êi kh«ng mang theo ®ñ ng©n l­îng, huynh t¹m thêi cÇm ®ì sè tiÒn nµy vËy!")
	end
end

function buy_no()
	Talk(1,"","Kh«ng lÏ sè tiÒn nµy l¹i lµm khã anh hïng sao")
end
