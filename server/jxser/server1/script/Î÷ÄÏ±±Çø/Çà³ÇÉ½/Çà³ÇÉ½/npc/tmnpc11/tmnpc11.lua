--description: ÌÆÃÅ¹¢×ÓÆæ 40¼¶ÈÎÎñ 
--author: yuanlan	
--date: 2003/3/12
-- Update: Dan_Deng(2003-08-13)
Include ("\\script\\event\\springfestival08\\allbrother\\findnpctask.lua")
function main()
	if allbrother_0801_CheckIsDialog(7) == 1 then
		allbrother_0801_FindNpcTaskDialog(7)
		return 0;
	end
	UTask_tm = GetTask(2)
	if (UTask_tm == 40*256+20) then
		if (GetTaskTemp(4) == 31) then  --ÒÑ¾­´ò°ÜÎåÖ»³èÎï
			Talk(7, "L40_step42", "V·n bèi lµ ®Ö tö §­êng M«n, ®· tõng nghe qua C¶nh Tö Kú ®¹i hiÖp! ", "§­êng D· lµ ai?", "Lµ s­ thóc cña v·n bèi.", "Hõ! H¾n kh«ng cßn mÆt mòi nµo ®Õn ®©y gÆp ta, hay ch¼ng d¸m ®Õn gÆp ta? L¹i ph¸i mét tªn tiÓu bèi nh­ ng­¬i ®Õn lµm g×?", "TiÒn bèi hiÓu lÇm råi! N¨m x­a s­ thóc kh«ng ph¶i thÊy chÕt kh«ng cøu, mµ lµ bæn m«n vèn cã m«n quy, kh«ng ®­îc trŞ bÖnh cho ng­êi ngoµi nªn thóc thóc míi bÊt ®¾c dÜ th«i! §· nhiÒu n¨m nay «ng cø m·i ray røc trong lßng!", "Nh÷ng duyªn cí nµy sao h¾n kh«ng ®İch th©n ®Õn gi¶i bµy cïng ta?", "TiÒn bèi biÕt s­ thóc vÉn cßn hiÓu lÇm, e r»ng võa gÆp mÆt kh«ng kŞp më miÖng th×…….")
		else
			Talk(1,"","MÆc kÖ ng­¬i lµ ai, chuyÖn g× th× còng ph¶i h¹ gôc 5 con gia sóc cña ta <color=Red>Sãi x¸m, M·nh hæ, Kim TiÒn b¸o, Heo rõng, GÊu n©u <color> råi míi nãi!")
--			AddNote("ÔÚÇà³ÇÉ½Î÷²¿ÕÒµ½¹¢×ÓÆæ£¬ĞèÒªÏÈ´ò°ÜËûµÄÎåÖ»¼ÒĞó²Å»á±»¹¢×ÓÆæÀí»á¡£")
		end
	elseif (UTask_tm == 40*256+60) then
		if (HaveItem(43) == 1) and (HaveItem(44) == 1) and (HaveItem(45) == 1) and (HaveItem(46) == 1) and (HaveItem(47) == 1) then		--ÒÑ¾­µÃµ½ÎåÖÖÒ©²Ä
			Talk(2, "", "TiÕn bèi, 5 lo¹i nµy lµ thuèc ch÷a bÖnh l¹, chØ cÇn uèng 3 lÇn lµ cã thÓ ch÷a ®­îc bÖnh!", " Tèt l¾m! Con g¸i ta ®­îc cøu råi! §a t¹ ng­¬i, cµng ®a t¹ s­ thóc cña ng­¬i, ta ®· hiÓu lÇm råi!")
			DelItem(43)
			DelItem(44)
			DelItem(45)
			DelItem(46)
			DelItem(47)
			SetTask(2, 40*256+80)
			AddNote("Giao ph­¬ng thuèc cho C¶nh Tö Kú, ®· hãa gi¶i thµnh c«ng ©n o¸n gi÷a «ng ta vµ §­êng D· ")
			Msg2Player("KiÕm ®ñ 5 lo¹i d­îc liÖu ®em cho C¶nh Tö Kú, ®· hãa gi¶i thµnh c«ng ©n o¸n gi÷a «ng ta vµ s­ thóc ")
		else
			Talk(3, "", "Ng­¬i qu¶ thËt cã c¸ch cøu con g¸i ta sao?", "§­êng D· s­ thóc ®· nãi cho v·n bèi ph­¬ng thuèc nµy! V·n bèi ®ang t×m 5 lo¹i d­îc liÖu cÇn thiÕt ®Ó ch÷a bÖnh l¹!", "ThËt c¸m ¬n ng­¬i! ")
		end
	elseif (UTask_tm >= 40*256+40) and (UTask_tm < 40*256+80) then					--ÉĞÎ´Íê³É40¼¶ÈÎÎñ
		Talk(1,"","Ng­¬i qu¶ thËt cã c¸ch cøu con g¸i ta sao?")
	elseif (UTask_tm >= 40*256+80) and (UTask_tm < 70*256) then					--ÒÑ¾­Íê³É40¼¶ÈÎÎñ£¬ÉĞÎ´³öÊ¦
		Talk(1,"","Ta ®· tr¸ch lÇm s­ thóc ng­¬i, ta thËt lÊy lµm hç thÑn!")
	else									--ÉĞÎ´Íê³É40¼¶ÈÎÎñ£¨È±Ê¡¶Ô»°£©
		Talk(1,"","§iÒu mµ ta ®au lßng nhÊt trªn ®êi lµ ng­êi b¹n th©n nhÊt cña ta l¹i lµ kÎ v« t×nh v« nghÜa!")
	end
end;

function L40_step42()
	SetTask(2, 40*256+40)
	AddNote("§¸nh b¹i 5 lo¹i gia sóc cña C¶nh Tö Kú, biÕt con g¸i «ng ta m¾c c¨n bÖnh k× qu¸i, muèn t×m §ång D· s­ thóc ®Ó nghÜ c¸ch ch÷a trŞ ")
	Talk(4,"","Kú thùc, ta giÕt h¾n liÖu cã İch g×? Thª tö cña ta còng kh«ng thÓ sèng l¹i ®­îc, vèn ta ®· kh«ng cßn høng thó, chØ mong ®­îc sèng bªn ®øa con g¸i bĞ báng cña ta. Nµo ngê, ®øa con g¸i duy nhÊt còng m¾c ph¶i chøng bÖnh l¹ nh­ vËy. NÕu c¶ con g¸i còng rêi bá ta mµ ®i, ta sèng trªn ®êi cßn cã ı nghÜa g×!", "TiÒn bèi, ®õng n«n nãng! Con g¸i cña ng­êi nhÊt ®Şnh ®­îc cøu!", "Cßn cã c¸ch g× sao? S­ thóc cña ng­¬i lµ thiªn h¹ ®Ö nhÊt thÇn y. Ngoµi h¾n, cßn ai cã thÓ cøu ®­îc con g¸i ta!", "Ta cã c¸ch! §Ó ta ®i t×m S­ thóc!")
end;
