--description: ÌìÍõ°ïË®Éú
--author: yuanlan	
--date: 2003/4/28
-- Update: Dan_Deng(2003-08-16)

function main()
	UTask_tw = GetTask(3)
	if (UTask_tw == 40*256+50) then
		UTask_tw40sub = GetTask(14)
		if (UTask_tw40sub == 1) then
			Talk(3, "", "Ta thİch nhÊt lµ ¨n trøng luéc, nh­ng v× nhµ nghÌo, kh«ng thÓ mua trøng ®­îc", "TiÓu b»ng h÷u! Ng­¬i gióp ta ®µo giun ta sÏ cho ng­¬i trøng luéc, ®­îc kh«ng?", "§­îc! Nhí ph¶i gi÷ lêi høa nhĞ!")
			AddNote("§ång ı cho Thuû Sinh mÊy qu¶ trøng, ®æi l¹i Thuû Sinh gióp ®µo trïng ")
			Msg2Player("§ång ı cho Thuû Sinh mÊy qu¶ trøng, ®æi l¹i Thuû Sinh gióp ®µo trïng ")
			SetTask(14, 3)
		elseif (UTask_tw40sub == 7) and (HaveItem(149) == 1) then	-- ×ÓÈÎÎñÍê³É
			Talk(3, "", "Ta ®· ®µo ®­îc giun råi, cã thÓ cho ta trøng ®­îc ch­a?", "TiÓu b»ng h÷u! 3 qu¶ trøng cho ng­¬i nµy!", "C¶m ¬n ®¹i ca! Trong ®©y cã n¨m con giun ®Ö ®µo ®­îc!")
			DelItem(149)
			AddEventItem(150)
			Msg2Player("NhËn ®­îc n¨m con giun ®Êt ")
			SetTask(14, 9)
			AddNote("Cho Thuû Sinh trøng, lÊy ®­îc 5 con trïng ")
		elseif (UTask_tw40sub == 0) then
			Talk(1, "", "Ta thİch nhÊt lµ ¨n trøng luéc, nh­ng v× nhµ nghÌo, kh«ng thÓ mua trøng ®­îc")
		elseif (UTask_tw40sub == 9) and (HaveItem(150) == 0) then
			AddEventItem(150)
			Talk(2,"","TiÓu b»ng h÷u! Ta kh«ng cÈn thËn nªn ®· lµm mÊt nh÷ng con giun råi, ng­¬i cã thÓ gióp ta ®µo l¹i mÊy con ®­îc kh«ng?","Còng may, ®Ö r¶nh rçi nªn ®· ®µo thªm ®­îc 5 con, tÆng cho huynh!")
		elseif (UTask_tw40sub >= 9) then
			Talk(1, "", "C¶m ¬n huynh ®· tÆng trøng")
		else
			Talk(1,"","Trong nµy cã mÊy con giun ta võa ®µo ®­îc. Huynh cã thÓ tÆng ta mÊy qu¶ trøng ®ã kh«ng?")
		end
	else
		if (random(0,1) == 0) then
			Talk(1,"","Sau nµy ®Ö lín lªn còng muèn gièng D­¬ng thóc thóc, V­¬ng b¸ b¸. C¸c vŞ ®Òu lµ nh÷ng ®¹i anh hïng ®­îc mäi ng­êi kİnh träng")
		else
			Talk(1,"","H«m qua ®Ö cã ®i cÇu xin D­¬ng thóc thóc d¹y vâ c«ng cho ®Ö, nh­ng thóc Êy kh«ng ®ång ı, nãi lµ ®Ö cßn qu¸ nhá, ®Ö kh«ng biÕt khi nµo ®Ö míi cã thÓ lín ®­îc chø ")
		end
	end
end;
