-- ´óÀí¡¡Â·ÈË¡¡»¨Å©
-- by£ºDan_Deng(2003-09-16)
-- Update: Dan_Deng(2004-05-24) È­ÇãÌìÏÂÈÎÎñ

function main(sel)
	Uworld75 = GetTask(75)
	U75_sub2 = GetTask(53)
	if (Uworld75 == 10) and (U75_sub2 < 10) then		-- ÈÎÎñÖĞ£¬½ÓÈ¡×ÓÈÎÎñ
		if (HaveItem(384) == 1) then
			SetTask(53,10)
			AddNote("NhiÖm vô quyÒn khuynh thiªn h¹: §i D­îc V­¬ng Cèc h¸i ba ®ãa hoa CÈm Môc Tóc dïm Hoa N«ng. ")
			Msg2Player("NhiÖm vô quyÒn khuynh thiªn h¹: §i D­îc V­¬ng Cèc h¸i ba ®ãa hoa CÈm Môc Tóc dïm Hoa N«ng. ")
			Talk(1,"","L¹c s­ huynh muèn tr¾c nghiÖm l¹i ng­¬i? Tèt qu¸! §¹i Lı bèn mïa hoa th¬m, cßn thiÕu Tö Môc Tóc kú phÈm cña D­îc v­¬ng Cèc. Ng­¬i h·y gióp ta h¸i 3 ®o¸ vÒ!")
		else
		 	Talk(1,"","Mét bøc th­ còng kh«ng cã, kh«ng chøng kh«ng cø kªu ta lµm sao tin ng­¬i?")
		end
	elseif (Uworld75 == 10) and (U75_sub2 == 10) then		-- ×ÓÈÎÎñÍê³ÉÅĞ¶Ï
		if (GetItemCount(112) >= 3) then
			DelItem(112)
			DelItem(112)
			DelItem(112)
			SetTask(53,20)
			AddNote("NhiÖm vô quyÒn khuynh thiªn h¹: Hoµn thµnh nhiÖm vô h¸i CÈm Môc Tóc. ")
			Msg2Player("NhiÖm vô quyÒn khuynh thiªn h¹: Hoµn thµnh nhiÖm vô h¸i CÈm Môc Tóc. ")
			Talk(1,"","ThËt lµ tuyÖt vêi, ®óng lµ nhÊt phÈm! Ta sÏ ph¸i ng­êi ®i th«ng b¸o L¹c s­ huynh r»ng ta ®ång ı råi.")
		else
			Talk(1,"","VÉn ch­a t×m ®­îc µ?")
		end
	else
		i = random(0,99)
		if (i < 25) then
			Talk(1,"","V©n Nam trµ hoa nhÊt thiªn h¹, §¹i lı trµ hoa nhÊt V©n Nam, hoa trµ trong m¾t ng­êi §¹i Lı chóng ta lµ hoa ®Ñp nhÊt thiªn h¹, ngay c¶ MÉu §¬n còng kh«ng s¸nh b»ng.")
		elseif (i < 50) then
			Talk(1,"","Nhµ nhµ ë §¹i Lı ®Òu trång hoa trµ, mçi n¨m ®Òu tæ chøc triÓn l·m héi hoa.")
		elseif (i < 75) then
			Talk(1,"","Hoa trµ ®Ñp nhÊt toµn §¹i Lı lµ do «ng l·o hä §oµn trång, «ng Êy sèng ë mét ng«i nhµ nhá bªn bê NhÜ H¶i. Hoa trµ cña l·o h¸n hä §oµn mçi n¨m ®Õn mïa héi hoa lu«n ®ùoc chän lµ hoa ®Ñp nhÊt.")
		else
			Talk(1,""," ¤ng l·o hä §oµn nµy c¶ ®êi yªu hoa nh­ thµnh c¸i bÖnh, hoa trµ mµ «ng Êy trång chØ b¸n cho ng­êi cã duyªn víi «ng Êy, cßn ng­êi kh¸c th× dï cho cã ®em nói vµng nói b¹c «ng Êy còng kh«ng b¸n.")
		end
	end
end;
