-- À¥ÂØ µÜ×Ó ÖìÈ± 30¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-30)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if (UTask_kl == 30*256+10) and (GetItemCount(111) >= 3) then		--30¼¶ÈÎÎñÍê³É
			L30_prise()
		elseif ((UTask_kl == 30*256) and (GetLevel() >= 30)) then		--30¼¶ÈÎÎñÆô¶¯
			Say("S­ t«n Ch­ëng m«n cã lÖnh ®i t×m 3 viªn D¹ Minh Ch©u, nh÷ng chuyÖn nhá nhÆt nh­ vËy th× giao cho ng­¬i ®i lµm vËy. ",2,"D¹......... /L30_get_yes","Kh¶ n¨ng cña ta thÊp kĞm, chØ sî kh«ng ®¶m ®­¬ng næi. /L30_get_no")
		else
			Talk(1,"","Ta suy nghÜ m·i còng kh«ng hiÓu t¹i sao s­ phô ta vÉn cßn ®Ó nh÷ng ng­êi nh­ l·o giµ Th¸n tån t¹i trªn ®êi. Ng­êi ta th­êng nãi kh«ng ®éc bÊt tr­îng phu, kh«ng giÕt l·o ®ã ®i cø nh­ lµ cßn c¸i ung bäc... £, ng­¬i ë ®©y nghe lĞn g× ®ã! ")
		end
	else
		Talk(1,"","C«n L«n ph¸i nÕu muèn cïng c¸c m«n ph¸i ë trung nguyªn b×nh ®¼ng ®Şa vŞ, nhÊt ®Şnh ph¶i cã nh÷ng ng­êi vâ c«ng xuÊt chóng, nh©n nghÜa h¬n ng­êi nh­ ta n¾m quyÒn míi ®­îc!")
	end
end;

function L30_get_yes()
	Talk(1,"","Nghe nãi gÇn ®©y cã c¸i ®éng TuyÕt B¸o, bªn trong cã rÊt nhiÒu d¹ minh ch©u gi¸ trŞ næi tiÕng kh¾p n¬i, ta sÏ ®i ®Õn ®©y thö vËn may vËy!")
	SetTask(9,30*256+10)
	AddNote("TiÕp nhËn nhiÖm vô cÊp 30: Vµo TuyÕt B¸o ®éng lÊy vÒ 3 viªn D¹ Minh Ch©u ")
	Msg2Player("TiÕp nhËn nhiÖm vô cÊp 30: Vµo TuyÕt B¸o ®éng lÊy vÒ 3 viªn D¹ Minh Ch©u ")
end;

function L30_get_no()
	Talk(1,"","S­ huynh sai b¶o mµ còng d¸m kh«ng tu©n lÖnh, qu¶ lµ to gan!")
end;

function L30_prise()
	Talk(1,"","Uhmm! §éng t¸c còng kh«ng ®Õn nçi chËm. §­îc! Ta sÏ phong ng­¬i lµ Th¸i Vi Hé Ph¸p, tõ ®©y vÒ sau cø cè g¾ng lµm viÖc cho ta th× tÊt nhiªn sÏ kh«ng İt lîi İch cho ng­¬i!")
	i = GetItemCount(111)
	for j = 1, i do DelItem(111) end
	SetTask(9,40*256)
	SetRank(22)
--	AddMagic(178)
--	AddMagic(172)
--	AddMagic(393)
--	AddMagic(173)
--	AddMagic(177)			-- °Ù´¨ÄÉº£
	add_kl(40)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóng mõng ng­¬i! §· ®­îc th¨ng cÊp thµnh C«n L«n ph¸i Th¸i Vi Hé Ph¸p, häc ®­îc vâ c«ng NhÊt Khi Tam thanh, Thiªn TÕ TÊn L«i, Thiªn Thanh §Şa Träc, B¾c Minh §¸o H¶i ")
	AddNote("T×m ®­îc 3 h¹t D¹ Minh Ch©u, hoµn thµnh nhiÖm vô cÊp 30 cña C«n L«n, ®­îc th¨ng tiÕn trë Th¸i Vi Hé Ph¸p ")
end;
