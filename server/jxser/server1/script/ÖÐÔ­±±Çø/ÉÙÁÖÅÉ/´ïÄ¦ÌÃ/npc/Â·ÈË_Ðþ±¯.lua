-- ÉÙÁÖ Â·ÈËNPC ´ïÄ¦ÔºÐþ±¯ 20¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-01)
-- update by: xiaoyang(2004\4\15) ÉÙÁÖÅÉ90¼¶ÈÎÎñ 

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_sl = GetTask(7)
	Uworld122 = GetTask(122)
	if(GetSeries() == 0) and (GetFaction() == "shaolin") then
		if(UTask_sl == 20*256+128) then		--20¼¶ÈÎÎñ½øÐÐÖÐ
			L20_prise()
		elseif((UTask_sl == 20*256) and (GetLevel() >= 20)) then		--20¼¶ÈÎÎñ
			Talk(2,"L20_get","GÇn ®©y cã 5 tªn ®Ö tö ®Õn tõ ®Êt Bå, Phóc KiÕn, do Ph­¬ng Tr­îng Nam ThiÕu L©m ®Ò cö, nh­ng do 5 tªn nµy ®· g©y n¸o lo¹n ThiÕu l©m, Ph­¬ng Tr­îng bã tay, hy väng bæn tù cã thÓ gi¸o hãa bän chóng, nh­ng bän chóng qu¸ ngç ng­îc cøng ®Çu, kh«ng thÌm nghe lêi khuyªn r¨n. ThËt ®au ®Çu qu¸!","5 tªn ngç ng­îc ®ã b©y giê ë ®©u?")
		else
			Talk(1,"","Ng­êi xuÊt gia chó träng minh t©m kiÕt tÝnh!")
		end
	elseif(Uworld122 == 10) then
		Talk(5,"Uworld122_find","HuyÒn Bi ®¹i s­! Trªn ®­êng lªn Hoa S¬n ta thÊy cã rÊt nhiÒu ®Ö tö ThiÕu L©m ®¸nh nhau chÝ tö, kh«ng biÕt lµ v× chuyÖn g×?","ThiÕu L©m muèn chän ng­êi thÝch hîp trong c¸c ®Ö tö ng­êi thÝch hîp ®Ó tu luyÖn 72 tuyÖt nghÖ t¹i Tµng Kinh C¸c. Nh÷ng kÎ giái giang ®Òu tõ §¹t Ma ViÖn cña ta vµ La H¸n §­êng cña HuyÒn Nan. §Ö tö cña La H¸n §­êng kh«ng gièng cña §¹t Ma ViÖn,lu«n tranh giµnh ®Þa vÞ, ®¹i kh¸i c©u chuyÖn lµ nh­ vËy.","§¹t Ma La H¸n ®Òu tõ ThiÕu L©m, hµ cí g× ph¶i tranh giµnh, ai häc mµ ch¼ng ®­îc!","§Ö tö cña ta siªu phµm xuÊt chóng, chän ai nh­êng ai?","Ch¼ng ph¶i La H¸n §­êng còng thuéc ThiÕu L©m sao?")
   elseif(Uworld122 >=20) and (Uworld122 < 30)then
   	Talk(1,"","§i t×m HuyÒn Nan ®i... ")
   elseif(Uworld122 == 30)then
   	Talk(5,"Uworld122_alow","§¹i s­! HuyÒn Nan ®aÞ s­ kh«ng nghe ta khuyªn gi¶i. Ta ®i qua Hoa S¬n thÊy rÊt nhiÒu cao thñ cña Kim quèc mai phôc, e r»ng cã ©m m­u g× ®ã.","Ng­¬i thÊy thËt chø?","TuyÖt kh«ng nãi dèi! ","¤i……Ng­¬i h·y ®i nãi c¸c ®Ö tö §¹t ma ViÖn ®õng ®¸nh nhau n÷a. §©y lµ lÖnh bµi cña ta. NÕu thËt sù lµ qu©n Kim, hy väng cã thÓ gióp tiÓu tù diÖt chóng.","T¹i h¹ xin tu©n lÖnh.")
	elseif (Uworld122 == 50) and (HaveItem(392) == 0) then
   	Talk(1,"","ThÝ chñ ®· ®Ó quªn mÊt lÖnh bµi n¬i l·o n¹p ®©y, kh«ng cã nã e ®Ö tö ThiÕu L©m kh«ng tin")
   	AddEventItem(392)
   	Msg2Player("NhËn l¹i lÖnh ThiÕu L©m t¨ng chóng ")
   elseif(Uworld122 >= 50) and (Uworld122 <= 60) then
   	Talk(1,"","Cã thÓ thËt sù chóng ta ®· sai... ")
   elseif (Uworld122 == 65) and (HaveItem(392) == 1) then
   	Talk(4,"U122_finish","Mèi nguy hiÓm Hoa S¬n ®· ®­îc hãa gi¶i, may lµ ®Õn kÞp kh«ng x¶y ra th­¬ng vong g× hÕt.","BÇn t¨ng ®· nhËn ®­îc tin cña ®Ö tö, thËt xÊu hæ lµm sao." ,"§¹i s­ ®õng nªn nh­ vËy, trong hiÓm nguy mµ ngµi qu¶ quyÕt ®­îc sù viÖc ®óng lµ b¶n s¾c anh hïng.","Anh b¹n trÎ ®õng trªu l·o n¹p n÷a, ng­¬i h·y ®Õn t×m HuyÒn Nan ®i «ng ta cã chuyÖn muèn nãi víi ng­¬i ®ã, ha ha.!")
   else							-- ³£¹æ¶Ô»°
		Talk(1,"","Ch­ëng m«n s­ huynh mÊy n¨m nay nghÜ c¸ch chèng Kim ®Õn ®é l«ng mi còng b¹c tr¾ng lu«n.")
	end
end;

function L20_get()
	Say("Hä ®· ®i Phôc Ng­u s¬n T©y. MÊy ng­êi nµy û cã vµi chiªu ®· kh«ng xem ng­êi Trung Nguyªn trong m¾t hä.",2,"§Ó ta ®i gi¸o huÊn bän chóng. /L20_get_yes","E r»ng ta kh«ng lµm ®­îc /L20_get_no")
end;

function L20_get_yes()
	Talk(1, "", "Hä tõ xa ®Õn còng xem nh­ lµ kh¸ch, ng­¬i ra tay ph¶i dÌ chõng ®ã.")
	SetTask(7,20*256+64)
--	SetTaskTemp(42,0)			-- ´´½¨ÁÙÊ±±äÁ¿£¨TaskTempµÄIDºÅÎª42£©£¨È¡ÏûÁÙÊ±±äÁ¿£©
	AddNote("Thay §¹t Ma ViÖn thñ täa HuyÒn Bi ®¹i s­ gi¸o huÊn n¨m g· ngç ng­îc. ")
	Msg2Player("Thay §¹t Ma ViÖn thñ täa HuyÒn Bi ®¹i s­ gi¸o huÊn n¨m g· ngç ng­îc. ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(2,"","S­ thóc! Ta ®· thu phôc 5 tªn man rî kia, tõ nay vÒ sau hä kh«ng d¸m g©y sù n÷a ®©u!","Ng· PhËt tõ bi! ThiÖn tai thiÖn tai!")
	SetTask(7,30*256)
	SetRank(3)
--	AddMagic(15)
	add_sl(30)			-- µ÷ÓÃskills_table.luaÖÐµÄº¯Êý£¬²ÎÊýÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	AddNote("Thu phôc ®­îc n¨m g· ngç ng­îc, th¨ng cÊp Hé Tù Kim Cang. ")
	Msg2Player("Chóc mõng b¹n! B¹n ®· th¨ng cÊp Hé Tù Kim Cang cña ThiÕu L©m tù! Häc ®­îc vâ c«ng BÊt §éng Minh V­¬ng. ")
end;

function Uworld122_find()
	Talk(1,"","HuyÒn Bi:... Ng­¬i h·y ®i t×m HuyÒn Nan ®i. ")
	SetTask(122,20)  --ÉèÖÃÈÎÎñ±äÁ¿20
	Msg2Player("HuyÒn Bi óp óp më më kh«ng ®¸p, b¶o b¹n ®i t×m HuyÒn Nan hái cho râ. ")
	AddNote("HuyÒn Bi óp óp më më kh«ng ®¸p, b¶o b¹n ®i t×m HuyÒn Nan hái cho râ. ")
end

function Uworld122_alow()
	AddEventItem(392)
	Msg2Player("LÊy ®­îc ThiÕu L©m t¨ng chóng lÖnh. ")
	SetTask(122,50)  --ÉèÖÃÈÎÎñ±äÁ¿50
	Msg2Player("§¸p øng HuyÒn Bi, ®Õn Hoa s¬n cøu c¸c ®Ö tö ThiÕu L©m, giÕt t­íng lÜnh Kim quèc. ")
	AddNote("§¸p øng HuyÒn Bi, ®Õn Hoa s¬n cøu c¸c ®Ö tö ThiÕu L©m, giÕt t­íng lÜnh Kim quèc. ")
end

function U122_finish()
	DelItem(392)
	Msg2Player("Giao l¹i ThiÕu L©m t¨ng chóng lÖnh. ")
	SetTask(122,70)
	Msg2Player("Hßa gi¶i víi HuyÒn Bi, ®i t×m HuyÒn Nan. ")
	AddNote("Hßa gi¶i víi HuyÒn Bi, ®i t×m HuyÒn Nan. ")
end
