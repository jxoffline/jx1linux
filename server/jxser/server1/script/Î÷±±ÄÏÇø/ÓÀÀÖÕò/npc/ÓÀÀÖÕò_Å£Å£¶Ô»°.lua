----description: ĞÂÊÖ´å_Å£Å£
--author: wangzg	
--date: 2003/7/18
--Modify:2003/7/21 wangzg
--update 2003/7/22 yuanlan
-- Update: Dan_Deng(2003-08-07)
-- µÈ´ı¼ì²â²¢É¾³ıÎäÆ÷µÄº¯Êı£¬ÏÖÔÚÏÈÖ»ÔÊĞí¸øÇ®

function main(sel)
	UTask_world37=GetTask(65)
	if (UTask_world37==2) then		--ÒÑ¾­½Óµ½ÈÎÎñ
		Say("Ta muèn lµm ®¹i hiÖp, ®i kh¾p n¬i hµnh hiÖp tr­îng nghÜa, gióp ®ì ng­êi nghÌo khæ!",2,"Khuyªn can /reason", "ñng hé /help")
	elseif (UTask_world37==9) then		--Ñ¡ÔñÈ°Ëµ
		Say("Lµm ®¹i hiÖp thËt khã! LuyÖn vâ c«ng l©u qu¸!",0)
	elseif (UTask_world37==10) then		--Ñ¡ÔñÖ§³Ö
		Say("Ta muèn lµm ®¹i hiÖp, ®i kh¾p n¬i hµnh hiÖp tr­îng nghÜa, gióp ®ì ng­êi nghÌo khæ!",0)	
	else
		Say("Nh÷ng hiÖp kh¸ch trong s¸ch thËt lµ oai phong, nÕu ®­îc gièng nh­ hä th× hay qu¸!",0)
	end
end;

function reason()		--Ñ¡ÔñÈ°ËµÅ£Å£
	Talk(3,"prise","Ng­êi xÊu rÊt hung d÷, ®Ö cßn nhá nh­ thÕ, vâ c«ng còng luyÖn kh«ng tèt th× lµm sao ®i hµnh hiÖp tr­îng nghÜa?","Ng­êi nãi còng ®óng! §îi ta lín lªn, luyÖn thªm vâ c«ng, sÏ ®i hµnh hiÖp tr­îng nghÜa!","§óng råi! LuyÖn tèt vâ c«ng c¬ b¶n, sau ®ã h·y ®i ®¸nh ng­êi xÊu. ")
end;

function prise()
	Talk(1,"","VËy ta vÒ nhµ ®©y!C¶m ¬n ®¹i hiÖp! §©y cã chót thuèc trŞ th­¬ng, xin nhËn cho!")
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	AddItem(1,0,0,1,0,0)
	SetTask(65,9)
	AddRepute(6)		-- ÉùÍû¼Ó6µã
	AddNote("T×m ®­îc Ng­u Ng­u, khuyªn h¾n vÒ nhµ, nhiÖm vô hoµn thµnh. ")
	Msg2Player("Khuyªn gi¶i Ng­u Ng­u vÒ nhµ, nhiÖm vô hoµn thµnh. ")
	Msg2Player("§­îc ba gãi Kim Th­¬ng d­îc ")
	Msg2Player("Thanh thÕ giang hå cña b¹n ®­îc gia t¨ng 6 ®iÓm. ")
end;

function help()			--Ñ¡Ôñ°ïÖúÅ£Å£
--	Say("Íæ¼Ò£ºĞ¡Ğ¡Äê¼Í£¬µ¹Í¦ÓĞÖ¾Æø¡£",3,"ËÍÒ»°ÑÎäÆ÷/arm","ËÍÒ»µãÒø×Ó/money","ÎÒÔÙÏëÏë/wait")
	Say("Tuæi cßn nhá nh­ng ®· cã chİ lín!",2,"TÆng mét chót b¹c /money","§Ó ta suy nghÜ kü l¹i xem/wait")		--µÈÄÜ¹»¼ì²âÎäÆ÷ÔÙÓÃÉÏÃæÕâ¾ä£¬ÏÖÔÚÏÈÖ»¸øÇ®
end

function arm()
	if x==0 then	--Èç¹ûÃ»ÓĞÎäÆ÷
		Say("Ta hiÖn t¹i kh«ng cã vò khİ.",3,"TÆng mét mãn vò khİ /arm","TÆng mét chót b¹c /money","§Ó ta suy nghÜ kü l¹i xem/wait")
	else 
		--¸øÎäÆ÷
		Talk(1,"","C¶m ¬n ®¹i hiÖp! Ng­êi thËt lµ tèt!")
		AddOwnExp(100)
		SetTask(65,10)
		AddNote("T×m ®­îc Ng­u Ng­u, cho ®i mét mãn vò khİ, ñng hé ­íc m¬ lµm ®¹i hiÖp cña nã. ")
	end
end

function money()
	if (GetCash() < 100) then
--		Say("Íæ¼Ò£º°¥Ñ½£¬ÎÒÉíÉÏÃ»´øÊ²Ã´Ç®¡£",3,"ËÍÒ»°ÑÎäÆ÷/arm","ËÍÒ»µãÒø×Ó/money","ÎÒÔÙÏëÏë/wait")
		Talk(1,"","Trong ng­êi ta kh«ng cã mang tiÒn, ®îi ta quay l¹i nhĞ!")		--µÈÄÜ¹»¼ì²âÎäÆ÷ÔÙÓÃÉÏÃæÕâ¾ä£¬ÏÖÔÚÏÈÖ»¸øÇ®
	else
		Pay(100)
		Talk(1,"","C¶m ¬n ®¹i hiÖp! Ng­êi thËt lµ tèt!")
		AddOwnExp(100)
		SetTask(65,11)
		AddRepute(4)
		AddNote("T×m ®­îc Ng­u Ng­u, cho ®i mét mãn vò khİ, ñng hé ­íc m¬ lµm ®¹i hiÖp cña nã. Hoµn thµnh nhiÖm vô. ")
		Msg2Player("T×m ®­îc Ng­u Ng­u, ñng hé ­íc m¬ lµm ®¹i hiÖp cña nã, cho nã mét İt b¹c. Hoµn thµnh nhiÖm vô. ")
		Msg2Player("Kinh nghiÖm giang hå cña b¹n ®· gia t¨ng! ")
		Msg2Player("Thanh thÕ giang hå cña b¹n ®· t¨ng lªn 4 ®iÓm. ")
	end
end

function wait()
end
