-- ÖĞÔ­ÄÏÇø\Îäµ±ÅÉ\Îäµ±ÅÉ\npc\Â·ÈË_ÀîÌìÄ¿.lua
-- by xiaoyang(2004\4\15) Îäµ±90¼¶ÈÎÎñ

Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
Uworld129 = GetTask(129)
Uworld31 = GetByte(GetTask(31),1)
	if (Uworld129 < 10) and (GetReputeLevel(GetRepute()) >= 5) and (GetLevel() >= 90) and (GetFaction() ~="wudang") and (Uworld31 ==127) then
		Talk(2,"Uworld129_interchange","Lı ®¹o tr­ëng tuæi trÎ tµi cao! T¹i h¹ ng­ìng mé ®· l©u! Xin ®­îc thØnh gi¸o!","NÕu nãi ®Õn si mª vâ häc, c¶ Vâ §ang nµy kh«ng ai h¬n s­ ®Ö Chu V©n TuyÒn. Ng­¬i h·y ®i t×mhuynh Êy ®i!")
   elseif (Uworld129 == 20)then
   	Talk(9,"Uworld129_interchange2"," Lı ®¹i hiÖp! T¹i h¹ muèn lªn nói häc vâ. S­ huynh Chu V©n TuyÒn b¶o t«i ®Õn t×m «ng.","§¹i hiÖp ta kh«ng d¸m nhËn!","VËy µ? Sao T¹i h¹ kh«ng c¶m thÊy vËy?","H«m nay gÆp nhau, xem nh­ lµ cã duyªn phËn vËy!","T¹i h¹ muèn thØnh gi¸o Lı huynh quan ®iÓm vÒ néi ngo¹i gia?","Néi tøc ngo¹i lùc ph¶i t­¬ng hîp, lùc do khİ sinh, khİ nh©n lùc dòng, phèi hîp lÉn nhau. XĞt tõ môc ®İch cña ng­êi häc vâ mµ nãi, vÉn lµ lÊy khİ lµm chñ. LuyÖn khİ chØ luyÖn t©m, t©m tŞnh t¾c sinh, v« dôc t¾c c­¬ng","§­îc nghe nh÷ng lêi ®ã, ¾t h¼n ph¶i mÊt 10 n¨m ®Ìn s¸ch!","C¸c h¹ tuæi trÎ tµi cao, hµ tÊt ph¶i khiªm tèn nh­ vËy!","ThËt sù Chu huynh qu¸ xem träng t¹i h¹! T¹i h¹ sÏ cè g¾ng!")
	elseif (Uworld129 == 40)then
		Talk(10,"Uworld129_interchange3","Chu huynh bÊt ngê nhËn ®­îc th­ nhµ, ®· xuèng nói råi! Ta ®Õn ®Ó b¸o l¹i cho ng­¬i.","Th­ nhµ? Ng­¬i ®· tõng xem qua néi dung ch­a?","§¹i kh¸i s­ huynh nãi cha mÑ ë nhµ rÊt nhí, nªn lËp tøc xuèng nói 1 chuyÕn.","Háng råi! ","Sao?","Tr­íc ®©y Chu s­ huynh tõ nhá lªn nói, ®· rÊt l©u kh«ng liªn hÖ ng­êi nhµ. Lóc Tèng Kim giao binh, thiªn h¹ ®¹i läan, nh©n d©n lÇm than. S­ phô ®· ph¸i ng­êi ®iÒu tra, nh­ng kh«ng cã tin tøc cña cha mÑ s­ huynh. L¸ th­ ®ã cã thÓ lµ gi¶.","VËy thÕ nµo míi lµ tèt!","May nhê C¸c h¹ th«ng b¸o kŞp thêi, b©y giê vÉn cßn kŞp. Ng­¬i h·y ®Õn Phôc Ng­u s¬n, ©m thÇm b¶o vÖ Chu s­ huynh.","T¹i h¹ ®· nghe danh Vâ §ang tõ l©u,cã thÓ cã c¬ héi gióp ®ì thËt lµ vinh h¹nh!","Theo lêi trong th­ nãi nhµ Chu huynh ë c¹nh Thiªn T©m ®éng.")
	elseif (Uworld129 == 60) and (GetFaction() ~= "wudang") then
		Talk(6,"Uworld129_finish","Huynh qu¶ thËt kh«ng hæ danh! §óng lµ ©m m­u cña Thiªn NhÉn gi¸o.","Xem ra qu©n Kim ®· b¾t ®Çu ®éng thñ. Chu s­ huynh ta kh«ng biÕt thÕ nµo råi?","BŞ th­¬ng kh«ng nhÑ, nh­ng tİnh m¹ng ®· ®­îc b¶o toµn. E r»ng ph¶i nghØ ng¬i mét thêi gian!","Thiªn Môc kh«ng biÕt c¸m ¬n ®¹i ©n cña huynh ®èi víi Vâ §ang? Ta tÆng huynh mét cuèn Vâ §ang mËt tŞch.","V¹n lÇn kh«ng nªn! Hµnh hiÖp tr­îng nghÜa lµ bæn phËn cña t«i.")
	else
		Talk(1,"","Kh«ng cÇu g× h¬n! ChØ hy väng Vâ §ang tai qua n¹n khái!")
	end
end

function Uworld129_interchange()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- °×ÃûÎ´Ñ§Ò°ÇòÈ­µÄ£¬²»ÔÊĞí½ÓÈÎÎñ
		Talk(1,"","Nh­ng ng­¬i vèn kh«ng biÕt vâ c«ng, ch¾c g× Chu s­ ®Ö chŞu nãi chuyÖn víi ng­¬i?")
	else
		SetTask(129,10)  --ÈÎÎñÆô¶¯
		Msg2Player("Lı Thiªn Môc ®Ó ng­¬i t×m Chu V©n TuyÒn häc hái vâ nghÖ. ")
		AddNote("Lı Thiªn Môc ®Ó ng­¬i t×m Chu V©n TuyÒn häc hái vâ nghÖ. ")
	end
end

function Uworld129_interchange2()
	SetTask(129,30)  --ÉèÖÃÈÎÎñ±äÁ¿30
	Msg2Player("Lı Thiªn Môc ®Ó ng­¬i khuyªn Chu V©n TuyÒn kh«ng qu¸ say mª vâ ®¹o. ")
	AddNote("Lı Thiªn Môc ®Ó ng­¬i khuyªn Chu V©n TuyÒn kh«ng qu¸ say mª vâ ®¹o. ")
end

function Uworld129_interchange3()
	SetTask(129,50)  --ÉèÖÃÈÎÎñ±äÁ¿50
	Msg2Player("NhËn lêi Lı Thiªn Môc ®i T©y ¸m Trung Phôc Ng­u s¬n b¶o vÖ Chu V©n TuyÒn. ")
	AddNote("NhËn lêi Lı Thiªn Môc ®i T©y ¸m Trung Phôc Ng­u s¬n b¶o vÖ Chu V©n TuyÒn. ")
end

function Uworld129_finish()
	if (GetTask(5) >= 70*256) and (GetTask(5) ~= 75*256) then
		Talk(2,"","Ta ®­a nã cho ng­¬i v× hy väng ng­¬i cã thÓ ph¸t d­¬ng quang ®¹i, nh­ thÕ vâ l©m Trung nguyªn l¹i cã thªm 1 phÇn lùc l­îng chèng Kim.",".....VËy ®­îc! T¹i h¹ xin nhËn!")
		if (HaveMagic(365) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(365,1)
		end
		if (HaveMagic(368) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(368,1)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("Häc ®­îc kü n¨ng Thiªn §Şa V« Cùc, Nh©n KiÕm Hîp NhÊt ")
		SetTask(129,255)
	else
	   SetTask(129,245)  --»ñµÃÉùÍûµÄÉèÖÃ±äÁ¿245
	end
   add_repute = ReturnRepute(30,100,4)			-- ÉùÍû½±Àø£º×î´ó30µã£¬´Ó100¼¶ÆğÃ¿¼¶µİ¼õ4%
   AddRepute(add_repute)
   Msg2Player("Cøu Chu V©n TuyÒn, nhiÖm vô hoµn thµnh. Danh väng cña b¹n t¨ng thªm "..add_repute.."®iÓm.")
   AddNote("Cøu Chu V©n TuyÒn, nhiÖm vô hoµn thµnh. NhiÖm vô hoµn thµnh ")
end
