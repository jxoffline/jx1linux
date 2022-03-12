-- À¥ÂØ µÜ×Ó ÇàÁ«×Ó 40¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl == 40*256+20) and (HaveItem(9) == 1)) then		--40¼¶ÈÎÎñÍê³É
			Talk(2,"L40_prise","Hé ph¸p! §©y cã ph¶i lµ HuyÕt Hån ThÇn KiÕm","H¶o kiÕm! ThËt lµ h¶o kiÕm! Ha! Ha! Ha! Bæn täa ®· kh«ng nh×n lÇm ng­êi, ng­¬i ®óng lµ cã tµi! §­îc! Bæn täa sÏ th¨ng ng­¬i thµnh ®¹i ®Ö tö cÊp 40!")
		elseif (UTask_kl == 40*256) and (GetLevel() >= 40) then		--40¼¶ÈÎÎñ
			Say("Nói C«n L«n vÒ phİa b¾c cã ®Ønh KiÕn Tİnh phong, truyÒn thuyÕt trªn ®Ønh cÊt giÊu 1 thanh tuyÖt thÕ h¶o kiÕm HuyÕt Hån ThÇn KiÕm, rÊt nhiÒu ng­êi v× muèn ®¹t ®­îc thanh kiÕm nµy mµ ®· bá m¹ng hoµng tuyÒn, ng­¬icã gan ®i ®o¹t lÊy thanh b¶o kiÕm nµy kh«ng?",2,"§Ö tö chÊp nhËn thö 1 phen. /L40_get_yes","§Ö tö vâ c«ng yÕu kĞm, sî kh«ng lµm næi chuyÖn nµy /L40_get_no")
		elseif (UTask_kl >= 50*256) then
			Talk(1,"","B¶o kiÕm ®Õn tay, tr­íc hÕt lµ trõ khö l·o s­ huynh ®¸ng ghĞt, sau ®ã lµ tiªu diÖt tªn s­ ®Ö hay c¶n trë. chØ cÇn ®îi 1 c¬ héi..Ha! Ha! Ha! ")
		else
			Talk(1,"","ChØ cÇn HuyÕt Hån ThÇn KiÕm ®Õn tay, ta sÏ cã thÓ....Ha! Ha! Ha! ")
		end
	else
		Talk(1,"","C«n L«n ph¸i chóng ta rÊt ®oµn kÕt th­¬ng yªu nhau. §Æc biÖt lµ ta vµ ch­ëng m«n TuyÒn C¬ Tö, Ngäc Hoµnh Tö…")
	end
end;

function L40_get_yes()
	Talk(1,"","ChØ cÇn lÊy ®­îc HuyÕt Hån ThÇn KiÕm, ta sÏ th¨ng cÊp ng­¬i thµnh ®Ö tö cÊp 40!")
	SetTask(9,40*256+10)
	AddNote("NhËn nhiÖm vô cÊp 40 C«n L«n ph¸i: T¹i ®Ønh KiÕn Tİnh ®o¹t lÊy thanh HuyÕt Hån b¶o kiÕm. ")
	Msg2Player("NhËn nhiÖm vô cÊp 40 C«n L«n ph¸i: T¹i ®Ønh KiÕn Tİnh ®o¹t lÊy thanh HuyÕt Hån b¶o kiÕm. ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","§a t¹ Hé ph¸p! ")
	DelItem(9)
	SetTask(9,50*256)
	SetRank(23)
--	AddMagic(175)
--	AddMagic(181)
	add_kl(50)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n! §· ®­îc th¨ng cÊp thµnh C«n L«n ph¸i Th¸i Vi Hé Ph¸p! Häc ®­îc vâ c«ng Khi Hµn Ng¹o TuyÕt, Khİ T©m phï ")
	AddNote("§o¹t ®­îc HuyÕt Hån ThÇn KiÕm, hoµn thµnh nhiÖm vô cÊp 40 cña C«n L«n ph¸i, th¨ng tiÕn thµnh Th¸i Vi Hé Ph¸p. ")
end;
