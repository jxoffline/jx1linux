--Á½ºşÇø °ÍÁêÏØ Â·ÈË4Ğ¡Óæ¶Ô»°
--°ÍÁêÏØĞÂÊÖÈÎÎñ£ºĞ¡ÓæµÄµùµù
--suyu
-- Update: Dan_Deng(2003-08-09)
-- Update: Dan_Deng(2003-09-09) ĞŞ¸Ä×°±¸ÊôĞÔÉú³É·½Ê½

Include("\\script\\global\\itemhead.lua")

function main()
	UTask_world18 = GetTask(46);
	if (UTask_world18 == 0) then		-- ÈÎÎñÆô¶¯
		Say("Hu!!hu! Bè ch¸u h«m qua ®i ®¸nh c¸ gÆp ph¶i m­a lín, b©y giê l©m bÖnh råi, b©y giê cßn lªn c¬n sèt n÷a. Bè kh«ng khái bÖnh, kh«ng thÓ ®i ®¸nh c¸, chóng ch¸u biÕt ¨n c¸i g×? C«/chó cã thÓ gióp ch¸u ®Õn cÇu cøu Ng« thÇn y kh«ng? ¤ng Êy lµ mét ng­êi tèt, ch¾c ch¾n sÏ gióp!",2,"Gióp /yes","Kh«ng gióp /no")
	elseif(UTask_world18 == 1) then		-- ÈÎÎñÍê³É
		if(HaveItem(180) == 1) then
			Talk(1,"","å! §©y lµ thuèc Tú Bµ hoµn ­?Nh­ vËy bÖnh t×nh cña bè ch¸u nhÊt ®Şnh sÏ khái. C«/chó thËt lµ mét ng­êi tèt, C«/chó h·y nhËn lÊy ®«i giµy nµy, cña mÑ ch¸u lµm ®Êy. ")
			DelItem(180)
			SetTask(46, 2)
			AddNote("§­a Tú Bµ hoµn cña TiÓu Ng­, hoµn thµnh nhiÖm vô. ")
			Msg2Player("§­a Tú Bµ hoµn cña TiÓu Ng­, hoµn thµnh nhiÖm vô. ")
			p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
			if(GetSex() == 0) then
				AddItem(0, 5, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("LÊy ®­îc ®«i giµy cá ")
			else
				AddItem(0, 5, 2, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
				Msg2Player("LÊy ®­îc ®«i giµy thªu. ")
			end
			AddRepute(5)		-- ¼ÓÉùÍû6µã
			Msg2Player("Danh väng cña b¹n t¨ng thªm 5 ®iÓm")
		else
			SetTask(46, 1)
			Talk(1,"","C«/chó vÉn ch­a t×m ®­îc thuèc Tú Bµ hoµn ­?BÖnh t×nh cña bè ch¸u biÕt tİnh sao b©y giê, huhuhu……")
		end
	else							-- ·ÇÈÎÎñ×´Ì¬
		if (random(0,1) == 0) then
			Talk(1,"","Bè ch¸u lµ ng­ d©n trªn §éng §×nh hå,mçi ngµy ®Òu ph¶i ra hå ®¸nh c¸, nÕu h«m nµo gÆp sãng to giã lín, cã khi ®Õn mÊy ngµy liÒn kh«ng thÓ vÒ nhµ. ")
		else
			Talk(1,"","Ch¸u rÊt lo cho bè, nÕu ch¸u lµ con trai th× tèt qu¸, lóc ®ã ch¸u sÏ gióp bè ®¸nh c¸. ")
		end
	end
end;

function yes()
	Talk(1,"","Ch¸u nhí lóc tr­íc cã nghe ®¹i phu nãi uèng thuèc Tú Bµ hoµn sÏ hÕt sèt, nh­ng nhµ chóng ch¸u nghÌo qu¸ kh«ng thÓ mua ®­îc. ")
	SetTask(46, 1)
	Msg2Player("TiÕp nhËn nhiÖm vô: Bè cña TiÓu Ng­ bŞ bÖnh, gióp «ng Êy mua Tú Bµ hoµn ®Ó ch÷a bÖnh. ")
	AddNote("TiÕp nhËn nhiÖm vô: Bè cña TiÓu Ng­ bŞ bÖnh, gióp «ng Êy mua Tú Bµ hoµn ®Ó ch÷a bÖnh. ")
end;

function no()
	Talk(1,"","Ch¸u ph¶i ë ®©y tiÕp tôc chê nh÷ng ng­êi h¶o t©m. ")
end;
