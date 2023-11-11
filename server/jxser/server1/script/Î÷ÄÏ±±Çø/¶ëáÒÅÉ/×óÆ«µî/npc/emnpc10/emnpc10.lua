--description: ¶ëáÒÅÉËÕ´ÊÜ° 
--author: yuanlan	
--date: 2003/3/5
--Dan_Deng(2003-07-22), ¼ÓÈëÃÅÅÉÈÎÎñµÄµÈ¼¶ÒªÇó
-- Dan_Deng(2003-08-12)

Include("\\script\\global\\skills_table.lua")

function main()
	UTask_em = GetTask(1)
	if (GetSeries() == 2) and (GetFaction() == "emei") then
		if ((UTask_em == 40*256) and (GetLevel() >= 40) and (GetFaction() == "emei")) then
			Talk(2, "L40_get","Trong v« sè tû muéi, t×nh c¶m cña ta víi TÇn s­ tû rÊt th©n thiÕt. Tû Êy s¾p mõng sinh nhËt. Ta muèn tÆng tû Êy 1 mãn quµ. TÇn s­ tû tinh th«ng ©m luËt, tû lu«n muèn cã ®­îc khóc nh¹c tuyÖt phÈm <color=Red>'B¸ch §iÓu TriÒu Phông'<color>.","Ta t×m kiÕm kh¾p n¬i míi biÕt ë <color=Red>Thanh Thµnh s¬n<color> cã vŞ <color=Red>Cao Nh©n<color> Èn c­ ®ang cÊt gi÷ quyÓn khóc phæ nµy, nh­ng m·i kh«ng t×m ®­îc «ng ta. Sinh nhËt TÇn s­ Tû ®· gÇn kÒ, ph¶i lµm sao ®©y?")
		elseif ((UTask_em == 40*256+80) and (HaveItem(22) == 1)) then					--µÃµ½°ÙÄñ³¯·ïÇúÆ×
			L40_prise()
		elseif (UTask_em >= 50*256) and (GetFaction() == "emei") then   							--ÒÑ¾­Íê³É40¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
			Talk(1,"","TÇn s­ tû nh×n thÊy khóc phæ vui mõng kh«n xiÕt, ®Òu do c«ng cña muéi!")
		else
			Talk(1,"","GÇn ®©y giang hå kh«ng yªn, d­êng nh­ l¹i cã chuyÖn ®¹i sù!")
		end
	elseif (UTask_em >= 70*256) then										--ÒÑ¾­³öÊ¦
		Talk(1,"","TiÓu s­ muéi, sau nµy hµnh hiÖp giang hå gÆp khã kh¨n g× h·y quay vÒ t×m ta!")
	else
		Talk(1,"","¢u D­¬ng c«ng s¸ng t¸c khóc '§iÖp LuyÕn Hoa' cã c©u '§×nh ViÖn th©m th©m th©m c¬ høa', c«ng phu dïng ch÷ cña c©u nµy, thËt khiÕn ng­êi ®êi th¸n phôc!")
	end
end;

function L40_get()
	Say("Muéi cã b»ng lßng gióp ta t×m vŞ cao nh©n ®ã kh«ng?", 2, "§ång ı!/L40_get_yes", "Kh«ng cßn thêi gian n÷a /L40_get_no")
end;

function L40_get_yes()
	Talk(1,"","Tèt l¾m! VŞ <color=Red>Cao nh©n<color> ®ã ®ang Èn c­ trong <color=Red>ThÇn Tiªn ®éng<color> ë Thanh Thµnh s¬n.")
	SetTask(1, 40*256+10)
	AddNote("Bªn T¶ Thiªn §iÖn Nga Mi ph¸i gÆp T« Tõ Hinh nhiÖm vô tiÕp theo Khóc Phæ, t×m gÆp  B¸ch §iÓu TriÒu Phông. ")
	Msg2Player("TiÕp nhËn nhiÖm vu, t×m B¸ch §iÓu TriÒu Phông khóc phæ ")
end;

function L40_get_no()
end;

function L40_prise()
	Talk(1,"","Khóc phæ 'B¸ch §iÓu TriÒu Phông'! Tèt l¾m! TÇn s­ tû thÊy ®­îc nhÊt ®Şnh rÊt vui, c¶m ¬n tiÓu s­ muéi! ")
	DelItem(22)
	SetRank(17)
	SetTask(1, 50*256)
--	AddMagic(86)
	add_em(50)			-- µ÷ÓÃskills_table.luaÖĞµÄº¯Êı£¬²ÎÊıÎªÑ§µ½¶àÉÙ¼¶¼¼ÄÜ¡£
	Msg2Player("Chóc mõng b¹n! §· trë thµnh Thanh Liªn Tiªn Tö. Häc ®­îc L­u Thuû. ")
	AddNote("VÒ Nga Mi, giao B¸ch §iÓu TriÒu Phông khóc phæ cho T« Tõ Hinh, hoµn thµnh nhiÖm vô. Th¨ng chøc thµnh Thanh Liªn Tiªn Tö. ")
end;
