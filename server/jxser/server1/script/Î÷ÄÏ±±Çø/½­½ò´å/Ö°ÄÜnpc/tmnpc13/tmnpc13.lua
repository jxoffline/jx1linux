--description: ÌÆÃÅ½­½ò´åÌÆÔª 50¼¶ÈÎÎñ
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)

Include("\\script\\global\\repute_head.lua")

function main()
	UTask_tm = GetTask(2);
	Uworld123 = GetTask(123)
	Uworld37 = GetByte(GetTask(37),1)
	if (GetLevel() >= 90) and (Uworld123 < 10) and (Uworld37 == 127) and (GetReputeLevel(GetRepute()) >= 5) and (GetFaction() ~= "tangmen") then		-- ÈÎÎñÆô¶¯Ìõ¼þ£º90¼¶¡¢ÊÇÌÆÃÅ¼ÇÃûµÜ×Ó¡¢ÈÎÎñÎ´×ö¹ý¡¢ÉùÍûµÈ¼¶5¼¶
		Talk(2,"U123_get","GÇn ®©y BÊt NhiÔm s­ huynh hµnh tung kú l¹, cã lÏ ta qu¸ ®a nghi ch¨ng? Ta lu«n c¶m thÊy cã mét mèi nguy hiÓm ®ang Èn chøa bªn trong!","VËy sao? Ta h×nh nh­ kh«ng c¶m thÊy!")
	elseif (Uworld123 >= 10) and (Uworld123 < 255) then			-- ÈÎÎñ½øÐÐÖÐ
		Talk(1,"","Nh÷ng lêi ®ã ®õng bao giê ®Ó truyÒn ra ngoµi, BÊt NhiÔm s­ huynh lµ ®øa con mµ m«n chñ nhÊt mùc yªu th­¬ng. NÕu ®Õn tay «ng ta, chóng ta e r»ng kh«ng toµn m¹ng!")
	elseif (UTask_tm == 50*256+40) then  				--50¼¶ÈÎÎñ
		Talk(7, "", "T×m ta cã viÖc gÊp g× kh«ng?", "Ngò s­ huynh, tèi qua huynh cã ®i qua phßng ¸m khÝ kh«ng?", "§Cã, ta vµo dän dÑp, quÐt nhµ xong th× ®i ra!", "Huynh cã thÊy Tam S­ huynh kh«ng?", "Nãi ra thËt l¹! Tèi qua ta thÊy mét ng­êi rÊt gièng Tam s­ huynh phÝa sau phßng ¸m khÝ. Ta cã gäi 1 tiÕng. Nµo ngê huynh Êy véi v· bá ®i, ta cßn cho lµ m×nh nh×n lÇm!", "Huynh cã biÕt Tam s­ huynh b©y giê ë ®©u kh«ng?", "S¸ng nay khi ta ra ngoµi, tr«ng thÊy huynh Êy ®i vÒ h­íng <color=Red>Thanh Thµnh s¬n<color>, cã thÓ ®i <color=Red>H­ëng Thñy ®éng <color>, nghe nãi cã vµi ng­êi b¹n cña huynh Êy ë ®ã.")
		SetTask(2, 50*256+60)
		Msg2Player("ë Giang T©n th«n t×m ®­îc §­êng Nguyªn, biÕt ®­îc §­êng Hßa ®i ®Õn H­ëng Thuû ®éng cña Thanh Thµnh s¬n ")
		AddNote("ë Giang T©n th«n t×m ®­îc §­êng Nguyªn, biÕt ®­îc §­êng Hßa ®i ®Õn H­ëng Thuû ®éng cña Thanh Thµnh s¬n ")
	elseif (UTask_tm == 50*256+60) then  
		Talk(1,"","Tam s­ huynh cã thÓ ®i <color=Red>H­ëng Thñy ®éng<color>, nghe nãi cã vµi ng­êi b¹n cña huynh ë ®ã.")
	else
		Talk(1,"","Cha mÑ ta mÊt sím, nhê ng­êi cËu nu«i nÊng nªn ng­êi, cËu lµ ng­êi th©n thuéc nhÊt cña ta.")
	end
end;

function U123_get()
	if (GetCamp() == 0) and (GetTask(75) < 255) then		-- °×ÃûÎ´Ñ§Ò°ÇòÈ­µÄ£¬²»ÔÊÐí½ÓÈÎÎñ
		Talk(1,"","Bá ®i! Ng­¬i ch¼ng ph¶i b¶n lÜnh g×, nãi ra nh÷ng lêi nµy chØ thªm phiÒn phøc mµ th«i!")
	else
		Say("GÇn ®©y d­êng nh­ «ng t©m thÇn th­êng bÊt æn….",2,"Nghe mét lóc ®· b¾t ®Çu tin mét chót /U123_get_yes","ChuyÖn cña ng­êi kh¸c kh«ng cÇn qu¸ ®Ó t©m /no")
	end
end

function U123_get_yes()
	SetTask(123,10)
	Msg2Player("NhiÖm vô gi¸ ho¹ NhÊt TrÇn b¾t ®Çu: §iÒu tra hµnh tung kú qu¸i cña §­êng BÊt NhiÔm ")
	AddNote("NhiÖm vô gi¸ ho¹ NhÊt TrÇn b¾t ®Çu: §iÒu tra hµnh tung kú qu¸i cña §­êng BÊt NhiÔm ")
end

function no()
end
