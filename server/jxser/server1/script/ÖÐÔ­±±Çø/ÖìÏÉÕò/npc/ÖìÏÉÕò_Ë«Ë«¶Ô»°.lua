--ÖĞÔ­±±Çø ÖìÏÉÕò Â·ÈËË«Ë«µÄ¶Ô»°
--ÖìÏÉÕòĞÂÊÖÈÎÎñ: ÕÒÊÖ»·
--by Dan_Deng(2003-07-21)
-- Update: Dan_Deng(2003-08-11)
-- Update: Dan_Deng(2003-09-09) ĞŞ¸Ä×°±¸ÊôĞÔÉú³É·½Ê½

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world40 = GetTask(68)
	if ((UTask_world40 == 0) and (GetLevel() >= 6)) then		--ÈÎÎñÆô¶¯
		Say("TiÓu n÷ lµm mÊt chiÕc nhÉn mÑ ®Ó l¹i råi, t×m hoµi kh«ng thÊy, ®ã lµ chiÕc nhÉn tiÓu n÷ thİch nhÊt.", 2, "Ta sÏ gióp c« t×m nã. /yes", "ThËt lµ phiÒn phøc. /no")
	elseif ((UTask_world40 == 3) and (HaveItem(191) == 1)) then		-- Íê³ÉÈÎÎñ
		DelItem(191)
		Talk(2,"finish_select","§©y cã ph¶i lµ nhÉn cña c« n­¬ng kh«ng?","§óng råi, thËt c¸m ¬n, xin h·y nhËn chót thµnh ı cña tiÓu n÷.")
	elseif (UTask_world40 <= 3) then		-- ÈÎÎñÖĞµÄÆÕÍ¨¶Ô»°
		Talk(1,"","Hy väng cã thÓ t×m l¹i ®­îc chiÕc nhÉn cña ta. ")
	else
		i = random(0,2)
		if (i==0) then
			Talk(1,"","§©y lµ chiÕc nhÉn do mÑ tiÓu n÷ ®Ó l¹i, tiÓu n÷ rÊt thİch nã.")
		elseif (i==1) then
			Talk(1,"","N¨m ngo¸i mÑ tiÓu n÷ l©m bÖnh qua ®êi, chØ ®Ó l¹i chiÕc nhÉn nµy th«i.")
		else
			Talk(1,"","Hu hu hu! TiÓu n÷ nhí mÑ qu¸.")
		end
	end
end;

function yes()
	SetTask(68,1)
	Msg2Player("NhËn nhiÖm vô: Gióp Song Song t×m l¹i chiÕc nhÉn. ")
	AddNote("NhËn nhiÖm vô: Gióp Song Song t×m l¹i chiÕc nhÉn. ")
end;

function no()
	Talk(1,"","¤i, kh«ng biÕt chiÕc nhÉn ®· r¬i ë ®©u?")
end;

function finish_select()
	Say("§©y lµ 200 l­îng, xin h·y nhËn lÊy.", 2, "NhËn. /finish_a","Tõchèi /finish_b")
end;

function finish_a()
	Talk(1,"","Xin ®a t¹.")
	Earn(200)
	SetTask(68,4)
	AddRepute(7)
	Msg2Player("Hoµn thµnh nhiÖm vô: Gióp Song Song t×m l¹i chiÕc nhÉn, lÊy ®­îc 200 l­îng b¹c. ")
	AddNote("Hoµn thµnh nhiÖm vô: Gióp Song Song t×m l¹i chiÕc nhÉn, lÊy ®­îc 200 l­îng b¹c. ")
	Msg2Player("Danh tiÕng giang hå cña b¹n t¨ng thªm 7 ®iÓm ")
end;

function finish_b()
	Talk(2,"","Ng­êi trªn giang hå gióp ®ì nhau lµ chuyÖn th­êng t×nh, C« n­¬ng kh«ng cÇn ph¶i kh¸ch khİ.","C¸c h¹ thËt lµ mét ng­êi hiÖp nghÜa, tiÓu n÷ cã mét chiÕc th¾t l­ng da sãi, xin tÆng c¸c h¹ ®Ó phßng th©n.")
	SetTask(68,5)
	AddRepute(9)
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
	AddItem(0,6,0,2,random(0,4),GetLucky(), p1,p2,p3,p4,p5,p6)
	Msg2Player("Hoµn thµnh nhiÖm vô: Gióp Song Song t×m l¹i chiÕc nhÉn. LÊy ®­îc mét chiÕc th¾t l­ng da sãi. ")
	AddNote("Hoµn thµnh nhiÖm vô: Gióp Song Song t×m l¹i chiÕc nhÉn. LÊy ®­îc mét chiÕc th¾t l­ng da sãi. ")
	Msg2Player("Danh väng cña b¹n t¨ng thªm 9 ®iÓm ")
end;
