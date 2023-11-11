-- Îå¶¾ Â·ÈËNPC ÇàòÚÕ¯Õ¯Ö÷ÌÀåö 50¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-05)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if ((UTask_wu == 50*256+20) and (HaveItem(88) == 1)) then		-- ÈÎÎñ½øÐÐÖÐ
			L40_prise()
		elseif ((UTask_wu == 50*256) and (GetLevel() >= 50)) then		--50¼¶ÈÎÎñ
			Talk(1,"L50_get","B¸ t¸nh 100 dÆm trong vïng nµy ®Òu ph¶i nép phÝ ®Ó ®­îc Ngò §éc gi¸o cña chóng ta b¶o hé. Nh­ng mµ gÇn ®©y cã mét tªn gäi lµ L­u KhÊu, ®· tËp hîp ®å ®Ö ë Ngäc Hoa ®éng trªn nói Vò Di. H¾n l¹i d¸m leo lªn l­ng cäp, tung hoµnh kh«ng coi bæn gi¸o ra g×. Míi ®©y chóng ®· c­íp ®i Ngäc San H« cña bæn gi¸o. ChuyÖn nµy khiÕn cho ta thËt lµ mÊt mÆt. Kh«ng thÓ bá qua cho chóng!")
		else							-- ³£¹æ¶Ô»°
			Talk(1,"","ChØ cÇn luyÖn thµnh vâ c«ng, th× kim ng©n mü n÷ sÏ tù ïn ïn mµ ®Õn ")
		end
	else
		Talk(1,"","Nh¾c ®Õn con g¸i,ta l¹i nhí ®Õn c¸c c« n­¬ng cña Thóy Yªn m«n. ¤i! ThËt lµ ®Ñp! Kh«ng ngê con g¸i cña c« ta l¹i ®Ñp ®Õn nh­ vËy. Míi nghÜ ®Õn th× löa trong ng­êi ta l¹i bèc lªn råi! Khµ!Khµ! ")
	end
end;

function L50_get()
	Say("Ng­¬i h·y ®i d¹y cho bän L­u KhÊu kia mét bµi häc, cho chóng thÊy ®­îc sù lîi h¹i cña bæn m«n",2,"Tu©n lÖnh!/L50_get_yes","§ång ®¶ng bän chóng qu¸ ®«ng, thuéc h¹ e lµ. /L50_get_no")
end;

function L50_get_yes()
	SetTask(10,50*256+10)
	AddNote("§Õn Ngäc Hoa ®éng trªn Vò Di s¬n s¬n ®¸nh L­u KhÊu ®Ó lÊy l¹i Ngäc San H«. ")
	Msg2Player("§Õn Ngäc Hoa ®éng trªn Vò Di s¬n s¬n ®¸nh L­u KhÊu ®Ó lÊy l¹i Ngäc San H«. ")
end;

function L50_get_no()
end;

function L40_prise()
	Talk(2,"","Ng­¬icã thÓ ®¬n th­¬ng ®éc m· mµ ®o¹t l¹i ®­îc Ngäc San H«, qu¶ lµ b¶n lÜnh bÊt phµm. Bæn tr¹i chñ xem ng­¬i®óng lµ mét kú tµi,phong cho ng­¬ilµm Co §éc T«n Gi¶. Sau nµy ng­¬icã thÓ thay ta mµ ®iÒu hµnh mäi viÖc trong tr¹i","Tu©n lÖnh!")
	SetTask(10,60*256)
	DelItem(88)
	SetRank(54)
--	AddMagic(72)
	add_wu(60)			-- µ÷ÓÃskills_table.luaÖÐµÄº¯Êý£¬²ÎÊýÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	AddNote("Mang Ngäc San H« vÒ cho Thang BËt, ®­îc th¨ng lµ Co §éc T«n Gi¶ ")
	Msg2Player("Chóc mõng B¹n! §· ®­îc th¨ng lµm Co §éc T«n Gi¶. Häc ®­îc vâ c«ng Xuyªn T©m §éc ThÝch ")
end;
