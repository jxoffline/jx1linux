-- ´äÑÌÃÅ ´äÑÌÃÅµÜ×Ó1 ÈëÃÅÈÎÎñ
-- by£ºDan_Deng(2003-07-25)

function main()
	UTask_cy = GetTask(6)
	Uworld36 = GetByte(GetTask(36),2)
	if (Uworld36 == 10) then		--ÈëÃÅÈÎÎñ½øĞĞÖĞ
		Talk(1,"U36_enter","Sau khi vµo trËn, nhËn ®­îc Hoa T×nh, ®Õn <color=Red>lèi ra cña Hoa Kh«i<color> giao cho S­ tû lµ ®­îc.")
	elseif (Uworld36 == 0) and (GetLevel() >=10) and (GetFaction() ~= "cuiyan") then		--ÈëÃÅÈÎÎñ
		Say("Theo m«n quy, muèn trë thµnh ®Ö tö kı danh ph¶i qua <color=Red>Hoa Kh«i trËn<color>, dùa vµo sù dòng c¶m vµ tµi trİ lÊy ®­îc <color=Green>Hoa T×nh<color>, ng­¬i cã muèn thö kh«ng?",2,"§­îc, ®Ó ta thö /enroll_yes","Kh«ng, ta chØ ®Õn tham quan. /no")
	elseif (GetFaction() == "cuiyan") then			-- Í¬ÃÅ
		Say("S­ muéi muèn ®Õn Hoa Kh«i trËn luyÖn c«ng µ?",2,"§óng vËy, xin tû h·y ®Ó cho muéi vµo /U36_enter","Ta chØ ®Õn th¨m tû /no")
	elseif (UTask_cy == 70*256) then
		Talk(1,"","S­ tû lÇn nµy vÒ lµ ®Ó th¨m viÕng c¸c tû muéi, cã g× thay ®æi kh«ng?")
	else
		Talk(1,"","Hoan nghªnh t«n kh¸ch gi¸ l©m, xin ®i vµo con ®­êng bªn c¹nh Hoa Kh«i trËn.")
	end
end;

function enroll_yes()
	Talk(1, "U36_enter", "ë ®©y lµ <color=Red>cæng vµo<color>. Sau khi vµo trËn lÊy ®­îc Hoa T×nh ®Õn Hoa Kh«i trËn giao cho S­ tû lµ ®­îc.")
	Uworld36 = SetByte(GetTask(36),2,10)
	SetTask(36,Uworld36)
	AddNote("TiÕp nhËn nhiÖm vô Hoa Kh«i trËn tiÕn vµo Hoa Kh«i trËn vµ lÊy ®­îc Hoa T×nh mang giao cho ®Ö tö Thóy Yªn m«n ë lèi ra ")
	Msg2Player("TiÕp nhËn nhiÖm vô Hoa Kh«i trËn tiÕn vµo Hoa Kh«i trËn vµ lÊy ®­îc Hoa T×nh mang giao cho ®Ö tö Thóy Yªn m«n ë lèi ra ")
end;

function U36_enter()
--	SetPos(207,1693)
	SetPos(210,1622)
end

function no()
end;
