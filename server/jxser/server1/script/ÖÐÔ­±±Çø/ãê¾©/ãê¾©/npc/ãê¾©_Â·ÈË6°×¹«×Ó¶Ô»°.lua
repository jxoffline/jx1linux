--ÖĞÔ­±±Çø ãê¾©¸® Â·ÈË6°×¹«×Ó¶Ô»°

function main(sel)
	x = GetTask(12)
	Uworld123 = GetTask(123)
	if (x > 0) and (x < 256) and (HaveItem(231+x) == 1) and (GetLevel() >= 20) and (GetRepute() >= 20) then			-- µÈ¼¶¹ı20¡¢ÉùÍû¹ı20¡¢ÓĞÈÎÎñ¡¢ÓĞĞÅº¯ÄÜ¶ÔÓ¦ÉÏ£¬¿ÉÒÔ¿ªÊ¼ÊÕÂò
		if (GetSex() == 0) then		-- Íæ¼ÒÊÇÄĞ½ÇÉ«
			Talk(2,"W12_sale_get","VŞ thiÕu hiÖp nµy phong th¸i ung dung, lµ ng­êi bÊt phµm. Kh¾p vïng Hoµng Hµ nµy ai còng biÕt tiÕng. Bæn thiÕu gia vèn còng ng­ìng mé ®· l©u. ","GhĞt. Ng­¬i muèn g× th× cø nãi ra ®i. §õng cã rµo tr­íc ®ãn sau n÷a ")
		else
			Talk(2,"W12_sale_get","VŞ c« n­¬ng nµy xin ®Ñp nh­ hoa, chim sa nh¹n l¹c. Kh¾p vïng Hoµng Hµ nµy ai còng biÕt tiÕng. Bæn thiÕu gia vèn còng ng­ìng mé ®· l©u. ","GhĞt. Ng­¬i muèn g× th× cø nãi ra ®i. §õng cã rµo tr­íc ®ãn sau n÷a ")
		end
	elseif (Uworld123 == 20) and (HaveItem(379) == 1) then		-- ÌÆ²»È¾ÈÎÎñ£ºÓĞÈÎÎñ²¢ÇÒÓĞĞÅº¯
		Talk(3,"Uworld123_step1","Th­ cña bÊt NhiÔm c«ng tö cuèi cïng ®· ®Õn! §· ®îi l©u qu¸ råi, ®Ó ta xem xem huynh nãi g×!","Th× ra lµ vËy! ThËt hay qu¸! Qu¶ lµ trêi kh«ng phô lßng ng­êi! §îi ®·, ta sÏ lËp tøc viÕt th­ cho huynh Êy!","Xong råi! Xin chuyÓn bøc th­ nµy cho BÊt NhiÔm c«ng tö.")
	elseif (Uworld123 == 30) and (HaveItem(380) == 0) then		-- ĞÅ¶ªÁË
		Talk(1,"","Ng­¬i lµm viÖc nh­ thÕ µ? Th­ ch­a lÊy mµ ®· véi vµng ®i råi?")
		AddEventItem(380)
		Msg2Player("Quay l¹i ®Ó nhËn th­ cña B¹ch C«ng tö ")
	else
		Talk(1,"","Tr¨m v¹n thiÕt m· cña chóng ta mét khi ®· Nam h¹ th× bän ng­êi Tèng kia lµm sao cã thÓ chèng ®ì ®­îc? Lóc ®ã th× c¶ giang s¬n, gÊm vãc vµ mü n÷ cña bän chóng ®Òu thuéc vÒ bé téc N÷ Ch©n cña ta! ha ha ha! ")
	end
end;

function W12_sale_get()
	Say("NÕu ®· nh­ vËy T¹i h¹ xin nãi th¼ng. Xin hái ng­¬i cã thÓ cho ta xem bøc mËt hµm trong ng­êi cña ng­¬i kia ®­îc kh«ng? ë ®©y t¹i h¹ cã 20000 l­îng gäi lµ cã chót lßng thµnh.",2,"Thø lçi. Ta ph¶i nghe theo lêi dÆn cña DŞch quan, kh«ng giao bøc mËt hµm nµy cho ng­êi kh¸c /W12_sale_no","VËy nÕu nh­ ta tÆng ng­¬i 20000 l­¬ng b¹c vµ tÊm ¸o da nµy th× thÕ nµo? /W12_sale_yes")
end

function W12_sale_yes()
	if (GetSex() == 0) then
		Talk(1,"","Huynh ®µi ®óng lµ ng­êi réng r·i! Sau nµy khi §¹i Kim c«ng ph¸ ®­îc L©m An nhÊt ®Şnh sÏ mêi huynh ®Õn tÖ x¸ ®Ó uèng trµ! ")
	else
		Talk(1,"","C« n­¬ng thËt lµ ng­êi réng r·i!.Sau nµy khi §¹i Kim c«ng ph¸ ®­îc L©m An nhÊt ®Şnh sÏ mêi c« n­¬ng ®Õn tÖ x¸ ®Ó uèng trµ! ")
	end
	x = GetTask(12)
	DelItem(231 + x)		-- É¾³ıµÀ¾ß
	SetTask(12,GetGameTime()+7200)			-- ÔÚÏßÊ±¼ä2Ğ¡Ê±ºó¿ÉÒÔÖØ¸´ËÍĞÅÈÎÎñ
	Earn(20000)
	Msg2Player("Ng­¬i ®em bøc mËt hµm cña DŞch quan, b¸n cho ng­êi Kim. Danh tiÕng cña ng­¬i ®· bŞ gi¶m xuèng ")
	AddNote("Ng­¬i ®em bøc mËt hµm cña DŞch quan, b¸n cho ng­êi Kim. Danh tiÕng cña ng­¬i ®· bŞ gi¶m xuèng ")
	i = GetRepute()
	if (i >= 20) then			-- ¿ÛÉùÍû20µã£¬²»¹»20¾Í¿Û¹â£¨Ğ¡ÓÚ10µÄ»°Ç°ÃæÒÑÉè¶¨²»ÈÃ×ö£©
		AddRepute(-1 * 20)
	else
		AddRepute(-1 * i)
	end
end

function W12_sale_no()
	Talk(1,"","Hµ tÊt ph¶i cè chÊp nh­ vËy?Nh÷ng kÎ kh«ng hiÓu ®­îc thêi thÕ, liÖu cã İch g×? TËn trung b¸o quèc kh«ng b»ng vinh hoa phó quı h­ëng suèt ®êi! Cho dï lµ Nh¹c Phi còng ®µnh nuèt hËn ë Phong Ba §×nh!")
end

function Uworld123_step1()
	AddEventItem(380)
	SetTask(123,30)
	DelItem(379)
	Msg2Player("NhËn ®­îc th­ cña B¹ch c«ng tö ")
end

function no()
end
