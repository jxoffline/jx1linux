-- special_horse.lua ÂôÌØÊâÂí(80¼¶Âí)µÄNPC½Å±¾
-- By Dan_Deng(2003-11-10)

function main()
	UWorld97 = GetTask(97)
	if (UWorld97 == 10) then		-- ÒÑ¾­Âò¹ı
		Talk(1,"","Ng­¬i nhÊt ®Şnh ph¶i ®èi ®·i tèt víi ngùa, h»ng ngµy ph¶i t¾m cho nã, b¸nh ®Ëu ph¶i gi· bét cho nhuyÔn... ")
	elseif (UWorld97 == 1) and (IsTongMaster() == 1) then			-- ¿ÉÒÔÂòÂí
		Talk(4,"sele_color","VŞ anh hïng nµy xin dõng b­íc ®·. ","Huynh ®µi, cã chuyÖn g× cÇn chØ gi¸o? ","T¹i h¹ ThÈm C©u, hiÖn cã 1 con thiªn lİ m· muèn b¸n, xem vŞ huynh ®µi nµy nhÊt ®Şnh lµ mét ®¹i t«ng s­ cña chİnh ph¸i. Ngùa tèt cña t¹i h¹ thËt kh«ng xÊu hæ khi phôc vô anh hïng. ","§Ó ta xem thö ngùa quı cña huynh,,, ")
	else
		Talk(1,"","Thiªn Lı m· kh«ng thiÕu, nh­ng ng­êi biÕt dïng ngùa hái cã mÊy ai!")
	end
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
	Say("Kh«ng sai,anh hïng qu¶ nhiªn biÕt nh×n!  T¹i h¹ ®©y còng kh«ng muèn ph¶i b¸n nã,nh­ng hiÖn giê t¹i h¹ cÇn 300 v¹n l­îng b¹c!  Hy väng anh hïng ®èi ®·i tèt víi nã! ",2,"kh«ng sao ®©u, ta nhÊt ®Şnh sÏ ®èi xö tèt víi nã mµ /buy_yes","NhÊt thêi lµm sao t×m ra ®­îc sè tiÒn nµy /buy_no")
end

function buy_yes()
	if (GetCash() >= 3000000) then
		i = GetTaskTemp(49)
		Pay(3000000)
		AddItem(0,10,5,i,0,0,0)
		SetTask(97,100+i)			-- ±äÁ¿¸³Öµ£¬²¢ÇÒ¼Ç×¡ÂòµÄÊÇÊ²Ã´ÑÕÉ«Âí
		Talk(1,"","Ngùa ¬i ngùa! Tõ ®©y vÒ sau ng­¬i h·y ®i theo vŞ anh hïng nµy nhĞ, nhÊt ®Şnh ph¶i ngoan ngo·n ®ã!")
	else
		Talk(1,"","Ta hiÖn giê trong ng­êi kh«ng mang theo ®ñ ng©n l­îng, huynh t¹m thêi cÇm ®ì sè tiÒn nµy vËy!")
	end
end

function buy_no()
	Talk(1,"","Kh«ng lÏ sè tiÒn nµy l¹i lµm khã anh hïng sao")
end
