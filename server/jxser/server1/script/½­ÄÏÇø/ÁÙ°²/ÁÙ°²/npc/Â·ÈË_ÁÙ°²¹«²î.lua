-- ½­ÄÏÇø ÁÙ°² Â·ÈË_ÁÙ°²¹«²î.lua £¨ÏûÃğ²É»¨ÔôÈÎÎñ£©
-- By: Dan_Deng(2004-05-27)

Include("\\script\\global\\repute_head.lua")

function main(sel)
	Uworld43 = GetTask(43)
--	if (Uworld43 < 10) and (GetLevel() >= 70) and (GetReputeLevel(GetRepute()) >= 6) then
		--		Say(10713 ,2,"¼éÒù¸¾Å®ÄËÊ®¶ñ²»ÉæÖ®×ï£¬ÎÒ¼ÈÖªÏş£¬×ÔÈ»Òª¹Ü¡£/U43_get","Ã»ÓĞ/no")
	if (Uworld43 == 40) and (HaveItem(381) == 1) then
		Talk(6,"U43_40","Qu¶ nhiªn kh«ng ngoµi dù ®o¸n cña ta. §¸m tÆc Th¸i Hoa nµy vèn lµ bän ë L«i V©n tr¹i -do M¹c Kh«ng NguyÖt cÇm ®Çu","Lµ c¸i tªn M¹c Kh«ng NguyÖt 'V¹n hoa chóng trung qu¸; phiÕn diÖp bÊt thiÖp th©n' ®ã sao?!","Chİnh lµ h¾n! Vèn xu¸t th©n tõ mét 'hµo téc phó quı', tiªu tiÒn hoang phİ. Sau khi ng­êi tiÒn nhiÖm cña L«i V©n tr¹i qua ®êi, h¾n tiÕp nhËn tæ nghiÖp. Nh­ng kh«ng ph¸t huy ®­îc, ng­îc l¹i cßn gi¶i t¸n s¬n tr¹i, lµm mét 'l÷ tÆc ®éc hµnh'. Khinh c«ng cña h¾n tuyÖt kü, tr­íc giê ch­a ai cã thÓ b¾t ®­îc. H¾n ®· h¹i kh«ng biÕt bao nhiªu ng­êi con g¸i trinh b¹ch'. ","Nãi nh­ vËy, nghÜa lµ Sai ®¹i nh©n ®· dß ra ®­îc hµnh tung cña h¾n råi?","NÕu ®¬n gi¶n nh­ vËy th× ta ®· kh«ng cÇn ®Õn ng­¬i gióp søc. Ng­êi nµy ®Õn - ®i khã liÖu. Ch¾c ch¾n h¾n ®ang muèn ®i t×m hai chiÕc 'V©n, L«i th­îc ' (th­îc: ch×a khãa) nµy ®Ó më cöa lín! Ng­¬i ®· cã trong tay mét chiÕc 'L«i th­îc'råi! Theo nh­ ta tİnh to¸n th× chiÕc cßn l¹i hiÖn ®ang ë trong tay cña tr¹i chñ V©n Bé ¦ng. ","Ta sÏ ®i t×m chiÕc cßn l¹i. Kh«ng trõ ng­êi nµy th× kh«ng biÕt bao nhiªu c« g¸i n÷a sÏ bŞ lµm nhôc")
	elseif (Uworld43 == 80) and (HaveItem(382) == 1) then
		Talk(1,"U43_80","Qu¶ nhiªn kh«ng ngoµi dù ®o¸n cña ta, M¹c Kh«ng NguyÖt hiÖn ®ang Èn nÊp ë trong thµnh L©m An nµy. Ng­¬i h·y chŞu khã t×m cho thËt kü l­ìng. Theo ta ­íc ®o¸n th× h¾n ®ang ë quanh vïng T©y Hå ")
	elseif (Uworld43 == 10) then
		Talk(1,"","L©u nh­ vËy mµ vÉn ch­a t×m ®­îc t«ng tİch g× cña bän Th¸i Hoa tÆc ­?")
	elseif (Uworld43 == 20) then
		Talk(1,"","Kh«ng t×m ®­îc doanh tr¹i cña chóng µ? NÕu t×m ®­îc chiÕc 'V©n th­îc' th× tÊt t×m ®­îc n¬i bän chóng ®ang tró Èn")
	else
		Talk(1,"","D­íi ch©n Thiªn Tö, sao cßn d¸m ph¶n nghŞch! BÊt cø kÎ nµo lµm cµn ë thµnh L©m An nµy, tèt nhÊt lµ ®õng ®Ó r¬i vµo tay ta")
	end
end;

function U43_get()
	Talk(1,"","Tèt! Theo ta ®iÒu tra ®­îc th× bän tÆc Th¸i Hoa nµy tù cho m×nh lµ phong l­u, thİch sö dông qu¹t. Chóng ®· tõng xuÊt hiÖn ë Thôc s¬n. N¬i ®ã vèn lµ s¬n tr¹i cña bän kiÕp phØ L«i V©n. Tr­íc tiªn ng­¬i h·y vµo nói Thôc s¬n ®Ó t×m gÆp L«i Bé Lang chñ. H¾n tÊt ®· biÕt chuyÖn nµy. Cã ®iÒu, ng­êi nµy vèn nham hiÓm, ®éc ¸c. Ng­¬i ph¶i nªn cÈn thËn ®Ò phßng")
	SetTask(43,10)
	AddNote("NhËn nhiÖm vô do C«ng Sai thµnh L©m An ñy th¸c: Tiªu diÖt bän tÆc Th¸i Hoa. §i dß th¸m t×nh h×nh cña chóng. Chóng ®· g©y ra liªn tiÕp nhiÒu vô ¸n gÇn ®©y. ")
	Msg2Player("NhËn nhiÖm vô do C«ng Sai thµnh L©m An ñy th¸c: Tiªu diÖt bän tÆc Th¸i Hoa. §i dß th¸m t×nh h×nh cña chóng. Chóng ®· g©y ra liªn tiÕp nhiÒu vô ¸n gÇn ®©y. ")
end;

function U43_40()
	SetTask(43,50)
	Msg2Player("Sau ®ã l¹i ®i t×m V©n Bé ­ng chñ ®Ó ®o¹t lÊy chiÕcV©n th­îc (ch×a khãa) ")
end

function U43_80()
	SetTask(43,90)
	Msg2Player("T×m n¬i M¹c Kh«ng NguyÖt ®ang tró Èn ë L©m An ")
end

function no()
end;
