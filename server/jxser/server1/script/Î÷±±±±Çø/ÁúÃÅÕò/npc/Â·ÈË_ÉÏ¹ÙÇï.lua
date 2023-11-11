--ÁúÃÅÕò Â·ÈË ÉÏ¹ÙÇï ĞÂÊÖÈÎÎñ£º½éÉÜ¹¤×÷
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world25 = GetTask(25)
	if (UTask_world25 == 0) then		-- ÈÎÎñÆô¶¯
		Talk(2,"W25_get","§Ó tr¸nh cuéc lo¹n chiÕn nµy, t¹i h¹ tõ Trung Nguyªn ®Õn ®©y! Nh­ng kh«ng biÕt b©y giê nªn ®i vÒ h­íng nµo!","Ng­¬i cã thÓ t×m mét c«ng viÖc, sau ®ã tõ tõ nghÜ ®Õn chuyÖn nµy!")
	elseif (UTask_world25 == 6) then
		Talk(1,"W25_prise","Bµ chñ ë L÷ qu¸n ®· ®ång ı cho ng­¬i ®Õn gióp viÖc ë ®ã!")
	else				-- ·ÇÈÎÎñ¶Ô»°
		Talk(1,"","Çy! ChiÕn tranh ë Trung Nguyªn nµy thËt lµ khèc liÖt! Ta bŞ b¾t tham gia vµo cuéc chiÕn nµy ®· 2 n¨m! ThËt sù kh«ng chŞu næi n÷a nªn ®· ®µo tÈu! Hy väng lµ cã thÓ sèng yªn æn ë thŞ trÊn nhá bĞ nµy ®Õn suèt ®êi")
	end
end;

function W25_get()
	Say("T¹i h¹ ch­a biÕt ®­îc g× vÒ vïng ®Êt nµy, còng ch­a biÕt n¬i ®©u sÏ chøa nhËn m×nh!",2,"Gióp h¾n nghÜ ra biÖn ph¸p! /W25_get_yes","Khİch lÖ tinh thÇn h¾n! /W25_get_no")
end

function W25_get_yes()
	Talk(1,""," §Ó ta thö hái gióp ng­¬i, xem cã viÖc g× thİch hîp kh«ng!")
	SetTask(25,3)
	AddNote("NhËn nhiÖm vô giíi thiÖu c«ng viÖc cho Th­îng Quan Thu ")
	Msg2Player("NhËn nhiÖm vô giíi thiÖu c«ng viÖc cho Th­îng Quan Thu ")
end

function W25_get_no()
	Talk(1,"","VËy th× ta kh«ng gióp ®­îc cho ng­¬i råi! Nh­ng mµ ng­¬i cø tin t­ëng r»ng trêi kh«ng tuyÖt ®­êng cña ng­êi ®©u! H·y trÊn tÜnh lªn! Råi sÏ cã c¸ch th«i!")
end

function W25_prise()
	Talk(1,"","T¹i h¹ thËt kh«ng biÕt lµm sao ®Ó thÓ hiÖn lßng c¶m kİch cña m×nh! §©y lµ vËt phßng th©n trªn ®­êng ®µo tÈu, hy väng sÏ h÷u dông ®èi víi huynh")
	SetTask(25,10)
	AddRepute(3)
	AddNote("H·y ®i t×m mét tin vui vÒ c«ng viÖc b¸o cho Th­îng Quan Thu, hoµn thµnh nhiÖm vô! ")
	Msg2Player("H·y ®i t×m mét tin vui vÒ c«ng viÖc b¸o cho Th­îng Quan Thu, hoµn thµnh nhiÖm vô! ")
	i = random(0,8)
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,10)
	if(i <= 5) then
		AddItem(0, 0, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	else
		i = i - 6
		AddItem(0, 1, i, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
	end
	Msg2Player("NhËn ®­îc mét mãn binh khİ ")
	Msg2Player("Danh väng cña b¹n t¨ng thªm 3 ®iÓm ")
end
