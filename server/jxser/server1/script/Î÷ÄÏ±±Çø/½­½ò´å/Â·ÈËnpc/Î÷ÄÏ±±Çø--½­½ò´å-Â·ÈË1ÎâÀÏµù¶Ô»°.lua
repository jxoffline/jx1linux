--Î÷ÄÏ±±Çø ½­½ò´å Â·ÈË1ÎâÀÏµù¶Ô»°
--½­½ò´åĞÂÊÖÈÎÎñ£ºÎâÀÏµùµÄÒ©
--suyu
-- Update: Dan_Deng(2003-08-11)

function main(sel)
	UTask_world21 = GetTask(49);
	if ((UTask_world21 == 0) and (GetLevel() >= 3)) then		-- ÈÎÎñÆô¶¯
		Say("Ta cø ho m·i kh«ng ngít. Kh«ng biÕt khi nµo Hång Mai míi trë vÒ, tíi lóc ph¶i ®Õn D­îc ®iÕm hèt thuèc th«i…KhÆc...khÆc", 2, "Gióp /yes", "Kh«ng gióp /no")
	elseif (UTask_world21 == 1) then
		if (HaveItem(179) == 1) then		--ÅĞ¶ÏÍæ¼ÒÊÇ·ñÄÃµ½Ò©
			Talk(1,"","§a t¹ hiÖp kh¸ch! Mét ngµy nµo ®ã, ta b¶o Hång Mai lµm cho ng­¬i 1 ®«i giµy!")
			DelItem(179)		--É¾µôÍæ¼ÒÉíÉÏµÄÒ©
			SetTask(49, 3)
			AddNote("§· thay l·o Ng« lÊy vÒ 10 viªn Xuyªn Bèi Hoµn, Ng« Hång Mai sÏ tÆng cho mét ®«i giµy ®Ó t¹ ¬n ")
			Msg2Player("§· thay l·o Ng« lÊy vÒ 10 viªn Xuyªn Bèi Hoµn, Ng« Hång Mai sÏ tÆng cho mét ®«i giµy ®Ó t¹ ¬n ")
		else
			Talk(1,"","Ng­¬i cã thÓ ®Õn d­îc phßng hái xem. Tõ ®©y ®i vÒ h­íng T©y vµi b­íc lµ tíi råi! …khÆc…khÆc…H·y nhí lµ 10 viªn Xuyªn Bèi hoµn, phiÒn ng­¬i gióp ta!")
		end
	else				-- ·ÇÈÎÎñ¶Ô»°
		Talk(1,"","Søc kháe ta vµ bµ nhµ ®Òu kh«ng kháe, khuª n÷ v× ch¨m sãc vî chång ta mµ vÉn ch­a lÊy chång, bËc lµm cha mÑ nh­ ta thËt kh«ng ph¶i víi con g¸i m×nh!")
	end
end;

function yes()
	Talk(1,"","Ng­¬i cã thÓ ®Õn d­îc phßng hái xem. Tõ ®©y ®i vÒ h­íng T©y vµi b­íc lµ tíi råi! …khÆc…khÆc…H·y nhí lµ 10 viªn Xuyªn Bèi hoµn, phiÒn ng­¬i gióp ta!")
	SetTask(49, 1)
	AddNote("NhËn nhiÖm vô thay Ng« l·o gia ®Õn tiÖm thuèc lÊy thuèc ")
	Msg2Player("NhËn nhiÖm vô thay Ng« l·o gia ®Õn tiÖm thuèc lÊy thuèc ")
end;

function no()
end;
