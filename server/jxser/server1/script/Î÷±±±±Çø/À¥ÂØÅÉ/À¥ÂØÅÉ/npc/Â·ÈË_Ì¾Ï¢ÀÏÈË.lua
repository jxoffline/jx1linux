-- À¥ÂØ ÆÍÒÛ Ì¾Ï¢ÀÏÈË 20¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-30)
-- by: xiaoyang(2004\4\20) Ë½»»ÃØóÅÈÎÎñ£¨À¥ÂØ90¼¶ÈÎÎñ£©

Include("\\script\\global\\skills_table.lua")
Include("\\script\\global\\repute_head.lua")

Include("\\script\\item\\skillbook.lua")

function main()
	UTask_kl = GetTask(9)
	Uworld130 = GetTask(130)
	Uworld31 = GetByte(GetTask(31),2)
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 20*256+10) and (HaveItem(7) == 1)) then		--20¼¶ÈÎÎñ½øĞĞÖĞ
			Talk(1,"L20_prise","§¹i gia! X­¬ng ®Çu L¹c §µ nµy cã ph¶i cña «ng kh«ng?")
		elseif ((UTask_kl == 20*256) and (GetLevel() >= 20)) then		--20¼¶ÈÎÎñ
			Talk(4,"L20_get","C¸i x­¬ng ®Çu L¹c §µ cña l·o bŞ mÊt råi, b©y giê ph¶i lµm g× ®©y? Hõm! NhÊt ®Şnh bŞ kÎ nµo lÊy c¾p råi!","§¹i gia! ¤ng cÇn x­¬ng ®Çu L¹c §µ ®Ó lµm g×?","Ng­¬i míi ®Õn ®óng kh«ng? Th¶o nµo mµ ta còng kh«ng biÕt lµ ai. Ta chİnh lµ Th¸n Tøc L·o Nh©n! Ch­ëng m«n ®ang luyÖn 1 chiªu tuyÖt thÕ vâ c«ng, ®ang cÇn 1 l­îng lín x­¬ng ®Çu L¹c §µ, b©y giê bŞ kÎ nµo ®¸nh c¾p råi, Ch­ëng m«n mµ chÊt vÊn, c¸i th©n giµ cña ta ch¾n kh«ng b¶o toµn ®­îc! Ph¶i lµm sao ®©y? B©y giê ph¶i lµm sao ®©y?","Sao kh«ng xuèng nói ®Ó mua")
		else
			Talk(1,"","B¹ch thñ t­¬ng tri do an kiÕm, chu m«n tiªn ®¹t tiÕu ®µm quan")
		end
	elseif (Uworld130 < 10) and (GetLevel() >= 90) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~="kunlun") and (Uworld31 ==127) then
		Talk(8,"Uworld130_get","L·o h¸n nµy g­¬ng mÆt ch»n chŞt sÑo, cùc kú xÊu xİ, mçi ngµy ®Òu quĞt l¸ rông bªn trong C«n L«n ph¸i, rÊt İt nãi chuyÖn, nh­ thÓ ®»ng sau che giÊu nh÷ng chuyÖn kh«ng thÓ cho ai biÕt ®­îc. Nghe ®©u l·o chİnh lµ Th¸n Tøc L·o Nh©n - Ch­ëng m«n cña ®êi tr­íc","L·o tiÒn bèi!","L·o tiÒn bèi?...§· rÊt l©u kh«ng cßn ai gäi ta nh­ thÕ n÷a. ","Ta nghe nãi...l·o chİnh lµ Ch­ëng m«n ®êi tr­íc cña C«n L«n","§ã lµ chuyÖn cña rÊt nhiÒu n¨m tr­íc råi, kh«ng nh¾c tíi n÷a.","V·n bèi nghe ®¹i danh cña tiÒn bèi,®Õn ®©y thØnh gi¸o!","Haha! Ng­¬i vÉn cho r»ng C«n L«n b©y giê vÉn cßn lµ 1 ®¸m ng­êi rêi r¹c tranh giµnh quyÒn lùc lÉn nhau sao?","VËy th× nh­ thÕ nµo?")
	elseif (Uworld130 == 20)then
		Talk(8,"Uworld130_help","§· thÊy g× ch­a?","Ch­a thÊy g× c¶! ","HiÖn t¹i C«n L«n ph¸i vÉn tån t¹i nh÷ng tªn nhá nhÆt soi mãi nh­ thÕ, ng­¬icÇn g× ph¶i kÕt nhãm víi ®¸m ng­êi ®ã!","V·n bèi nghe nãi bän hä h×nh nh­ ®ang trao ®æi Cuång Phong SËu §iÖn vµ Ngò L«i Ch¸nh Ph¸p g× ®ã","Bi kŞch n¨m x­a giê ®· lÆp l¹i! L·o phu còng v× n¨m x­a tuÇn tù truyÒn hÕt tuyÖt chiªu cho 3 ®å ®Ö, g©y cho chóng nghi kş lÉn nhau, nªn häp søc l¹i phÕ ta. B©y giê …Çy!","Lo¹i ®å ®Ö v« sØ nh­ thÕ, kh«ng nªn ®Ó t©m ®Õn lµm g×. Cø ®Ó bän chóng tù sinh tù tµn.","BÊt luËn thÕ nµo, l·o phu còng lµ mét thµnh viªn cña C«n L«n. Nh­ng l·o phu kh«ng tiÖn ra tay, cã thÓ nhê tiÓu hiÖp ®©y gióp chuyÖn nµy kh«ng? L·o phu c¶m kİch v« cïng, C«n L«n còng sÏ tèt h¬n trong vµi n¨m tíi!","§­îc th«i!")
   elseif (Uworld130 == 40) and (GetFaction() ~= "kunlun") then
   	Talk(4,"Uworld130_finish","TiÒn bèi! Ta ®· gióp «ng d¹y dç 2 tªn nµy. Nh­ng chØ sî mÊy tªn tiÓu tèt nµy b¶n chÊt khã thay ®æi, còng xin tiÒn bèi ra tay d¹y dç! ","Vâ c«ng cña ta toµn bé kh«ng cßn, ®· xem nh­ ng­êi tµn phÕ ","Sao?","Nh÷ng chuyÖn cò còng kh«ng nªn nh¾c l¹i lµm g× ")
   elseif (Uworld130 > 10) and (Uworld130 < 40)then
   	Talk(1,"","C«n L«n mÖnh ®å nhiÒu tr¾c trë, nÕu ®­îc c¸c vŞ ra tay gióp ®ì, l·o phu thËt sù c¶m kİch v« cïng! ")
	else
		Talk(1,"","L·o giµ råi! Còng kh«ng cßn h÷u dông n÷a!")
	end
end;

function L20_get()
	Say("Mua? TÊt nhiªn lµ kh«ng thÓ mua ®­îc! C¸i x­¬ng ®Çu nµy ta ph¶i phİ mÊt rÊt nhiÒu søc lùc míi t×m ®­îc, lÇn nµy bŞ ®¸nh c¾p th× ta chÕt ch¾c råi",2,"Ng­êi kh«ng cÇn ph¶i lo l¾ng, ta sÏ gióp ng­êi t×m l¹i c¸i x­¬ng ®Çu l¹c ®µ nµy. /L20_get_yes","VËy th× kh«ng cßn c¸ch nµo c¶ /L20_get_no")
end;

function L20_get_yes()
	Talk(1,"","Ng­¬i ®óng lµ hiÖp kh¸ch tèt bông, chØ cÇn ng­¬i t×m ®­îc x­¬ng ®Çu l¹c ®µ, ta sÏ tiÕn cö ng­¬i tr­íc mÆt Ch­ëng m«n ®Ó trë thµnh ®Ö tö cÊp 20")
	SetTask(9,20*256+10)
	AddNote("NhËn nhiÖm vô cÊp 20, t×m l¹i x­¬ng ®Çu l¹c ®µ bŞ ®¸nh mÊt. ")
	Msg2Player("NhËn nhiÖm vô cÊp 20, t×m l¹i x­¬ng ®Çu l¹c ®µ bŞ ®¸nh mÊt. ")
end;

function L20_get_no()
end;

function L20_prise()
	Talk(1,"","§©y råi! §©y råi! RÊt c¶m ¬n ng­¬i! Ta nhÊt ®Şnh sÏ tiÕn cö ng­¬i víi Ch­ëng m«n")
	DelItem(7)
	SetTask(9,30*256)
	SetRank(21)
--	AddMagic(174)
	add_kl(30)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! §· ®­îc th¨ng cÊp thµnh C«n L«n ph¸i Tö Vi Hé Ph¸p, häc ®­îc Ky B¸n phï. ")
	AddNote("T×m ®­îc x­¬ng ®Çu l¹c ®µ, giao cho Th¸n Tøc L·o Nh©n, hoµn thµnh nhiÖm vô. Th¨ng cÊp thµnh Tö Vi hé ph¸p ")
end;

function Uworld130_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- °×ÃûÎ´Ñ§Ò°ÇòÈ­µÄ£¬²»ÔÊĞí½ÓÈÎÎñ
		Talk(1,"","YÕu ®uèi kh«ng cã søc nh­ ng­¬i nãi nhiÒu còng v« İch! §i ®i!")
	else
		Say("NÕu ng­¬i thùc sù muèn häc, th× tr­íc hÕt ®i ra phİa sau ngän nói, chØ cÇn nh×n qua sÏ biÕt!",2,"§i th× ®i /Uworld130_yes","Ng­êi muèn d¹y th× d¹y, kh«ng d¹y th× th«i. /Uworld130_no")
	end
end

function Uworld130_yes()
	SetTask(130,10)
	Msg2Player("Th¸n Tøc L·o Nh©n muèn b¹n ®i vßng vßng ra phİa sau nói. ")
	AddNote("Th¸n Tøc L·o Nh©n muèn b¹n ®i vßng vßng ra phİa sau nói. ")
end

function Uworld130_no()
end

function Uworld130_help()
	SetTask(130,30)
	Msg2Player("Th¸n Tøc L·o Nh©n muèn b¹n ng¨n chÆn néi chiÕn, b¹n ®¸p øng. ")
	AddNote("Th¸n Tøc L·o Nh©n muèn b¹n ng¨n chÆn néi chiÕn, b¹n ®¸p øng. ")
end

function Uworld130_finish()
	if(GetTask(9) >= 70*256) and (GetTask(9) ~= 75*256) then
		Talk(4,"","ë ®©y cã 1 quyÓn bİ kİp cña C«n L«n, ng­¬i h·y theo ®ã mµ tËp luyÖn","§©y lµ…?","ChØ hy väng ng­¬i nghiªm tóc luyÖn tËp, lóc C«n L«n gÆp nguy khã, cã thÓ ra tay yÓm trî, lµ l·o giµ nµy ®· m·n nguyÖn l¾m råi. ","V·n bèi tu©n lÖnh")
		if (HaveMagic(372) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(372,1)
		end
		if (HaveMagic(375) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(375,1)
		end
		if (HaveMagic(394) == -1) then		-- ±ØĞëÃ»ÓĞ¼¼ÄÜµÄ²Å¸ø¼¼ÄÜ
			AddMagic(394)
		end
		CheckIsCanGet150SkillTask()
		Msg2Player("Häc ®­îc kü n¨ng C«n L«n Ng¹o TuyÕt TiÕu Phong, L«i §éng Cöu Thiªn, Tóy Tiªn T¸ Cèt ")
 		SetTask(130,255)
	else
	   SetTask(130,245)  --»ñµÃÉùÍûµÄÉèÖÃ±äÁ¿245
	end
   add_repute = ReturnRepute(30,100,4)			-- ÉùÍû½±Àø£º×î´ó30µã£¬´Ó100¼¶ÆğÃ¿¼¶µİ¼õ4%
   AddRepute(add_repute)
   Msg2Player("Hãa gi¶i mét cuéc néi chiÕn, hoµn thµnh nhiÖm vô. Danh väng cña b¹n t¨ng thªm "..add_repute.."®iÓm.")  
   AddNote("Hãa gi¶i mét cuéc néi chiÕn, hoµn thµnh nhiÖm vô. ")
end
