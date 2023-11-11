-- À¥ÂØ µÜ×Ó Óñºâ×Ó 50¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-07-31)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_kl = GetTask(9);
	if (GetSeries() == 4) and (GetFaction() == "kunlun") then
		if ((UTask_kl >= 50*256+64) and (UTask_kl < 60*256) and (HaveItem(10) == 1)) then		--50¼¶ÈÎÎñÍê³É
			L50_prise()
		elseif ((UTask_kl == 50*256) and (GetLevel() >= 50)) then		--50¼¶ÈÎÎñ
			Say("Phİa sau nói C«n L«n cã mét huyÖt ®éng, bªn trong cã giam mét qu¸i nh©n. Tªn qu¸i nh©n nµy lu«n miÖng nãi r»ng h¾n sÏ san b»ng C«n L«n ph¸i nµy, kÕt qu¶ lµ bŞ Ch­ëng M«n ®¸nh b¹i, nhèt vµo trong ®éng. Bæn ph¸i cã mét quy luËt ®Ö tö nµo ®­îc th¨ng cÊp 50 ¾t sÏ ®¸nh b¹i ®­îc h¾n, nh­ng ph¶i lÊy ®­îc tãc cña h¾n ®Ó chøng minh ",2,"Xin cho ®Ö tö ®i thö xem /L50_get_yes","§Ö tö vâ nghÖ ch­a cao, e r»ng kh«ng th¾ng næi /L50_get_no")
		else
			Talk(1,"","Ng­¬i h·y ph¸t huy nh÷ng së tr­êng cña m×nh, tïy c¬ øng biÕn!")
		end
	else
		Talk(1,"","Ta ®©y xem träng nhÊt lµ t×nh b¹n, ng­êi nh©n tõ th× v« ®Şch mµ. Ha! Ha! Ha!")
	end
end;

function L50_get_yes()
	Talk(1,"","Cã chİ khİ, thÕ th× ta sÏ cho ng­¬i c¬ héi nµy!")
	SetTask(9,50*256+64)
	AddNote("NhËn ®­îc nhiÖm vô cÊp 50 cña C«n L«n ph¸i: §¸nh b¹i B¨ng HuyÖn Qu¸i Nh©n, ®ång thêi bøt lÊy 1 tóm tãc lµm b»ng chøng. ")
	Msg2Player("NhËn ®­îc nhiÖm vô cÊp 50 cña C«n L«n ph¸i: §¸nh b¹i B¨ng HuyÖn Qu¸i Nh©n, ®ång thêi bøt lÊy 1 tóm tãc lµm b»ng chøng. ")
end;

function L50_get_no()
end;

function L50_prise()
	Talk(2,"","Hé ph¸p! §Ö tö may m¾n kh«ng bá m¹ng!","§­îc l¾m! Ng­¬i ®­îc th¨ng tiÕn trë thµnh Thô Phï Thiªn t­íng. H·y nhí kü! ChØ cÇn trung thµnh víi ta, cã bÊt cø İch lîi g× ta ®Òu kh«ng quªn ng­¬i!")
	DelItem(10)
	SetTask(9,60*256)
	SetRank(24)
--	AddMagic(176)
--	AddMagic(90)
	add_kl(60)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n! §· trë thµnh Thô Phï Thiªn t­íng! Häc ®­îc Cuång Phong SËu §iÖn, Mª Tung ¶o ¶nh ")
	AddNote("LÊy ®­îc tãc cña B¨ng HuyÖt qu¸i nh©n, hoµn thµnh nhiÖm vô cÊp 50 cña C«n L«n ph¸i. §­îc phong Thô Phï Thiªn T­íng. ")
end;
