--ÁúÃÅÕò Â·ÈË ÆòØ¤ ĞÂÊÖÈÎÎñ£ºÉÓ¿ÚĞÅ
-- By: Dan_Deng(2003-09-04)

Include("\\script\\global\\itemhead.lua")

function main(sel)
	UTask_world26 = GetTask(26)
	if (UTask_world26 == 0) and (GetLevel() >= 2) then		-- ÈÎÎñÆô¶¯
		if (GetSex() == 0) then
			Talk(4,"W26_get","VŞ ®¹i hiÖp nµy, xin gióp ta 1 viÖc. ","Sao?","B¹n cã thÓ gióp ta chuyÓn lêi tíi Mi Nhi c« n­¬ng trong trÊn kh«ng? ","Lêi g×. ")
		else
			Talk(4,"W26_get","VŞ ®¹i hiÖp nµy, xin gióp ta 1 viÖc. ","Sao?","B¹n cã thÓ gióp ta chuyÓn lêi tíi Mi Nhi c« n­¬ng trong trÊn kh«ng? ","Lêi g×. ")
		end
	elseif (UTask_world26 == 6) then
		Talk(1,"W26_prise","Rèt cuéc ng­¬i ®· b¶o ta nãi ra ı nghÜa g× khiÕn cho TriÖu My Nhi ®au khæ tuyÖt väng!? ThËt lµ ®¸ng th­¬ng!")
	elseif (UTask_world26 >= 10) then
		Talk(1,"","Tr¨ng sím ch¼ng thÓ s¸ng, nçi buån ®au tim gan! Ai nãi mïa xu©n ®Ñp, chØ thÊy hoa rông tµn. ¤i! L­u l¹c nh­ thÕ nµy th× cßn mÆt mòi nµo gÆp mäi ng­êi!")
	else				-- ·ÇÈÎÎñ¶Ô»°
		Talk(1,"","C¸i g×? Bè thİ cho ta µ? §i ®i…ta ®©u cã xin tiÒn! §õng cã nghÜ ta lµ ¨n mµy.")
	end
end;

function W26_get()
	Say("H·y nãi víi c« Êy lµ Tiªu DŞch ¶nh ®· chÕt råi. Cßn n÷a, kh«ng ®­îc nãi lµ ta nãi!",2,"Gióp /W26_get_yes","Kh«ng gióp /W26_get_no")
end

function W26_get_yes()
	Talk(1,"","Kh«ng biÕt ng­¬i nãi g× n÷a! Nh­ng ta còng sÏ ®i mét chuyÕn!")
	SetTask(26,3)
	AddNote("NhiÖm vô kÕ tiÕp: Gİup l·o ¨n mµy ®­a tin cho TriÖu Mi Nhi ")
	Msg2Player("NhiÖm vô kÕ tiÕp: Gİup l·o ¨n mµy ®­a tin cho TriÖu Mi Nhi ")
end

function W26_get_no()
	Talk(2,"","ThËt lµ thØnh cÇu kú l¹! Huynh kh«ng nãi râ th× ta kh«ng gióp ®©u.","VËy…. ta t×m ng­êi kh¸c gióp vËy!")
end

function W26_prise()
	Talk(1,"",":…mét lêi khã nãi hÕt! §©y cã chó thµnh ı! Xin nhËn lÊy!")
	SetTask(26,10)
	AddNote("Nãi ph¶n øng cña TriÖu Mi Nhi cho C¸i Bang, hoµn thµnh nhiÖm vô. ")
	Msg2Player("Nãi ph¶n øng cña TriÖu Mi Nhi cho C¸i Bang, hoµn thµnh nhiÖm vô. ")
	p1,p2,p3,p4,p5,p6 = RndItemProp(6,15)
	if(GetSex() == 0) then
		AddItem(0, 8, 1, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("§­îc mét m¶nh Ng­u b× Hé UyÓn. ")
	else
		AddItem(0, 8, 0, 1, random(0,4), GetLucky(), p1,p2,p3,p4,p5,p6)
		Msg2Player("§­îc mét Thanh §ång Ngäc Tr¹c. ")
	end
	AddRepute(5)
	Msg2Player("Danh väng cña b¹n t¨ng thªm 5 ®iÓm ")
end
