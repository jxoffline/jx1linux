-- Îå¶¾ Â·ÈËNPC ³àĞ«Õ¯Ö÷ÍÀÒì 30¼¶ÈÎÎñ
-- by£ºDan_Deng(2003-08-05)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_wu = GetTask(10)
	if (GetSeries() == 1) and (GetFaction() == "wudu") then
		if (UTask_wu == 30*256+10) then		-- ÈÎÎñ½øĞĞÖĞ
			if (HaveItem(87) == 1) then
				Talk(2,"L30_step1","Ngèc thËt! Méc H­¬ng ®Ønh nµy lµ gi¶!","Kh«ng sao! Còng kh«ng tr¸ch ®­îc ng­¬i! Ng­¬i ch­a tõng thÊy qua Méc H­¬ng §Ønh. Méc H­¬ng §Ønh thËt sù sÏ ph¸t ra ¸nh s¸ng xanh lam. Cßn thø nµy l¹i ph¸t ra ¸nh s¸ng vµng")
			else
				Talk(1,"","§Ó ta tù tay ®i b¾t ph¶n ®å. Ta muèn b¾t h¾n mang vµo trong Ngò §éc ®éng, cho ®éc trïng c¾n chÕt h¾n ")
			end
		elseif (UTask_wu == 30*256+20) then		-- ÈÎÎñÍê³É
			if (HaveItem(221) == 1) then
				DelItem(221)
				L30_prise()
			else
				Talk(1,"","Nhí ®Êy! Méc H­¬ng §Ønh thËt sù sÏ ph¸t ra ¸nh s¸ng xanh lam. ")
			end
		elseif ((UTask_wu == 30*256) and (GetLevel() >= 30)) then		--30¼¶ÈÎÎñ
			Talk(4,"L30_get","Gi¸o quy cña bæn gi¸o, ph¶n ®å ph¶i chÕt. VËy mµ vÉn cßn nh÷ng kÎ cuång väng ","LÏ nµo vÉn cßn nh÷ng kÎ muèn tù ®i t×m chç chÕt ­?","Kh«ng ngê kÎ th©n tİn nhÊt mµ ta tin t­ëng l¹i d¸m ®¸nh c¾p b¸u vËt luyÖn c«ng Méc H­¬ng §Ønh cïa ta. H¾n ®· ch¹y lªn Vò di s¬n! Hõ! H¾n t­ëng lµ cã thÓ tho¸t khái Thñ T©m Ch­ëng cña ta ­? ","§å Tr¹i Chñ dù ®Şnh sÏ xö trİ h¾n thÕ nµo?")
		else							-- ³£¹æ¶Ô»°
			Talk(1,"","Kh«ng ph¶i lµ ta kh«ng tin t­ëng ®Ö tö, nh­ng mµ c¸i bän nµy cø r×nh ta cã mãn nµo l¹ lµ trém. Mãn b¶o bèi nµy ta ®· cùc khæ l¾m míi cã ®­îc nã ")
		end
	else
		Talk(1,"","Ta b×nh sinh rÊt hËn nh÷ng kÎ béi tİn béi nghÜa")
	end
end;

function L30_get()
	Say("B©y giê ta cho ng­¬i mét c¬ héi lËp c«ng, h·y ®i ®Õn Vò di s¬n ®Ó b¾t bän ph¶n ®å ®ã, lÊy l¹i Méc §Ønh H­¬ng. Ng­¬i cã ®ång ı ®i kh«ng? ",2,"Xin phông mÖnh cña §å tr¹i chñ. /L30_get_yes","Thuéc h¹ c«ng lùc cßn yÕu, chØ sî kh«ng hoµn thµnh ®­îc nhiÖm vô. /L30_get_no")
end;

function L30_get_yes()
	Talk(1, "", "§­îc! NÕu ng­¬i cã thÓ ®o¹t l¹i Méc H­¬ng §Ønh, ta sÏ th¨ng ng­¬i lµ: H¾c ¸m Diªm La ")
	SetTask(10,30*256+10)
	AddNote("L¹i lªn Vò Di s¬n ®Ó lÊy l¹i Méc H­¬ng §Ønh ")
	Msg2Player("L¹i lªn Vò Di s¬n ®Ó lÊy l¹i Méc H­¬ng §Ønh ")
end;

function L30_get_no()
end;

function L30_step1()
	Talk(1,"","D¹! Thuéc h¹ lÇn nµy nhÊt ®Şnh sÏ ®em ®­îc Méc H­¬ng §Ønh thËt vÒ ")
	SetTask(10,30*256+20)
	DelItem(87)
	AddNote("L¹i lªn Vò Di s¬n ®Ó lÊy l¹i Méc H­¬ng §Ønh thËt ")
	Msg2Player("L¹i lªn Vò Di s¬n ®Ó lÊy l¹i Méc H­¬ng §Ønh thËt ")
end;

function L30_prise()
	Talk(2,"","Méc H­¬ng §Ønh! Tèt! Tèt! Ta sÏ th­ëng ph¹t ph©n minh. LÇn nµy ng­¬i lËp ®¹i c«ng. B¾t ®Çu thõ h«m nay, ng­¬i sÏ ®­îc th¨ng lµ: H¾c ¸m Diªm La ","§a t¹ §å tr¹i chñ!")
	SetTask(10,40*256)
	SetRank(52)
--	AddMagic(68)
--	AddMagic(384)
--	AddMagic(64)
--	AddMagic(69)
	add_wu(40)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng B¹n! §· ®­îc th¨ng lµ H¾c ¸m Diªm La. Häc ®­îc vâ c«ng: U Minh Kh« L©u, B¸ch §éc Xuyªn T©m, B¨ng Lam HuyÒn Tinh, V« H×nh §éc ")
	AddNote("§o¹t ®­îc Méc H­¬ng §Ønh vÒ cho §å DŞ, ®­îc th¨ng lµ H¾c ¸m Diªm La ")
end;
