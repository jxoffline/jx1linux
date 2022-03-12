--Ê¯¹ÄÕò Â·ÈË °¢Çí ĞÂÊÖÈÎÎñ£º°¢ÇíµÄ½äÖ¸
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world24 = GetTask(24)
	if (UTask_world24 == 0) and (GetLevel() >= 5) then		-- ÈÎÎñÆô¶¯
		Say("ChiÕc nhÉn cña ta t×m kh«ng thÊy, nhÊt ®Şnh lµ con linh miªu tha ®i råi. ",2,"Gióp c« ta t×m. /W24_get_yes","Gi¶ vê nh­ kh«ng nghe/W24_get_no")
	elseif (UTask_world24 == 5) and (HaveItem(234) == 1) then		-- ÈÎÎñÍê³É
		p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
		if (GetSex() == 0) then
			W24_rank = "<#> TÊm bïa hé th©n nµy ta gi÷ còng ch¼ng İch g×, h·y cÇm lÊy coi nh­ lµ t¹ lÔ."
			AddItem(0, 4, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("§­îc miÕng lÖnh phï hé th©n Lôc C«ng Th¹ch. ")
		else
			W24_rank = "<#> Sîi d©y chuyÒn nµy mÆc dï rÊt ®Ñp nh­ng lµ cña mét kÎ ®¸ng ghĞt tÆng cho ta, b©y giê ta ®­a l¹i cho ng­¬i."
			AddItem(0, 4, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
			Msg2Player("§­îc mét d©y chuyÒn §ång. ")
		end
		Talk(1,"","<#> ¸i chµ! §©y ch¼ng ph¶i lµ chiÕc nhÉn cña ta sao? ThËt c¶m ¬n ng­¬i ®· t×m nã gióp ta!"..W24_rank)
		SetTask(24,10)
		DelItem(234)
		AddRepute(7)
		AddNote("Giao nhÉn cho A Kinh. Hoµn thµnh nhiÖm vô ")
		Msg2Player("Giao nhÉn cho A Kinh. Hoµn thµnh nhiÖm vô ")
		Msg2Player("Danh väng cña b¹n t¨ng thªm 7 ®iÓm. ")
	else				-- ·ÇÈÎÎñ¶Ô»°
		Talk(1,"","Th«n ta con g¸i ®Òu khĞo tay, th­êng c¾t giÊy kİnh thÇn b¸i phËt, ta thİch nhÊt lµ chiÕc nhÉn nµy, lµm rÊt tinh x¶o.")
	end
end;

function W24_get_yes()
	SetTask(24,5)
	Talk(1,"","§õng lo! Ta sÏ ®i t×m l¹i cho muéi!")
	AddNote("NhËn nhiÖm vô: Gióp A Kinh t×m chiÕc nhÉn bŞ ®¸nh mÊt. ")
	Msg2Player("NhËn nhiÖm vô: Gióp A Kinh t×m chiÕc nhÉn bŞ ®¸nh mÊt. ")
end

function W24_get_no()
end
