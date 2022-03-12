-- Î÷ÄÏ±±Çø ³É¶¼¸® æÎ¿Í1¶Ô»°.lua¡¡£¨·½ÊÊ£ºÈ­ÇãÌìÏÂÈÎÎñ£©
-- By: Dan_Deng(2004-05-24)

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub1 = GetTask(52)
	if (Uworld75 == 10) and (U75_sub1 < 10)then		-- ÈÎÎñÖĞ£¬½ÓÈ¡×ÓÈÎÎñ
		 if (HaveItem(384) == 1) then
			SetTask(52,10)
			AddNote("NhiÖm vô QuyÒn khuynh thiªn h¹: §i Nh¹n §·ng S¬n b¾t b¶y con nhÖn giïm Ph­¬ng Thİch ")
			Msg2Player("NhiÖm vô QuyÒn khuynh thiªn h¹: §i Nh¹n §·ng S¬n b¾t b¶y con nhÖn giïm Ph­¬ng Thİch ")
			Talk(1,""," §¹i s­ huynh ®· cho phĞp th× ph¶i lµm míi ®­îc! Ta muèn tiÖn ®©y thö ng­¬i. §i Nh¹n §·ng s¬n thay ta b¾t b¶y con nhÖn.")
		 else
		 	Talk(1,"","Ngay c¶ phong th­ cßn kh«ng cã th× lµm sao mµ ta tin ng­¬i h¶?")
		end
	elseif (Uworld75 == 10) and (U75_sub1 == 10) then		-- ×ÓÈÎÎñÍê³ÉÅĞ¶Ï
		if (GetItemCount(86) >= 7) then
			for i = 1,7 do DelItem(86) end
			Talk(1,"","§©y ®óng lµ con nhÖn mµ ta cÇn. Hay qu¸ hay qu¸! Ta cø sî ng­¬i ®· gÆp vÊn ®Ò g× råi!")
			SetTask(52,20)
			AddNote("NhiÖm vô quyÒn khuynh thiªn h¹: NhiÖm vô b¾t 7 con nhiÖn ®· hoµn thµnh. ")
			Msg2Player("NhiÖm vô quyÒn khuynh thiªn h¹: NhiÖm vô b¾t 7 con nhiÖn ®· hoµn thµnh. ")
		else
			Talk(1,"","ViÖc mµ ta giao cho ng­¬i cã khã kh«ng?")
		end
	else
		Talk(1,"","ThÊy ng­¬i còng lµ mét ng­êi thİch luyÖn ch÷, h«m nµo r¶nh rçi thi thè mét b÷a nhĞ!")
	end
end;
