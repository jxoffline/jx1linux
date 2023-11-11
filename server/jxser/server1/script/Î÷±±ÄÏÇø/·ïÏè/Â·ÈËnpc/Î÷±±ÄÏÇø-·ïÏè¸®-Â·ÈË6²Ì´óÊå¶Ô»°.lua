--Î÷±±ÄÏÇø ·ïÏè¸® Â·ÈË6²Ì´óÊå¶Ô»°¡¡£¨È­ÇãÌìÏÂÈÎÎñ£©
-- By: Dan_Deng(2004-05-24)

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub3 = GetTask(54)
	if (Uworld75 == 10) and (U75_sub3 < 10) then		-- ÈÎÎñÖĞ£¬½ÓÈ¡×ÓÈÎÎñ
		if (HaveItem(384) == 1) then
			SetTask(54,10)
			AddNote("§Õn hÎm ThiÕu L©m Méc Nh©n gióp Th¸i ®¹i thóc t×m hoa sen vµng. ")
			Msg2Player("§Õn hÎm ThiÕu L©m Méc Nh©n gióp Th¸i ®¹i thóc t×m hoa sen vµng. ")
			Talk(1,"","TiÕc lµ c¶ ®êi ta nghiªn cøu vâ häc, vÉn ch­a cã con. Nghe nãi trong ThiÕu L©m Méc Nh©n H¹ng cã hoa sen vµng, ®­îc phËt tæ phï hé, cã thÓ gióp ng­êi ta cã con")
		else
		 	Talk(1,"","Ngay c¶ bøc th­ còng kh«ng cã, chØ dùa vµo lêi nãi lµm sao tin ng­¬i?")
		end
	elseif (Uworld75 == 10) and (U75_sub3 == 10) then		-- ×ÓÈÎÎñÍê³ÉÅĞ¶Ï
		if (HaveItem(26) == 1) then
			DelItem(26)
			SetTask(54,20)
			AddNote("T×m ra hoa sen vµng, nhiÖm vô hoµn thµnh. ")
			Msg2Player("T×m ra hoa sen vµng, nhiÖm vô hoµn thµnh. ")
			Talk(1,"","Ha ha! Cã ph¶i ®ã lµ ngäc bèi trong truyÒn thuyÕt kh«ng? H¶o tiÓu tö! C¶m ¬n ng­¬i! ViÖc ng­¬i häc quyÒn ph¸p, ta hoµn toµn t¸n thµnh.")
		else
			Talk(1,"","Cßn ch­a t×m ®­îc hoa sen vµng µ ")
		end
	else
		i = random(0,1)
		if (i == 0) then
			Talk(1,"","L·o th¸i gia chóng ta mÊy ®êi ®¬n truyÒn, kh«ng cã con trai, thËt cã lçi víi liÖt tæ liÖt t«ng!")
		else
			Talk(1,"","BÊt hiÕu cã 3 ®iÒu, kh«ng cã ng­êi nèi dâi lµ ®iÒu lín nhÊt!")
		end
	end
end;
